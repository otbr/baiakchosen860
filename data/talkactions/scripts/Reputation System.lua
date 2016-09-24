--[[
 
Name: Reputation Sytem
Author: Kimoszin
Version: v0.1
Site: www.phenomy.com.br
 
]]--
 
local config = {
        groupInstall = 5, -- Grupo necessario para instalar o sistema
        groupSetRep = 0, -- Grupo necessario para dar REP's
        groupMyRep = 0, -- Grupo necessario para saber seus REP's
        groupRemRep = 5, -- Grupo necessario para remover os REP's
        maxPlayersList = 10, -- N�mero maximo que vai mostrar os players no rank
        }
 
function onSay(cid, words, param, channel)
        local str = string.explode(param, ",")
        local player = str[1]
        local Rep = str[2]
       
        if words == "!helpRep" then
                doShowTextDialog(cid, 1304, "!myRep -- Serve para voc� saber quanto de reputa��o tem.\n\n !setRep -- Serve para voc� doar reputa��o.\n\n !remRep -- Serve para voc� adicionar reputa��o em uma outra pessoa")
    elseif words == "/installRep" then
                if getPlayerGroupId(cid) >= config.groupInstall then
                        if db.executeQuery("ALTER TABLE `players` ADD rep INT(15) NOT NULL DEFAULT 0;") then
                                doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Parab�ns, foi instalado o Reputation System em seu sevidor!.")
                                return true
                        end
                                doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "N�o foi possivel instalar ou j� est� instalado o Reputation System em seu sevidor!.")
                                return true
                else
                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Desculpe, mais voc� n�o pode usar esse comando")
                        return true
                end
        elseif words == "!myRep" then
                if getPlayerGroupId(cid) > config.groupMyRep then      
                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Voc� possui "..getMyReputation(cid).." pontos de reputa��o.")
                else
                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Desculpe, mais voc� n�o pode usar esse comando")
                        return true
                end
        elseif words == "!setRep" then
                if getPlayerGroupId(cid) > config.groupSetRep then     
                        if(param == '') then
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
                        return true
                       
                        end
                                local pid = getPlayerByNameWildcard(player)
                               
                                if (player ~= getCreatureName(cid) and Rep ~= nil) then
                                        if (pid ~= nil) then
                                                if (getMyReputation(cid) >= tonumber(Rep)) then
                                                                setReputation(getPlayerAccountId(pid), Rep)
                                                                removeReputation(getPlayerAccountId(cid), Rep)
                                                                doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Voc� acabou de dar "..Rep.." de reputa��o para o player "..player..".")
                                                                doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, "Voc� acaba de receber "..Rep.." pontos de reputa��o do player "..getCreatureName(cid)..".")
                                                                doSendAnimatedText(getCreaturePosition(pid), "+ "..Rep.." REP", 30)
                                                else
                                                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Voc� n�o possui reputa��o suficiente")
                                                end
                                                else
                                                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "O player deve estar online!")
                                        end
                                else
                                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Ocorreu um erro.")
                                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Desculpe, mais voc� n�o pode usar esse comando")
                        return true
                end
        elseif words == "!remRep" then
                if getPlayerGroupId(cid) > config.groupRemRep then     
                        if(param == '') then
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command param required.")
                        return true
                       
                        end
                                local pid = getPlayerByNameWildcard(player)
 
                                if (player ~= getCreatureName(cid) and Rep ~= nil) then
                                        if (pid ~= nil) then
                                                if (getMyReputation(cid) >= tonumber(Rep)) then
                                                                removeReputation(getPlayerAccountId(pid), Rep)
                                                                removeReputation(getPlayerAccountId(cid), Rep)
                                                                doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Voc� acabou de tirar "..Rep.." de reputa��o do player "..player..".")
                                                                doPlayerSendTextMessage(pid, 21, "Voc� acaba de perder "..Rep.." pontos de reputa��o, retirados por "..getCreatureName(cid)..".")
                                                                doSendAnimatedText(getCreaturePosition(pid), "- "..Rep.." REP", 180)
                                                else
                                                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Voc� n�o possui reputa��o suficiente")
                                                end
                                                else
                                                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "O player deve estar online!")
                                        end
                                else
                                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Ocorreu um erro.")
                                end
                else
                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Desculpe, mais voc� n�o pode usar esse comando")
                        return true
                end
    elseif words == "!rankRep" then
            local text = "*~ RANK REPUTATION SYSTEM *~\n"
                local q = db.getResult("SELECT `rep`, `name` FROM `players` ORDER BY `rep` DESC;")
        if (q:getID() ~= -1) then k = 1 repeat if k > config.maxPlayersList then break end
                text = text .. "\n " .. k .. ". "..q:getDataString("name").." [" .. q:getDataInt("rep") .. "]"
                k = k + 1 until not q:next() end
                doShowTextDialog(cid, 2493, text)
        end
end