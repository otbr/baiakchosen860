-- == Blood Castle Event por Killua == --

function onDeath(cid, corpse, mostDamageKiller)
     local artigo = getPlayerSex(mostDamageKiller[1]) == 0 and "A jogadora" or "O jogador"
     if isMonster(cid) and string.lower(getCreatureName(cid)) == string.lower("Guarda do Portao") then
          removeWalls()
          addEvent(createAngel, 2*60*1000)
          doBroadcastMessage("[Blood Castle] " .. artigo .. " " .. getPlayerName(mostDamageKiller[1]) .. " derrotou o Guarda do Portao! Prossigam para proxima sala e aguardem ate o arcanjo nascer!")
     end
return true
end