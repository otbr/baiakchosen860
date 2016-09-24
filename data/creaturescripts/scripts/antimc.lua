-- Anti Mage Bomb System por Killua

local config = {
    max = 10, -- Quantos acc manager o mesmo ip pode logar de uma vez
    acc_name = "Account Manager", -- Nome do account manager
    ip_banishment = "true", -- Se logar mais acc manager do que o permitido, leva ban? "true" ou "false"
    banishment_length = 1 -- Quantos dias o ip fica banido?
}

local accepted_ip_list = {""} -- lista dos ips permitidos a logar varios acc manager, exemplo: {"200.85.3.60", "201.36.5.222"}
 
function onLogin(cid)
    if getPlayerName(cid) == config.acc_name then
        if isInArray(accepted_ip_list, doConvertIntegerToIp(getPlayerIp(cid))) then
            return true
        end
        if #getPlayersByIp(getPlayerIp(cid)) >= config.max then
            if config.ip_banishment == "true" then
                doAddIpBanishment(doConvertIntegerToIp(getPlayerIp(cid)), banishment_length * 24 * 60 * 60)
            end
            return false
        end
    end
    return true
end