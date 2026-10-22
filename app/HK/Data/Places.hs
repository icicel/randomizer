module HK.Data.Places where

import Logic
import HK.Data

places :: [Location]
places = [

    -- "name": "Descending_Dark",
    -- "logic": "Mines_35[left1] + Broke_Crystallized_Mound_Quake_Floor + (LEFTCLAW | RIGHTCLAW + PRECISEMOVEMENT + (RIGHTDASH | OBSCURESKIPS + DIFFICULTSKIPS) | WINGS + OBSCURESKIPS | $SHRIEKPOGO[2])"
    place Descending_Dark (item QUAKE) $
        has Mines_35_left1 .& crystallizedMoundQuakeFloor .& (
            leftClaw
        .| rightClaw .& preciseMovement .& (
                rightDash
            .| obscureSkips .& difficultSkips
            )
        .| wings .& obscureSkips
        .| shriekPogo options{casts = [2]}
        ),

    -- "name": "Grub-Crystallized_Mound",
    -- "logic": "Mines_35[left1] + Broke_Crystallized_Mound_Quake_Floor + (LEFTCLAW | RIGHTCLAW + PRECISEMOVEMENT + (RIGHTDASH | OBSCURESKIPS) | WINGS)"
    place Grub_Crystallized_Mound (item GRUBS) $
        has Mines_35_left1 .& crystallizedMoundQuakeFloor .& (
            leftClaw
        .| rightClaw .& preciseMovement .& (
                rightDash
            .| obscureSkips
            )
        .| wings
        )

    ]
