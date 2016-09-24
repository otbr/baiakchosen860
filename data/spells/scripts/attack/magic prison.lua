local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 1498)

local arr = {
{1, 1, 1, 1, 1, 1},
{1, 0, 0, 0, 0, 1},
{1, 0, 0, 2, 0, 1},
{1, 0, 0, 0, 0, 1},
{1, 1, 1, 1, 1, 1}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
