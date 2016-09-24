local bloqueado = 0

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

        if os.time() - bloqueado < 0 then
                doTeleportThing(cid, fromPosition, false)
                doPlayerSendCancel(cid, "Já existe um player fazendo essa quest.")
        return true
        end

        local teleportEntrada = {x = 64, y = 902, z = 15}
        local tempo = 3 * 60 -- em segundos, isso equivale a 3 minutos
        
        doTeleportThing(cid, teleportEntrada, false)
        doSendMagicEffect(teleportEntrada, CONST_ME_TELEPORT)
        bloqueado = os.time() + tempo
        
return true
end