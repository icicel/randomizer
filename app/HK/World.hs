module HK.World where

import qualified Data.Map as Map

import Logic
import HK.Data


hollowKnight :: World
hollowKnight = createWorld
    Tutorial_01_right1
    Map.empty
    [
        descendingDark,
        grubCrystallizedMound
    ]

-- "name": "Descending_Dark",
-- "logic": "Mines_35[left1] + Broke_Crystallized_Mound_Quake_Floor + (LEFTCLAW | RIGHTCLAW + PRECISEMOVEMENT + (RIGHTDASH | OBSCURESKIPS + DIFFICULTSKIPS) | WINGS + OBSCURESKIPS | $SHRIEKPOGO[2])"
descendingDark :: Location
descendingDark = place Descending_Dark (item QUAKE) $
    has Mines_35_left1 .& crystallizedMoundQuakeFloor .& (
        leftClaw
     .| rightClaw .& preciseMovement .& (
            rightDash
         .| obscureSkips .& difficultSkips
        )
     .| wings .& obscureSkips
     .| shriekPogo options{casts = [2]}
    )

-- "name": "Grub-Crystallized_Mound",
-- "logic": "Mines_35[left1] + Broke_Crystallized_Mound_Quake_Floor + (LEFTCLAW | RIGHTCLAW + PRECISEMOVEMENT + (RIGHTDASH | OBSCURESKIPS) | WINGS)"
grubCrystallizedMound :: Location
grubCrystallizedMound = place Grub_Crystallized_Mound (item GRUBS) $
    has Mines_35_left1 .& crystallizedMoundQuakeFloor .& (
        leftClaw
     .| rightClaw .& preciseMovement .& (
            rightDash
         .| obscureSkips
        )
     .| wings
    )

-- "name": "Broke_Crystallized_Mound_Quake_Floor",
-- "logic": "Mines_35[left1] + QUAKE + $CASTSPELL",
brokeCrystallizedMoundQuakeFloor :: Location
brokeCrystallizedMoundQuakeFloor = event Broke_Crystallized_Mound_Quake_Floor $
    has Mines_35_left1 .& quake .& castSpell options
