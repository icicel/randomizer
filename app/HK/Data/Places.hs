module HK.Data.Places where

import Logic
import HK.Data

places :: [Location]
places = [

    place Start $
        Always
    ,
    
    place Sly $
        has Room_shop_left1 .& has Rescued_Sly
    ,

    place Sly_Key $
        has Room_shop_left1 .& has Rescued_Sly .& shopKey
    ,

    place Iselda $
        has Room_mapper_left1
    ,

    -- todo charm costs for notches
    place Salubra $
        has Room_Charm_Shop_left1
    ,

    place Leg_Eater $
        has Fungus2_26_left1
    ,

    -- todo grub costs
    place Grubfather $
        has Crossroads_38_right1
    ,

    -- todo essence costs
    place Seer $
        has RestingGrounds_07_right1
    ,

    place Descending_Dark $
        has Mines_35_left1 .& has Broke_Crystallized_Mound_Quake_Floor .& (
            leftClaw
         .| rightClaw .& preciseMovement .& (
                rightDash
             .| obscureSkips .& difficultSkips
            )
         .| wings .& obscureSkips
         .| shriekPogo options{casts = [2]}
        )
    ,

    place Grub_Crystallized_Mound $
        has Mines_35_left1 .& has Broke_Crystallized_Mound_Quake_Floor .& (
            leftClaw
         .| rightClaw .& preciseMovement .& (
                rightDash
             .| obscureSkips
            )
         .| wings
        )

    ]
