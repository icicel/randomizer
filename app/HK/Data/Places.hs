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

    place World_Sense $
        has Room_temple_left1 .& has Opened_Black_Egg_Temple
    ,

    place Mothwing_Cloak $
        has Fungus1_04_right1 .& has Defeated_Hornet_1
    ,

    place Mantis_Claw $
        has Fungus2_14 .& (
            leftDash
         .| wings
         .| leftSuperdash .& anyClaw
        --  .| (shadeSkip(hits 2) .| leftClaw) .& enemyPogos
         .| spellAirstall .& castSpell(castSequence [1,1]){before=ROOMSOUL}
        )
    ,

    place Crystal_Heart $
        has Mines_31_left1 .& rightSuperdash
     .| has Mines_31 .& (
            rightDash
         .| wings
         .| rightSuperdash
         .| spellAirstall .& castSpell(cast 1)
         .| preciseMovement .& (rightClaw .| leftDash)
        )
    ,

    place Monarch_Wings $
        has Abyss_21_right1 .& (rightClaw .| wings)
    ,

    place Shade_Cloak $
        (
            has Abyss_10_left2 .& rightShadowDash
         .| has Abyss_10_left1 .& (
                rightClaw
            --  .| wings .& shadeSkip(hits 2)
             .| shriekPogo(cast 2)
            )
        ) .& (
            wings
         .| rightSuperdash
         .| rightDash .& (
                leftClaw
             .| preciseMovement
             .| backgroundPogos
            )
        )
     .| (
            has Abyss_10_left2 .& rightShadowDash
         .| has Abyss_10_left1
        ) .& (
            rightShadowDash
         .| voidHeart .& (
                rightDash
             .| rightSuperdash
             .| swim
             .| wings
             .| fullClaw
            )
        ) .& (
            wings
         .| leftClaw .& rightSuperdash
         .| leftClaw .& rightDash
         .| backgroundPogos .& rightDash
        )
    ,

    place Isma's_Tear $
        has Waterways_13
    ,

    place Dream_Nail $
        has RestingGrounds_04_left1
     .| has RestingGrounds_04_right1
    ,

    place Vengeful_Spirit $
        has Crossroads_ShamanTemple_left1
    ,

    place Shade_Soul $
        has Ruins1_31b_right1
     .| has Ruins1_31b_right2 .& has Defeated_Elegant_Warrior
    ,

    place Desolate_Dive $
        has Ruins1_24_right1 .& has Defeated_Soul_Master
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

    place Howling_Wraiths $
        has Room_Fungus_Shaman_left1
    ,

    place Abyss_Shriek $
        has Abyss_12_right1 .& scream .& castSpell(cast 1)
    ,

    place Cyclone_Slash $
        has Room_nailmaster_left1
    ,

    place Dash_Slash $
        has Room_nailmaster_03_left1 .& has Can_Visit_Lemm
    ,

    place Great_Slash $
        has Room_nailmaster_02_left1
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
