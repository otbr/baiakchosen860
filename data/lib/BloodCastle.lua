-- == Blood Castle Event por Killua == --

bloodconfig = {

     templo = {x = 160, y = 54, z = 7}, -- templo

     posGuarda = {x = 1115, y = 1452, z = 7}, -- Onde o guarda do portão vai nascer

     premios = {{6527, 10}, {2160, 100}}, -- Premios que o vencedor vai ganhar {id, quantidade}

     positionTP = {x = 154, y = 53, z = 7}, -- Onde o tp será criado

     positionEvento = {x = 1115, y = 1492, z = 7}, -- Para onde o tp vai levar

     tempoTP = 2, -- Depois de quanto tempo que avisou vai ser criado o tp? Em minutos

     tempoAberto = 5, -- Tempo que o tp fica aberto. Em minutos

     minPlayers = 5, -- Número mínimo de players que devem entrar para que o evento aconteça

     tempoMaximo = 50, -- Tempo máximo, em minutos, que alguem pode permanecer no evento

     playersStorage = 54910, -- Não mude

     posPedras = {{x = 1113, y = 1487, z = 7, stackpos=1}, {x = 1114, y = 1487, z = 7, stackpos=1}, {x = 1115, y = 1487, z = 7, stackpos=1}, {x = 1116, y = 1487, z = 7,stackpos=1}, {x = 1117, y = 1487, z = 7,        stackpos=1}}, -- Posições das pedras que bloqueiam a entrada do evento

     idDasParedes = 3368, -- ID das paredes que vao ser removidas quando o Guarda morrer (todas devem ter o mesmo id)

     estatua = {x = 1115, y = 1441, z = 7}, -- Posicao onde o arcanjo vai ser criado

     tempoSaida = 70, -- Quando tempo o tp q é criado quando a estátua morre vai ficar? Em segundos

     posParedes = {{x = 1114, y = 1451, z = 7, stackpos=1}, {x = 1115, y = 1451, z = 7, stackpos=1}, {x = 1116, y = 1451, z = 7, stackpos=1}}, -- Posições das paredes que ficam atrás do guarda

     fromPos = {x = 1103, y = 1432, z = 7}, -- Canto superior esquerdo da área do seu evento ---- Deve ser uma área quadrada ou retangular, de forma que todo o evento fique dentro dela.
     toPos = {x = 1124, y = 1496, z = 7}, -- Canto inferior direito da área do seu evento
}

-- [[ NAO ALTERE MAIS NADA DAQUI PARA BAIXO! ]] --

function removeTpb()
     local t = getTileItemById(bloodconfig.positionTP, 1387)
     if t then
          doRemoveItem(t.uid, 1)
          doSendMagicEffect(bloodconfig.positionTP, CONST_ME_POFF)
     end
end

function removeStones()
     for i = 1, #bloodconfig.posPedras do
          local pedra = getTileItemById(bloodconfig.posPedras[i], 1304)
          if pedra then
               doRemoveItem(pedra.uid, 1)
          end
     end
end

function putStones()
     for i = 1, #bloodconfig.posPedras do
          local pedra = getTileItemById(bloodconfig.posPedras[i], 1304)
          if not pedra then
               doCreateItem(1304, 1, pedra)
          end
     end
end


function createTeleportb()
     local tip = doCreateTeleport(1387, bloodconfig.positionEvento, bloodconfig.positionTP)
     doItemSetAttribute(tip, "aid", 4726)
end

function removeTpa()
     local t = getTileItemById(bloodconfig.estatua, 1387)
     if t then
          doRemoveItem(t.uid, 1)
          doSendMagicEffect(bloodconfig.estatua, CONST_ME_POFF)
     end
end


function getPlayersInBlood()
     local playersInBlood = getGlobalStorageValue(bloodconfig.playersStorage)
     return playersInBlood < 0 and 0 or playersInBlood
end

function removePlayers()
     for _, pid in pairs(getPlayersOnline()) do
          if isInArea(getThingPos(pid), bloodconfig.fromPos, bloodconfig.toPos) then
               doTeleportThing(pid, bloodconfig.templo, false)
               doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi removido do Blood Castle. Possiveis causas: o evento nao atingiu o numero minimo de players; Voce                      permaneceu no evento por mais de " .. bloodconfig.tempoMaximo .. " minutos.")
          end
     end
end

function checkBlood()
     if getPlayersInBlood() >= bloodconfig.minPlayers then
          removeStones()
          doBroadcastMessage("[Blood Castle] O Evento comecou e o teleporte para ele foi fechado. Boa sorte a todos!")
          if not isMonster(getTopCreature(bloodconfig.posGuarda).uid) then
               doCreateMonster("Guarda do Portao", bloodconfig.posGuarda)
          end
          addEvent(removePlayers, bloodconfig.tempoMaximo*60*1000)
     else
          removePlayers()
          setGlobalStorageValue(bloodconfig.playersStorage, 0)
          doBroadcastMessage("[Blood Castle] O evento nao atingiu o numero minimo de participantes e foi cancelado.")
          if isMonster(getTopCreature(bloodconfig.posGuarda).uid) then
               doRemoveCreature(getTopCreature(bloodconfig.posGuarda).uid)
          end
          if isMonster(getTopCreature(bloodconfig.estatua).uid) then
               doRemoveCreature(getTopCreature(bloodconfig.estatua).uid)
          end
     end
end

function putWalls()
     for i = 1, #bloodconfig.posParedes do
          doCreateItem(bloodconfig.idDasParedes, 1, bloodconfig.posParedes[i])
     end
end

function removeWalls()
     for i = 1, #bloodconfig.posParedes do
          local wall = getTileItemById(bloodconfig.posParedes[i], bloodconfig.idDasParedes)
          if wall then
               doRemoveItem(wall.uid, 1)
          end
     end
end

function createAngel()
     if not isMonster(getTopCreature(bloodconfig.estatua).uid) then
          doCreateMonster("Arcanjo", bloodconfig.estatua)
          doBroadcastMessage("[Blood Castle] A estatua do arcanjo apareceu!")
     end
end

function Guarantee()
     if isMonster(getTopCreature(bloodconfig.posGuarda).uid) then
          putWalls()
          doRemoveCreature(getTopCreature(bloodconfig.posGuarda).uid)
     elseif isMonster(getTopCreature(bloodconfig.estatua).uid) then
          putStones()
          putWalls()
          doRemoveCreature(getTopCreature(bloodconfig.estatua).uid)
      end
end