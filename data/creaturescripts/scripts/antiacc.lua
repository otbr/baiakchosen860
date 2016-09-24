local config = {
max = 10, -- número de Account Manager permitido para logar de uma só vez
group_id = "Account Manager" -- kikar apenas player com o group id 1
}

local accepted_ip_list = {} -- lista dos players permitidos a usar MC, exemplo: {"200.85.3.60", "201.36.5.222"}

local function antiMC(p)
if (#getPlayersByIp(getPlayerIp(p.pid)) >= p.max) then
doRemoveCreature(p.pid)
end
return true
end

function onLogin(cid)
if getPlayerName(cid) == config.group_id then
if isInArray(accepted_ip_list,doConvertIntegerToIp(getPlayerIp(cid))) == false then
addEvent(antiMC, 1000, {pid = cid, max = config.max+1})
end
end
return true
end