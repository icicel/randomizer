module HK.Data.Events where

import Logic
import HK.Data

events :: [Location]
events = [

    -- "name": "Broke_Crystallized_Mound_Quake_Floor",
    -- "logic": "Mines_35[left1] + QUAKE + $CASTSPELL",
    event Broke_Crystallized_Mound_Quake_Floor $
        has Mines_35_left1 .& quake .& castSpell options

    ]
