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

    item LANTERN $ at Sly
    ,
    item SIMPLE $ atMany [
        Sly
    ],
    item ELEGANT $ at Sly_Key
    ,
    item SALUBRASBLESSING $ at Salubra
    ,

    item QUILL $ at Iselda
    ,

    item RANCIDEGGS $ atMany [
        Sly, Grubfather
    ],
    item MASKSHARDS $ atMany [
        Sly, Sly, Sly_Key, Sly_Key, Grubfather, Seer
    ],
    item VESSELFRAGMENTS $ atMany [
        Sly, Sly_Key, Grubfather, Seer
    ],
    item NOTCHES $ atMany [
        Salubra, Salubra, Salubra, Salubra
    ],
    item PALEORE $ atMany [
        Grubfather, Seer
    ],
    item HALLOWNESTSEALS $ atMany [
        Grubfather, Seer
    ],
    item KINGSIDOLS $ atMany [
        Grubfather
    ],
    item ARCANEEGGS $ atMany [
        Seer
    ],

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

    ]
