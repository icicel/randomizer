module HK.World where

import qualified Data.Map as Map

import Logic
import HK.Data
import HK.Data.Events
import HK.Data.Places
import HK.Data.Transitions
import HK.Data.Waypoints


hollowKnight :: World
hollowKnight = createWorld
    Tutorial_01_right1
    Map.empty
    (events ++ places ++ transitions ++ waypoints)
    []
