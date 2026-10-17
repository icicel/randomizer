module Main(main) where

import Randomizer

import HK.World

main :: IO ()
main = do
    print (sane hollowKnight)
    print $ logic descendingDark
    print $ logic grubCrystallizedMound
    print $ normalize $ logic descendingDark
    print $ normalize $ logic grubCrystallizedMound
    return ()
