module HK.Data where

import Randomizer


-- items
leftClaw, rightClaw, leftDash, rightDash, leftSuperdash, rightSuperdash, fireball, quake, scream, scream_2, wings, dreamNail :: Logic
leftClaw = Term "LEFTCLAW"
rightClaw = Term "RIGHTCLAW"
leftDash = Term "LEFTDASH"
rightDash = Term "RIGHTDASH"
leftSuperdash = Term "LEFTSUPERDASH"
rightSuperdash = Term "RIGHTSUPERDASH"
fireball = Term "FIREBALL"
quake = Term "QUAKE"
scream = Term "SCREAM"
scream_2 = Terms "SCREAM" 2
wings = Term "WINGS"
dreamNail = Term "DREAMNAIL"

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
preciseMovement = Term "PRECISEMOVEMENT"
difficultSkips = Term "DIFFICULTSKIPS"
obscureSkips = Term "OBSCURESKIPS"
shriekPogoSkips = Term "SHRIEKPOGOSKIPS"
slopeBallSkips = Term "SLOPEBALLSKIPS"


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
    shriekPogoSkips .& scream_2 .& wings .& difficultSkipsifNeeded .& (castSpellNormal .| castSpellStalled)

slopeball :: Spellcast -> Logic
slopeball spellcast = slopeBallSkips .& fireball .& castSpell spellcast
