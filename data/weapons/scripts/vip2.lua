local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 51)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CAKE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -570, 0, -570)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end