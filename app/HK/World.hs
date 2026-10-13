module HK.World where

import qualified Data.Map as Map

import Randomizer
import HK.Data


hollowKnight :: World
hollowKnight = createWorld
    Tutorial_01'right1'
    Map.empty
    [
        descendingDark,
        grubCrystallizedMound
    ]

-- "name": "Descending_Dark",
-- "logic": "Mines_35[left1] + Broke_Crystallized_Mound_Quake_Floor + (LEFTCLAW | RIGHTCLAW + PRECISEMOVEMENT + (RIGHTDASH | OBSCURESKIPS + DIFFICULTSKIPS) | WINGS + OBSCURESKIPS | $SHRIEKPOGO[2])"
descendingDark :: Location
descendingDark = place Descending_Dark (item QUAKE) $
    crystallizedMoundQuakeFloor .& (
        leftClaw
     .| rightClaw .& preciseMovement .& (
            rightDash
         .| obscureSkips .& difficultSkips
        )
     .| wings .& obscureSkips
     .| shriekPogo (options { casts = [2] })
    )

-- "name": "Grub-Crystallized_Mound",
-- "logic": "Mines_35[left1] + Broke_Crystallized_Mound_Quake_Floor + (LEFTCLAW | RIGHTCLAW + PRECISEMOVEMENT + (RIGHTDASH | OBSCURESKIPS) | WINGS)"
grubCrystallizedMound :: Location
grubCrystallizedMound = place Grub_Crystallized_Mound (item GRUB) $
    crystallizedMoundQuakeFloor .& (
        leftClaw
     .| rightClaw .& preciseMovement .& (
            rightDash
         .| obscureSkips
        )
     .| wings
    )
