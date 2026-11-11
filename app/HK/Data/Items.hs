module HK.Data.Items where

import Logic
import HK.Data

allItems :: [Item]
allItems = [

    itemType LURIEN DREAMER $ at Lurien
    ,
    itemType MONOMON DREAMER $ at Monomon
    ,
    itemType HERRAH DREAMER $ at Herrah
    ,
    item WORLDSENSE $ at World_Sense
    ,
    item LEFTDASH $ atMany [
        Mothwing_Cloak, Shade_Cloak
    ],
    item RIGHTDASH $ atMany [
        Mothwing_Cloak, Shade_Cloak
    ],
    item LEFTCLAW $ at Mantis_Claw
    ,
    item RIGHTCLAW $ at Mantis_Claw
    ,
    item LEFTSUPERDASH $ at Crystal_Heart
    ,
    item RIGHTSUPERDASH $ at Crystal_Heart
    ,
    item WINGS $ at Monarch_Wings
    ,
    item ACID $ at Isma's_Tear
    ,
    item DREAMNAIL $ atMany [
        Seer, Seer, Dream_Nail
    ],
    itemType FIREBALL SPELLS $ atMany [
        Vengeful_Spirit, Shade_Soul
    ],
    itemType QUAKE SPELLS $ atMany [
        Desolate_Dive, Descending_Dark
    ],
    itemType SCREAM SPELLS $ atMany [
        Howling_Wraiths, Abyss_Shriek
    ],
    item CYCLONESLASH $ at Cyclone_Slash
    ,
    item DASHSLASH $ at Dash_Slash
    ,
    item GREATSLASH $ at Great_Slash
    ,

    itemType GATHERINGSWARM CHARMS $ at Sly
    ,
    itemType WAYWARDCOMPASS CHARMS $ at Iselda
    ,
    itemType GRUBSONG CHARMS $ at Grubfather
    ,
    itemType STALWARTSHELL CHARMS $ at Sly
    ,
    itemType BALDURSHELL CHARMS $ at Baldur_Shell
    ,
    itemType FURYOFTHEFALLEN CHARMS $ at Fury_of_the_Fallen
    ,
    itemType QUICKFOCUS CHARMS $ at Salubra
    ,
    itemType LIFEBLOODHEART CHARMS $ at Salubra
    ,
    itemType LIFEBLOODCORE CHARMS $ at Lifeblood_Core
    ,
    itemType DEFENDERSCREST CHARMS $ at Defender's_Crest
    ,
    itemType FLUKENEST CHARMS $ at Flukenest
    ,
    itemType THORNSOFAGONY CHARMS $ at Thorns_of_Agony
    ,
    itemType MARKOFPRIDE CHARMS $ at Mark_of_Pride
    ,
    itemType STEADYBODY CHARMS $ at Salubra
    ,
    itemType HEAVYBLOW CHARMS $ at Sly_Key
    ,
    itemType SHARPSHADOW CHARMS $ at Sharp_Shadow
    ,
    itemType SPORESHROOM CHARMS $ at Spore_Shroom
    ,
    itemType LONGNAIL CHARMS $ at Salubra
    ,
    itemType SHAMANSTONE CHARMS $ at Salubra
    ,
    itemType SOULCATCHER CHARMS $ at Soul_Catcher
    ,
    itemType SOULEATER CHARMS $ at Soul_Eater
    ,
    itemType GLOWINGWOMB CHARMS $ at Glowing_Womb
    ,
    itemType FRAGILEHEART CHARMS $ atMany [
        Leg_Eater, Unbreakable_Heart
    ],
    itemType FRAGILEGREED CHARMS $ atMany [
        Leg_Eater, Unbreakable_Greed
    ],
    itemType FRAGILESTRENGTH CHARMS $ atMany [
        Leg_Eater, Unbreakable_Strength
    ],
    itemType NAILMASTERSGLORY CHARMS $ at Nailmaster's_Glory
    ,
    itemType JONISBLESSING CHARMS $ at Joni's_Blessing
    ,
    itemType SHAPEOFUNN CHARMS $ at Shape_of_Unn
    ,
    itemType HIVEBLOOD CHARMS $ at Hiveblood
    ,
    itemType DREAMWIELDER CHARMS $ at Seer
    ,
    itemType DASHMASTER CHARMS $ at Dashmaster
    ,
    itemType QUICKSLASH CHARMS $ at Quick_Slash
    ,
    itemType SPELLTWISTER CHARMS $ at Spell_Twister
    ,
    itemType DEEPFOCUS CHARMS $ at Deep_Focus
    ,
    itemType GRUBBERFLYSELEGY CHARMS $ at Grubfather
    ,
    multipartItemType WHITEFRAGMENT CHARMS 2 $ atMany [
        Queen_Fragment, King_Fragment, Void_Heart
    ],
    itemType SPRINTMASTER CHARMS $ at Sly_Key
    ,
    itemType DREAMSHIELD CHARMS $ at Dreamshield
    ,
    itemType WEAVERSONG CHARMS $ at Weaversong
    ,
    itemType GRIMMCHILD CHARMS $ at Grimmchild
    ,

    item CREST $ at City_Crest
    ,
    item LANTERN $ at Sly
    ,
    item TRAM $ at Tram_Pass
    ,
    item SIMPLE $ atMany [
        Sly, Simple_Key_Basin, Simple_Key_City, Simple_Key_Lurker
    ],
    item SHOPKEY $ at Shopkeeper's_Key
    ,
    item ELEGANT $ at Sly_Key
    ,
    item LOVEKEY $ at Love_Key
    ,
    item KINGSBRAND $ at King's_Brand
    ,
    item GODTUNER $ at Godtuner
    ,
    item JOURNAL $ at Hunter's_Journal
    ,
    item SALUBRASBLESSING $ at Salubra
    ,

    item COLLECTORSMAP $ at Collector's_Map
    ,
    item QUILL $ at Iselda
    ,
    item CROSSROADSMAP $ at Crossroads_Map
    ,
    item GREENPATHMAP $ at Greenpath_Map
    ,
    item FOGCANYONMAP $ at Fog_Canyon_Map
    ,
    item FUNGALWASTESMAP $ at Fungal_Wastes_Map
    ,
    item DEEPNESTMAP $ atMany [
        Deepnest_Map_Upper, Deepnest_Map_Right
    ],
    item ANCIENTBASINMAP $ at Ancient_Basin_Map
    ,
    item KINGDOMSEDGEMAP $ at Kingdom's_Edge_Map
    ,
    item CITYOFTEARSMAP $ at City_of_Tears_Map
    ,
    item ROYALWATERWAYSMAP $ at Royal_Waterways_Map
    ,
    item HOWLINGCLIFFSMAP $ at Howling_Cliffs_Map
    ,
    item CRYSTALPEAKMAP $ at Crystal_Peak_Map
    ,
    item QUEENSGARDENSMAP $ at Queen's_Gardens_Map
    ,
    item RESTINGGROUNDSMAP $ at Resting_Grounds_Map
    ,

    itemType DIRTMOUTHSTAG STAGS $ at Dirtmouth_Stag
    ,
    itemType CROSSROADSSTAG STAGS $ at Crossroads_Stag
    ,
    itemType GREENPATHSTAG STAGS $ at Greenpath_Stag
    ,
    itemType QUEENSSTATIONSTAG STAGS $ at Queen's_Station_Stag
    ,
    itemType QUEENSGARDENSSTAG STAGS $ at Queen's_Gardens_Stag
    ,
    itemType CITYSTOREROOMSSTAG STAGS $ at City_Storerooms_Stag
    ,
    itemType KINGSSTATIONSTAG STAGS $ at King's_Station_Stag
    ,
    itemType RESTINGGROUNDSSTAG STAGS $ at Resting_Grounds_Stag
    ,
    itemType DISTANTVILLAGESTAG STAGS $ at Distant_Village_Stag
    ,
    itemType HIDDENSTATIONSTAG STAGS $ at Hidden_Station_Stag
    ,
    itemType STAGNESTSTAG STAGS $ at Stag_Nest_Stag
    ,

    item GEO $ amountAtMany [
        (Geo_Chest_False_Knight, 200), (Geo_Chest_Soul_Master, 380), (Geo_Chest_Watcher_Knights, 655), (Geo_Chest_Greenpath, 85), (Geo_Chest_Mantis_Lords, 620), (Geo_Chest_Resting_Grounds, 150), (Geo_Chest_Crystal_Peak, 80), (Geo_Chest_Weavers_Den, 160), (Geo_Chest_Junk_Pit_1, 8), (Geo_Chest_Junk_Pit_2, 8), (Geo_Chest_Junk_Pit_3, 25), (Geo_Chest_Junk_Pit_5, 10)
    ],
    item GRUBS $ atMany [
        Grub_Crossroads_Acid, Grub_Crossroads_Center, Grub_Crossroads_Stag, Grub_Crossroads_Spike, Grub_Crossroads_Guarded, Grub_Greenpath_Cornifer, Grub_Greenpath_Journal, Grub_Greenpath_MMC, Grub_Greenpath_Stag, Grub_Fog_Canyon, Grub_Fungal_Bouncy, Grub_Fungal_Spore_Shroom, Grub_Deepnest_Mimic, Grub_Deepnest_Nosk, Grub_Deepnest_Spike, Grub_Dark_Deepnest, Grub_Beast's_Den, Grub_Kingdom's_Edge_Oro, Grub_Kingdom's_Edge_Camp, Grub_Hive_External, Grub_Hive_Internal, Grub_Basin_Requires_Wings, Grub_Basin_Requires_Dive, Grub_Waterways_Main, Grub_Isma's_Grove, Grub_Waterways_Requires_Tram, Grub_City_of_Tears_Left, Grub_Soul_Sanctum, Grub_Watcher's_Spire, Grub_City_of_Tears_Guarded, Grub_King's_Station, Grub_Resting_Grounds, Grub_Crystal_Peak_Below_Chest, Grub_Crystallized_Mound, Grub_Crystal_Peak_Spike, Grub_Crystal_Peak_Mimic, Grub_Crystal_Peak_Crushers, Grub_Crystal_Heart, Grub_Hallownest_Crown, Grub_Howling_Cliffs, Grub_Queen's_Gardens_Stag, Grub_Queen's_Gardens_Marmu, Grub_Queen's_Gardens_Top, Grub_Collector_1, Grub_Collector_2, Grub_Collector_3
    ],
    item ESSENCE $ amountAtMany [
        (Whispering_Root_Crossroads, 29), (Whispering_Root_Greenpath, 44), (Whispering_Root_Leg_Eater, 20), (Whispering_Root_Mantis_Village, 18), (Whispering_Root_Deepnest, 45), (Whispering_Root_Queens_Gardens, 29), (Whispering_Root_Kingdoms_Edge, 51), (Whispering_Root_Waterways, 35), (Whispering_Root_City, 28), (Whispering_Root_Resting_Grounds, 20), (Whispering_Root_Spirits_Glade, 34), (Whispering_Root_Crystal_Peak, 21), (Whispering_Root_Howling_Cliffs, 46), (Whispering_Root_Ancestral_Mound, 42), (Whispering_Root_Hive, 20), (Boss_Essence_Elder_Hu, 100), (Boss_Essence_Xero, 100), (Boss_Essence_Gorb, 100), (Boss_Essence_Marmu, 150), (Boss_Essence_No_Eyes, 200), (Boss_Essence_Galien, 200), (Boss_Essence_Markoth, 250), (Boss_Essence_Failed_Champion, 300), (Boss_Essence_Soul_Tyrant, 300), (Boss_Essence_Lost_Kin, 400), (Boss_Essence_White_Defender, 300), (Boss_Essence_Grey_Prince_Zote, 300)
    ],
    item RANCIDEGGS $ atMany [
        Sly, Grubfather, Rancid_Egg_Sheo, Rancid_Egg_Fungal_Core, Rancid_Egg_Queen's_Gardens, Rancid_Egg_Blue_Lake, Rancid_Egg_Crystal_Peak_Dive_Entrance, Rancid_Egg_Crystal_Peak_Dark_Room, Rancid_Egg_Crystal_Peak_Tall_Room, Rancid_Egg_City_of_Tears_Left, Rancid_Egg_City_of_Tears_Pleasure_House, Rancid_Egg_Beast's_Den, Rancid_Egg_Dark_Deepnest, Rancid_Egg_Weaver's_Den, Rancid_Egg_Near_Quick_Slash, Rancid_Egg_Upper_Kingdom's_Edge, Rancid_Egg_Waterways_East, Rancid_Egg_Waterways_Main, Rancid_Egg_Waterways_West_Bluggsac, Rancid_Egg_Waterways_West_Pickup, Rancid_Egg_Tuk_Defender's_Crest
    ],
    item MASKSHARDS $ atMany [
        Sly, Sly, Sly_Key, Sly_Key, Grubfather, Seer, Mask_Shard_Brooding_Mawlek, Mask_Shard_Crossroads_Goam, Mask_Shard_Stone_Sanctuary, Mask_Shard_Queen's_Station, Mask_Shard_Deepnest, Mask_Shard_Waterways, Mask_Shard_Enraged_Guardian, Mask_Shard_Hive, Mask_Shard_Grey_Mourner, Mask_Shard_Bretta
    ],
    item VESSELFRAGMENTS $ atMany [
        Sly, Sly_Key, Grubfather, Seer, Vessel_Fragment_Greenpath, Vessel_Fragment_City, Vessel_Fragment_Crossroads, Vessel_Fragment_Basin, Vessel_Fragment_Deepnest, Vessel_Fragment_Stag_Nest
    ],
    item NOTCHES $ atMany [
        Salubra, Salubra, Salubra, Salubra, Charm_Notch_Shrumal_Ogres, Charm_Notch_Fog_Canyon, Charm_Notch_Colosseum, Charm_Notch_Grimm
    ],
    item PALEORE $ atMany [
        Grubfather, Seer, Pale_Ore_Basin, Pale_Ore_Crystal_Peak, Pale_Ore_Nosk, Pale_Ore_Colosseum
    ],
    item WANDERERSJOURNALS $ atMany [
        Wanderer's_Journal_Cliffs, Wanderer's_Journal_Greenpath_Stag, Wanderer's_Journal_Greenpath_Lower, Wanderer's_Journal_Fungal_Wastes_Thorns_Gauntlet, Wanderer's_Journal_Above_Mantis_Village, Wanderer's_Journal_Crystal_Peak_Crawlers, Wanderer's_Journal_Resting_Grounds_Catacombs, Wanderer's_Journal_King's_Station, Wanderer's_Journal_Pleasure_House, Wanderer's_Journal_City_Storerooms, Wanderer's_Journal_Ancient_Basin, Wanderer's_Journal_Kingdom's_Edge_Entrance, Wanderer's_Journal_Kingdom's_Edge_Camp, Wanderer's_Journal_Kingdom's_Edge_Requires_Dive
    ],
    item HALLOWNESTSEALS $ atMany [
        Grubfather, Seer, Hallownest_Seal_Crossroads_Well, Hallownest_Seal_Greenpath, Hallownest_Seal_Fog_Canyon_West, Hallownest_Seal_Fog_Canyon_East, Hallownest_Seal_Queen's_Station, Hallownest_Seal_Fungal_Wastes_Sporgs, Hallownest_Seal_Mantis_Lords, Hallownest_Seal_Resting_Grounds_Catacombs, Hallownest_Seal_King's_Station, Hallownest_Seal_City_Rafters, Hallownest_Seal_Soul_Sanctum, Hallownest_Seal_Watcher_Knight, Hallownest_Seal_Deepnest_By_Mantis_Lords, Hallownest_Seal_Beast's_Den, Hallownest_Seal_Queen's_Gardens
    ],
    item KINGSIDOLS $ atMany [
        Grubfather, King's_Idol_Cliffs, King's_Idol_Crystal_Peak, King's_Idol_Glade_of_Hope, King's_Idol_Dung_Defender, King's_Idol_Great_Hopper, King's_Idol_Pale_Lurker, King's_Idol_Deepnest
    ],
    item ARCANEEGGS $ atMany [
        Seer, Arcane_Egg_Lifeblood_Core, Arcane_Egg_Shade_Cloak, Arcane_Egg_Birthplace
    ],
    item FLAMES $ atMany [
        Grimmkin_Flame_City_Storerooms, Grimmkin_Flame_Greenpath, Grimmkin_Flame_Crystal_Peak, Grimmkin_Flame_King's_Pass, Grimmkin_Flame_Resting_Grounds, Grimmkin_Flame_Kingdom's_Edge, Grimmkin_Flame_Fungal_Core, Grimmkin_Flame_Ancient_Basin, Grimmkin_Flame_Hive, Grimmkin_Flame_Brumm
    ],

    item ELEVATORPASS $ at Elevator_Pass
    ,
    item LEFTSLASH $ at Start
    ,
    item RIGHTSLASH $ at Start
    ,
    item UPSLASH $ at Start
    ,
    item DOWNSLASH $ at Start
    ,
    item SWIM $ at Start
    ,
    item FOCUS $ at Start
    ,

    item MIMIC $ atMany [
        Mimic_Grub_Deepnest_1, Mimic_Grub_Deepnest_2, Mimic_Grub_Deepnest_3, Mimic_Grub_Crystal_Peak
    ],
    item LUMAFLY $ at Lumafly_Escape_Junk_Pit_Chest_4
    ,
    item LIFEBLOODCOCOONSMALL $ atMany [
        Lifeblood_Cocoon_King's_Pass, Lifeblood_Cocoon_Ancestral_Mound, Lifeblood_Cocoon_Greenpath, Lifeblood_Cocoon_Mantis_Village, Lifeblood_Cocoon_Failed_Tramway
    ],
    item LIFEBLOODCOCOONLARGE $ atMany [
        Lifeblood_Cocoon_Fog_Canyon_West, Lifeblood_Cocoon_Galien, Lifeblood_Cocoon_Kingdom's_Edge
    ],
    item JOURNALENTRY $ atMany [
        Journal_Entry_Void_Tendrils, Journal_Entry_Charged_Lumafly, Journal_Entry_Goam, Journal_Entry_Garpede, Journal_Entry_Seal_of_Binding
    ]

    ]
