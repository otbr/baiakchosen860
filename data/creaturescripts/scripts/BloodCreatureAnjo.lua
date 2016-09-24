-- == Blood Castle Event por Killua == --

function onDeath(cid, corpse, mostDamageKiller)
     local artigo = getPlayerSex(mostDamageKiller[1]) == 0 and "A jogadora" or "O jogador"
     if isMonster(cid) and string.lower(getCreatureName(cid)) == string.lower("Arcanjo") then
          doBroadcastMessage("[Blood Castle] " .. artigo .. " " .. getPlayerName(mostDamageKiller[1]) .. " destruiu a estatua do Arcanjo e foi o vencedor da rodada!")
          for _, premio in pairs(bloodconfig.premios) do
               doPlayerAddItem(mostDamageKiller[1], premio[1], premio[2])
           end
          doPlayerSendTextMessage(mostDamageKiller[1], 25, "Parabens voce venceu o evento Blood Castle!")
          doSendMagicEffect(getCreaturePosition(mostDamageKiller[1]), 66)
          doCreateTeleport(1387, bloodconfig.templo, bloodconfig.estatua)
          addEvent(removeTpa, bloodconfig.tempoSaida*1000)
          setGlobalStorageValue(bloodconfig.playersStorage, 0)
          putWalls()
          putStones()
     end
return true
end