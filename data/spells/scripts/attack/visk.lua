local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 47)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 47)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1900, 0, -1950, 0)
 

arr = {
{0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 2, 1, 1, 1, 1, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}
}
 
local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
doSendAnimatedText(getPlayerPosition(cid), "VIS", TEXTCOLOR_RED)
doPlayerAddExp(cid,1)
	return doCombat(cid, combat, var)
end
