module Randomizer where

import qualified Data.Map as Map

data Logic = And Logic Logic | Or Logic Logic | Term Check | Always | Never

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

data Check = Amount Term Int | Bool Term

instance Show Check where
    show (Amount s n) = s ++ ">=" ++ show n
    show (Bool s) = s

term :: Term -> Logic
term = Term . Bool

terms :: Term -> Int -> Logic
terms s = Term . Amount s

-- and evaluated before or
infixl 6 .&
infixl 5 .|
(.&) :: Logic -> Logic -> Logic
(.&) = And
(.|) :: Logic -> Logic -> Logic
(.|) = Or

-- a terminal location, associated with one or more items
data Location = Location String Logic
    deriving (Show)

-- a nonterminal location without associated items
data Waypoint = Waypoint String Logic
    deriving (Show)

-- a nonterminal location with a corresponding item, whose vanilla item is the
--  corresponding item of the connecting transition (and vice versa)
-- being able to reach a transition automatically gives its item
data Transition = Transition String Logic
    deriving (Show)

type Term = String
type Inventory = Map.Map Term Int

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
match (Term (Bool item)) inv = match (Term (Amount item 1)) inv
match Always _ = True
match Never _ = False

-- convert to a disjunction of conjunctions (aka an "or" of "ands")
disjunctiveNormalForm :: Logic -> [[Check]]
disjunctiveNormalForm (And a b) = [x ++ y | x <- disjunctiveNormalForm a, y <- disjunctiveNormalForm b]
disjunctiveNormalForm (Or a b) = disjunctiveNormalForm a ++ disjunctiveNormalForm b
disjunctiveNormalForm (Term c) = [[c]]
disjunctiveNormalForm Always = [[]]
disjunctiveNormalForm Never = []
