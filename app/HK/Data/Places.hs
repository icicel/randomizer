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
         .| (shadeSkip(2) .| leftClaw) .& enemyPogos
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
        -- upper path
        (
            has Abyss_10_left2 .& rightShadowDash
         .| has Abyss_10_left1 .& (
                rightClaw
             .| wings .& shadeSkip(2)
             .| shriekPogo(cast 2)
            )
        -- reach statue from above
        ) .& (
            wings
         .| rightSuperdash
         .| rightDash .& (
                leftClaw
             .| preciseMovement
             .| backgroundPogos
            )
        )
        -- lower path
     .| (
            has Abyss_10_left2 .& rightShadowDash
         .| has Abyss_10_left1
        -- pass through void tendrils
        ) .& (
            rightShadowDash
         .| voidHeart .& (
                rightDash
             .| rightSuperdash
             .| swim
             .| wings
             .| fullClaw
            )
        -- reach statue from below
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

    place Baldur_Shell $
        (
            has Fungus1_28_left1
         .| has Fungus1_28_left2 .& (
                fullClaw
             .| wings
             .| rightDash
             .| rightSuperdash
             .| shadeSkip(1)
            )
        ) .& has Defeated_Right_Cliffs_Baldur
    ,

    place Fury_of_the_Fallen $
        has Tutorial_01
    ,

    place Lifeblood_Core $
        has Abyss_08_right1 .& (
            preciseMovement
         .| fullDash .& wings
        )
    ,

    place Defender's_Crest $
        has Waterways_05_bot1 .& (
            anyClaw
         .| wings
        ) .& has Defeated_Dung_Defender
    ,

    place Flukenest $
        has Waterways_12_right1 .& (
            swim
         .| leftSuperdash
         .| leftDash .& shriekPogo(cast 4)
        ) .& has Defeated_Flukemarm
    ,

    place Thorns_of_Agony $
        has Fungus1_14_left1 .& (
            rightDash
         .| leftClaw .& rightSuperdash
        )
    ,

    place Mark_of_Pride $
        (
            has Fungus2_31_left1 .& has Defeated_Mantis_Lords
         .| has Bench_Mantis_Village
        ) .& (
            leftClaw
         .| wings
         .| rightClaw .& (
                backgroundPogos
             .| shadeSkip(1)
            )
        )
    ,

    place Sharp_Shadow $
        has Deepnest_44_top1 .& rightShadowDash .& (
            leftShadowDash
         .| damageBoosts .& (
                takeDamage(1) .& takeDamage(1) .& takeDamage(1)
             .| leftDash .& takeDamage(1) .& takeDamage(1)
             .| quake .& castSpell(cast 2) .& takeDamage(1)
            )
        )
    ,

    place Spore_Shroom $
        (
            has Fungus2_20_left1
         .| has Fungus2_20_right1
        ) .& (
            rightClaw
         .| wings
        ) .& (
            acid
         .| rightDash
         .| leftClaw .& rightSuperdash
         .| shriekPogo(cast 2){before=AREASOUL}
        )
    ,

    place Soul_Catcher $
        has Crossroads_ShamanTemple_left1 .& (
            has Defeated_Ancestral_Mound_Baldur .& (
                upWallBreak
             .| (
                    leftSuperdash .& rightClaw
                 .| rightSuperdash .& leftClaw
                ) .& obscureSkips
            )
         .| (
                anyClaw
             .| wings .& shadeSkip(1)
             .| shriekPogo(cast 2){before=ROOMSOUL}
            ) .& upWallBreak
        )
    ,

    place Soul_Eater $
        has RestingGrounds_10 .& (
            anyClaw
         .| wings
        ) .& upWallBreak
    ,

    place Glowing_Womb $
        has Crossroads_22_bot1 .& (
            anyClaw
         .| wings
         .| backgroundPogos
         .| enemyPogos
        )
    ,

    place Nailmaster's_Glory $
        has Room_shop_left1 .& has Rescued_Sly .& cycloneSlash .& dashSlash .& greatSlash
    ,

    place Joni's_Blessing $
        has Cliffs_05_left1
    ,

    place Shape_of_Unn $
        has Fungus1_Slug_right1 .& (
            acid
         .| fullSkipAcid
         .| acidSkips .& fullDash .& shriekPogo(castSequence [1,1])
        )
    ,

    place Hiveblood $
        has Hive_05_left1 .& has Defeated_Hive_Knight
    ,

    place Dashmaster $
        has Fungus2_23
    ,

    place Quick_Slash $
        has Deepnest_East_14b_top1
     .| has Deepnest_East_14b_right1 .& (
            fullClaw
         .| wings
         .| enemyPogos .& dangerousSkips
        )
    ,

    place Spell_Twister $
        has Ruins1_30 .& (
            anyClaw
         .| wings
        )
    ,

    place Deep_Focus $
        has Mines_36_right1
    ,

    place Queen_Fragment $
        has Room_Queen_left1
    ,

    place King_Fragment $
        has White_Palace_09_right1 .& (
            leftSuperdash .& (
                fullClaw
             .| wings
            )
         .| rightClaw .& leftDash .& obscureSkips .& preciseMovement .& (
                shriekPogo(castSequence [1,1,1,1,1])
             .| leftSharpShadow .& shriekPogo(castSequence [1,1,1,1])
            )
        )
    ,

    place Void_Heart $
        has Abyss_15_top1 .& rightShadowDash .& dreamNail .& (
            enemyPogos
         .| anyClaw
         .| wings
        ) .& (
            fullClaw
         .| wings
         .| obscureSkips .& rightClaw
         .| obscureSkips .& leftClaw .& fullSuperdash
        )
    ,

    place Dreamshield $
        has RestingGrounds_17_right1
    ,

    place Weaversong $
        has Deepnest_45_v02_left1 .& (
            rightClaw
         .| wings .& (
                leftClaw
             .| enemyPogos
            )
         .| leftClaw .& enemyPogos .& difficultSkips
         .| shriekPogo(cast 3){before=AREASOUL}
        )
    ,

    place Grimmchild $
        has Nightmare_Lantern_Lit .& has Grimm_Main_Tent_left1
    ,

    place Unbreakable_Heart $
        has Grimm_Divine_left1 .& fragileHeart .& has Can_Visit_Lemm
    ,

    place Unbreakable_Greed $
        has Grimm_Divine_left1 .& fragileGreed .& has Can_Visit_Lemm
    ,

    place Unbreakable_Strength $
        has Grimm_Divine_left1 .& fragileStrength .& has Can_Visit_Lemm
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
