module HK.Data where

import Randomizer

instance Term ID where
data ID = GRUB | LEFTCLAW | RIGHTCLAW | LEFTDASH | RIGHTDASH | LEFTSUPERDASH | RIGHTSUPERDASH | FIREBALL | QUAKE | SCREAM | WINGS | DREAMNAIL
    | PRECISEMOVEMENT | DIFFICULTSKIPS | OBSCURESKIPS | SHRIEKPOGOSKIPS | SLOPEBALLSKIPS | Tutorial_01'right1'
    deriving (Show, Eq, Ord)

instance STerm SID where
data SID = Todo
    deriving (Show, Eq, Ord)


-- items
leftClaw, rightClaw, leftDash, rightDash, leftSuperdash, rightSuperdash, fireball, quake, scream, scream_2, wings, dreamNail :: Logic ID
leftClaw = has LEFTCLAW
rightClaw = has RIGHTCLAW
leftDash = has LEFTDASH
rightDash = has RIGHTDASH
leftSuperdash = has LEFTSUPERDASH
rightSuperdash = has RIGHTSUPERDASH
fireball = has FIREBALL
quake = has QUAKE
scream = has SCREAM
scream_2 = hasAmount SCREAM 2
wings = has WINGS
dreamNail = has DREAMNAIL

-- item macros
anyClaw, anyDash, anySuperdash, fullClaw, fullDash, fullSuperdash :: Logic ID
anyClaw = leftClaw .| rightClaw
anyDash = leftDash .| rightDash
anySuperdash = leftSuperdash .| rightSuperdash
fullClaw = leftClaw .& rightClaw
fullDash = leftDash .& rightDash
fullSuperdash = leftSuperdash .& rightSuperdash

-- waypoints
crystallizedMoundQuakeFloor :: Logic ID
crystallizedMoundQuakeFloor = quake

-- settings
preciseMovement, difficultSkips, obscureSkips, shriekPogoSkips, slopeBallSkips :: Logic ID
preciseMovement = has PRECISEMOVEMENT
difficultSkips = has DIFFICULTSKIPS
obscureSkips = has OBSCURESKIPS
shriekPogoSkips = has SHRIEKPOGOSKIPS
slopeBallSkips = has SLOPEBALLSKIPS


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
castSpell :: Spellcast -> Logic ID
castSpell _ = Always

shriekPogo :: Spellcast -> Logic ID
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

slopeball :: Spellcast -> Logic ID
slopeball spellcast = slopeBallSkips .& fireball .& castSpell spellcast
