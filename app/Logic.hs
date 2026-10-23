module Logic where

import qualified Data.Map as Map



-- an integer with a string label
data Label = Label Int String

instance Show Label where
    show (Label _ s) = s
instance Eq Label where
    (Label i1 _) == (Label i2 _) = i1 == i2
instance Ord Label where
    compare (Label i1 _) (Label i2 _) = compare i1 i2



-- doing it this way allows using any enumeration type to define ids, without much
--  boilerplate on my part
-- separate id classes ensure ids typecheck properly between different label types

-- randomizer logic terms
type Term = Label
class (Show t, Enum t) => TermID t
term :: TermID t => t -> Term
term t = Label (fromEnum t) (show t)

-- place-type location names
type Name = Label
class (Show n, Enum n) => NameID n
name :: NameID n => n -> Name
name n = Label (fromEnum n) (show n)

-- state variables
type Variable = Label
class (Show v, Enum v) => VariableID v
var :: VariableID v => v -> Variable
var v = Label (fromEnum v) (show v)



data World = World {
    startTerm :: Term,
    startState :: State,
    locations :: [Location],
    items :: [Item]
}

createWorld :: TermID t => t -> State -> [Location] -> [Item] -> World
createWorld t = World (term t)



data Item = Item {
    itemTerm :: Term,
    placements :: Placements,
    collectorTerm :: Maybe (Term, Int)
}

-- simple item
item :: TermID t => t -> Placements -> Item
item t places = Item (term t) places Nothing

-- item with a collector term, incremented when the item term is first collected
itemType :: (TermID t, TermID c) => t -> c -> Placements -> Item
itemType t c places = Item (term t) places (Just (term c, 1))

-- item with a collector term, incremented when n of the item term have been collected
multipartItemType :: (TermID t, TermID c) => t -> c -> Int -> Placements -> Item
multipartItemType t c n places = Item (term t) places (Just (term c, n))

newtype Placements = Placements [(Name, Int)]

at :: NameID n => n -> Placements
at n = Placements [(name n, 1)]

amountAt :: NameID n => n -> Int -> Placements
amountAt n i = Placements [(name n, i)]

atMany :: NameID n => [n] -> Placements
atMany ns = Placements [(name n, 1) | n <- ns]

amountAtMany :: NameID n => [(n, Int)] -> Placements
amountAtMany ns = Placements [(name n, i) | (n, i) <- ns]

type Inventory = Map.Map Term Int

-- todo: nonterminals should also be available from this function, returning 0
--  if the progress stateset is empty and 1 otherwise
lookupItem :: Term -> Inventory -> Int
lookupItem = Map.findWithDefault 0



type State = Map.Map Variable Int

lookupVar :: Variable -> State -> Int
lookupVar = Map.findWithDefault 0

insertVar :: Variable -> Int -> State -> State
insertVar = Map.insert

newtype Stateset = Stateset [State]

nothing :: Stateset
nothing = Stateset []

single :: State -> Stateset
single st = Stateset [st]

-- add the state unless it is "strictly less" than all existing states, meaning
--  all its values are equal or lesser than the other states' corresponding values
-- this is a partial ordering (two states could be neither > nor < nor == to each other),
--  so we can't use the existing instance of Ord for Map
-- how it works: `isSubmapOfBy f a b` checks whether all keys of a are in b, and if so,
--  whether all values of a are related by f to the corresponding values in b
-- that means that for states, there are two cases;
-- 1) not all keys of a are in b, in which case strictlyLessThan a b = False
-- 2) all keys of a are in b, in which case strictlyLessThan a b = whether all values
--  in a are <= to the corresponding values in b
addState :: State -> Stateset -> Stateset
addState st (Stateset sts) =
    if all (strictlyLessThan st) sts
        then Stateset sts
        else Stateset (st:sts)
    where
        strictlyLessThan = Map.isSubmapOfBy (<=)

merge :: Stateset -> Stateset -> Stateset
merge (Stateset sts) alts = foldr addState alts sts

union :: [Stateset] -> Stateset
union = foldr merge nothing

data StateModifier = StateModifier {
    label :: String,
    dependencies :: [Term],
    modify :: State -> Inventory -> [State]
}

apply :: StateModifier -> Inventory -> Stateset -> Stateset
apply sm inventory (Stateset sts) = union $ map Stateset $ map (modify sm inventory) sts

type Progress = Map.Map Term Stateset

lookupProgress :: Term -> Progress -> Stateset
lookupProgress = Map.findWithDefault nothing



data Location =
    Place Name Logic |
    Event Term Logic |
    Waypoint Term Logic |
    Transition Term Term Logic

instance Show Location where
    show (Place n _) = show n
    show (Event t _) = show t
    show (Waypoint t _) = show t
    show (Transition from to _) = show from ++ "->" ++ show to

-- a terminal location with one or more randomized items
-- the only location type where two different locations may give the same term, so uses a
--  name instead of a term for identification
place :: NameID n => n -> Logic -> Location
place = Place . name

-- a terminal location with a static term
event :: TermID t => t -> Logic -> Location
event = Event . term

-- a nonterminal location with a static term
waypoint :: TermID t => t -> Logic -> Location
waypoint = Waypoint . term

-- a nonterminal location with a randomized term
-- its vanilla item is the corresponding item of the connecting transition (and vice versa)
-- being able to reach a transition automatically gives its item
transition :: TermID t => t -> t -> Logic -> Location
transition from to = Transition (term from) (term to)

logic :: Location -> Logic
logic (Place _ lg) = lg
logic (Event _ lg) = lg
logic (Waypoint _ lg) = lg
logic (Transition _ _ lg) = lg



-- the logic type is purely structural, and for actual evaluation must be
--  normalized into disjunctive normal form (a disjunction of conjunctions of checks)
data Logic = And Logic Logic | Or Logic Logic | Check Check | Always | Never

instance Show Logic where
    show (And a b) = show a ++ " & " ++ show b
    show (Or a b) = "(" ++ showOr (Or a b) ++ ")"
        where
            showOr :: Logic -> String
            showOr (Or a' b') = showOr a' ++ " | " ++ showOr b'
            showOr otherLogic = show otherLogic
    show (Check c) = show c
    show Always = "True"
    show Never = "False"

-- and evaluated before or
infixl 6 .&
infixl 5 .|
(.&) :: Logic -> Logic -> Logic
(.&) = And
(.|) :: Logic -> Logic -> Logic
(.|) = Or

data Check = Amount Int Term | Flag Term | Modifier StateModifier

instance Show Check where
    show (Amount n t) = show t ++ ">=" ++ show n
    show (Flag t) = show t
    show (Modifier sm) = "$" ++ label sm

has :: TermID t => t -> Logic
has = Check . Flag . term

hasAmount :: TermID t => Int -> t -> Logic
hasAmount n = Check . Amount n . term

stateModifier :: TermID t => String -> [t] -> (State -> Inventory -> [State]) -> Logic
stateModifier l deps = Check . Modifier . StateModifier l (map term deps)
