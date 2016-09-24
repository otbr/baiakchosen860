local combat = createCombatObject()

local meteor = createCombatObject()
setCombatParam(meteor, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(meteor, COMBAT_PARAM_EFFECT, 36)
setCombatFormula(meteor, COMBAT_FORMULA_DAMAGE, -1000, -1000, -1000, -1000)

local meteor_water = createCombatObject()
setCombatParam(meteor_water, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(meteor_water, COMBAT_PARAM_EFFECT, 36)
setCombatFormula(meteor_water, COMBAT_FORMULA_DAMAGE, -1000, -1000, -1000, -1000)

combat_arr = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 1, 0, 3, 0, 1, 0, 1, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local combat_area = createCombatArea(combat_arr)
setCombatArea(combat, combat_area)

local function meteorCast(p)
doCombat(p.cid, p.combat, positionToVariant(p.pos))
end

local function stunEffect(cid)
doSendMagicEffect(getThingPos(cid), CONST_ME_STUN)
end

function onTargetTile(cid, pos)
if (math.random(1, 1) == 1) then
local ground = getThingfromPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0})
if (isInArray(water, ground.itemid) == TRUE) then
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, 3)
addEvent(meteorCast, 6000, {cid = cid, pos = pos, combat = meteor_water})
else
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
doSendDistanceShoot(newpos, pos, 3)
addEvent(meteorCast, 600, {cid = cid,pos = pos, combat = meteor})
end
end
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetTile")

function onCastSpell(cid, var)
if isMonster(cid) then
        doCreatureSay(cid, "METEORO DE PEGASUS!", TALKTYPE_MONSTER)
    end
return doCombat(cid, combat, var)	
end