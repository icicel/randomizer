module Main(main) where

import Randomizer

import HK.World

main :: IO ()
main = do
    print $ name descendingDark
    print $ name grubCrystallizedMound
    print $ disjunctiveNormalForm $ logic descendingDark
    print $ disjunctiveNormalForm $ logic grubCrystallizedMound
    return ()
