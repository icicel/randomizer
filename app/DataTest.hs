module DataTest where

import Randomizer

-- example locations

-- "name": "Descending_Dark",
-- "logic": "Mines_35[left1] + Broke_Crystallized_Mound_Quake_Floor + (LEFTCLAW | RIGHTCLAW + PRECISEMOVEMENT + (RIGHTDASH | OBSCURESKIPS + DIFFICULTSKIPS) | WINGS + OBSCURESKIPS | $SHRIEKPOGO[2])"
descendingDark :: Location
descendingDark = Location "Descending_Dark" $
    crystallizedMoundQuakeFloor .& (
        leftClaw
     .| rightClaw .& preciseMovement .& (
            rightDash
         .| obscureSkips .& difficultSkips
        )
     .| wings .& obscureSkips
     .| shriekPogo (options { casts = [2] })
    )

-- "name": "Grub-Crystallized_Mound",
-- "logic": "Mines_35[left1] + Broke_Crystallized_Mound_Quake_Floor + (LEFTCLAW | RIGHTCLAW + PRECISEMOVEMENT + (RIGHTDASH | OBSCURESKIPS) | WINGS)"
grubCrystallizedMound :: Location
grubCrystallizedMound = Location "Grub-Crystallized_Mound" $
    crystallizedMoundQuakeFloor .& (
        leftClaw
     .| rightClaw .& preciseMovement .& (
            rightDash
         .| obscureSkips
        )
     .| wings
    )


-- items
leftClaw, rightClaw, leftDash, rightDash, leftSuperdash, rightSuperdash, fireball, quake, scream, wings, dreamNail :: Logic
leftClaw = Item "LEFTCLAW"
rightClaw = Item "RIGHTCLAW"
leftDash = Item "LEFTDASH"
rightDash = Item "RIGHTDASH"
leftSuperdash = Item "LEFTSUPERDASH"
rightSuperdash = Item "RIGHTSUPERDASH"
fireball = Item "FIREBALL"
quake = Item "QUAKE"
scream = Item "SCREAM"
wings = Item "WINGS"
dreamNail = Item "DREAMNAIL"

-- item macros
anyClaw, anyDash, anySuperdash, fullClaw, fullDash, fullSuperdash :: Logic
anyClaw = leftClaw .| rightClaw
anyDash = leftDash .| rightDash
anySuperdash = leftSuperdash .| rightSuperdash
fullClaw = leftClaw .& rightClaw
fullDash = leftDash .& rightDash
fullSuperdash = leftSuperdash .& rightSuperdash

-- waypoints
crystallizedMoundQuakeFloor :: Logic
crystallizedMoundQuakeFloor = quake

-- settings
preciseMovement, difficultSkips, obscureSkips, shriekPogoSkips, slopeBallSkips :: Logic
preciseMovement = Setting "PRECISEMOVEMENT"
difficultSkips = Setting "DIFFICULTSKIPS"
obscureSkips = Setting "OBSCURESKIPS"
shriekPogoSkips = Setting "SHRIEKPOGOSKIPS"
slopeBallSkips = Setting "SLOPEBALLSKIPS"


-- spellcasting state variables

data Spellcast = Spellcast {
    casts :: [Int],
    canLeftStall :: Bool,
    canRightStall :: Bool,
    before :: NearbySoul,
    after :: NearbySoul
}

data NearbySoul = None | ItemSoul | MapAreaSoul | AreaSoul | RoomSoul

-- default state
options :: Spellcast
options = Spellcast {
    casts = [1],
    canLeftStall = True,
    canRightStall = True,
    before = None,
    after = None
}

-- TODO: nonterminal logic
castSpell :: Spellcast -> Logic
castSpell _ = Always

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
    shriekPogoSkips .& scream .& wings .& difficultSkipsifNeeded .& (castSpellNormal .| castSpellStalled)

slopeball :: Spellcast -> Logic
slopeball spellcast = slopeBallSkips .& fireball .& castSpell spellcast
