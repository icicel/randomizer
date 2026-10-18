module HK.Data where

import Data.List

import Randomizer

instance TermID TID
data TID =
    LEFTCLAW | RIGHTCLAW | LEFTDASH | RIGHTDASH | LEFTSUPERDASH | RIGHTSUPERDASH
    | WINGS | DREAMNAIL
    | FIREBALL | QUAKE | SCREAM
    | GRUB | VESSELFRAGMENTS
    | PRECISEMOVEMENT | DIFFICULTSKIPS | OBSCURESKIPS | SHRIEKPOGOSKIPS | SLOPEBALLSKIPS
    | Broke_Crystallized_Mound_Quake_Floor
    | Tutorial_01_right1 | Mines_35_left1
    deriving (Show, Enum)

instance NameID NID
data NID = Descending_Dark | Grub_Crystallized_Mound
    deriving (Show, Enum)

instance VariableID VID
data VID = SPENTSOUL | SPENTRESERVESOUL
    deriving (Show, Enum)


-- items
leftClaw, rightClaw, leftDash, rightDash, leftSuperdash, rightSuperdash, fireball, quake, scream, scream_2, wings, dreamNail :: Logic
leftClaw = has LEFTCLAW
rightClaw = has RIGHTCLAW
leftDash = has LEFTDASH
rightDash = has RIGHTDASH
leftSuperdash = has LEFTSUPERDASH
rightSuperdash = has RIGHTSUPERDASH
fireball = has FIREBALL
quake = has QUAKE
scream = has SCREAM
scream_2 = hasAmount 2 SCREAM
wings = has WINGS
dreamNail = has DREAMNAIL

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
crystallizedMoundQuakeFloor = has Broke_Crystallized_Mound_Quake_Floor

-- settings
preciseMovement, difficultSkips, obscureSkips, shriekPogoSkips, slopeBallSkips :: Logic
preciseMovement = has PRECISEMOVEMENT
difficultSkips = has DIFFICULTSKIPS
obscureSkips = has OBSCURESKIPS
shriekPogoSkips = has SHRIEKPOGOSKIPS
slopeBallSkips = has SLOPEBALLSKIPS


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
        let castsStr = intercalate "," $ map show $ casts spellcast
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
        if null res5 then [] else "[" ++ intercalate "," res5 ++ "]"

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
slopeball spellcast = slopeBallSkips .& fireball .& castSpell spellcast
