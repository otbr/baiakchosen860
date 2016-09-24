function getPlayerVeteranoID(name)
return db.getResult("Select `parceiro` From `players` Where `id`=" .. getPlayerGUIDByName(name) .. ";"):getDataInt("parceiro")
end          

function getPlayerParceiros(cid)
return db.getResult("SELECT `n_parceria` FROM `accounts` WHERE `id`=".. getPlayerAccountId(cid) ..";"):getDataInt("n_parceria")
end


function setPlayerParceirosLimit(cid,value)
db.executeQuery("UPDATE `accounts` SET `parcerias_limit`="..value.." WHERE `id`=".. getPlayerAccountId(cid) ..";")
return TRUE
end

function getPlayerParceirosLimit(cid)
return db.getResult("SELECT `parcerias_limit` FROM `accounts` WHERE `id`=".. getPlayerAccountId(cid) ..";"):getDataInt("parcerias_limit")
end
--============ deletar parceiros ===============-
function getDeleteLimitParceiro(name)
return db.getResult("Select `delete_limit` FROM `players` WHERE `name`='".. name .. "';"):getDataInt("delete_limit")
end

function doSetParceiroDeleteLimitByName(name,quant)
return db.executeQuery("UPDATE `players` SET `delete_limit`=".. quant .." WHERE `name` = '".. name .."';")
end

function getDeleteParceiro(name)
return db.getResult("Select `n_delete` FROM `players` WHERE `name`='".. name .. "';"):getDataInt("n_delete")
end

function doDeleteParceiro(cid,name)
 if getPlayerVeteranoID(getCreatureName(cid)) ~= 0 then
    if getDeleteParceiro(getCreatureName(cid)) <= getDeleteLimitParceiro(getCreatureName(cid)) then
       --========================================QUERYs==========================================--
       db.executeQuery("UPDATE `players` SET `n_delete`=`n_delete`+1 WHERE `id`=".. getPlayerGUID(cid) ..";")
       db.executeQuery("UPDATE `accounts` SET `parceria_status`=0 WHERE `id`=".. getPlayerAccountId(cid) ..";")
       db.executeQuery("UPDATE `accounts` SET `n_parceria`=`n_parceria`-1 WHERE `id`=".. getPlayerGUIDByName(name) .. ";")
       db.executeQuery("UPDATE `players` SET `parceiro`=0 WHERE `id`=".. getPlayerGUID(cid) ..";")
       db.executeQuery("DELETE FROM `parceiro_ativo` WHERE `name_convidado`='".. getCreatureName(cid) .."';")
       --========================================================================================--
       restantes = getDeleteLimitParceiro(getCreatureName(cid)) - getDeleteParceiro(getCreatureName(cid))
       doPlayerSendTextMessage(cid,21,name.." not going to be your partner in the next time you login. You can still delete ".. restantes .." times.")
       if isPlayerOnline(name) then
          doPlayerSendTextMessageByName(name,19,getCreatureName(cid) .." removed you as a partner him.")
       end
    else
        doPlayerSendCancel(cid,"You can not delete your partners.")
    end
 else
     doPlayerSendCancel(cid,"This character has no partner.")
 end
return TRUE
end 

function doPlayerSendTextMessageByName(name,type,msg)
if isPlayerOnline(name) then
   doPlayerSendTextMessage(getCreatureByName(name), type, msg)
   return TRUE
end
return FALSE
end

--// Funçao importante, que nao tem em nenhum distro

function isPlayerOnline(name)
players=getPlayersOnline()
for _,pid in ipairs(players) do
    if getCreatureName(pid):lower() == name:lower() then
       return true
    end
end
return false
end 