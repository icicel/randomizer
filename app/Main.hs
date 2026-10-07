module Main(main) where

import Randomizer

import HK.World

main :: IO ()
main = do
    print descendingDark
    print grubCrystallizedMound
    let descendingDarkLogic = case descendingDark of
            Location _ logic -> logic
    let grubCrystallizedMoundLogic = case grubCrystallizedMound of
            Location _ logic -> logic
    print $ disjunctiveNormalForm descendingDarkLogic
    print $ disjunctiveNormalForm grubCrystallizedMoundLogic
    return ()
