module Randomizer where

import qualified Data.Map as Map
import qualified Control.Monad.State.Lazy as MState

type Randomizer = MState.State World

data World = World {
    state :: State
}

type State = Map.Map String Int

type Item = String
type Inventory = Map.Map Item Int

-- a terminal location with one or more randomized items
data Location = Location Item Logic
    deriving (Show)

-- a terminal location with a static item
data Event = Event Item Logic
    deriving (Show)

-- a nonterminal location with a static item
data Waypoint = Waypoint Item Logic
    deriving (Show)

-- a nonterminal location with a randomized item
-- its vanilla item is the corresponding item of the connecting transition (and vice versa)
-- being able to reach a transition automatically gives its item
data Transition = Transition Item Logic
    deriving (Show)

data Logic = And Logic Logic | Or Logic Logic | Term Term | Always | Never

instance Show Logic where
    show (And a b) = show a ++ " & " ++ show b
    show o@(Or _ _) = "(" ++ showOr o ++ ")"
        where
            showOr :: Logic -> String
            showOr (Or a b) = showOr a ++ " | " ++ showOr b
            showOr a = show a
    show (Term c) = show c
    show Always = "True"
    show Never = "False"

data Term = Amount Item Int | Flag Item

instance Show Term where
    show (Amount s n) = s ++ ">=" ++ show n
    show (Flag s) = s

has :: Item -> Logic
has = Term . Flag

hasAmount :: Item -> Int -> Logic
hasAmount s = Term . Amount s

-- and evaluated before or
infixl 6 .&
infixl 5 .|
(.&) :: Logic -> Logic -> Logic
(.&) = And
(.|) :: Logic -> Logic -> Logic
(.|) = Or

match :: Logic -> Inventory -> Bool
match (And a b) inv =
    if match a inv
        then match b inv
        else False
match (Or a b) inv =
    if match a inv
        then True
        else match b inv
match (Term (Amount item n)) inv =
    case Map.lookup item inv of
        Just count -> count >= n
        Nothing -> False
match (Term (Flag item)) inv = match (Term (Amount item 1)) inv
match Always _ = True
match Never _ = False

-- convert to a disjunction of conjunctions (aka an "or" of "ands")
disjunctiveNormalForm :: Logic -> [[Term]]
disjunctiveNormalForm (And a b) = [x ++ y | x <- disjunctiveNormalForm a, y <- disjunctiveNormalForm b]
disjunctiveNormalForm (Or a b) = disjunctiveNormalForm a ++ disjunctiveNormalForm b
disjunctiveNormalForm (Term c) = [[c]]
disjunctiveNormalForm Always = [[]]
disjunctiveNormalForm Never = []
