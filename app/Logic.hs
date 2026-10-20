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
    locations :: [Location]
}

createWorld :: TermID t => t -> State -> [Location] -> World
createWorld t st locs = World (term t) st locs



newtype Item = Item (Term, Int)

instance Show Item where
    show (Item (t, 1)) = show t
    show (Item (t, n)) = show t ++ "*" ++ show n

item :: TermID t => t -> Item
item a = Item (term a, 1)

items :: TermID t => t -> Int -> Item
items a n = Item (term a, n)

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

-- add if greater than any existing state
addState :: State -> Stateset -> Stateset
addState st (Stateset sts) =
    if any (< st) sts
        then Stateset (st:sts)
        else Stateset sts

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
    Place Name Item Logic |
    Event Term Logic |
    Waypoint Term Logic |
    Transition Term Term Logic

instance Show Location where
    show (Place n _ _) = show n
    show (Event t _) = show t
    show (Waypoint t _) = show t
    show (Transition from to _) = show from ++ "->" ++ show to

-- a terminal location with a randomized item
-- the only location type where two different locations may give the same term, so uses a
--  name instead of a term for identification
place :: NameID n => n -> Item -> Logic -> Location
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
logic (Place _ _ lg) = lg
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
