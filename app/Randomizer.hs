module Randomizer where

import qualified Data.Map as Map

data Logic = And Logic Logic | Or Logic Logic | Terms Term Int | Term Term | Always | Never

instance Show Logic where
    show (And a b) = show a ++ " & " ++ show b
    show o@(Or _ _) = "(" ++ showOr o ++ ")"
        where
            showOr :: Logic -> String
            showOr (Or a b) = showOr a ++ " | " ++ showOr b
            showOr a = show a
    show (Terms s 1) = s
    show (Terms s n) = s ++ " *" ++ show n
    show (Term s) = show (Terms s 1)
    show Always = "True"
    show Never = "False"

-- and evaluated before or
infixl 6 .&
infixl 5 .|
(.&) :: Logic -> Logic -> Logic
(.&) = And
(.|) :: Logic -> Logic -> Logic
(.|) = Or

data Location = Location String Logic
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
match (Terms item n) inv =
    case Map.lookup item inv of
        Just count -> count >= n
        Nothing -> False
match (Term item) inv = match (Terms item 1) inv
match Always _ = True
match Never _ = False
