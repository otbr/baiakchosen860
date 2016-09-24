local chance_percent = 30 -- Chance percenting
local extra_damage_percent = 250 -- Extra Damage Percent
 
 
function onLogin(cid)
   registerCreatureEvent(cid, "HeadshotCritical")
   return true
end
 
function onStatsChange(cid, attacker, type, combat, value)
   if type ~= STATSCHANGE_HEALTHLOSS then
      return true
   end

   if isPlayer(attacker) and getPlayerStorageValue(cid, 71257) < 1 then
      if math.random(100) <= chance_percent then
         local dmg = value * (extra_damage_percent / 100)
         setPlayerStorageValue(cid, 71257, 1)
         doTargetCombatHealth(attacker, cid, type, -dmg, -dmg, 255)
         setPlayerStorageValue(cid, 71257, -1)
         doCreatureSay(cid, "HEADSHOT", 19)
         return false
      end
   end
   
   return true
end