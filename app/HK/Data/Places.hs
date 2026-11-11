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

    place City_Crest $
        (
            has Crossroads_10_left1
         .| has Crossroads_10_right1
        ) .& has Defeated_False_Knight
    ,

    place Tram_Pass $
        has Deepnest_26b_right2 .& (
            leftClaw
         .| wings
        )
    ,

    place Simple_Key_Basin $
        has Abyss_20_top1
     .| has Abyss_20_top2
    ,

    place Simple_Key_City $
        (
            has Ruins1_17_top1
         .| has Ruins1_17_right1
        ) .& (
            rightDash
         .| wings
         .| rightSuperdash
         .| enemyPogos
        )
    ,

    place Simple_Key_Lurker $
        has GG_Lurker_left1 .& (
            swim
         .| rightDash
         .| wings
         .| leftClaw .& fullSuperdash
        ) .& rightClaw .& has Defeated_Pale_Lurker
    ,

    place Shopkeeper's_Key $
        has Mines_11 .& (
            anyClaw
         .| wings
         .| enemyPogos
        )
    ,

    place Love_Key $
        has Fungus3_39_left1 .& (
            acid
         .| rightSkipAcid
         .| acidSkips .& (
                rightClaw .& rightDash .& wings .& (
                    dashMaster
                 .| spellAirstall .& castSpell(cast 1){before=ROOMSOUL}
                )
             .| rightDash .& shriekPogo(cast 1){before=ROOMSOUL}
             .| complexSkips .& rightSharpShadow .& wings
            )
        )
    ,

    place King's_Brand $
        has Room_Wyrm_right1
    ,

    place Godtuner $
        has GG_Waterways .& godTunerUnlock
    ,

    place Collector's_Map $
        has Ruins2_11_right1 .& (
            leftClaw
         .| rightClaw .& (
                wings
             .| rightDash
             .| preciseMovement
            )
         .| wings .& complexSkips .& enemyPogos
         .| shriekPogo(cast 5){before=AREASOUL}
        ) .& has Defeated_Collector
    ,

    place Mask_Shard_Brooding_Mawlek $
        (
            has Crossroads_09_left1
         .| has Crossroads_09_right1
        ) .& has Defeated_Brooding_Mawlek
    ,

    place Mask_Shard_Crossroads_Goam $
        (
            has Crossroads_13_left1
         .| has Crossroads_13_right1
        ) .& (
            anyClaw
         .| wings
         .| enemyPogos
        )
    ,

    place Mask_Shard_Stone_Sanctuary $
        has Fungus1_36_left1
    ,

    place Mask_Shard_Queen's_Station $
        has Fungus2_01 .& (
            fullClaw .& (
                leftDash
             .| leftSuperdash
            )
         .| wings
        )
    ,

    place Mask_Shard_Deepnest $
        has Fungus2_25_top2
    ,

    place Mask_Shard_Waterways $
        has Waterways_04b_left1 .& (
            swim
         .| leftDash .& (
                leftClaw
             .| shriekPogo(cast 1){before=ROOMSOUL}
            )
        )
     .| has Waterways_04b_right1 .& (
            wings
         .| leftDash
         .| swim
         .| rightClaw .& rightDash .& leftSuperdash
        ) .& (
            swim
         .| leftDash .& (
                leftClaw
             .| shriekPogo(cast 1){before=ROOMSOUL}
            )
        )
     .| has Waterways_04b_right2 .& (
            swim
         .| leftSkipAcid
        )
    ,

    place Mask_Shard_Enraged_Guardian $
        has Mines_32_bot1 .& has Defeated_Enraged_Guardian
    ,

    place Mask_Shard_Hive $
        has Hive_04_left1
     .| has Hive_04_left2
     .| has Hive_04_right1
    ,

    place Mask_Shard_Grey_Mourner $
        has Room_Mansion_left1 .& has Can_Deliver_Flower
    ,

    place Mask_Shard_Bretta $
        has Room_Bretta_right1
    ,

    place Vessel_Fragment_Greenpath $
        has Fungus1_13_right1 .& (
            leftClaw
         .| damageBoosts .& takeDamage(1) .& wings .& enemyPogos
         .| wings .& rightClaw .& (
                leftDash
             .| leftSuperdash
            )
         .| enemyPogos .& shriekPogo(cast 2){before=AREASOUL}
        )
    --  .| startLocation Lower_Greenpath
    ,

    place Vessel_Fragment_City $
        has Ruins2_09_bot1 .& has Defeated_King's_Station_Arena
    ,

    place Vessel_Fragment_Crossroads $
        has Crossroads_37_right1
    ,

    place Vessel_Fragment_Basin $
        (
            has Abyss_04 .& (
                anyClaw
             .| wings .& enemyPogos
            )
         .| has Abyss_04_top1
        ) .& has Can_Visit_Lemm .& has Defeated_Colosseum_2
    ,

    place Vessel_Fragment_Deepnest $
        has Deepnest_38_bot1 .& (
            rightClaw
         .| wings
        )
    ,

    place Vessel_Fragment_Stag_Nest $
        has Cliffs_03_right1
     .| has Can_Stag .& (
            allStags
         .| stagNestStag
        )
    ,

    place Charm_Notch_Shrumal_Ogres $
        (
            has Fungus2_05_bot1
         .| has Fungus2_05_right1
        ) .& has Defeated_Shrumal_Ogre_Arena
    ,

    place Charm_Notch_Fog_Canyon $
        has Fungus3_28_right1 .& (
            acid
         .| acidSkips .& (
                leftSkipAcid
             .| wings .& leftDash
             .| wings .& rightClaw .& spellAirstall .& castSpell(cast 1){before=ROOMSOUL}
             .| damageBoosts .& takeDamage(1) .& fullClaw .& fullDash
            )
        ) .& (
            rightClaw
         .| leftClaw .& wings
         .| leftClaw .& enemyPogos
        )
    ,

    place Charm_Notch_Colosseum $
        has Room_Colosseum_01_left1 .& has Can_Replenish_Geo .& has Defeated_Colosseum_1
    ,

    place Charm_Notch_Grimm $
        has Grimm_Main_Tent_left1 .& has Defeated_Grimm
    ,

    place Pale_Ore_Basin $
        has Abyss_17_top1 .& (
            anyClaw
         .| wings
         .| damageBoosts .& takeDamage(1)
        )
    ,

    place Pale_Ore_Crystal_Peak $
        has Mines_34_bot1 .& (
            leftClaw .& (
                wings
             .| rightDash
             .| rightSuperdash
             .| spikeTunnels
            )
         .| rightClaw .& (
                wings
             .| enemyPogos .& (
                    rightDash
                 .| spikeTunnels
                )
            )
         .| shriekPogo(cast 1){before=ROOMSOUL}
        )
    --  .| startLocation Hallownest's_Crown
    ,

    place Pale_Ore_Nosk $
        has Deepnest_32_left1 .& has Defeated_Nosk
    ,

    place Pale_Ore_Colosseum $
        has Room_Colosseum_01_left1 .& has Can_Replenish_Geo .& (
            anyClaw
         .| spicyCombatSkips .& wings
        ) .& has Defeated_Colosseum_2
    ,

    place Geo_Chest_False_Knight $
        (
            has Crossroads_10_left1
         .| has Crossroads_10_right1
        ) .& has Defeated_False_Knight
    ,

    place Geo_Chest_Soul_Master $
        has Ruins1_32_right1 .& (
            anyClaw
         .| shriekPogo(cast 1){before=AREASOUL}
        )
    ,

    place Geo_Chest_Watcher_Knights $
        has Ruins2_03_top1
     .| has Ruins2_03_bot1 .& has Defeated_Watcher_Knights .& (
            anyClaw
         .| shriekPogo(cast 8){before=AREASOUL}
        )
    ,

    place Geo_Chest_Greenpath $
        has Fungus1_13_right1
    ,

    place Geo_Chest_Mantis_Lords $
        (
            has Fungus2_31_left1 .& has Defeated_Mantis_Lords
         .| has Bench_Mantis_Village
        ) .& (
            anyClaw
         .| wings
        )
    ,

    place Geo_Chest_Resting_Grounds $
        has RestingGrounds_10
    ,

    place Geo_Chest_Crystal_Peak $
        has Mines_37_bot1 .& (
            anyClaw
         .| shriekPogo(cast 1){before=AREASOUL}
        )
     .| has Mines_37_bot1 .& wings .& glowingWomb .& shadeSkip(2) .& complexSkips
     .| has Mines_37_top1 .& wings .& grubberflysElegy .& leftSlash .& shadeSkip(1) .& complexSkips .& (
            fullDash
         .| fullSuperdash .& rightClaw .& obscureSkips .& preciseMovement
         .| dashSprint .& obscureSkips
        )
    ,

    place Geo_Chest_Weavers_Den $
        has Deepnest_45_v02_left1 .& (
            rightClaw
         .| wings .& (
                leftClaw
             .| enemyPogos
            )
         .| leftClaw .& enemyPogos .& difficultSkips
        ) .& has Broke_Weavers_Den_Secret_Wall .& (
            leftDash .& wings
         .| leftSuperdash
         .| fireballSkips .& wings .& (
                fireball .& castSpell(cast 3){before=AREASOUL}
             .| scream .& castSpell(cast 4){before=AREASOUL}
             .| shriekPogo(cast 3){before=AREASOUL}
            )
        ) .& (
            leftDash
         .| spikeTunnels
        ) .& (
            rightClaw
         .| wings .& enemyPogos
         .| leftClaw .& leftDash .& enemyPogos .& dangerousSkips .& complexSkips
        )
    ,

    place Geo_Chest_Junk_Pit_1 $
        has GG_Waterways
    ,

    place Geo_Chest_Junk_Pit_2 $
        has GG_Waterways
    ,

    place Geo_Chest_Junk_Pit_3 $
        has GG_Waterways
    ,

    place Geo_Chest_Junk_Pit_5 $
        has GG_Waterways
    ,

    place Lumafly_Escape_Junk_Pit_Chest_4 $
        has GG_Waterways
    ,

    place Rancid_Egg_Sheo $
        has Fungus1_15_right1
     .| has Fungus1_15_door1
    ,

    place Rancid_Egg_Fungal_Core $
        has Fungus2_29
    ,

    place Rancid_Egg_Queen's_Gardens $
        has Fungus3_34 .& (
            rightClaw .& backgroundPogos
         .| wings
         .| fullDash
         .| shadeSkip(2)
        )
     .| has Fungus3_34_left1 .& (
            rightDash
         .| leftClaw .& rightSuperdash .& (
                rightClaw
             .| backgroundPogos .& leftDash
             .| shadeSkip(2)
             .| spellAirstall .& castSpell(cast 2){before=AREASOUL}
            )
        )
    ,

    place Rancid_Egg_Blue_Lake $
        has Crossroads_50_left1 .& (
            rightSuperdash
         .| rightDash .& shriekPogo(castSequence [1,1])
        )
     .| (
            has Crossroads_50_left1
         .| has Crossroads_50_right1
        ) .& swim .& (
            wings .& enemyPogos
         .| shriekPogo(cast 2){before=MAPAREASOUL}
        )
     .| has Crossroads_50_right1 .& leftSuperdash .& complexSkips .& shriekPogo(cast 3){before=MAPAREASOUL}
    ,

    place Rancid_Egg_Crystal_Peak_Dive_Entrance $
        has Mines_01_left1 .& has Broke_Crystal_Peak_Entrance_Quake_Floor .& (
            rightDash
         .| wings
         .| leftClaw .& rightSuperdash
         .| rightClaw .& spellAirstall .& castSpell(cast 3){before=ITEMSOUL,after=AREASOUL}
        )
     .| has Mines_01_bot1 .& (
            anyClaw .& wings
         .| fullClaw .& fullSuperdash
         .| leftClaw .& fullDash .& backgroundPogos
         .| leftClaw .& wings .& (
                rightDash
             .| rightSuperdash
            )
         .| backgroundPogos .& rightDash .& shriekPogo(cast 5){before=AREASOUL}
        )
    ,

    place Rancid_Egg_Crystal_Peak_Dark_Room $
        has Mines_29_left1
     .| has Mines_29_right1
     .| has Mines_29_right2
    ,

    place Rancid_Egg_Crystal_Peak_Tall_Room $
        has Mines_20 .& has Broke_Crystal_Peak_Dive_Egg_Quake_Floor
    ,

    place Rancid_Egg_City_of_Tears_Left $
        has Ruins1_05c .& (
            anyClaw
         .| wings
         .| backgroundPogos
         .| damageBoosts .& takeDamage(2)
        )
    ,

    place Rancid_Egg_City_of_Tears_Pleasure_House $
        has Ruins_Elevator_left1
     .| has Ruins_Elevator_left2
    ,

    place Rancid_Egg_Beast's_Den $
        has Deepnest_Spider_Town_left1 .& (
            wings .& anyClaw
         .| (
                fullClaw
             .| wings .& complexSkips .& shadeSkip(2)
             .| shriekPogo(cast 2){before=ROOMSOUL} .& shriekPogo(cast 2){before=ROOMSOUL}
            ) .& combatLeftDevout
        )
    ,

    place Rancid_Egg_Dark_Deepnest $
        (
            has Deepnest_39_left1
         .| has Deepnest_39_top1
         .| has Deepnest_39_door1
         .| has Deepnest_39_right1 .& (
                leftClaw
             .| wings .& rightClaw
             .| wings .& enemyPogos
             .| rightClaw .& enemyPogos
            )
        ) .& (
            lantern
         .| darkRooms
        )
    ,

    place Rancid_Egg_Weaver's_Den $
        has Deepnest_45_v02_left1 .& (
            spikeTunnels
         .| leftDash
        ) .& (
            lantern
         .| darkRooms
        )
    ,

    place Rancid_Egg_Near_Quick_Slash $
        has Deepnest_East_14_top2 .& has Broke_Oro_Quake_Floor_2 .& has Broke_Oro_Quake_Floor_3 .& (
            rightClaw
         .| wings
         .| leftClaw .& enemyPogos
         .| fullDash .& damageBoosts .& enemyPogos .& complexSkips .& takeDamage(1) .& takeDamage(1)
        )
     .| (
            has Deepnest_East_14_left1 .& (
                rightDash
             .| spikeTunnels
            )
         .| has Deepnest_East_14_door1 .& (
                leftDash
             .| preciseMovement
            )
        ) .& rightClaw .& wings .& (
            leftDash
         .| enemyPogos
        )
    ,

    place Rancid_Egg_Upper_Kingdom's_Edge $
        has Deepnest_East_07 .& (
            anyClaw
         .| wings
        )
    ,

    place Rancid_Egg_Waterways_East $
        has Waterways_07
    ,

    place Rancid_Egg_Waterways_Main $
        has Waterways_02 .& (
            anyClaw
         .| wings
        )
     .| has Waterways_02_top1
     .| has Waterways_02_top3 .& has Broke_Waterways_Bench_Quake_Floor_3
     .| has Bench_Waterways
    ,

    place Rancid_Egg_Waterways_West_Bluggsac $
        (
            has Waterways_04
         .| has Waterways_04_left2
        ) .& swim .& (
            anyClaw
         .| wings
         .| rightDash
         .| enemyPogos
        )
     .| has Waterways_04 .& (
            leftSkipAcid .& wings
         .| complexSkips .& fireballSkips .& acidSkips .& fireball .& leftDash .& rightClaw .& wings
         .| acidSkips .& leftDash .& (
                shriekPogo(cast 1){before=ROOMSOUL} .& (
                    rightClaw
                 .| enemyPogos
                )
             .| shriekPogo(cast 2){before=ROOMSOUL}
            )
        )
     .| has Waterways_04_left2 .& (
            rightSkipAcid .& wings
         .| acidSkips .& rightDash .& (
                shriekPogo(cast 1){before=ROOMSOUL} .& anyClaw
             .| shriekPogo(cast 2){before=ROOMSOUL}
            )
        )
    ,

    place Rancid_Egg_Waterways_West_Pickup $
        has Waterways_04b_left1 .& (
            anyClaw
         .| wings .& enemyPogos .& dangerousSkips
         .| shriekPogo(cast 5){before=AREASOUL}
        )
    ,

    place Rancid_Egg_Tuk_Defender's_Crest $
        has Waterways_03_left1 .& defendersCrest
    ,

    place Wanderer's_Journal_Cliffs $
        has Cliffs_01_right1
     .| has Cliffs_01_right2
     .| has Cliffs_01_right3 .& (
            anyClaw
         .| wings
         .| fullDash .& enemyPogos
        )
     .| has Cliffs_01_right4
    ,

    place Wanderer's_Journal_Greenpath_Stag $
        has Fungus1_22_left1
     .| has Fungus1_22_top1
    ,

    place Wanderer's_Journal_Greenpath_Lower $
        has Fungus1_11 .& (
            anyClaw
         .| shriekPogo(cast 3){before=AREASOUL}
        )
    ,

    place Wanderer's_Journal_Fungal_Wastes_Thorns_Gauntlet $
        has Fungus2_04 .& (
            leftClaw .& wings
         .| rightClaw .& (
                wings
             .| rightDash
             .| rightSuperdash .& leftClaw
             .| spellAirstall .& castSpell(cast 3){before=AREASOUL}
            )
         .| shriekPogo(cast 4){before=AREASOUL,canLeftStall=False,canRightStall=False}
         .| (
                shriekPogo(castSequence [3,1]){before=AREASOUL,canLeftStall=False,canRightStall=False} .& leftDash
             .| shriekPogo(cast 3){before=AREASOUL,canLeftStall=False,canRightStall=False} .& rightDash
            ) .& complexSkips
        )
    ,

    place Wanderer's_Journal_Above_Mantis_Village $
        has Fungus2_17 .& (
            anyClaw
         .| shriekPogo(cast 5){before=AREASOUL}
        )
    ,

    place Wanderer's_Journal_Crystal_Peak_Crawlers $
        has Mines_20
    ,

    place Wanderer's_Journal_Resting_Grounds_Catacombs $
        has RestingGrounds_10 .& (
            anyClaw
         .| wings
        )
    ,

    place Wanderer's_Journal_King's_Station $
        has Ruins2_05_bot1 .& enemyPogos
     .| has Ruins2_05_left1
     .| has Ruins2_05_top1
    ,

    place Wanderer's_Journal_Pleasure_House $
        has Ruins_Elevator_left1
     .| has Ruins_Elevator_left2
    ,

    place Wanderer's_Journal_City_Storerooms $
        has Ruins1_28
     .| has Ruins1_28_left1
    ,

    place Wanderer's_Journal_Ancient_Basin $
        (
            has Abyss_02_right1
         .| has Abyss_02_bot1 .& (
                leftClaw
             .| wings
            )
        ) .& (
            leftClaw .& rightSuperdash
         .| rightDash
         .| spikeTunnels
        )
    ,

    place Wanderer's_Journal_Kingdom's_Edge_Entrance $
        has Deepnest_East_07_bot1
    ,

    place Wanderer's_Journal_Kingdom's_Edge_Camp $
        has Deepnest_East_13_bot1
    ,

    place Wanderer's_Journal_Kingdom's_Edge_Requires_Dive $
        (
            has Deepnest_East_18 .& (
                anyClaw
             .| wings
            )
         .| has Deepnest_East_18_top1
        ) .& has Broke_Edge_Journal_Quake_Floor
    ,

    place Hallownest_Seal_Crossroads_Well $
        (
            has Crossroads_01_left1
         .| has Crossroads_01_top1
         .| has Crossroads_01_right1
        ) .& (
            anyClaw
         .| wings .& (
                infected
             .| shadeSkip(1) .& (
                    anyDash
                 .| spellAirstall .& castSpell(cast 1){before=ROOMSOUL}
                )
             .| shadeSkip(2)
            )
         .| infected .& anyDash .& damageBoosts .& takeDamage(3)
         .| shriekPogo(cast 5){before=AREASOUL}
        )
    ,

    place Hallownest_Seal_Greenpath $
        (
            has Fungus1_10_left1
         .| has Fungus1_10_top1
         .| has Fungus1_10_right1
        ) .& (
            acid
         .| wings .& spellAirstall .& castSpell(cast 1){before=ROOMSOUL}
         .| leftDash .& (
                spellAirstall .& castSpell(cast 1){before=ROOMSOUL}
             .| dashMaster .& obscureSkips
             .| wings
             .| leftClaw
            )
         .| leftSuperdash
        )
    ,

    place Hallownest_Seal_Fog_Canyon_West $
        has Fungus3_30_bot1
    ,

    place Hallownest_Seal_Fog_Canyon_East $
        has Fungus3_26_top1 .& (
            leftClaw
         .| wings
         .| leftSuperdash
         .| leftDash
         .| damageBoosts .& takeDamage(1)
         .| spellAirstall .& castSpell(cast 2)
        )
    ,

    place Hallownest_Seal_Queen's_Station $
        has Fungus2_34_right1 .& wings
    ,

    place Hallownest_Seal_Fungal_Wastes_Sporgs $
        has Fungus2_03 .& (
            anyClaw
         .| wings
         .| leftDash
         .| leftSuperdash
         .| enemyPogos
        ) .& (
            rightDash
         .| rightClaw
         .| wings
         .| leftClaw
         .| preciseMovement
         .| enemyPogos .& dangerousSkips
        )
    ,

    place Hallownest_Seal_Mantis_Lords $
        (
            has Fungus2_31_left1 .& has Defeated_Mantis_Lords
         .| has Bench_Mantis_Village
        ) .& (
            anyClaw
         .| wings
        )
    ,

    place Hallownest_Seal_Resting_Grounds_Catacombs $
        has RestingGrounds_10 .& upWallBreak
    ,

    place Hallownest_Seal_King's_Station $
        has Ruins2_08_left1 .& (
            leftClaw
         .| wings
         .| rightClaw .& leftDash
        )
    ,

    place Hallownest_Seal_City_Rafters $
        has Ruins1_03
    ,

    place Hallownest_Seal_Soul_Sanctum $
        has Ruins1_32_right1 .& (
            anyClaw
         .| shriekPogo(cast 1){before=AREASOUL}
        ) .& has Broke_Quake_Floor_After_Soul_Master_1 .& has Broke_Quake_Floor_After_Soul_Master_2
    ,

    place Hallownest_Seal_Watcher_Knight $
        (
            has Ruins2_03_top1
         .| has Ruins2_03_bot1 .& has Defeated_Watcher_Knights .& (
                anyClaw
             .| shriekPogo(cast 8){before=AREASOUL}
            )
        ) .& (
            rightClaw
         .| wings
         .| leftClaw .& rightSuperdash
         .| rightDash .& backgroundPogos
        )
    ,

    place Hallownest_Seal_Deepnest_By_Mantis_Lords $
        has Deepnest_16_bot1 .& (
            leftClaw
         .| rightClaw .& wings
         .| wings .& anyDash .& enemyPogos .& complexSkips .& shadeSkip(2)
         .| shriekPogo(cast 6)
        )
    ,

    place Hallownest_Seal_Beast's_Den $
        has Deepnest_Spider_Town_left1
    ,

    place Hallownest_Seal_Queen's_Gardens $
        (
            has Fungus3_48_right2
         .| has Fungus3_48_bot1
        ) .& (
            fullClaw
         .| wings
         .| enemyPogos .& dangerousSkips
        )
    ,

    place King's_Idol_Cliffs $
        has Cliffs_01
    ,

    place King's_Idol_Crystal_Peak $
        (
            has Mines_30_right1
         .| has Mines_30_left1 .& rightSuperdash
        ) .& (
            rightClaw .& rightDash .& backgroundPogos
         .| wings
        )
    ,

    place King's_Idol_Glade_of_Hope $
        has RestingGrounds_08_left1 .& (
            swim .& leftClaw
         .| swim .& wings .& anyClaw
         .| rightSuperdash .& fullClaw
         .| rightSuperdash .& wings .& anyClaw
         .| wings .& rightDash
         .| wings .& leftClaw .& obscureSkips
         .| rightClaw .& rightDash .& difficultSkips .& (
                swim
             .| rightSuperdash
            )
         .| shriekPogo(castSequence [1,1])
         .| shriekPogo(cast 1) .& (
                swim
             .| rightDash
             .| rightSuperdash
            )
        )
    ,

    place King's_Idol_Dung_Defender $
        has Waterways_15_top1
    ,

    place King's_Idol_Great_Hopper $
        has Deepnest_East_08_top1
     .| has Deepnest_East_08_right1
    ,

    place King's_Idol_Pale_Lurker $
        has GG_Lurker_left1 .& (
            swim
         .| rightSkipAcid
        )
    ,

    place King's_Idol_Deepnest $
        has Deepnest_33_top1
    ,

    place Arcane_Egg_Lifeblood_Core $
        has Abyss_08_right1 .& (
            preciseMovement
         .| leftDash
        ) .& (
            rightSuperdash .& (
                rightClaw
             .| wings
            )
        )
    ,

    place Arcane_Egg_Shade_Cloak $
        has Abyss_10_left2 .& rightShadowDash
     .| has Abyss_10_left1 .& (
            rightShadowDash
         .| voidHeart .& (
                swim
             .| rightDash
             .| rightSuperdash
             .| fullClaw
             .| wings
            )
         .| (
                rightClaw
             .| wings .& shadeSkip(2)
             .| shriekPogo(cast 2)
            ) .& (
                leftShadowDash
             .| voidHeart .& (
                    leftDash
                 .| leftSuperdash
                )
            )
        )
    ,

    place Arcane_Egg_Birthplace $
        has Abyss_15_top1
    ,

    place Whispering_Root_Crossroads $
        has Crossroads_07 .& (
            rightClaw
         .| wings .& leftClaw
         .| shriekPogo(cast 5){before=AREASOUL}
        ) .& (
            wings
         .| fullSuperdash
         .| anyDash
         .| infected
        ) .& dreamNail .& upWallBreak
    ,

    place Whispering_Root_Greenpath $
        has Fungus1_13_left1 .& has Fungus1_13_right1 .& (
            leftClaw
         .| rightClaw .& wings .& (
                leftDash
             .| leftSuperdash
             .| damageBoosts .& takeDamage(1)
            )
         .| shriekPogo(cast 2){before=AREASOUL} .& enemyPogos
        ) .& dreamNail .& (
            sideSlash
         .| greatSlash
         .| cycloneSlash
         .| fullDashSlash
         .| anyDashSlash .& dashMaster .& obscureSkips
        )
    ,

    place Whispering_Root_Leg_Eater $
        (
            has Fungus2_33_left1
         .| has Fungus2_33_right1
        ) .& dreamNail
    ,

    place Whispering_Root_Mantis_Village $
        has Fungus2_17 .& (
            anyClaw
         .| shriekPogo(cast 5){before=AREASOUL} .& enemyPogos
        ) .& dreamNail
    ,

    place Whispering_Root_Deepnest $
        has Deepnest_39 .& (
            lantern
         .| darkRooms
        ) .& (
            fullClaw
         .| wings .& anyClaw
         .| wings .& enemyPogos
        ) .& dreamNail
    ,

    place Whispering_Root_Queens_Gardens $
        has Fungus3_11 .& (
            leftClaw
         .| wings
         .| rightClaw .& enemyPogos
        ) .& dreamNail
    ,

    place Whispering_Root_Kingdoms_Edge $
        has Deepnest_East_07 .& (
            anyClaw
         .| wings
        ) .& dreamNail
    ,

    place Whispering_Root_Waterways $
        has Abyss_01_left3 .& (
            fullClaw .& (
                rightDash
             .| wings
             .| rightSuperdash
             .| enemyPogos
            )
         .| leftClaw .& fullDash .& obscureSkips
         .| wings .& anyClaw
         .| shriekPogo(cast 2){before=AREASOUL}
        ) .& dreamNail
    ,

    place Whispering_Root_City $
        (
            has Ruins1_17_top1
         .| has Ruins1_17_right1
        ) .& (
            fullDash
         .| wings
         .| fullSuperdash
         .| enemyPogos
        ) .& dreamNail
    ,

    place Whispering_Root_Resting_Grounds $
        has RestingGrounds_05 .& dreamNail
    ,

    place Whispering_Root_Spirits_Glade $
        has RestingGrounds_08_left1 .& dreamNail .& (
            wings .& (
                swim .& anyClaw
             .| rightDash .& anyClaw
             .| rightSuperdash .& anyClaw
             .| fullDash
             .| leftClaw .& obscureSkips
            )
         .| leftClaw .& swim .& rightDash
         .| fullClaw .& rightSuperdash .& rightDash
         .| rightClaw .& rightDash .& difficultSkips .& (
                swim
             .| rightSuperdash
            )
         .| shriekPogo(castSequence [1,1])
         .| shriekPogo(cast 1) .& (
                swim
             .| rightDash
             .| rightSuperdash
            )
        )
    ,

    place Whispering_Root_Crystal_Peak $
        (
            has Mines_23_left1
         .| has Mines_23_top1
         .| has Mines_23_right1
         .| has Mines_23_right2
        ) .& (
            rightClaw
         .| wings
        ) .& (
            fullDash
         .| wings
        ) .& dreamNail
    ,

    place Whispering_Root_Howling_Cliffs $
        has Cliffs_01 .& (
            leftClaw
         .| rightClaw .& fullDash
         .| wings
         .| fullDash .& enemyPogos
        ) .& dreamNail
    ,

    place Whispering_Root_Ancestral_Mound $
        has Crossroads_ShamanTemple_left1 .& (
            wings
         .| fullClaw .& enemyPogos
        ) .& (
            anyClaw
         .| has Defeated_Ancestral_Mound_Baldur
         .| shriekPogo(cast 2){before=ROOMSOUL}
        ) .& dreamNail .& upWallBreak
    ,

    place Whispering_Root_Hive $
        (
            has Hive_02_left1
         .| has Hive_02_left2
         .| has Hive_02_left3
        ) .& (
            rightClaw
         .| wings
         .| fullDash .& leftClaw
        ) .& dreamNail
    ,

    place Boss_Essence_Elder_Hu $
        has Fungus2_32_left1 .& dreamNail .& has Defeated_Elder_Hu
    ,

    place Boss_Essence_Xero $
        (
            has RestingGrounds_02_top1
         .| has RestingGrounds_02 .& (
                anyClaw
             .| wings
             .| rightSuperdash
             .| backgroundPogos
            )
        ) .& dreamNail .& has Defeated_Xero
    ,

    place Boss_Essence_Gorb $
        has Cliffs_02 .& dreamNail .& has Defeated_Gorb
    ,

    place Boss_Essence_Marmu $
        (
            has Fungus3_40_top1
         .| (
                has Fungus3_40_right1
             .| has Can_Stag .& queensGardensStag
             .| has Bench_Gardens_Stag
            ) .& (
                leftClaw
             .| rightClaw .& leftSuperdash
             .| wings
             .| leftDash
            )
        ) .& dreamNail .& has Defeated_Marmu
    ,

    place Boss_Essence_No_Eyes $
        (
            has Fungus1_35_left1
         .| has Fungus1_35_right1
        ) .& lantern .& dreamNail .& has Defeated_No_Eyes
    ,

    place Boss_Essence_Galien $
        has Deepnest_40_right1 .& dreamNail .& has Defeated_Galien
    ,

    place Boss_Essence_Markoth $
        has Deepnest_East_10_left1 .& dreamNail .& has Defeated_Markoth
    ,

    place Boss_Essence_Failed_Champion $
        (
            has Crossroads_10_left1
         .| has Crossroads_10_right1
        ) .& has Defeated_False_Knight .& has Defeated_Failed_Champion .& (
            anyClaw
         .| wings .& infected
         .| shriekPogo(cast 2){before=AREASOUL}
        ) .& dreamNail
    ,

    place Boss_Essence_Soul_Tyrant $
        (
            has Ruins1_24_right1
         .| has Ruins1_24_left1
        ) .& has Defeated_Soul_Master .& has Defeated_Soul_Tyrant .& dreamNail
    ,

    place Boss_Essence_Lost_Kin $
        has Abyss_19_bot1 .& (
            anyClaw
         .| wings
        ) .& dreamNail .& has Defeated_Broken_Vessel .& has Defeated_Lost_Kin
    ,

    place Boss_Essence_White_Defender $
        has Waterways_15_top1 .& dreamNail .& dreamer_3 .& has Defeated_Dung_Defender .& has Defeated_White_Defender
    ,

    place Boss_Essence_Grey_Prince_Zote $
        has Room_Bretta_right1 .& dreamNail .& wings .& has Rescued_Bretta .& has Defeated_Colosseum_Zote .& has Defeated_Grey_Prince_Zote
    ,

    place Grub_Crossroads_Acid $
        has Crossroads_35_right1
    ,

    place Grub_Crossroads_Center $
        (
            has Crossroads_05_left1
         .| has Crossroads_05_right1
        ) .& (
            enemyPogos
         .| rightDash
         .| wings
         .| rightSuperdash
        )
    ,

    place Grub_Crossroads_Stag $
        has Crossroads_03
    ,

    place Grub_Crossroads_Spike $
        has Crossroads_31_right1
    ,

    place Grub_Crossroads_Guarded $
        has Crossroads_48_left1
    ,

    place Grub_Greenpath_Cornifer $
        (
            has Fungus1_06_left1
         .| has Fungus1_06_bot1
        ) .& (
            sideSlash
         .| greatSlash
         .| cycloneSlash
         .| rightDash
         .| leftDashSlash .& dashMaster .& obscureSkips
         .| rightClaw
         .| wings
         .| rightSuperdash
         .| enemyPogos
        )
    ,

    place Grub_Greenpath_Journal $
        (
            has Fungus1_07_left1
         .| has Fungus1_07_top1
         .| has Fungus1_07_right1
        ) .& (
            sideSlash
         .| greatSlash
         .| cycloneSlash
         .| rightDash
         .| leftDashSlash
         .| wings
         .| acid .& (
                rightClaw
             .| enemyPogos
            )
         .| enemyPogos .& difficultSkips
        )
    ,

    place Grub_Greenpath_MMC $
        has Fungus1_13_right1
    ,

    place Grub_Greenpath_Stag $
        has Fungus1_21
    ,

    place Grub_Fog_Canyon $
        has Fungus3_47 .& (
            leftSuperdash
         .| shriekPogo(cast 2){before=AREASOUL}
        )
    ,

    place Grub_Fungal_Bouncy $
        has Fungus2_18_right1
    ,

    place Grub_Fungal_Spore_Shroom $
        has Fungus2_20_left1
     .| has Fungus2_20_right1
    ,

    place Grub_Deepnest_Mimic $
        has Deepnest_36_left1
    ,

    place Grub_Deepnest_Nosk $
        has Deepnest_31_right1
     .| has Deepnest_31_right2 .& (
            anyClaw
         .| wings
        )
    ,

    place Grub_Deepnest_Spike $
        has Deepnest_03_top1 .& leftClaw
     .| has Deepnest_03 .& (
            fullClaw
         .| wings
         .| leftClaw .& shadeSkip(1)
         .| rightClaw .& enemyPogos .& (
                complexSkips
             .| has Deepnest_03_left1
            ) .& (
                rightDash
             .| dangerousSkips
            )
        )
    ,

    place Grub_Dark_Deepnest $
        (
            lantern
         .| darkRooms
        ) .& (
            has Deepnest_39 .& (
                rightClaw
             .| wings .& (
                    leftClaw
                 .| enemyPogos
                )
            )
         .| has Deepnest_39_top1
         .| has Deepnest_39_left1 .& (
                rightClaw
             .| wings
             .| rightDash
            )
        )
    ,

    place Grub_Beast's_Den $
        has Deepnest_Spider_Town_left1 .& (
            wings .& anyClaw
         .| (
                fullClaw
             .| wings .& complexSkips .& shadeSkip(2)
             .| shriekPogo(cast 2){before=ROOMSOUL} .& shriekPogo(cast 2){before=ROOMSOUL}
            ) .& combatLeftDevout
        )
    ,

    place Grub_Kingdom's_Edge_Oro $
        (
            has Deepnest_East_14_door1
         .| has Deepnest_East_14_top2 .& has Broke_Oro_Quake_Floor_2 .& has Broke_Oro_Quake_Floor_3 .& (
                rightClaw
             .| wings
             .| leftClaw .& enemyPogos
             .| fullDash .& damageBoosts .& enemyPogos .& complexSkips .& takeDamage(1) .& takeDamage(1)
            ) .& (
                rightDash
             .| preciseMovement
            )
         .| has Deepnest_East_14_left1 .& (
                rightDash
             .| spikeTunnels
            )
        ) .& (
            anyClaw
         .| wings
         .| shadeSkip(2) .& enemyPogos .& (
                anyDash
             .| spellAirstall .& castSpell(cast 1){before=ROOMSOUL}
            )
        )
    ,

    place Grub_Kingdom's_Edge_Camp $
        has Deepnest_East_11 .& (
            anyClaw
         .| wings
         .| preciseMovement .& (
                leftDash
             .| damageBoosts .& takeDamage(1)
            )
        )
    ,

    place Grub_Hive_External $
        has Hive_03_top1
    ,

    place Grub_Hive_Internal $
        (
            has Hive_04_left1
         .| has Hive_04_right1
        ) .& (
            anyClaw .& wings .& (
                leftClaw .& rightSuperdash
             .| rightClaw .& leftSuperdash
             .| enemyPogos .& difficultSkips
            )
         .| fullClaw .& leftSuperdash .& obscureSkips .& preciseMovement
        )
    ,

    place Grub_Basin_Requires_Wings $
        has Abyss_19 .& (
            wings .& (
                anyClaw
             .| enemyPogos
            )
         .| anyClaw .& enemyPogos .& backgroundPogos .& slopeball(cast 1){before=ROOMSOUL}
        )
    ,

    place Grub_Basin_Requires_Dive $
        has Abyss_17_top1 .& has Broke_Basin_Grub_Quake_Floor
    ,

    place Grub_Waterways_Main $
        has Waterways_04 .& (
            rightClaw
         .| swim
         .| cycloneSlash
         .| (
                fireball
             .| scream
            ) .& castSpell(cast 1){before=ROOMSOUL}
        )
     .| has Waterways_04_left2 .& (
            swim
         .| rightSkipAcid
        )
    ,

    place Grub_Isma's_Grove $
        has Waterways_13 .& (
            acid
         .| rightSkipAcid
        ) .& anyClaw
     .| has Waterways_13_left1 .& (
            fullClaw
         .| anyClaw .& (
                wings
             .| enemyPogos
            )
         .| leftClaw .& (
                rightDash
             .| rightSuperdash
            )
         .| shriekPogo(cast 5) .& enemyPogos
        ) .& (
            acid
         .| rightSkipAcid
         .| rightDash .& acidSkips .& shriekPogo(cast 1)
        )
    ,

    place Grub_Waterways_Requires_Tram $
        has Waterways_14_bot1 .& (
            anyClaw
         .| shriekPogo(cast 2)
        ) .& (
            rightSuperdash .& wings .& (
                rightClaw
             .| leftClaw .& enemyPogos
             .| enemyPogos .& dangerousSkips
            )
         .| acid .& (
                rightClaw
             .| leftClaw .& wings
             .| wings .& enemyPogos .& dangerousSkips
            )
        )
     .| has Waterways_14_bot2 .& (
            rightClaw
         .| wings .& leftClaw
         .| shriekPogo(cast 1){before=ITEMSOUL}
        ) .& (
            leftSuperdash .& wings .& (
                rightClaw
             .| leftClaw .& enemyPogos
             .| enemyPogos .& dangerousSkips
            )
         .| acid .& (
                rightClaw
             .| leftClaw .& wings
             .| wings .& enemyPogos .& dangerousSkips
            )
        )
    ,

    place Grub_City_of_Tears_Left $
        (
            has Ruins1_05_top1
         .| has Ruins1_05_right1
         .| has Ruins1_05 .& (
                leftClaw
             .| wings .& (
                    rightClaw
                 .| backgroundPogos
                )
             .| shriekPogo(cast 2){before=AREASOUL}
            )
        ) .& (
            rightClaw
         .| wings
         .| leftClaw .& backgroundPogos
         .| enemyPogos
        )
    ,

    place Grub_Soul_Sanctum $
        has Ruins1_32_right1 .& (
            anyClaw
         .| shriekPogo(cast 1){before=AREASOUL}
        ) .& has Broke_Quake_Floor_After_Soul_Master_1 .& has Broke_Quake_Floor_After_Soul_Master_2 .& has Broke_Quake_Floor_After_Soul_Master_3
    ,

    place Grub_Watcher's_Spire $
        has Ruins2_03_bot2 .& (
            rightClaw
         .| wings .& leftClaw
         .| shriekPogo(cast 5){before=AREASOUL}
        )
    ,

    place Grub_City_of_Tears_Guarded $
        has Ruins_House_01_left1
    ,

    place Grub_King's_Station $
        (
            has Ruins2_07_left1 .& (
                swim
             .| rightSkipAcid
            )
         .| has Ruins2_07_top1
         .| has Ruins2_07_right1 .& (
                leftDash
             .| swim
             .| leftClaw
             .| wings
            )
        ) .& (
            leftDash
         .| swim
         .| rightClaw .& leftSuperdash
         .| wings .& leftSuperdash
         .| rightClaw .& wings .& preciseMovement
         .| wings .& spellAirstall .& castSpell(cast 3)
         .| shriekPogo(cast 1)
        )
    ,

    place Grub_Resting_Grounds $
        has RestingGrounds_10 .& (
            leftClaw
         .| wings
         .| enemyPogos .& dangerousSkips .& rightClaw
        ) .& upWallBreak
    ,

    place Grub_Crystal_Peak_Below_Chest $
        has Mines_04_top1
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
    ,

    place Grub_Crystal_Peak_Spike $
        has Mines_03 .& (
            fullClaw .& fullDash
         .| spikeTunnels .& (
                fullClaw .& (
                    (
                        leftDash
                     .| leftSuperdash
                    ) .& (
                        rightDash
                     .| rightSuperdash
                    )
                 .| spellAirstall .& castSpell(cast 2)
                )
             .| wings .& (
                    fullDash
                 .| spellAirstall .& castSpell(cast 2)
                )
            )
        )
    ,

    place Grub_Crystal_Peak_Mimic $
        has Mines_16_top1 .& (
            leftClaw
         .| wings
         .| rightClaw .& (
                leftDash
             .| spellAirstall .& castSpell(cast 2)
            )
        )
    ,

    place Grub_Crystal_Peak_Crushers $
        (
            has Mines_19_left1
         .| has Mines_19_right1
        ) .& (
            anyClaw
         .| wings
        ) .& (
            leftDash
         .| obscureSkips .& dangerousSkips .& dashSprint
         .| leftSuperdash .& dangerousSkips .& difficultSkips
        )
    ,

    place Grub_Crystal_Heart $
        has Mines_31_left1 .& (
            leftClaw .& rightSuperdash
         .| wings .& (
                leftClaw .& rightDash
             .| rightClaw
             .| backgroundPogos
            )
         .| fullClaw .& rightDash .& spellAirstall .& castSpell(cast 3)
         .| shriekPogo(cast 2){before=AREASOUL}
        )
    ,

    place Grub_Hallownest_Crown $
        has Mines_24_left1 .& (
            rightDash
         .| rightSuperdash
         .| spikeTunnels
        )
    ,

    place Grub_Howling_Cliffs $
        has Fungus1_28_left1
    ,

    place Grub_Queen's_Gardens_Stag $
        has Fungus3_10_bot1 .& (
            wings
         .| fullDash
        ) .& has Defeated_West_Queen's_Gardens_Arena
     .| has Fungus3_10_top1
    ,

    place Grub_Queen's_Gardens_Marmu $
        (
            has Fungus3_48_bot1
         .| has Fungus3_48_right2
        ) .& (
            fullClaw
         .| wings .& anyClaw
         .| enemyPogos .& shriekPogo(cast 2){before=ROOMSOUL}
        )
    ,

    place Grub_Queen's_Gardens_Top $
        has Fungus3_22 .& (
            fullClaw .& leftSuperdash .& (
                rightSuperdash
             .| wings
            )
         .| complexSkips .& spellAirstall .& castSpell(cast 3){before=ROOMSOUL} .& wings .& leftClaw .& (
                rightClaw .& leftSharpShadow
             .| rightClaw .& leftDash .& difficultSkips
             .| leftSharpShadow .& difficultSkips
            )
         .| leftDash .& leftClaw .& (
                shriekPogo(cast 2){before=ROOMSOUL} .& enemyPogos .& complexSkips
             .| shriekPogo(cast 1){before=ROOMSOUL} .& rightClaw
            )
         .| rightClaw .& (
                fullDash .& shriekPogo(cast 5){before=AREASOUL}
             .| leftSuperdash .& shriekPogo(cast 4){before=AREASOUL}
            )
        )
    ,

    place Grub_Collector_1 $
        has Ruins2_11_right1 .& (
            leftClaw
         .| rightClaw .& (
                wings
             .| rightDash
             .| preciseMovement
            )
         .| wings .& complexSkips .& enemyPogos
         .| shriekPogo(cast 5){before=AREASOUL}
        ) .& has Defeated_Collector
    ,

    place Grub_Collector_2 $
        has Ruins2_11_right1 .& (
            leftClaw
         .| rightClaw .& (
                wings
             .| rightDash
             .| preciseMovement
            )
         .| wings .& complexSkips .& enemyPogos
         .| shriekPogo(cast 5){before=AREASOUL}
        ) .& has Defeated_Collector
    ,

    place Grub_Collector_3 $
        has Ruins2_11_right1 .& (
            leftClaw
         .| rightClaw .& (
                wings
             .| rightDash
             .| preciseMovement
            )
         .| wings .& complexSkips .& enemyPogos
         .| shriekPogo(cast 5){before=AREASOUL}
        ) .& has Defeated_Collector
    ,

    place Mimic_Grub_Deepnest_1 $
        has Deepnest_36_left1
    ,

    place Mimic_Grub_Deepnest_2 $
        has Deepnest_36_left1
    ,

    place Mimic_Grub_Deepnest_3 $
        has Deepnest_36_left1
    ,

    place Mimic_Grub_Crystal_Peak $
        has Mines_16_top1
    ,

    place Crossroads_Map $
        has Crossroads_33
    ,

    place Greenpath_Map $
        has Fungus1_06_bot1
     .| has Fungus1_06_left1 .& (
            sideSlash
         .| greatSlash
         .| cycloneSlash
         .| rightDash
         .| leftDashSlash
         .| rightSuperdash
         .| enemyPogos
         .| rightClaw
         .| wings
         .| spellAirstall .& castSpell(cast 2){before=AREASOUL}
        )
    ,

    place Fog_Canyon_Map $
        (
            has Fungus3_25_left1 .& rightShadowDash
         .| has Fungus3_25_right1
        ) .& (
            wings
         .| enemyPogos .& (
                leftClaw .& leftDash
             .| complexSkips .& fullDash
            )
        )
    --  .| has StartLocation_East_Fog_Canyon .& leftDash .& leftClaw
    ,

    place Fungal_Wastes_Map $
        has Fungus2_18
    ,

    place Deepnest_Map_Upper $
        has Deepnest_01b
     .| has Deepnest_01b_bot1
    ,

    place Deepnest_Map_Right $
        (
            has Fungus2_25_top1
         .| has Fungus2_25_top2
         .| has Fungus2_25_right1
        ) .& (
            anyClaw
         .| shriekPogo(cast 1)
        )
    ,

    place Ancient_Basin_Map $
        has Abyss_04_top1 .& (
            rightDash
         .| anyClaw
         .| wings
         .| rightSuperdash
         .| preciseMovement
        )
     .| (
            has Abyss_04_left1
         .| has Abyss_04_right1
         .| has Abyss_04_bot1
        ) .& (
            anyClaw
         .| wings .& enemyPogos
        )
    ,

    place Kingdom's_Edge_Map $
        has Deepnest_East_03
    ,

    place City_of_Tears_Map $
        has Ruins1_31
     .| has Ruins1_31_bot1
     .| has Ruins1_31_left1
    ,

    place Royal_Waterways_Map $
        (
            has Waterways_09_left1
         .| has Waterways_09_right1
        ) .& (
            leftClaw
         .| (
                leftDash
             .| leftSuperdash
            ) .& rightClaw
         .| wings
        )
    --  .| has StartLocation_West_Waterways
    ,

    place Howling_Cliffs_Map $
        has Cliffs_01_right1
     .| has Cliffs_01_right2
     .| has Cliffs_01 .& (
            fullDash .& enemyPogos
         .| anyClaw
         .| wings
        )
    ,

    place Crystal_Peak_Map $
        has Mines_30_right1
     .| has Mines_30_left1 .& rightSuperdash
    ,

    place Queen's_Gardens_Map $
        has Fungus1_24_left1 .& (
            anyClaw
         .| wings
        )
    ,

    place Resting_Grounds_Map $
        has RestingGrounds_09_left1
     .| has Can_Stag .& restingGroundsStag
    ,

    place Dirtmouth_Stag $
        has Room_Town_Stag_Station_left1
     .| has Can_Stag
    ,

    place Crossroads_Stag $
        has Crossroads_47_right1
     .| has Can_Stag .& crossroadsStag
    ,

    place Greenpath_Stag $
        has Fungus1_16_alt_right1
     .| has Can_Stag .& greenpathStag
    ,

    place Queen's_Station_Stag $
        has Fungus2_02_right1
     .| has Can_Stag .& queensStationStag
    ,

    place Queen's_Gardens_Stag $
        has Fungus3_40_top1 .& (
            rightDash
         .| wings
         .| rightClaw
         .| leftClaw .& rightSuperdash
         .| enemyPogos
         .| shadeSkip(1)
         .| spellAirstall .& castSpell(cast 2){before=ROOMSOUL}
        )
     .| has Fungus3_40_right1
     .| has Can_Stag .& queensGardensStag
     .| has Bench_Gardens_Stag
    ,

    place City_Storerooms_Stag $
        has Ruins1_29_left1
     .| has Can_Stag .& cityStoreroomsStag
    ,

    place King's_Station_Stag $
        has Ruins2_08_left1
     .| has Can_Stag .& kingsStationStag
    ,

    place Resting_Grounds_Stag $
        has RestingGrounds_09_left1
     .| has Can_Stag .& restingGroundsStag
    ,

    place Distant_Village_Stag $
        has Deepnest_09_left1
     .| has Can_Stag .& distantVillageStag
    ,

    place Hidden_Station_Stag $
        has Abyss_22_left1
     .| has Can_Stag .& hiddenStationStag
    ,

    place Stag_Nest_Stag $
        has Cliffs_03_right1
     .| has Can_Stag .& (
            stagNestStag
         .| allStags
        )
    ,

    place Lifeblood_Cocoon_King's_Pass $
        has Tutorial_01
    ,

    place Lifeblood_Cocoon_Ancestral_Mound $
        has Crossroads_ShamanTemple_left1 .& (
            upWallBreak
         .| (
                leftSuperdash .& rightClaw
             .| rightSuperdash .& leftClaw
            ) .& obscureSkips
        )
    ,

    place Lifeblood_Cocoon_Greenpath $
        has Fungus1_32_bot1
     .| has Fungus1_32_top1
     .| has Fungus1_32_left1
    ,

    place Lifeblood_Cocoon_Fog_Canyon_West $
        has Fungus3_30_bot1
    ,

    place Lifeblood_Cocoon_Mantis_Village $
        (
            has Fungus2_15_top3
         .| has Fungus2_15_right1
         .| has Fungus2_15_left1
        ) .& (
            leftClaw .& wings
         .| rightClaw .& leftSuperdash
         .| shriekPogo(cast 4)
        )
    ,

    place Lifeblood_Cocoon_Failed_Tramway $
        (
            has Deepnest_26 .& (
                leftClaw
             .| wings .& enemyPogos
             .| shriekPogo(cast 1)
            )
         .| has Deepnest_26_left1 .& has Opened_Tramway_Exit_Gate
        ) .& (
            leftClaw
         .| wings .& (
                rightClaw .& (
                    leftDash
                 .| leftSuperdash
                 .| obscureSkips .& preciseMovement
                )
             .| enemyPogos
             .| shadeSkip(1)
            )
        )
    ,

    place Lifeblood_Cocoon_Galien $
        has Deepnest_40_right1 .& (
            rightClaw
         .| wings .& leftClaw
         .| leftClaw .& leftDash .& obscureSkips
         .| shriekPogo(castSequence [2,2]){before=AREASOUL}
        )
    ,

    place Lifeblood_Cocoon_Kingdom's_Edge $
        has Deepnest_East_15_left1
    ,

    place Grimmkin_Flame_City_Storerooms $
        has Ruins1_28 .& grimmchild
    ,

    place Grimmkin_Flame_Greenpath $
        (
            has Fungus1_10_left1
         .| has Fungus1_10_top1
         .| has Fungus1_10_right1
        ) .& grimmchild
    ,

    place Grimmkin_Flame_Crystal_Peak $
        (
            has Mines_10_bot1 .& (
                rightClaw .& rightSuperdash .& (
                    leftClaw
                 .| rightDash .& wings
                )
             .| rightDash .& shriekPogo(castSequence [3,1])
             .| rightSuperdash .& shriekPogo(castSequence [3,2])
             .| complexSkips .& wings .& rightDash .& spellAirstall .& shadeSkip(2) .& castSpell(cast 2)
            )
         .| has Mines_10_right1 .& (
                leftSuperdash
             .| wings .& leftDash .& (
                    leftClaw .& (
                        spellAirstall .& castSpell(cast 2)
                     .| obscureSkips .& leftSharpShadow
                    )
                 .| shriekPogo(cast 1)
                )
            )
        ) .& grimmchild
    ,

    place Grimmkin_Flame_King's_Pass $
        has Tutorial_01 .& has First_Grimmchild_Upgrade .& grimmchild
    ,

    place Grimmkin_Flame_Resting_Grounds $
        (
            has RestingGrounds_06_left1
         .| has RestingGrounds_06_right1
         .| has RestingGrounds_06_top1
        ) .& has First_Grimmchild_Upgrade .& grimmchild
    ,

    place Grimmkin_Flame_Kingdom's_Edge $
        has Deepnest_East_03 .& has First_Grimmchild_Upgrade .& grimmchild
    ,

    place Grimmkin_Flame_Fungal_Core $
        has Fungus2_30_top1 .& has Second_Grimmchild_Upgrade .& grimmchild
    ,

    place Grimmkin_Flame_Ancient_Basin $
        (
            has Abyss_02_right1
         .| has Abyss_02_bot1 .& (
                leftClaw
             .| wings
            ) .& (
                rightClaw
             .| wings
             .| rightDash
             .| rightSuperdash
             .| enemyPogos
            )
        ) .& has Second_Grimmchild_Upgrade .& grimmchild
    ,

    place Grimmkin_Flame_Hive $
        (
            has Hive_03_right1
         .| has Hive_03_bot1 .& (
                fullClaw
             .| wings
             .| fullDash .& enemyPogos
            )
        ) .& has Second_Grimmchild_Upgrade .& grimmchild
    ,

    place Grimmkin_Flame_Brumm $
        has Room_spider_small_left1 .& has Second_Grimmchild_Upgrade .& grimmchild
    ,

    place Hunter's_Journal $
        has Fungus1_08_left1
    ,

    place Journal_Entry_Void_Tendrils $
        has Abyss_09_right3
    ,

    place Journal_Entry_Charged_Lumafly $
        has Uumuu_Arena .& has Defeated_Uumuu .& (
            rightClaw .& (
                acid
             .| rightSuperdash
             .| rightDash .& wings
             .| rightSharpShadow .& spellAirstall .& castSpell(cast 3){before=ROOMSOUL}
            )
         .| leftClaw .& wings .& (
                acid
             .| rightSuperdash
             .| rightDash .& spellAirstall .& castSpell(cast 3){before=ROOMSOUL}
            )
         .| acidSkips .& (
                rightSuperdash .& shriekPogo(castSequence [4,1]){before=AREASOUL,canRightStall=False}
             .| acid .& shriekPogo(castSequence [3,1]){before=AREASOUL,canRightStall=False}
             .| rightDash .& shriekPogo(castSequence [1,3,1]){before=AREASOUL}
             .| rightClaw .& shriekPogo(castSequence [2,1]){before=ROOMSOUL}
             .| leftClaw .& shriekPogo(cast 3){before=ROOMSOUL}
             .| rightDash .& leftClaw .& shriekPogo(cast 1){before=ROOMSOUL}
            )
        )
    ,

    place Journal_Entry_Goam $
        has Crossroads_52_left1 .& has Broke_Goam_Entry_Quake_Floor
    ,

    place Journal_Entry_Garpede $
        has Deepnest_44_top1
    ,

    place Journal_Entry_Seal_of_Binding $
        has White_Palace_20_bot1 .& has Completed_Path_of_Pain
    ,

    place Elevator_Pass $
        has Crossroads_49b_right1

    ]
