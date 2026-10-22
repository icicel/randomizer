module HK.Data.Places where

import Logic
import HK.Data

places :: [Location]
places = [

    multiPlace Start [
        item FOCUS, item SWIM, item LEFTSLASH, item RIGHTSLASH, item UPSLASH, item DOWNSLASH
    ] $
        Always
    ,
    
    multiPlace Sly [
        item GATHERINGSWARM, item STALWARTSHELL, item LANTERN, item SIMPLE,
        item MASKSHARDS, item MASKSHARDS, item VESSELFRAGMENTS, item RANCIDEGGS
    ] $
        has Room_shop_left1 .& has Rescued_Sly
    ,

    multiPlace Sly_Key [
        item HEAVYBLOW, item SPRINTMASTER, item ELEGANT,
        item MASKSHARDS, item MASKSHARDS, item VESSELFRAGMENTS
    ] $
        has Room_shop_left1 .& has Rescued_Sly .& shopKey
    ,

    multiPlace Iselda [
        item WAYWARDCOMPASS, item QUILL
    ] $
        has Room_mapper_left1
    ,

    -- todo charm costs for notches
    multiPlace Salubra [
        item LIFEBLOODHEART, item LONGNAIL, item STEADYBODY, item SHAMANSTONE, item QUICKFOCUS,
        item NOTCHES, item NOTCHES, item NOTCHES, item NOTCHES, item SALUBRASBLESSING
    ] $
        has Room_Charm_Shop_left1
    ,

    multiPlace Leg_Eater [
        item FRAGILEHEART, item FRAGILEGREED, item FRAGILESTRENGTH
    ] $
        has Fungus2_26_left1
    ,

    -- todo grub costs
    multiPlace Grubfather [
        item GRUBSONG, item GRUBBERFLYSELEGY, item MASKSHARDS, item PALEORE, item RANCIDEGGS,
        item HALLOWNESTSEALS, item KINGSIDOLS
    ] $
        has Crossroads_38_right1
    ,

    -- todo essence costs
    multiPlace Seer [
        item DREAMNAIL, item DREAMNAIL, item DREAMWIELDER,
        item MASKSHARDS, item VESSELFRAGMENTS, item PALEORE, item HALLOWNESTSEALS, item ARCANEEGGS
    ] $
        has RestingGrounds_07_right1
    ,

    place Descending_Dark (item QUAKE) $
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

    place Grub_Crystallized_Mound (item GRUBS) $
        has Mines_35_left1 .& has Broke_Crystallized_Mound_Quake_Floor .& (
            leftClaw
        .| rightClaw .& preciseMovement .& (
                rightDash
            .| obscureSkips
            )
        .| wings
        )

    ]
