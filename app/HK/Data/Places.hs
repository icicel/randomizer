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

    place Lurien $
        has Ruins2_Watcher_Room_bot1 .& dreamNail
    ,

    place Monomon $
        has Uumuu_Arena .& has Defeated_Uumuu .& dreamNail .& (
            acid .& leftClaw
         .| acid .& rightClaw .& wings
         .| leftSuperdash .& fullClaw
         .| leftSuperdash .& rightClaw .& wings
         .| rightSuperdash .& leftClaw .& wings
         .| acid .& shriekPogo(cast 3){before=ROOMSOUL}
         .| leftDash .& anyClaw .& acidSkips .& shriekPogo(cast 2){before=ROOMSOUL}
         .| leftDash .& acidSkips .& complexSkips .& shriekPogo(cast 5)
         .| fullClaw .& wings .& fullSharpShadow .& fireball .& fireballSkips .& acidSkips .& complexSkips
        )
    ,

    place Herrah $
        has Deepnest_Spider_Town_left1 .& dreamNail .& (
            wings .& anyClaw .& (
                herrah
             .| combatRightDevout
            )
         .| (
                fullClaw
             .| enemyPogos .& shriekPogo(cast 2){before=ROOMSOUL} .& shriekPogo(cast 2){before=ROOMSOUL} .& shriekPogo(cast 3){before=ROOMSOUL}
            ) .& (
                herrah .& combatLeftDevout
             .| combatAnyDevout
            )
        )
     .| has Bench_Beast's_Den .& shriekPogo(castSequence [1,2,2]) .& shriekPogo(cast 3){before=ROOMSOUL} .& (
            herrah
         .| combatLeftDevout
        )
    ,    

    place Descending_Dark $
        has Mines_35_left1 .& has Broke_Crystallized_Mound_Quake_Floor .& (
            leftClaw
         .| rightClaw .& preciseMovement .& (
                rightDash
             .| obscureSkips .& difficultSkips
            )
         .| wings .& obscureSkips
         .| shriekPogo(cast 2)
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
