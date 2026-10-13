module Randomizer where

import qualified Data.Map as Map
import qualified Control.Monad.State.Lazy as MState

class (Show t, Ord t) => Term t

class (Show s, Ord s) => STerm s



type Randomizer t s = MState.State (World t s)

data (Term t, STerm s) => World t s = World {
    startTerm :: t,
    startState :: State s,
    locations :: [Location t]
}

type State s = Map.Map s Int



newtype Item t = Item (t, Int)
    deriving (Show)

item :: (Term t) => t -> Item t
item a = Item (a, 1)

items :: (Term t) => t -> Int -> Item t
items a n = Item (a, n)

type Inventory t = Map.Map t Int



data (Term t) => Location t =

-- a terminal location with a randomized item
    Place String (Item t) (Logic t) |

-- a terminal location with a static term
    Event t (Logic t) |

-- a nonterminal location with a static term
    Waypoint t (Logic t) |

-- a nonterminal location with a randomized term
-- its vanilla item is the corresponding item of the connecting transition (and vice versa)
-- being able to reach a transition automatically gives its item
    Transition t t (Logic t)

    deriving (Show)

logic :: (Term t) => Location t -> Logic t
logic (Place _ _ l) = l
logic (Event _ l) = l
logic (Waypoint _ l) = l
logic (Transition _ _ l) = l

name :: (Term t) => Location t -> String
name (Place n _ _) = n
name (Event n _) = show n
name (Waypoint n _) = show n
name (Transition n _ _) = show n



data (Term t) => Logic t = And (Logic t) (Logic t) | Or (Logic t) (Logic t) | Check (Check t) | Always | Never

instance Term t => Show (Logic t) where
    show (And a b) = show a ++ " & " ++ show b
    show o@(Or _ _) = "(" ++ showOr o ++ ")"
        where
            showOr :: Term t => Logic t -> String
            showOr (Or a b) = showOr a ++ " | " ++ showOr b
            showOr otherLogic = show otherLogic
    show (Check c) = show c
    show Always = "True"
    show Never = "False"

data (Term t) => Check t = Amount t Int | Flag t

instance Term t => Show (Check t) where
    show (Amount term n) = show term ++ ">=" ++ show n
    show (Flag term) = show term

has :: (Term t) => t -> Logic t
has = Check . Flag

hasAmount :: (Term t) => t -> Int -> Logic t
hasAmount term = Check . Amount term

-- and evaluated before or
infixl 6 .&
infixl 5 .|
(.&) :: (Term t) => Logic t -> Logic t -> Logic t
(.&) = And
(.|) :: (Term t) => Logic t -> Logic t -> Logic t
(.|) = Or

match :: (Term t) => Logic t -> Inventory t -> Bool
match (And a b) inv =
    if match a inv
        then match b inv
        else False
match (Or a b) inv =
    if match a inv
        then True
        else match b inv
match (Check (Amount term n)) inv =
    case Map.lookup term inv of
        Just count -> count >= n
        Nothing -> False
match (Check (Flag term)) inv = match (Check (Amount term 1)) inv
match Always _ = True
match Never _ = False

-- convert to a disjunction of conjunctions (aka an "or" of "ands")
disjunctiveNormalForm :: (Term t) => Logic t -> [[Check t]]
disjunctiveNormalForm (And a b) = [x ++ y | x <- disjunctiveNormalForm a, y <- disjunctiveNormalForm b]
disjunctiveNormalForm (Or a b) = disjunctiveNormalForm a ++ disjunctiveNormalForm b
disjunctiveNormalForm (Check c) = [[c]]
disjunctiveNormalForm Always = [[]]
disjunctiveNormalForm Never = []
