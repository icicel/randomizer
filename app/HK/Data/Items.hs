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

    item DREAMNAIL $ atMany [
        Seer, Seer
    ],

    itemType GATHERINGSWARM CHARMS $ at Sly
    ,
    itemType WAYWARDCOMPASS CHARMS $ at Iselda
    ,
    itemType GRUBSONG CHARMS $ at Grubfather
    ,
    itemType STALWARTSHELL CHARMS $ at Sly
    ,
    itemType QUICKFOCUS CHARMS $ at Salubra
    ,
    itemType LIFEBLOODHEART CHARMS $ at Salubra
    ,
    itemType STEADYBODY CHARMS $ at Salubra
    ,
    itemType HEAVYBLOW CHARMS $ at Sly_Key
    ,
    itemType LONGNAIL CHARMS $ at Salubra
    ,
    itemType SHAMANSTONE CHARMS $ at Salubra
    ,
    itemType FRAGILEHEART CHARMS $ at Leg_Eater
    ,
    itemType FRAGILEGREED CHARMS $ at Leg_Eater
    ,
    itemType FRAGILESTRENGTH CHARMS $ at Leg_Eater
    ,
    itemType DREAMWIELDER CHARMS $ at Seer
    ,
    itemType GRUBBERFLYSELEGY CHARMS $ at Grubfather
    ,
    itemType SPRINTMASTER CHARMS $ at Sly_Key
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
