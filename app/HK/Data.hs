module HK.Data where

import qualified Data.List as List

import Logic

instance TermID TID
data TID =
    -- settings
    ITEMRANDO | MAPAREARANDO | FULLAREARANDO | ROOMRANDO | PRECISEMOVEMENT | PROFICIENTCOMBAT
    | BACKGROUNDPOGOS | ENEMYPOGOS | OBSCURESKIPS | SHADESKIPS | INFECTIONSKIPS | FIREBALLSKIPS
    | SPIKETUNNELS | ACIDSKIPS | DAMAGEBOOSTS | DANGEROUSSKIPS | DARKROOMS | COMPLEXSKIPS
    | DIFFICULTSKIPS | SLOPEBALLSKIPS | SHRIEKPOGOSKIPS | RANDOMNAIL | CURSED | RANDOMFOCUS
    | CURSEDMASKS | CURSEDNOTCHES | RANDOMELEVATORS

    -- main progression items
    | DREAMER | LURIEN | MONOMON | HERRAH | WORLDSENSE | LEFTDASH | RIGHTDASH | LEFTCLAW
    | RIGHTCLAW | LEFTSUPERDASH | RIGHTSUPERDASH | WINGS | ACID | DREAMNAIL | FIREBALL | SPELLS
    | QUAKE | SCREAM | CYCLONESLASH | DASHSLASH | GREATSLASH | FOCUS

    -- charms
    | GATHERINGSWARM | WAYWARDCOMPASS | GRUBSONG | STALWARTSHELL | BALDURSHELL
    | FURYOFTHEFALLEN | QUICKFOCUS | LIFEBLOODHEART | LIFEBLOODCORE | DEFENDERSCREST
    | FLUKENEST | THORNSOFAGONY | MARKOFPRIDE | STEADYBODY | HEAVYBLOW | SHARPSHADOW
    | SPORESHROOM | LONGNAIL | SHAMANSTONE | SOULCATCHER | SOULEATER | GLOWINGWOMB
    | FRAGILEHEART | FRAGILEGREED | FRAGILESTRENGTH | NAILMASTERSGLORY | JONISBLESSING
    | SHAPEOFUNN | HIVEBLOOD | DREAMWIELDER | DASHMASTER | QUICKSLASH | SPELLTWISTER
    | DEEPFOCUS | GRUBBERFLYSELEGY | WHITEFRAGMENT | SPRINTMASTER | DREAMSHIELD | WEAVERSONG
    | GRIMMCHILD

    -- misc items
    | CREST | LANTERN | TRAM | SIMPLE | SHOPKEY | ELEGANT | LOVEKEY | KINGSBRAND | GODTUNER
    | JOURNAL | SALUBRASBLESSING

    -- maps
    | COLLECTORSMAP | QUILL | CROSSROADSMAP | GREENPATHMAP | FOGCANYONMAP | FUNGALWASTESMAP
    | DEEPNESTMAP | ANCIENTBASINMAP | KINGDOMSEDGEMAP | CITYOFTEARSMAP
    | ROYALWATERWAYSMAP | HOWLINGCLIFFSMAP | CRYSTALPEAKMAP | QUEENSGARDENSMAP
    | RESTINGGROUNDSMAP

    -- stags
    | DIRTMOUTHSTAG | CROSSROADSSTAG | GREENPATHSTAG | QUEENSSTATIONSTAG
    | QUEENSGARDENSSTAG | CITYSTOREROOMSSTAG | KINGSSTATIONSTAG | RESTINGGROUNDSSTAG
    | DISTANTVILLAGESTAG | HIDDENSTATIONSTAG | STAGNESTSTAG

    -- collectibles
    | GEO | GRUBS | ESSENCE | RANCIDEGGS | CHARMS | MASKSHARDS | VESSELFRAGMENTS | NOTCHES | PALEORE
    | WANDERERSJOURNALS | HALLOWNESTSEALS | KINGSIDOLS | ARCANEEGGS | MAPS | STAGS | FLAMES

    -- randomizer custom items
    | ELEVATORPASS | LEFTSLASH | RIGHTSLASH | UPSLASH | DOWNSLASH | SWIM

    -- waypoints/events
    | Start_State | Can_Replenish_Geo | Can_Replenish_Geo_Crossroads | Rescued_Sly | Rescued_Bretta
    | Rescued_Deepnest_Zote | Defeated_Colosseum_Zote | Lever_Shade_Soul | Lever_City_Fountain
    | Lever_Path_of_Pain | Completed_Path_of_Pain | Lever_Dung_Defender
    | Warp_Lifeblood_Core_to_Abyss | Warp_Palace_Grounds_to_White_Palace
    | Warp_White_Palace_Entrance_to_Palace_Grounds | Warp_White_Palace_Atrium_to_Palace_Grounds
    | Warp_Path_of_Pain_Complete | Upper_Tram | Lower_Tram | Left_Elevator | Right_Elevator
    | Crossroads_Hot_Spring | Deepnest_Hot_Spring | Colosseum_Hot_Spring | Pleasure_House_Hot_Spring
    | Defeated_Gruz_Mother | Defeated_False_Knight | Defeated_Brooding_Mawlek | Defeated_Hornet_1
    | Defeated_Mantis_Lords | Defeated_Sanctum_Warrior | Defeated_Soul_Master
    | Defeated_Elegant_Warrior | Defeated_Crystal_Guardian | Defeated_Enraged_Guardian
    | Defeated_Flukemarm | Defeated_Dung_Defender | Defeated_Broken_Vessel | Defeated_Hornet_2
    | Defeated_Watcher_Knights | Defeated_Uumuu | Uumuu_Arena | Defeated_Nosk
    | Defeated_Traitor_Lord | Defeated_Grimm | Defeated_Collector | Defeated_Hive_Knight
    | Defeated_Pale_Lurker | Defeated_Elder_Hu | Defeated_Xero | Defeated_Gorb | Defeated_Marmu
    | Defeated_No_Eyes | Defeated_Galien | Defeated_Markoth | Defeated_Failed_Champion
    | Defeated_Soul_Tyrant | Defeated_Lost_Kin | Defeated_White_Defender | Defeated_Grey_Prince_Zote
    | Defeated_Colosseum_1 | Defeated_Colosseum_2 | Defeated_Ancestral_Mound_Baldur
    | Defeated_Crossroads_Baldur | Defeated_Right_Cliffs_Baldur | Defeated_Shrumal_Ogre_Arena
    | Defeated_King's_Station_Arena | Defeated_West_Queen's_Gardens_Arena
    | Defeated_Path_of_Pain_Arena | Can_Bench | Can_Warp_To_DG_Bench | Can_Warp_To_Bench | Can_Stag
    | Can_Visit_Lemm | Can_Repair_Fragile_Charms | Grey_Mourner | Can_Deliver_Flower
    | First_Grimmchild_Upgrade | Second_Grimmchild_Upgrade | Nightmare_Lantern_Lit
    | Opened_Waterways_Manhole | Opened_Dung_Defender_Wall | Opened_Resting_Grounds_Floor
    | Broke_Crypts_One_Way_Floor | Opened_Resting_Grounds_Catacombs_Wall
    | Opened_Pleasure_House_Wall | Opened_Gardens_Stag_Exit | Opened_Mawlek_Wall
    | Opened_Shaman_Pillar | Opened_Archives_Exit_Wall | Opened_Tramway_Exit_Gate
    | Broke_Camp_Bench_Wall | Broke_Sanctum_Glass_Floor | Broke_Goam_Entry_Quake_Floor
    | Broke_Pilgrim's_Way_Quake_Floor | Broke_Sanctum_Geo_Rock_Quake_Floor
    | Broke_Quake_Floor_After_Soul_Master_1 | Broke_Quake_Floor_After_Soul_Master_2
    | Broke_Quake_Floor_After_Soul_Master_3 | Broke_Quake_Floor_After_Soul_Master_4
    | Broke_Sanctum_Escape_Quake_Floor_1 | Broke_Sanctum_Escape_Quake_Floor_2
    | Broke_Crystal_Peak_Entrance_Quake_Floor | Broke_Crystal_Peak_Dive_Egg_Quake_Floor
    | Broke_Hallownest's_Crown_Quake_Floor | Broke_Crystallized_Mound_Quake_Floor
    | Broke_Resting_Grounds_Quake_Floor | Broke_Cliffs_Dark_Room_Quake_Floor
    | Broke_Weavers_Den_Secret_Wall | Broke_Basin_Grub_Quake_Floor | Broke_Lower_Edge_Quake_Floor
    | Broke_Oro_Quake_Floor_1 | Broke_Oro_Quake_Floor_2 | Broke_Oro_Quake_Floor_3
    | Broke_420_Rock_Quake_Floor_1 | Broke_420_Rock_Quake_Floor_2 | Broke_420_Rock_Quake_Floor_3
    | Broke_420_Rock_Quake_Floor_4 | Broke_420_Rock_Quake_Floor_5 | Broke_420_Rock_Quake_Floor_6
    | Broke_420_Rock_Quake_Floor_7 | Broke_420_Rock_Quake_Floor_8 | Broke_420_Rock_Quake_Floor_9
    | Broke_420_Rock_Quake_Floor_10 | Broke_420_Rock_Quake_Floor_11
    | Broke_Waterways_Bench_Quake_Floor_1 | Broke_Waterways_Bench_Quake_Floor_2
    | Broke_Waterways_Bench_Quake_Floor_3 | Broke_Flukemarm_Quake_Floor
    | Broke_Dung_Defender_Quake_Floor | Broke_Edge_Journal_Quake_Floor | Opened_Emilitia_Door
    | Lit_Abyss_Lighthouse | Opened_Lower_Kingdom's_Edge_Wall | Opened_Glade_Door
    | Opened_Waterways_Exit | Palace_Entrance_Lantern_Lit | Palace_Left_Lantern_Lit
    | Palace_Right_Lantern_Lit | Palace_Atrium_Gates_Opened | Opened_Black_Egg_Temple

    -- bench waypoints
    | Bench_Dirtmouth | Bench_Mato | Bench_Crossroads_Hot_Springs | Bench_Crossroads_Stag
    | Bench_Salubra | Bench_Ancestral_Mound | Bench_Black_Egg_Temple | Bench_Waterfall
    | Bench_Stone_Sanctuary | Bench_Greenpath_Toll | Bench_Greenpath_Stag | Bench_Lake_of_Unn
    | Bench_Sheo | Bench_Archives | Bench_Queen's_Station | Bench_Leg_Eater | Bench_Bretta
    | Bench_Mantis_Village | Bench_Quirrel | Bench_City_Toll | Bench_City_Storerooms
    | Bench_Watcher's_Spire | Bench_King's_Station | Bench_Pleasure_House | Bench_Waterways
    | Bench_Godhome_Atrium | Bench_Godhome_Roof | Bench_Hall_of_Gods | Bench_Deepnest_Hot_Springs
    | Bench_Failed_Tramway | Bench_Beast's_Den | Bench_Basin_Toll | Bench_Hidden_Station | Bench_Oro
    | Bench_Camp | Bench_Colosseum | Bench_Hive | Bench_Peak_Dark_Room | Bench_Crystal_Guardian
    | Bench_Grounds_Stag | Bench_Grey_Mourner | Bench_Gardens_Cornifer | Bench_Gardens_Toll
    | Bench_Gardens_Stag | Bench_Palace_Entrance | Bench_Palace_Atrium | Bench_Palace_Balcony
    | Bench_Upper_Tram | Bench_Lower_Tram

    -- room waypoints
    | Tutorial_01 | Town | Crossroads_03 | Crossroads_07 | Crossroads_08 | Crossroads_14
    | Crossroads_18 | Crossroads_19 | Crossroads_21 | Crossroads_27 | Crossroads_33 | Fungus1_11
    | Fungus1_21 | Fungus1_30 | Fungus3_01 | Fungus3_02 | Fungus3_26 | Fungus3_44 | Fungus3_47
    | Fungus2_01 | Fungus2_03 | Fungus2_04 | Fungus2_06 | Fungus2_11 | Fungus2_13 | Fungus2_14
    | Fungus2_15 | Fungus2_17 | Fungus2_18 | Fungus2_20 | Fungus2_21 | Fungus2_23 | Fungus2_29
    | Deepnest_01 | Deepnest_01b | Deepnest_02 | Deepnest_03 | Deepnest_10 | Deepnest_14
    | Deepnest_17 | Deepnest_26 | Deepnest_34 | Deepnest_35 | Deepnest_37 | Deepnest_39
    | Deepnest_41 | Deepnest_42 | Deepnest_East_02 | Deepnest_East_03 | Deepnest_East_04
    | Deepnest_East_07 | Deepnest_East_11 | Deepnest_East_18 | Hive_03_c | Abyss_03 | Abyss_03_b
    | Abyss_03_c | Abyss_04 | Abyss_06_Core | Abyss_09 | Abyss_19 | Abyss_01 | Waterways_01
    | Waterways_02 | Waterways_04 | Waterways_04b | Waterways_07 | Waterways_13 | GG_Waterways
    | Room_GG_Shortcut | Warp_Junk_Pit_to_Godhome | Warp_Godhome_to_Junk_Pit | GG_Atrium
    | GG_Workshop | Ruins1_03 | Ruins1_05b | Ruins1_05c | Ruins1_05 | Ruins1_23 | Ruins1_28
    | Ruins1_30 | Ruins1_31 | Ruins2_01 | Ruins2_01_b | Ruins2_03b | Ruins2_04 | Ruins2_10
    | RestingGrounds_02 | RestingGrounds_05 | RestingGrounds_10 | Mines_02 | Mines_03 | Mines_04
    | Mines_05 | Mines_10 | Mines_11 | Mines_18 | Mines_20 | Mines_23 | Mines_31 | Fungus3_04
    | Fungus3_11 | Fungus3_13 | Fungus3_22 | Fungus3_34 | Fungus3_40 | Cliffs_01 | Cliffs_02
    | White_Palace_01 | White_Palace_03_hub | White_Palace_13 | Abyss_05

    -- transitions
    | Room_temple_left1 | Tutorial_01_right1 | Tutorial_01_top1 | Tutorial_01_top2 | Town_left1
    | Town_bot1 | Town_right1 | Town_top1 | Town_door_station | Town_door_sly | Town_door_mapper
    | Town_door_jiji | Town_door_bretta | Town_room_divine | Town_room_grimm | Room_shop_left1
    | Room_Town_Stag_Station_left1 | Room_mapper_left1 | Room_Bretta_right1 | Room_Ouiji_left1
    | Grimm_Divine_left1 | Grimm_Main_Tent_left1 | Crossroads_01_top1 | Crossroads_01_left1
    | Crossroads_01_right1 | Crossroads_02_left1 | Crossroads_02_door1 | Crossroads_02_right1
    | Crossroads_03_right1 | Crossroads_03_right2 | Crossroads_03_left1 | Crossroads_03_left2
    | Crossroads_03_bot1 | Crossroads_03_top1 | Crossroads_04_left1 | Crossroads_04_top1
    | Crossroads_04_door_Mender_House | Crossroads_04_door1 | Crossroads_04_door_charmshop
    | Crossroads_04_right1 | Crossroads_05_left1 | Crossroads_05_right1 | Crossroads_06_left1
    | Crossroads_06_door1 | Crossroads_06_right1 | Crossroads_07_left1 | Crossroads_07_left2
    | Crossroads_07_left3 | Crossroads_07_right1 | Crossroads_07_right2 | Crossroads_07_bot1
    | Crossroads_08_left1 | Crossroads_08_left2 | Crossroads_08_right1 | Crossroads_08_right2
    | Crossroads_09_left1 | Crossroads_09_right1 | Crossroads_10_left1 | Crossroads_10_right1
    | Crossroads_11_alt_left1 | Crossroads_11_alt_right1 | Crossroads_12_left1
    | Crossroads_12_right1 | Crossroads_13_left1 | Crossroads_13_right1 | Crossroads_14_left1
    | Crossroads_14_left2 | Crossroads_14_right1 | Crossroads_14_right2 | Crossroads_15_left1
    | Crossroads_15_right1 | Crossroads_16_left1 | Crossroads_16_right1 | Crossroads_16_bot1
    | Crossroads_18_right1 | Crossroads_18_right2 | Crossroads_18_bot1 | Crossroads_19_right1
    | Crossroads_19_top1 | Crossroads_19_left1 | Crossroads_19_left2 | Crossroads_21_left1
    | Crossroads_21_right1 | Crossroads_21_top1 | Crossroads_22_bot1 | Crossroads_25_right1
    | Crossroads_25_left1 | Crossroads_27_right1 | Crossroads_27_bot1 | Crossroads_27_left1
    | Crossroads_27_left2 | Crossroads_30_left1 | Crossroads_31_right1 | Crossroads_33_top1
    | Crossroads_33_left1 | Crossroads_33_left2 | Crossroads_33_right1 | Crossroads_33_right2
    | Crossroads_35_bot1 | Crossroads_35_right1 | Crossroads_36_right1 | Crossroads_36_right2
    | Crossroads_37_right1 | Crossroads_38_right1 | Crossroads_39_right1 | Crossroads_39_left1
    | Crossroads_40_right1 | Crossroads_40_left1 | Crossroads_42_left1 | Crossroads_42_right1
    | Crossroads_43_left1 | Crossroads_43_right1 | Crossroads_45_right1 | Crossroads_45_left1
    | Crossroads_46_left1 | Crossroads_46b_right1 | Crossroads_ShamanTemple_left1
    | Crossroads_47_right1 | Crossroads_48_left1 | Crossroads_49_right1 | Crossroads_49_left1
    | Crossroads_49b_right1 | Crossroads_50_right1 | Crossroads_50_left1 | Crossroads_52_left1
    | Room_ruinhouse_left1 | Room_Charm_Shop_left1 | Room_Mender_House_left1 | Fungus1_01_left1
    | Fungus1_01_right1 | Fungus1_01b_left1 | Fungus1_01b_right1 | Fungus1_02_left1
    | Fungus1_02_right1 | Fungus1_02_right2 | Fungus1_03_left1 | Fungus1_03_right1 | Fungus1_03_bot1
    | Fungus1_04_left1 | Fungus1_04_right1 | Fungus1_05_right1 | Fungus1_05_bot1 | Fungus1_05_top1
    | Fungus1_06_left1 | Fungus1_06_bot1 | Fungus1_07_top1 | Fungus1_07_left1 | Fungus1_07_right1
    | Fungus1_08_left1 | Fungus1_09_left1 | Fungus1_09_right1 | Fungus1_10_left1 | Fungus1_10_right1
    | Fungus1_10_top1 | Fungus1_11_top1 | Fungus1_11_right1 | Fungus1_11_right2 | Fungus1_11_left1
    | Fungus1_11_bot1 | Fungus1_12_left1 | Fungus1_12_right1 | Fungus1_13_right1 | Fungus1_13_left1
    | Fungus1_14_left1 | Fungus1_15_door1 | Fungus1_15_right1 | Fungus1_16_alt_right1
    | Fungus1_17_left1 | Fungus1_17_right1 | Fungus1_19_left1 | Fungus1_19_right1 | Fungus1_19_bot1
    | Fungus1_20_v02_bot1 | Fungus1_20_v02_bot2 | Fungus1_20_v02_right1 | Fungus1_21_bot1
    | Fungus1_21_top1 | Fungus1_21_left1 | Fungus1_21_right1 | Fungus1_22_bot1 | Fungus1_22_top1
    | Fungus1_22_left1 | Fungus1_23_left1 | Fungus1_23_right1 | Fungus1_24_left1 | Fungus1_25_right1
    | Fungus1_25_left1 | Fungus1_26_right1 | Fungus1_26_left1 | Fungus1_26_door_SlugShrine
    | Fungus1_28_left1 | Fungus1_28_left2 | Fungus1_29_left1 | Fungus1_29_right1 | Fungus1_30_top1
    | Fungus1_30_top3 | Fungus1_30_left1 | Fungus1_30_right1 | Fungus1_31_top1 | Fungus1_31_bot1
    | Fungus1_31_right1 | Fungus1_32_bot1 | Fungus1_32_top1 | Fungus1_32_left1 | Fungus1_34_door1
    | Fungus1_34_left1 | Fungus1_35_left1 | Fungus1_35_right1 | Fungus1_36_left1 | Fungus1_37_left1
    | Fungus1_Slug_right1 | Room_Slug_Shrine_left1 | Room_nailmaster_02_left1 | Fungus3_01_top1
    | Fungus3_01_right1 | Fungus3_01_left1 | Fungus3_01_right2 | Fungus3_02_left1 | Fungus3_02_left2
    | Fungus3_02_left3 | Fungus3_02_right1 | Fungus3_02_right2 | Fungus3_03_right1
    | Fungus3_03_left1 | Fungus3_24_right1 | Fungus3_24_left1 | Fungus3_24_top1 | Fungus3_25_right1
    | Fungus3_25_left1 | Fungus3_25b_right1 | Fungus3_25b_left1 | Fungus3_26_top1 | Fungus3_26_left1
    | Fungus3_26_left2 | Fungus3_26_left3 | Fungus3_26_right1 | Fungus3_27_left1 | Fungus3_27_right1
    | Fungus3_28_right1 | Fungus3_30_bot1 | Fungus3_35_right1 | Fungus3_44_bot1 | Fungus3_44_door1
    | Fungus3_44_right1 | Fungus3_47_left1 | Fungus3_47_right1 | Fungus3_47_door1
    | Room_Fungus_Shaman_left1 | Fungus3_archive_left1 | Fungus3_archive_bot1
    | Fungus3_archive_02_top1 | Fungus2_01_left1 | Fungus2_01_left2 | Fungus2_01_left3
    | Fungus2_01_right1 | Fungus2_02_right1 | Fungus2_34_right1 | Fungus2_03_left1 | Fungus2_03_bot1
    | Fungus2_03_right1 | Fungus2_04_top1 | Fungus2_04_right1 | Fungus2_04_left1 | Fungus2_04_right2
    | Fungus2_05_bot1 | Fungus2_05_right1 | Fungus2_06_top1 | Fungus2_06_left1 | Fungus2_06_left2
    | Fungus2_06_right1 | Fungus2_06_right2 | Fungus2_07_left1 | Fungus2_07_right1
    | Fungus2_08_left1 | Fungus2_08_left2 | Fungus2_08_right1 | Fungus2_09_left1 | Fungus2_09_right1
    | Fungus2_10_right1 | Fungus2_10_right2 | Fungus2_10_bot1 | Fungus2_11_top1 | Fungus2_11_left1
    | Fungus2_11_left2 | Fungus2_11_right1 | Fungus2_12_left1 | Fungus2_12_bot1 | Fungus2_13_top1
    | Fungus2_13_left2 | Fungus2_13_left3 | Fungus2_14_top1 | Fungus2_14_right1 | Fungus2_14_bot3
    | Fungus2_15_top3 | Fungus2_15_right1 | Fungus2_15_left1 | Fungus2_17_left1 | Fungus2_17_right1
    | Fungus2_17_bot1 | Fungus2_18_right1 | Fungus2_18_bot1 | Fungus2_18_top1 | Fungus2_19_top1
    | Fungus2_19_left1 | Fungus2_20_right1 | Fungus2_20_left1 | Fungus2_21_right1 | Fungus2_21_left1
    | Fungus2_23_right1 | Fungus2_23_right2 | Fungus2_26_left1 | Fungus2_28_left1 | Fungus2_28_left2
    | Fungus2_29_right1 | Fungus2_29_bot1 | Fungus2_30_bot1 | Fungus2_30_top1 | Fungus2_31_left1
    | Fungus2_32_left1 | Fungus2_33_right1 | Fungus2_33_left1 | Deepnest_01_right1
    | Deepnest_01_bot1 | Deepnest_01_bot2 | Deepnest_01_left1 | Deepnest_01b_top1
    | Deepnest_01b_top2 | Deepnest_01b_right1 | Deepnest_01b_right2 | Deepnest_01b_bot1
    | Deepnest_02_left1 | Deepnest_02_left2 | Deepnest_02_right1 | Deepnest_03_right1
    | Deepnest_03_left1 | Deepnest_03_top1 | Deepnest_03_left2 | Deepnest_09_left1
    | Deepnest_10_right1 | Deepnest_10_right2 | Deepnest_10_right3 | Deepnest_10_door1
    | Deepnest_10_door2 | Room_spider_small_left1 | Deepnest_Spider_Town_left1 | Deepnest_14_right1
    | Deepnest_14_left1 | Deepnest_14_bot1 | Deepnest_14_bot2 | Deepnest_16_left1 | Deepnest_16_bot1
    | Deepnest_17_left1 | Deepnest_17_right1 | Deepnest_17_top1 | Deepnest_17_bot1 | Fungus2_25_top1
    | Fungus2_25_top2 | Fungus2_25_right1 | Deepnest_26_left1 | Deepnest_26_left2
    | Deepnest_26_right1 | Deepnest_26_bot1 | Deepnest_26b_right2 | Deepnest_26b_right1
    | Deepnest_30_left1 | Deepnest_30_top1 | Deepnest_30_right1 | Deepnest_31_right1
    | Deepnest_31_right2 | Deepnest_32_left1 | Deepnest_33_top1 | Deepnest_33_top2
    | Deepnest_33_bot1 | Deepnest_34_left1 | Deepnest_34_right1 | Deepnest_34_top1
    | Deepnest_35_left1 | Deepnest_35_top1 | Deepnest_35_bot1 | Deepnest_36_left1
    | Deepnest_37_left1 | Deepnest_37_right1 | Deepnest_37_top1 | Deepnest_37_bot1
    | Deepnest_38_bot1 | Deepnest_39_left1 | Deepnest_39_top1 | Deepnest_39_door1
    | Deepnest_39_right1 | Deepnest_40_right1 | Deepnest_41_right1 | Deepnest_41_left1
    | Deepnest_41_left2 | Deepnest_42_bot1 | Deepnest_42_left1 | Deepnest_42_top1 | Deepnest_43_bot1
    | Deepnest_43_left1 | Deepnest_43_right1 | Deepnest_44_top1 | Deepnest_45_v02_left1
    | Room_Mask_Maker_right1 | Deepnest_East_01_bot1 | Deepnest_East_01_right1
    | Deepnest_East_01_top1 | Deepnest_East_02_bot1 | Deepnest_East_02_bot2 | Deepnest_East_02_top1
    | Deepnest_East_02_right1 | Deepnest_East_03_left1 | Deepnest_East_03_left2
    | Deepnest_East_03_top1 | Deepnest_East_03_top2 | Deepnest_East_03_right1
    | Deepnest_East_03_right2 | Deepnest_East_04_left1 | Deepnest_East_04_left2
    | Deepnest_East_04_right2 | Deepnest_East_04_right1 | Deepnest_East_06_top1
    | Deepnest_East_06_left1 | Deepnest_East_06_bot1 | Deepnest_East_06_door1
    | Deepnest_East_06_right1 | Deepnest_East_07_bot1 | Deepnest_East_07_bot2
    | Deepnest_East_07_left1 | Deepnest_East_07_left2 | Deepnest_East_07_right1
    | Deepnest_East_08_right1 | Deepnest_East_08_top1 | Deepnest_East_09_right1
    | Deepnest_East_09_left1 | Deepnest_East_09_bot1 | Deepnest_East_10_left1
    | Deepnest_East_11_right1 | Deepnest_East_11_left1 | Deepnest_East_11_top1
    | Deepnest_East_11_bot1 | Deepnest_East_12_right1 | Deepnest_East_12_left1
    | Deepnest_East_13_bot1 | Deepnest_East_14_top2 | Deepnest_East_14_left1
    | Deepnest_East_14_door1 | Deepnest_East_14b_right1 | Deepnest_East_14b_top1
    | Deepnest_East_15_left1 | Deepnest_East_16_left1 | Deepnest_East_16_bot1
    | Deepnest_East_17_left1 | Deepnest_East_18_top1 | Deepnest_East_18_bot1
    | Deepnest_East_18_right2 | Room_nailmaster_03_left1 | Deepnest_East_Hornet_left1
    | Deepnest_East_Hornet_left2 | Room_Wyrm_right1 | GG_Lurker_left1 | Hive_01_left1
    | Hive_01_right1 | Hive_01_right2 | Hive_02_left1 | Hive_02_left2 | Hive_02_left3
    | Hive_03_c_left1 | Hive_03_c_right2 | Hive_03_c_right3 | Hive_03_c_top1 | Hive_03_bot1
    | Hive_03_right1 | Hive_03_top1 | Hive_04_left1 | Hive_04_left2 | Hive_04_right1 | Hive_05_left1
    | Room_Colosseum_01_left1 | Room_Colosseum_01_bot1 | Room_Colosseum_02_top1
    | Room_Colosseum_02_top2 | Room_Colosseum_Spectate_bot1 | Room_Colosseum_Spectate_right1
    | Abyss_01_left1 | Abyss_01_left2 | Abyss_01_left3 | Abyss_01_right1 | Abyss_01_right2
    | Abyss_02_right1 | Abyss_02_bot1 | Abyss_03_bot1 | Abyss_03_bot2 | Abyss_03_top1
    | Abyss_03_b_left1 | Abyss_03_c_right1 | Abyss_03_c_top1 | Abyss_04_top1 | Abyss_04_left1
    | Abyss_04_bot1 | Abyss_04_right1 | Abyss_05_left1 | Abyss_05_right1 | Abyss_06_Core_top1
    | Abyss_06_Core_left1 | Abyss_06_Core_left3 | Abyss_06_Core_right2 | Abyss_06_Core_bot1
    | Abyss_08_right1 | Abyss_09_right1 | Abyss_09_right2 | Abyss_09_right3 | Abyss_09_left1
    | Abyss_10_left1 | Abyss_10_left2 | Abyss_12_right1 | Abyss_15_top1 | Abyss_16_left1
    | Abyss_16_right1 | Abyss_17_top1 | Abyss_18_left1 | Abyss_18_right1 | Abyss_19_left1
    | Abyss_19_right1 | Abyss_19_bot1 | Abyss_19_bot2 | Abyss_20_top1 | Abyss_20_top2
    | Abyss_21_right1 | Abyss_22_left1 | Abyss_Lighthouse_room_left1 | Waterways_01_top1
    | Waterways_01_left1 | Waterways_01_right1 | Waterways_01_bot1 | Waterways_02_top1
    | Waterways_02_top2 | Waterways_02_top3 | Waterways_02_bot1 | Waterways_02_bot2
    | Waterways_03_left1 | Waterways_04_bot1 | Waterways_04_right1 | Waterways_04_left1
    | Waterways_04_left2 | Waterways_04b_right1 | Waterways_04b_right2 | Waterways_04b_left1
    | Waterways_05_right1 | Waterways_05_bot1 | Waterways_05_bot2 | Waterways_06_right1
    | Waterways_06_top1 | Waterways_07_right1 | Waterways_07_right2 | Waterways_07_left1
    | Waterways_07_door1 | Waterways_07_top1 | Waterways_08_top1 | Waterways_08_left1
    | Waterways_08_left2 | Waterways_09_right1 | Waterways_09_left1 | Waterways_12_right1
    | Waterways_13_left1 | Waterways_13_left2 | Waterways_14_bot1 | Waterways_14_bot2
    | Waterways_15_top1 | GG_Pipeway_right1 | GG_Pipeway_left1 | GG_Waterways_right1
    | GG_Waterways_door1 | Room_GG_Shortcut_left1 | Room_GG_Shortcut_top1 | Ruins1_01_left1
    | Ruins1_01_top1 | Ruins1_01_bot1 | Ruins1_02_top1 | Ruins1_02_bot1 | Ruins1_03_top1
    | Ruins1_03_left1 | Ruins1_03_right1 | Ruins1_03_right2 | Ruins1_04_right1 | Ruins1_04_door1
    | Ruins1_04_bot1 | Ruins1_05b_left1 | Ruins1_05b_top1 | Ruins1_05b_bot1 | Ruins1_05b_right1
    | Ruins1_05c_left2 | Ruins1_05c_bot1 | Ruins1_05c_top1 | Ruins1_05c_top2 | Ruins1_05c_top3
    | Ruins1_05_bot1 | Ruins1_05_bot2 | Ruins1_05_bot3 | Ruins1_05_right1 | Ruins1_05_right2
    | Ruins1_05_top1 | Ruins1_06_left1 | Ruins1_06_right1 | Ruins1_09_top1 | Ruins1_09_left1
    | Ruins1_17_top1 | Ruins1_17_right1 | Ruins1_17_bot1 | Ruins1_18_left1 | Ruins1_18_right1
    | Ruins1_18_right2 | Ruins1_23_top1 | Ruins1_23_right1 | Ruins1_23_right2 | Ruins1_23_bot1
    | Ruins1_23_left1 | Ruins1_24_left1 | Ruins1_24_right1 | Ruins1_24_left2 | Ruins1_24_right2
    | Ruins1_25_left1 | Ruins1_25_left2 | Ruins1_25_left3 | Ruins1_27_left1 | Ruins1_27_right1
    | Ruins1_28_left1 | Ruins1_28_right1 | Ruins1_28_bot1 | Ruins1_29_left1 | Ruins1_30_left1
    | Ruins1_30_left2 | Ruins1_30_bot1 | Ruins1_30_right1 | Ruins1_31_bot1 | Ruins1_31_left1
    | Ruins1_31_left2 | Ruins1_31_left3 | Ruins1_31_right1 | Ruins1_31b_right1 | Ruins1_31b_right2
    | Ruins1_32_right1 | Ruins1_32_right2 | Room_nailsmith_left1 | Ruins2_01_top1 | Ruins2_01_bot1
    | Ruins2_01_left2 | Ruins2_01_b_top1 | Ruins2_01_b_left1 | Ruins2_01_b_right1 | Ruins2_03b_top1
    | Ruins2_03b_top2 | Ruins2_03b_left1 | Ruins2_03b_bot1 | Ruins2_03_top1 | Ruins2_03_bot1
    | Ruins2_03_bot2 | Ruins2_04_left1 | Ruins2_04_left2 | Ruins2_04_right1 | Ruins2_04_right2
    | Ruins2_04_door_Ruin_House_01 | Ruins2_04_door_Ruin_House_02 | Ruins2_04_door_Ruin_House_03
    | Ruins2_04_door_Ruin_Elevator | Ruins2_05_left1 | Ruins2_05_top1 | Ruins2_05_bot1
    | Ruins2_06_left1 | Ruins2_06_left2 | Ruins2_06_right1 | Ruins2_06_right2 | Ruins2_06_top1
    | Ruins2_07_right1 | Ruins2_07_left1 | Ruins2_07_top1 | Ruins2_08_left1 | Ruins2_09_bot1
    | Ruins2_10_right1 | Ruins2_10_left1 | Ruins2_10b_right1 | Ruins2_10b_right2 | Ruins2_10b_left1
    | Ruins2_11_b_right1 | Ruins2_11_b_left1 | Ruins2_11_b_bot1 | Ruins2_11_right1
    | Ruins2_Watcher_Room_bot1 | Ruins_House_01_left1 | Ruins_House_02_left1 | Ruins_House_03_left1
    | Ruins_House_03_left2 | Ruins_Elevator_left1 | Ruins_Elevator_left2 | Ruins_Bathhouse_door1
    | Ruins_Bathhouse_right1 | RestingGrounds_02_right1 | RestingGrounds_02_left1
    | RestingGrounds_02_bot1 | RestingGrounds_02_top1 | RestingGrounds_04_left1
    | RestingGrounds_04_right1 | RestingGrounds_05_left1 | RestingGrounds_05_left2
    | RestingGrounds_05_left3 | RestingGrounds_05_right1 | RestingGrounds_05_right2
    | RestingGrounds_05_bot1 | RestingGrounds_06_left1 | RestingGrounds_06_right1
    | RestingGrounds_06_top1 | RestingGrounds_07_right1 | RestingGrounds_08_left1
    | RestingGrounds_09_left1 | RestingGrounds_10_left1 | RestingGrounds_10_top1
    | RestingGrounds_10_top2 | RestingGrounds_12_bot1 | RestingGrounds_12_door_Mansion
    | RestingGrounds_17_right1 | Room_Mansion_left1 | Mines_01_bot1 | Mines_01_left1 | Mines_02_top1
    | Mines_02_top2 | Mines_02_left1 | Mines_02_right1 | Mines_03_right1 | Mines_03_bot1
    | Mines_03_top1 | Mines_04_right1 | Mines_04_top1 | Mines_04_left1 | Mines_04_left2
    | Mines_04_left3 | Mines_05_right1 | Mines_05_top1 | Mines_05_bot1 | Mines_05_left1
    | Mines_05_left2 | Mines_06_right1 | Mines_06_left1 | Mines_07_right1 | Mines_07_left1
    | Mines_10_right1 | Mines_10_left1 | Mines_10_bot1 | Mines_11_right1 | Mines_11_top1
    | Mines_11_bot1 | Mines_13_right1 | Mines_13_top1 | Mines_13_bot1 | Mines_16_top1
    | Mines_17_right1 | Mines_17_left1 | Mines_18_top1 | Mines_18_left1 | Mines_18_right1
    | Mines_19_left1 | Mines_19_right1 | Mines_20_left1 | Mines_20_left2 | Mines_20_left3
    | Mines_20_bot1 | Mines_20_right1 | Mines_20_right2 | Mines_23_left1 | Mines_23_right1
    | Mines_23_right2 | Mines_23_top1 | Mines_24_left1 | Mines_25_left1 | Mines_25_top1
    | Mines_28_left1 | Mines_28_bot1 | Mines_28_door1 | Mines_29_left1 | Mines_29_right1
    | Mines_29_right2 | Mines_30_left1 | Mines_30_right1 | Mines_31_left1 | Mines_32_bot1
    | Mines_33_right1 | Mines_33_left1 | Mines_34_bot1 | Mines_34_bot2 | Mines_34_left1
    | Mines_35_left1 | Mines_36_right1 | Mines_37_bot1 | Mines_37_top1 | Fungus3_04_left1
    | Fungus3_04_left2 | Fungus3_04_right1 | Fungus3_04_right2 | Fungus3_05_left1
    | Fungus3_05_right1 | Fungus3_05_right2 | Fungus3_08_left1 | Fungus3_08_right1 | Fungus3_08_top1
    | Fungus3_10_top1 | Fungus3_10_bot1 | Fungus3_11_left1 | Fungus3_11_left2 | Fungus3_11_right1
    | Fungus3_13_left1 | Fungus3_13_left2 | Fungus3_13_left3 | Fungus3_13_bot1 | Fungus3_13_right1
    | Fungus3_21_right1 | Fungus3_21_top1 | Fungus3_22_right1 | Fungus3_22_left1 | Fungus3_22_bot1
    | Fungus3_23_right1 | Fungus3_23_left1 | Fungus3_34_right1 | Fungus3_34_left1 | Fungus3_34_top1
    | Fungus3_39_right1 | Fungus3_39_left1 | Fungus3_40_right1 | Fungus3_40_top1 | Fungus3_48_right1
    | Fungus3_48_right2 | Fungus3_48_door1 | Fungus3_48_bot1 | Fungus3_49_right1 | Fungus3_50_right1
    | Room_Queen_left1 | Cliffs_01_right1 | Cliffs_01_right2 | Cliffs_01_right3 | Cliffs_01_right4
    | Cliffs_02_right1 | Cliffs_02_bot1 | Cliffs_02_bot2 | Cliffs_02_door1 | Cliffs_02_left1
    | Cliffs_02_left2 | Cliffs_03_right1 | Cliffs_04_right1 | Cliffs_04_left1 | Cliffs_05_left1
    | Cliffs_06_left1 | Room_nailmaster_left1 | White_Palace_01_left1 | White_Palace_01_right1
    | White_Palace_01_top1 | White_Palace_02_left1 | White_Palace_03_hub_left1
    | White_Palace_03_hub_left2 | White_Palace_03_hub_right1 | White_Palace_03_hub_top1
    | White_Palace_03_hub_bot1 | White_Palace_04_top1 | White_Palace_04_right2
    | White_Palace_05_left1 | White_Palace_05_left2 | White_Palace_05_right1
    | White_Palace_05_right2 | White_Palace_06_left1 | White_Palace_06_top1 | White_Palace_06_bot1
    | White_Palace_07_top1 | White_Palace_07_bot1 | White_Palace_08_left1 | White_Palace_08_right1
    | White_Palace_09_right1 | White_Palace_11_door2 | White_Palace_12_right1 | White_Palace_12_bot1
    | White_Palace_13_right1 | White_Palace_13_left1 | White_Palace_13_left2 | White_Palace_13_left3
    | White_Palace_14_bot1 | White_Palace_14_right1 | White_Palace_15_left1 | White_Palace_15_right1
    | White_Palace_15_right2 | White_Palace_16_left1 | White_Palace_16_left2
    | White_Palace_17_right1 | White_Palace_17_bot1 | White_Palace_18_top1 | White_Palace_18_right1
    | White_Palace_19_top1 | White_Palace_19_left1 | White_Palace_20_bot1
    deriving (Show, Enum)

instance NameID NID
data NID =
    Start | Sly | Sly_Key | Iselda | Salubra | Leg_Eater | Grubfather | Seer | Lurien | Monomon
    | Herrah | World_Sense | Mothwing_Cloak | Mantis_Claw | Crystal_Heart | Monarch_Wings
    | Shade_Cloak | Isma's_Tear | Dream_Nail | Vengeful_Spirit | Shade_Soul | Desolate_Dive
    | Descending_Dark | Howling_Wraiths | Abyss_Shriek | Cyclone_Slash | Dash_Slash | Great_Slash
    | Focus | Baldur_Shell | Fury_of_the_Fallen | Lifeblood_Core | Defender's_Crest | Flukenest
    | Thorns_of_Agony | Mark_of_Pride | Sharp_Shadow | Spore_Shroom | Soul_Catcher | Soul_Eater
    | Glowing_Womb | Nailmaster's_Glory | Joni's_Blessing | Shape_of_Unn | Hiveblood | Dashmaster
    | Quick_Slash | Spell_Twister | Deep_Focus | Queen_Fragment | King_Fragment | Void_Heart
    | Dreamshield | Weaversong | Grimmchild | Unbreakable_Heart | Unbreakable_Greed
    | Unbreakable_Strength | City_Crest | Tram_Pass | Simple_Key_Basin | Simple_Key_City
    | Simple_Key_Lurker | Shopkeeper's_Key | Love_Key | King's_Brand | Godtuner | Collector's_Map
    | Mask_Shard_Brooding_Mawlek | Mask_Shard_Crossroads_Goam | Mask_Shard_Stone_Sanctuary
    | Mask_Shard_Queen's_Station | Mask_Shard_Deepnest | Mask_Shard_Waterways
    | Mask_Shard_Enraged_Guardian | Mask_Shard_Hive | Mask_Shard_Grey_Mourner | Mask_Shard_Bretta
    | Vessel_Fragment_Greenpath | Vessel_Fragment_City | Vessel_Fragment_Crossroads
    | Vessel_Fragment_Basin | Vessel_Fragment_Deepnest | Vessel_Fragment_Stag_Nest
    | Charm_Notch_Shrumal_Ogres | Charm_Notch_Fog_Canyon | Charm_Notch_Colosseum | Charm_Notch_Grimm
    | Pale_Ore_Basin | Pale_Ore_Crystal_Peak | Pale_Ore_Nosk | Pale_Ore_Colosseum
    | Geo_Chest_False_Knight | Geo_Chest_Soul_Master | Geo_Chest_Watcher_Knights
    | Geo_Chest_Greenpath | Geo_Chest_Mantis_Lords | Geo_Chest_Resting_Grounds
    | Geo_Chest_Crystal_Peak | Geo_Chest_Weavers_Den | Geo_Chest_Junk_Pit_1 | Geo_Chest_Junk_Pit_2
    | Geo_Chest_Junk_Pit_3 | Geo_Chest_Junk_Pit_5 | Lumafly_Escape_Junk_Pit_Chest_4
    | Rancid_Egg_Sheo | Rancid_Egg_Fungal_Core | Rancid_Egg_Queen's_Gardens | Rancid_Egg_Blue_Lake
    | Rancid_Egg_Crystal_Peak_Dive_Entrance | Rancid_Egg_Crystal_Peak_Dark_Room
    | Rancid_Egg_Crystal_Peak_Tall_Room | Rancid_Egg_City_of_Tears_Left
    | Rancid_Egg_City_of_Tears_Pleasure_House | Rancid_Egg_Beast's_Den | Rancid_Egg_Dark_Deepnest
    | Rancid_Egg_Weaver's_Den | Rancid_Egg_Near_Quick_Slash | Rancid_Egg_Upper_Kingdom's_Edge
    | Rancid_Egg_Waterways_East | Rancid_Egg_Waterways_Main | Rancid_Egg_Waterways_West_Bluggsac
    | Rancid_Egg_Waterways_West_Pickup | Rancid_Egg_Tuk_Defender's_Crest | Wanderer's_Journal_Cliffs
    | Wanderer's_Journal_Greenpath_Stag | Wanderer's_Journal_Greenpath_Lower
    | Wanderer's_Journal_Fungal_Wastes_Thorns_Gauntlet | Wanderer's_Journal_Above_Mantis_Village
    | Wanderer's_Journal_Crystal_Peak_Crawlers | Wanderer's_Journal_Resting_Grounds_Catacombs
    | Wanderer's_Journal_King's_Station | Wanderer's_Journal_Pleasure_House
    | Wanderer's_Journal_City_Storerooms | Wanderer's_Journal_Ancient_Basin
    | Wanderer's_Journal_Kingdom's_Edge_Entrance | Wanderer's_Journal_Kingdom's_Edge_Camp
    | Wanderer's_Journal_Kingdom's_Edge_Requires_Dive | Hallownest_Seal_Crossroads_Well
    | Hallownest_Seal_Greenpath | Hallownest_Seal_Fog_Canyon_West | Hallownest_Seal_Fog_Canyon_East
    | Hallownest_Seal_Queen's_Station | Hallownest_Seal_Fungal_Wastes_Sporgs
    | Hallownest_Seal_Mantis_Lords | Hallownest_Seal_Resting_Grounds_Catacombs
    | Hallownest_Seal_King's_Station | Hallownest_Seal_City_Rafters | Hallownest_Seal_Soul_Sanctum
    | Hallownest_Seal_Watcher_Knight | Hallownest_Seal_Deepnest_By_Mantis_Lords
    | Hallownest_Seal_Beast's_Den | Hallownest_Seal_Queen's_Gardens | King's_Idol_Cliffs
    | King's_Idol_Crystal_Peak | King's_Idol_Glade_of_Hope | King's_Idol_Dung_Defender
    | King's_Idol_Great_Hopper | King's_Idol_Pale_Lurker | King's_Idol_Deepnest
    | Arcane_Egg_Lifeblood_Core | Arcane_Egg_Shade_Cloak | Arcane_Egg_Birthplace
    | Whispering_Root_Crossroads | Whispering_Root_Greenpath | Whispering_Root_Leg_Eater
    | Whispering_Root_Mantis_Village | Whispering_Root_Deepnest | Whispering_Root_Queens_Gardens
    | Whispering_Root_Kingdoms_Edge | Whispering_Root_Waterways | Whispering_Root_City
    | Whispering_Root_Resting_Grounds | Whispering_Root_Spirits_Glade | Whispering_Root_Crystal_Peak
    | Whispering_Root_Howling_Cliffs | Whispering_Root_Ancestral_Mound | Whispering_Root_Hive
    | Boss_Essence_Elder_Hu | Boss_Essence_Xero | Boss_Essence_Gorb | Boss_Essence_Marmu
    | Boss_Essence_No_Eyes | Boss_Essence_Galien | Boss_Essence_Markoth
    | Boss_Essence_Failed_Champion | Boss_Essence_Soul_Tyrant | Boss_Essence_Lost_Kin
    | Boss_Essence_White_Defender | Boss_Essence_Grey_Prince_Zote | Grub_Crossroads_Acid
    | Grub_Crossroads_Center | Grub_Crossroads_Stag | Grub_Crossroads_Spike
    | Grub_Crossroads_Guarded | Grub_Greenpath_Cornifer | Grub_Greenpath_Journal
    | Grub_Greenpath_MMC | Grub_Greenpath_Stag | Grub_Fog_Canyon | Grub_Fungal_Bouncy
    | Grub_Fungal_Spore_Shroom | Grub_Deepnest_Mimic | Grub_Deepnest_Nosk | Grub_Deepnest_Spike
    | Grub_Dark_Deepnest | Grub_Beast's_Den | Grub_Kingdom's_Edge_Oro | Grub_Kingdom's_Edge_Camp
    | Grub_Hive_External | Grub_Hive_Internal | Grub_Basin_Requires_Wings | Grub_Basin_Requires_Dive
    | Grub_Waterways_Main | Grub_Isma's_Grove | Grub_Waterways_Requires_Tram
    | Grub_City_of_Tears_Left | Grub_Soul_Sanctum | Grub_Watcher's_Spire
    | Grub_City_of_Tears_Guarded | Grub_King's_Station | Grub_Resting_Grounds
    | Grub_Crystal_Peak_Below_Chest | Grub_Crystallized_Mound | Grub_Crystal_Peak_Spike
    | Grub_Crystal_Peak_Mimic | Grub_Crystal_Peak_Crushers | Grub_Crystal_Heart
    | Grub_Hallownest_Crown | Grub_Howling_Cliffs | Grub_Queen's_Gardens_Stag
    | Grub_Queen's_Gardens_Marmu | Grub_Queen's_Gardens_Top | Grub_Collector_1 | Grub_Collector_2
    | Grub_Collector_3 | Mimic_Grub_Deepnest_1 | Mimic_Grub_Deepnest_2 | Mimic_Grub_Deepnest_3
    | Mimic_Grub_Crystal_Peak | Crossroads_Map | Greenpath_Map | Fog_Canyon_Map | Fungal_Wastes_Map
    | Deepnest_Map_Upper | Deepnest_Map_Right | Ancient_Basin_Map | Kingdom's_Edge_Map
    | City_of_Tears_Map | Royal_Waterways_Map | Howling_Cliffs_Map | Crystal_Peak_Map
    | Queen's_Gardens_Map | Resting_Grounds_Map | Dirtmouth_Stag | Crossroads_Stag | Greenpath_Stag
    | Queen's_Station_Stag | Queen's_Gardens_Stag | City_Storerooms_Stag | King's_Station_Stag
    | Resting_Grounds_Stag | Distant_Village_Stag | Hidden_Station_Stag | Stag_Nest_Stag
    | Lifeblood_Cocoon_King's_Pass | Lifeblood_Cocoon_Ancestral_Mound | Lifeblood_Cocoon_Greenpath
    | Lifeblood_Cocoon_Fog_Canyon_West | Lifeblood_Cocoon_Mantis_Village
    | Lifeblood_Cocoon_Failed_Tramway | Lifeblood_Cocoon_Galien | Lifeblood_Cocoon_Kingdom's_Edge
    | Grimmkin_Flame_City_Storerooms | Grimmkin_Flame_Greenpath | Grimmkin_Flame_Crystal_Peak
    | Grimmkin_Flame_King's_Pass | Grimmkin_Flame_Resting_Grounds | Grimmkin_Flame_Kingdom's_Edge
    | Grimmkin_Flame_Fungal_Core | Grimmkin_Flame_Ancient_Basin | Grimmkin_Flame_Hive
    | Grimmkin_Flame_Brumm | Hunter's_Journal | Journal_Entry_Void_Tendrils
    | Journal_Entry_Charged_Lumafly | Journal_Entry_Goam | Journal_Entry_Garpede
    | Journal_Entry_Seal_of_Binding | Elevator_Pass | Split_Mothwing_Cloak | Left_Mantis_Claw
    | Right_Mantis_Claw | Split_Crystal_Heart | Leftslash | Rightslash | Upslash | Egg_Shop

    -- geo
    | Geo_Rock_Broken_Elevator_1 | Geo_Rock_Broken_Elevator_2 | Geo_Rock_Broken_Elevator_3
    | Geo_Rock_Broken_Bridge_Upper | Geo_Rock_Broken_Bridge_Lower
    | Geo_Rock_Broken_Bridge_Lower_Dupe | Geo_Rock_Abyss_1 | Geo_Rock_Abyss_2 | Geo_Rock_Abyss_3
    | Geo_Rock_Basin_Tunnel | Geo_Rock_Basin_Grub | Geo_Rock_Basin_Before_Broken_Vessel
    | Geo_Rock_Cliffs_Main_1 | Geo_Rock_Cliffs_Main_2 | Geo_Rock_Cliffs_Main_3
    | Geo_Rock_Cliffs_Main_4 | Geo_Rock_Below_Gorb_Dupe | Geo_Rock_Below_Gorb
    | Geo_Rock_Crossroads_Well | Geo_Rock_Crossroads_Center_Grub | Geo_Rock_Crossroads_Root
    | Geo_Rock_Crossroads_Root_Dupe_1 | Geo_Rock_Crossroads_Root_Dupe_2
    | Geo_Rock_Crossroads_Aspid_Arena | Geo_Rock_Crossroads_Aspid_Arena_Dupe_1
    | Geo_Rock_Crossroads_Aspid_Arena_Dupe_2 | Geo_Rock_Crossroads_Aspid_Arena_Hidden
    | Geo_Rock_Crossroads_Above_False_Knight | Geo_Rock_Crossroads_Before_Acid_Grub
    | Geo_Rock_Crossroads_Below_Goam_Mask_Shard | Geo_Rock_Crossroads_After_Goam_Mask_Shard
    | Geo_Rock_Crossroads_Above_Lever | Geo_Rock_Crossroads_Before_Fungal
    | Geo_Rock_Crossroads_Before_Fungal_Dupe_1 | Geo_Rock_Crossroads_Before_Fungal_Dupe_2
    | Geo_Rock_Crossroads_Before_Shops | Geo_Rock_Crossroads_Before_Glowing_Womb
    | Geo_Rock_Crossroads_Above_Tram | Geo_Rock_Crossroads_Above_Mawlek
    | Geo_Rock_Crossroads_Vessel_Fragment | Geo_Rock_Crossroads_Goam_Alcove
    | Geo_Rock_Crossroads_Goam_Damage_Boost | Geo_Rock_Crossroads_Tram
    | Geo_Rock_Crossroads_Goam_Journal | Geo_Rock_Crossroads_Goam_Journal_Dupe
    | Geo_Rock_Ancestral_Mound | Geo_Rock_Ancestral_Mound_Dupe | Geo_Rock_Ancestral_Mound_Tree
    | Geo_Rock_Ancestral_Mound_Tree_Dupe | Geo_Rock_Moss_Prophet | Geo_Rock_Moss_Prophet_Dupe
    | Geo_Rock_Deepnest_Below_Mimics | Geo_Rock_Deepnest_Below_Mimics_Dupe
    | Geo_Rock_Deepnest_Below_Spike_Grub | Geo_Rock_Deepnest_Below_Spike_Grub_Dupe
    | Geo_Rock_Deepnest_Spike_Grub_Right | Geo_Rock_Deepnest_By_Mantis_Lords_Garpede_Pogo
    | Geo_Rock_Deepnest_By_Mantis_Lords_Garpede_Pogo_Dupe
    | Geo_Rock_Deepnest_By_Mantis_Lords_Requires_Claw_1
    | Geo_Rock_Deepnest_By_Mantis_Lords_Requires_Claw_2
    | Geo_Rock_Deepnest_By_Mantis_Lords_Requires_Claw_3 | Geo_Rock_Deepnest_Nosk_1
    | Geo_Rock_Deepnest_Nosk_2 | Geo_Rock_Deepnest_Nosk_3 | Geo_Rock_Deepnest_Above_Galien
    | Geo_Rock_Deepnest_Galien_Spike | Geo_Rock_Deepnest_Garpede_1 | Geo_Rock_Deepnest_Garpede_2
    | Geo_Rock_Dark_Deepnest_Above_Grub_1 | Geo_Rock_Dark_Deepnest_Above_Grub_2
    | Geo_Rock_Dark_Deepnest_Bottom_Left | Geo_Rock_Above_Mask_Maker_1 | Geo_Rock_Above_Mask_Maker_2
    | Geo_Rock_Lower_Kingdom's_Edge_1 | Geo_Rock_Lower_Kingdom's_Edge_2
    | Geo_Rock_Lower_Kingdom's_Edge_3 | Geo_Rock_Lower_Kingdom's_Edge_Dive
    | Geo_Rock_Kingdom's_Edge_Below_Bardoon | Geo_Rock_Kingdom's_Edge_Oro_Far_Left
    | Geo_Rock_Kingdom's_Edge_Oro_Middle_Left | Geo_Rock_Kingdom's_Edge_Above_Root
    | Geo_Rock_Kingdom's_Edge_Above_Tower | Geo_Rock_Kingdom's_Edge_Below_Colosseum
    | Geo_Rock_Kingdom's_Edge_Above_420_Geo_Rock | Geo_Rock_Kingdom's_Edge_420_Geo_Rock
    | Geo_Rock_Beast's_Den_Above_Trilobite | Geo_Rock_Beast's_Den_Above_Trilobite_Dupe
    | Geo_Rock_Beast's_Den_Below_Herrah | Geo_Rock_Beast's_Den_Below_Egg
    | Geo_Rock_Beast's_Den_Below_Egg_Dupe | Geo_Rock_Beast's_Den_Bottom
    | Geo_Rock_Beast's_Den_Bottom_Dupe | Geo_Rock_Beast's_Den_After_Herrah
    | Geo_Rock_Greenpath_Entrance | Geo_Rock_Greenpath_Waterfall
    | Geo_Rock_Greenpath_Below_Skip_Squit | Geo_Rock_Greenpath_Skip_Squit
    | Geo_Rock_Greenpath_Second_Skip_Fool_Eater | Geo_Rock_Greenpath_Second_Skip_Fool_Eater_Dupe
    | Geo_Rock_Greenpath_Second_Skip_Lower | Geo_Rock_Greenpath_Below_Hornet
    | Geo_Rock_Greenpath_Above_Thorns | Geo_Rock_Greenpath_Hunter's_Journal
    | Geo_Rock_Greenpath_Acid_Bridge | Geo_Rock_Greenpath_After_MMC_Hidden
    | Geo_Rock_Greenpath_After_MMC | Geo_Rock_Greenpath_After_MMC_Dupe
    | Geo_Rock_Greenpath_Obbles_Fool_Eater | Geo_Rock_Greenpath_Moss_Knights
    | Geo_Rock_Greenpath_Moss_Knights_Dupe_1 | Geo_Rock_Greenpath_Moss_Knights_Dupe_2
    | Geo_Rock_Greenpath_Below_Stag | Geo_Rock_Greenpath_Below_Stag_Fool_Eater
    | Geo_Rock_Baldur_Shell_Top_Left | Geo_Rock_Baldur_Shell_Alcove | Geo_Rock_Greenpath_MMC
    | Geo_Rock_Greenpath_Below_Toll | Geo_Rock_Greenpath_Toll_Hidden
    | Geo_Rock_Greenpath_Toll_Hidden_Dupe | Geo_Rock_Fungal_Below_Shrumal_Ogres
    | Geo_Rock_Fungal_Above_Cloth | Geo_Rock_Fungal_After_Cloth
    | Geo_Rock_Fungal_Below_Pilgrim's_Way | Geo_Rock_Fungal_Below_Pilgrim's_Way_Dupe
    | Geo_Rock_Mantis_Outskirts_Guarded | Geo_Rock_Mantis_Outskirts_Guarded_Dupe
    | Geo_Rock_Mantis_Outskirts_Alcove | Geo_Rock_Mantis_Village_After_Lever
    | Geo_Rock_Mantis_Village_Above_Claw | Geo_Rock_Mantis_Village_Above_Claw_Dupe
    | Geo_Rock_Mantis_Village_Below_Lore | Geo_Rock_Mantis_Village_Above_Lever
    | Geo_Rock_Above_Mantis_Lords_1 | Geo_Rock_Above_Mantis_Lords_2
    | Geo_Rock_Fungal_After_Bouncy_Grub | Geo_Rock_Fungal_After_Bouncy_Grub_Dupe
    | Geo_Rock_Fungal_Bouncy_Grub_Lever | Geo_Rock_Fungal_After_Cornifer
    | Geo_Rock_Fungal_Above_City_Entrance | Geo_Rock_Deepnest_By_Mantis_Lords_1
    | Geo_Rock_Deepnest_By_Mantis_Lords_2 | Geo_Rock_Deepnest_Lower_Cornifer
    | Geo_Rock_Fungal_Core_Entrance | Geo_Rock_Fungal_Core_Hidden | Geo_Rock_Fungal_Core_Above_Elder
    | Geo_Rock_Queen's_Gardens_Acid_Entrance | Geo_Rock_Queen's_Gardens_Below_Stag
    | Geo_Rock_Fog_Canyon_East | Geo_Rock_Love_Key | Geo_Rock_Love_Key_Dupe
    | Geo_Rock_Queen's_Gardens_Above_Marmu | Geo_Rock_Pale_Lurker | Geo_Rock_Godhome_Pipeway
    | Geo_Rock_Hive_Entrance | Geo_Rock_Hive_Outside_Bench | Geo_Rock_Hive_Below_Root
    | Geo_Rock_Hive_After_Root | Geo_Rock_Hive_Below_Stash | Geo_Rock_Hive_Stash
    | Geo_Rock_Hive_Stash_Dupe | Geo_Rock_Hive_Below_Grub | Geo_Rock_Hive_Above_Mask
    | Geo_Rock_Crystal_Peak_Lower_Middle | Geo_Rock_Crystal_Peak_Lower_Conveyer_1
    | Geo_Rock_Crystal_Peak_Lower_Conveyer_2 | Geo_Rock_Crystal_Peak_Before_Dark_Room
    | Geo_Rock_Crystal_Peak_Before_Dark_Room_Dupe | Geo_Rock_Crystal_Peak_Above_Spike_Grub
    | Geo_Rock_Crystal_Peak_Mimic_Grub | Geo_Rock_Crystal_Peak_Dive_Egg
    | Geo_Rock_Crystal_Peak_Dive_Egg_Dupe | Geo_Rock_Crystal_Peak_Conga_Line
    | Geo_Rock_Hallownest_Crown_Dive | Geo_Rock_Hallownest_Crown_Dive_Dupe
    | Geo_Rock_Hallownest_Crown_Hidden | Geo_Rock_Hallownest_Crown_Hidden_Dupe_1
    | Geo_Rock_Hallownest_Crown_Hidden_Dupe_2 | Geo_Rock_Crystal_Peak_Before_Crystal_Heart
    | Geo_Rock_Crystal_Peak_Entrance | Geo_Rock_Crystal_Peak_Entrance_Dupe_1
    | Geo_Rock_Crystal_Peak_Entrance_Dupe_2 | Geo_Rock_Crystal_Peak_Above_Crushers_Lower
    | Geo_Rock_Crystal_Peak_Above_Crushers_Higher | Geo_Rock_Resting_Grounds_Catacombs_Grub
    | Geo_Rock_Resting_Grounds_Catacombs_Left_Dupe | Geo_Rock_Resting_Grounds_Catacombs_Left
    | Geo_Rock_Overgrown_Mound | Geo_Rock_Fluke_Hermit_Dupe | Geo_Rock_Fluke_Hermit
    | Geo_Rock_Pleasure_House | Geo_Rock_City_of_Tears_Quirrel | Geo_Rock_City_of_Tears_Lemm
    | Geo_Rock_City_of_Tears_Above_Lemm | Geo_Rock_Soul_Sanctum | Geo_Rock_Watcher's_Spire
    | Geo_Rock_Above_King's_Station | Geo_Rock_King's_Station | Geo_Rock_King's_Pass_Left
    | Geo_Rock_King's_Pass_Below_Fury | Geo_Rock_King's_Pass_Hidden | Geo_Rock_King's_Pass_Collapse
    | Geo_Rock_King's_Pass_Above_Fury | Geo_Rock_Waterways_Tuk | Geo_Rock_Waterways_Tuk_Alcove
    | Geo_Rock_Waterways_Left | Geo_Rock_Waterways_East | Geo_Rock_Waterways_Flukemarm
    | Boss_Geo_Massive_Moss_Charger | Boss_Geo_Gorgeous_Husk | Boss_Geo_Sanctum_Soul_Warrior
    | Boss_Geo_Elegant_Soul_Warrior | Boss_Geo_Crystal_Guardian | Boss_Geo_Enraged_Guardian
    | Boss_Geo_Gruz_Mother | Boss_Geo_Vengefly_King

    -- soul totems
    | Soul_Totem_Basin | Soul_Totem_Cliffs_Main | Soul_Totem_Cliffs_Gorb | Soul_Totem_Cliffs_Joni's
    | Soul_Totem_Crossroads_Goam_Journal | Soul_Totem_Crossroads_Shops
    | Soul_Totem_Crossroads_Mawlek_Upper | Soul_Totem_Crossroads_Acid
    | Soul_Totem_Crossroads_Mawlek_Lower | Soul_Totem_Crossroads_Myla | Soul_Totem_Ancestral_Mound
    | Soul_Totem_Distant_Village | Soul_Totem_Deepnest_Vessel | Soul_Totem_Mask_Maker
    | Soul_Totem_Lower_Kingdom's_Edge_1 | Soul_Totem_Lower_Kingdom's_Edge_2
    | Soul_Totem_Upper_Kingdom's_Edge | Soul_Totem_Kingdom's_Edge_Camp | Soul_Totem_Oro_Dive_2
    | Soul_Totem_Oro_Dive_1 | Soul_Totem_Oro | Soul_Totem_420_Geo_Rock | Soul_Totem_Beast's_Den
    | Soul_Totem_Greenpath_Hunter's_Journal | Soul_Totem_Greenpath_MMC
    | Soul_Totem_Greenpath_Below_Toll | Soul_Totem_Before_Pilgrim's_Way | Soul_Totem_Pilgrim's_Way
    | Soul_Totem_Fungal_Core | Soul_Totem_Top_Left_Queen's_Gardens | Soul_Totem_Below_Marmu
    | Soul_Totem_Upper_Crystal_Peak | Soul_Totem_Hallownest_Crown
    | Soul_Totem_Outside_Crystallized_Mound | Soul_Totem_Crystal_Heart_1
    | Soul_Totem_Crystal_Heart_2 | Soul_Totem_Crystallized_Mound | Soul_Totem_Resting_Grounds
    | Soul_Totem_Below_Xero | Soul_Totem_Sanctum_Below_Soul_Master | Soul_Totem_Sanctum_Below_Chest
    | Soul_Totem_Sanctum_Above_Grub | Soul_Totem_Waterways_Entrance | Soul_Totem_Top_Left_Waterways
    | Soul_Totem_Waterways_East | Soul_Totem_Waterways_Flukemarm | Soul_Totem_White_Palace_Entrance
    | Soul_Totem_White_Palace_Hub | Soul_Totem_White_Palace_Left | Soul_Totem_White_Palace_Final
    | Soul_Totem_White_Palace_Right | Soul_Totem_Path_of_Pain_Below_Lever
    | Soul_Totem_Path_of_Pain_Left_of_Lever | Soul_Totem_Path_of_Pain_Entrance
    | Soul_Totem_Path_of_Pain_Second | Soul_Totem_Path_of_Pain_Hidden
    | Soul_Totem_Path_of_Pain_Below_Thornskip | Soul_Totem_Path_of_Pain_Final
    | Soul_Totem_Pale_Lurker

    -- lore tablets
    | Lore_Tablet_City_Entrance | Lore_Tablet_Pleasure_House | Lore_Tablet_Sanctum_Entrance
    | Lore_Tablet_Sanctum_Past_Soul_Master | Lore_Tablet_Watcher's_Spire
    | Lore_Tablet_Archives_Upper | Lore_Tablet_Archives_Left | Lore_Tablet_Archives_Right
    | Lore_Tablet_Pilgrim's_Way_1 | Lore_Tablet_Pilgrim's_Way_2 | Lore_Tablet_Mantis_Outskirts
    | Lore_Tablet_Mantis_Village | Lore_Tablet_Greenpath_Upper_Hidden
    | Lore_Tablet_Greenpath_Below_Toll | Lore_Tablet_Greenpath_Lifeblood
    | Lore_Tablet_Greenpath_Stag | Lore_Tablet_Greenpath_QG | Lore_Tablet_Greenpath_Lower_Hidden
    | Lore_Tablet_Dung_Defender | Lore_Tablet_Spore_Shroom | Lore_Tablet_Fungal_Wastes_Hidden
    | Lore_Tablet_Fungal_Wastes_Below_Shrumal_Ogres | Lore_Tablet_Fungal_Core
    | Lore_Tablet_Ancient_Basin | Lore_Tablet_King's_Pass_Focus | Lore_Tablet_King's_Pass_Fury
    | Lore_Tablet_King's_Pass_Exit | Lore_Tablet_World_Sense | Lore_Tablet_Howling_Cliffs
    | Lore_Tablet_Kingdom's_Edge | Lore_Tablet_Palace_Workshop | Lore_Tablet_Palace_Throne
    | Lore_Tablet_Path_of_Pain_Entrance
    deriving (Show, Enum)

instance VariableID VID
data VID = SPENTSOUL | SPENTRESERVESOUL
    deriving (Show, Enum)


-- items
dreamer, lurien, monomon, herrah, worldSense, leftDash, leftDash_2, rightDash, rightDash_2, leftClaw, rightClaw, leftSuperdash, rightSuperdash, wings, acid, dreamNail, dreamNail_2, dreamNail_3, spells, fireball, fireball_2, quake, quake_2, scream, scream_2, cycloneSlash, dashSlash, greatSlash, focus :: Logic
dreamer = has DREAMER
lurien = has LURIEN
monomon = has MONOMON
herrah = has HERRAH
worldSense = has WORLDSENSE
leftDash = has LEFTDASH
leftDash_2 = hasAmount 2 LEFTDASH .| hasAmount 2 RIGHTDASH .& leftDash
rightDash = has RIGHTDASH
rightDash_2 = hasAmount 2 RIGHTDASH .| hasAmount 2 LEFTDASH .& rightDash
leftClaw = has LEFTCLAW
rightClaw = has RIGHTCLAW
leftSuperdash = has LEFTSUPERDASH
rightSuperdash = has RIGHTSUPERDASH
wings = has WINGS
acid = has ACID
dreamNail = has DREAMNAIL
dreamNail_2 = hasAmount 2 DREAMNAIL
dreamNail_3 = hasAmount 3 DREAMNAIL
spells = has SPELLS
fireball = has FIREBALL
fireball_2 = hasAmount 2 FIREBALL
quake = has QUAKE
quake_2 = hasAmount 2 QUAKE
scream = has SCREAM
scream_2 = hasAmount 2 SCREAM
cycloneSlash = has CYCLONESLASH
dashSlash = has DASHSLASH
greatSlash = has GREATSLASH
focus = has FOCUS

shopKey :: Logic
shopKey = has SHOPKEY

-- item macros
anyClaw, anyDash, anySuperdash, fullClaw, fullDash, fullSuperdash :: Logic
anyClaw = leftClaw .| rightClaw
anyDash = leftDash .| rightDash
anySuperdash = leftSuperdash .| rightSuperdash
fullClaw = leftClaw .& rightClaw
fullDash = leftDash .& rightDash
fullSuperdash = leftSuperdash .& rightSuperdash

-- settings
itemRando, mapAreaRando, fullAreaRando, roomRando, preciseMovement, proficientCombat, backgroundPogos, enemyPogos, obscureSkips, shadeSkips, infectionSkips, fireballSkips, spikeTunnels, acidSkips, damageBoosts, dangerousSkips, darkRooms, complexSkips, difficultSkips, slopeballSkips, shriekPogoSkips, randomNail, cursed, randomFocus, cursedMasks, cursedNotches, randomElevators :: Logic
itemRando = has ITEMRANDO
mapAreaRando = has MAPAREARANDO
fullAreaRando = has FULLAREARANDO
roomRando = has ROOMRANDO
preciseMovement = has PRECISEMOVEMENT
proficientCombat = has PROFICIENTCOMBAT
backgroundPogos = has BACKGROUNDPOGOS
enemyPogos = has ENEMYPOGOS
obscureSkips = has OBSCURESKIPS
shadeSkips = has SHADESKIPS
infectionSkips = has INFECTIONSKIPS
fireballSkips = has FIREBALLSKIPS
spikeTunnels = has SPIKETUNNELS
acidSkips = has ACIDSKIPS
damageBoosts = has DAMAGEBOOSTS
dangerousSkips = has DANGEROUSSKIPS
darkRooms = has DARKROOMS
complexSkips = has COMPLEXSKIPS
difficultSkips = has DIFFICULTSKIPS
slopeballSkips = has SLOPEBALLSKIPS
shriekPogoSkips = has SHRIEKPOGOSKIPS
randomNail = has RANDOMNAIL
cursed = has CURSED
randomFocus = has RANDOMFOCUS
cursedMasks = has CURSEDMASKS
cursedNotches = has CURSEDNOTCHES
randomElevators = has RANDOMELEVATORS


-- spellcasting state modifiers

data Spellcast = Spellcast {
    casts :: [Int],
    canLeftStall :: Bool,
    canRightStall :: Bool,
    before :: NearbySoul,
    after :: NearbySoul
}

instance Show Spellcast where
    show spellcast = do
        let castsStr = List.intercalate "," $ map show $ casts spellcast
        let canLeftStallStr = if (canLeftStall spellcast) then "LEFTSTALL" else "NOLEFTSTALL"
        let canRightStallStr = if (canRightStall spellcast) then "RIGHTSTALL" else "NORIGHTSTALL"
        let beforeStr = "before:" ++ show (before spellcast)
        let afterStr = "after:" ++ show (after spellcast)
        let res = []
        let res1 = if (not $ casts spellcast == [1]) then castsStr : res else res
        let res2 = if (not $ canLeftStall spellcast) then canLeftStallStr : res1 else res1
        let res3 = if (not $ canRightStall spellcast) then canRightStallStr : res2 else res2
        let res4 = if (not $ before spellcast == None) then beforeStr : res3 else res3
        let res5 = if (not $ after spellcast == None) then afterStr : res4 else res4
        if null res5 then [] else "[" ++ List.intercalate "," res5 ++ "]"

data NearbySoul = None | ItemSoul | MapAreaSoul | AreaSoul | RoomSoul
    deriving (Eq, Show)

-- default state
options :: Spellcast
options = Spellcast {
    casts = [1],
    canLeftStall = True,
    canRightStall = True,
    before = None,
    after = None
}

castSpell :: Spellcast -> Logic
castSpell spellcast = stateModifier
    ("CASTSPELL" ++ show spellcast)
    [VESSELFRAGMENTS]
    (\state inventory -> do
        let restoreBefore = case before spellcast of None -> False; _ -> True
        let restoreAfter = case after spellcast of None -> False; _ -> True
        let vessels = lookupItem (term VESSELFRAGMENTS) inventory `div` 4
        let maxSoul = 99 :: Int
        let maxReserveSoul = vessels * 33
        let spentSoul = if restoreBefore then 0 else lookupVar (var SPENTSOUL) state
        let spentReserveSoul = if restoreBefore then 0 else lookupVar (var SPENTRESERVESOUL) state
        let soul = maxSoul - spentSoul
        let reserveSoul = maxReserveSoul - spentReserveSoul
        let (success, leftSoul, leftReserveSoul) = performSequence (casts spellcast) soul reserveSoul
        let finalSpentSoul = if restoreAfter then 0 else maxSoul - leftSoul
        let finalSpentReserveSoul = if restoreAfter then 0 else maxReserveSoul - leftReserveSoul
        if success then
            [insertVar (var SPENTSOUL) finalSpentSoul $
            insertVar (var SPENTRESERVESOUL) finalSpentReserveSoul
            state]
        else
            []
    )

performSequence :: [Int] -> Int -> Int -> (Bool, Int, Int)
performSequence [] soul reserveSoul = (True, soul, reserveSoul)
performSequence (castGroup:rest) soul reserveSoul = do
    let cost = castGroup * 33
    let refill = min cost reserveSoul
    if cost <= soul
        then performSequence rest (soul - cost + refill) (reserveSoul - refill)
    else
        (False, soul, reserveSoul)

shriekPogo :: Spellcast -> Logic
shriekPogo spellcast = do
    let castCount = sum (casts spellcast)
    -- this is a difficult skip if there are 4 or more casts
    let difficultSkipsifNeeded = if (castCount >= 4) then difficultSkips else Always
    -- stalling splits the casts but requires the ability to dash
    let leftDashifPossible = if (canLeftStall spellcast) then leftDash else Never
    let rightDashifPossible = if (canRightStall spellcast) then rightDash else Never
    let stalledSpellcast = spellcast { casts = replicate castCount 1 }
    let castSpellStalled = castSpell stalledSpellcast .& (leftDashifPossible .| rightDashifPossible)
    let castSpellNormal = castSpell spellcast
    shriekPogoSkips .& scream_2 .& wings .& difficultSkipsifNeeded .& (castSpellNormal .| castSpellStalled)

slopeball :: Spellcast -> Logic
slopeball spellcast = slopeballSkips .& fireball .& castSpell spellcast
