module Randomizer where

import Control.Monad.State.Lazy

import qualified Data.Map as Map

data Logic = And Logic Logic | Or Logic Logic | Item Item | Setting Setting | Always | Never

instance Show Logic where
    show (And a b) = show a ++ " & " ++ show b
    show o@(Or _ _) = "(" ++ showOr o ++ ")"
        where
            showOr :: Logic -> String
            showOr (Or a b) = showOr a ++ " | " ++ showOr b
            showOr a = show a
    show (Item s) = s
    show (Setting s) = "$" ++ s
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

type Item = String
type Inventory = [Item]

type Setting = String
type Settings = Map.Map Setting Bool
type Randomizer = State Settings

match :: Logic -> Inventory -> Randomizer Bool
match (And a b) inv = do
    aResult <- match a inv
    if aResult
        then match b inv
        else return False
match (Or a b) inv = do
    aResult <- match a inv
    if aResult
        then return True
        else match b inv
match (Item item) inv = return $ item `elem` inv
match (Setting setting) _ = do
    settings <- get
    case Map.lookup setting settings of
        Just value -> return value
        Nothing -> error $ "Setting not found: " ++ show (Setting setting)
match Always _ = return True
match Never _ = return False
