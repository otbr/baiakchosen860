local spellConfig = {
        {effect = CONST_ME_GIANTICE,
         area = createCombatArea({
                {1, 1, 1},
                {1, 3, 1},
                {1, 1, 1}})
        },
        {effect = CONST_ME_WATERSPLASH,
         area = createCombatArea({
                {0, 1, 0, 0, 0},
                {1, 0, 0, 1, 0},
                {0, 0, 3, 0, 0},
                {0, 0, 1, 0, 1},
                {1, 0, 0, 1, 0}})
        },
        {effect = CONST_ME_GIANTICE,
         area = createCombatArea({
                {0, 0, 1, 0, 1},
                {1, 0, 0, 0, 1},
                {0, 0, 3, 1, 0},
                {0, 1, 0, 0, 1},
                {1, 0, 1, 0, 0}})
        },
        {effect = CONST_ME_SMOKE,
         area = createCombatArea({
                {0, 0, 1, 0, 1},
                {1, 0, 0, 0, 1},
                {0, 0, 3, 1, 0},
                {0, 1, 0, 0, 1},
                {1, 0, 1, 0, 0}})
        },
        {effect = CONST_ME_WATERSPLASH,
         area = createCombatArea({
                {0, 0, 1, 0, 1, 0, 0},
                {0, 0, 0, 0, 0, 1, 0},
                {1, 0, 0, 0, 0, 0, 1},
                {0, 0, 1, 3, 1, 0, 0},
                {1, 0, 0, 0, 0, 0, 1},
                {0, 0, 1, 0, 0, 0, 0},
                {0, 0, 1, 0, 1, 0, 0}})
        },
        {effect = CONST_ME_SMOKE,
         area = createCombatArea({
                {0, 0, 1, 0, 1, 0, 0},
                {0, 1, 0, 1, 0, 1, 0},
                {1, 0, 1, 0, 0, 0, 1},
                {0, 0, 0, 3, 1, 0, 0},
                {0, 1, 0, 0, 0, 0, 1},
                {1, 0, 0, 1, 0, 1, 0},
                {0, 0, 1, 0, 1, 0, 0}})
        },
        {effect = CONST_ME_WATERSPLASH,
         area = createCombatArea({
                {0, 0, 1, 0, 1, 0, 0},
                {0, 1, 0, 1, 0, 1, 0},
                {1, 0, 1, 0, 0, 0, 1},
                {0, 0, 0, 3, 1, 0, 0},
                {0, 1, 0, 0, 0, 0, 1},
                {1, 0, 0, 1, 0, 1, 0},
                {0, 0, 1, 0, 1, 0, 0}})
        }
}

local combats = {}
for k, config in ipairs(spellConfig) do
        combats[k] = createCombatObject()
                onTargetTile = function(cid, pos)
                        local basePos = getThingPosition(cid)
                        local fromPos = {x=basePos.x-6, y=basePos.y-8, z=basePos.z}
                        doSendDistanceShoot(fromPos, pos, CONST_ANI_SNOWBALL)
                end
                setCombatCallback(combats[k], CALLBACK_PARAM_TARGETTILE, "onTargetTile")
                setCombatParam(combats[k], COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
                setCombatParam(combats[k], COMBAT_PARAM_EFFECT, config.effect)
                setCombatFormula(combats[k], COMBAT_FORMULA_DAMAGE, -500, -500, -500, -500)
                setCombatArea(combats[k], config.area)
end

local function castingSpellTime(p)
        if(isCreature(p[1]) == TRUE) then
                doCombat(unpack(p))
        end
end
function onCastSpell(cid, var)
        for k, combat in ipairs(combats) do
                addEvent(castingSpellTime, (250*k), {cid, combat, var})
        end        
		if isMonster(cid) then
        doCreatureSay(cid, "METEORO DE PEGASUS!", TALKTYPE_MONSTER)
    end	
	return true
end