module Main(main) where

import Randomizer

import HK.World

main :: IO ()
main = do
    print (sane hollowKnight)
    print $ logic descendingDark
    print $ logic grubCrystallizedMound
    print $ logic brokeCrystallizedMoundQuakeFloor
    printNormalized $ logic descendingDark
    printNormalized $ logic grubCrystallizedMound
    printNormalized $ logic brokeCrystallizedMoundQuakeFloor
    return ()
