module Main(main) where

import qualified Control.Monad as M

import Randomizer
import Logic
import HK.World
import HK.Data

getTerm :: Location -> Maybe Term
getTerm (Place _ _) = Nothing
getTerm (Event t _) = Just t
getTerm (Waypoint t _) = Just t
getTerm (Transition t _ _) = Just t

getName :: Location -> Maybe Name
getName (Place n _) = Just n
getName _ = Nothing

findLocation :: TermID t => t -> Location
findLocation t = case filter (\loc -> getTerm loc == Just (term t))
    (locations hollowKnight) of
    [] -> error $ "Location not found: " ++ show t
    (loc:_) -> loc

findPlace :: NameID n => n -> Location
findPlace n = case filter (\loc -> getName loc == Just (name n))
    (locations hollowKnight) of
    [] -> error $ "Place not found: " ++ show n
    (loc:_) -> loc

main :: IO ()
main = do
    M.unless (sane hollowKnight) $ error "World is not sane"
    let descendingDark = findPlace Descending_Dark
    let grubCrystallizedMound = findPlace Grub_Crystallized_Mound
    let brokeCrystallizedMoundQuakeFloor = findLocation Broke_Crystallized_Mound_Quake_Floor
    print $ logic descendingDark
    print $ logic grubCrystallizedMound
    print $ logic brokeCrystallizedMoundQuakeFloor
    printNormalized $ logic descendingDark
    printNormalized $ logic grubCrystallizedMound
    printNormalized $ logic brokeCrystallizedMoundQuakeFloor
    return ()
