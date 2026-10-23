module Randomizer where

import qualified Data.List as List
import qualified Control.Monad.State.Lazy as MState

import Logic



type Randomizer = MState.State World

sane :: World -> Bool
sane world = saneTerms world && saneNames world && saneTransitions world

-- no duplicate location terms
saneTerms :: World -> Bool
saneTerms world = do
    let uniqueTerms = removeDuplicates terms
    length terms == length uniqueTerms
    where
        terms = foldr (\loc ts -> case loc of
                Event t _ -> t:ts
                Waypoint t _ -> t:ts
                Transition t _ _ -> t:ts
                _ -> ts
            ) [] (locations world)

-- no duplicate place names
saneNames :: World -> Bool
saneNames world = do
    let uniqueNames = removeDuplicates names
    length names == length uniqueNames
    where
        names = foldr (\loc ns -> case loc of
                Place n _ -> n:ns
                _ -> ns
            ) [] (locations world)

removeDuplicates :: (Eq a) => [a] -> [a]
removeDuplicates [] = []
removeDuplicates (x:xs) = x : removeDuplicates (filter (/= x) xs)

-- transitions lead to each other
saneTransitions :: World -> Bool
saneTransitions world = all reverseExists transitions
    where
        locs = locations world
        transitions = [(from, to) | Transition from to _ <- locs]
        reverseExists (from, to) = flip any locs $ \loc ->
            case loc of
                Transition f t _ -> f == to && t == from
                _ -> False



type NormalizedLogic = [Clause]

type Clause = [Check]

normalize :: Logic -> NormalizedLogic
normalize (And a b) = [x ++ y | x <- normalize a, y <- normalize b]
normalize (Or a b) = normalize a ++ normalize b
normalize (Check c) = [[c]]
normalize Always = [[]]
normalize Never = []

-- the number of clauses produced by normalizing
-- should optimally never exceed 1000
normalizedSize :: Logic -> Int
normalizedSize (And a b) = normalizedSize a * normalizedSize b
normalizedSize (Or a b) = normalizedSize a + normalizedSize b
normalizedSize (Check _) = 1
normalizedSize Always = 1
normalizedSize Never = 0

-- todo: should be the start state defined in World, but this requires the main randomizer monad
defaultStatePlaceholder :: Stateset
defaultStatePlaceholder = undefined

resolve :: Logic -> Inventory -> Progress -> Stateset
resolve = resolve' . normalize
    where
        resolve' :: NormalizedLogic -> Inventory -> Progress -> Stateset
        resolve' nlg inventory progress = union [resolveClause clause inventory progress | clause <- nlg]

resolveClause :: Clause -> Inventory -> Progress -> Stateset
resolveClause [] _ _ = defaultStatePlaceholder
resolveClause (provider:checks) inventory progress = do
    let start = case provider of
            Amount _ _ -> error $ "Amount check " ++ show provider ++ " cannot be a state provider"
            Flag t -> lookupProgress t progress
            Modifier mf -> apply mf inventory defaultStatePlaceholder
    foldl (\alts check -> match check inventory alts) start checks

match :: Check -> Inventory -> Stateset -> Stateset
match _ _ (Stateset []) = nothing
match (Amount n t) inventory alts =
    if lookupItem t inventory >= n
        then alts
        else nothing
match (Flag t) inventory alts = match (Amount 1 t) inventory alts
match (Modifier mf) inventory alts = apply mf inventory alts



printNormalized :: Logic -> IO ()
printNormalized = putStrLn . showLogic . normalize
    where
        showLogic :: NormalizedLogic -> String
        showLogic = List.intercalate "\n| " . map showClause
        showClause :: Clause -> String
        showClause = List.intercalate " & " . map show
