module Main(main) where

import Randomizer

import HK.World

main :: IO ()
main = do
    print (sane hollowKnight)
    print $ logic descendingDark
    print $ logic grubCrystallizedMound
    print $ disjunctiveNormalForm $ logic descendingDark
    print $ disjunctiveNormalForm $ logic grubCrystallizedMound
    return ()
