-- counts physicals, casts .... [player name : creature cid]
playerAttacksMade = {}
playerActivateTime = {}
playerBlocked = {}

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function onLogin(cid)
	if isPlayer(cid) then 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Loading Anti Bot...         done.' )
		playerAttacksMade[cid] = {}
		playerActivateTime[cid] = {}
		playerBlocked[cid] = false
	end
	return true
end

function onLogout(cid)
	if isPlayer(cid) then
		playerAttacksMade[cid] = nil
		playerActivateTime[cid] = nil
		playerBlocked[cid] = nil
	end
	return true
end

function onStatsChange(cid, attacker, type, combat, value)

	local maxAttacks = {
	6, --pos 1
	6, --pos 2
	6, --pos 3
	6, --pos 4
	7, --pos 5
	7, --pos 6
	7, --pos 7
	7, --pos 8
	}
	
	if not type == STATSCHANGE_HEALTHLOSS or not isPlayer(attacker) then return true end
	if value <= 0 then return true end
		
	if playerAttacksMade[attacker][cid] == nil then
		playerAttacksMade[attacker][cid] = 0
		playerActivateTime[attacker][cid] = os.time()
	end

	local currentTime = os.time()
	--TESTE
	--doPlayerSendTextMessage(attacker, MESSAGE_STATUS_CONSOLE_ORANGE,  playerAttacksMade[attacker][cid] .. '________' .. attacker .. '_____' .. cid .. '______' .. currentTime .. '_______' .. playerActivateTime[attacker][cid] )
	
	if currentTime >= playerActivateTime[attacker][cid] then
		playerActivateTime[attacker][cid] = currentTime + 1
		playerAttacksMade[attacker][cid] = 0
	else
		playerAttacksMade[attacker][cid] = playerAttacksMade[attacker][cid] + 1	
	end		
	
	if playerAttacksMade[attacker][cid] > maxAttacks[getPlayerVocation(attacker)] then
		playerBlocked[attacker] = true
		doBroadcastMessage('O player ' .. getPlayerName(attacker) .. ' esta usando bot de fast attack. O seu ataque foi travado ate que ele relogue.', 21)
		doShowTextDialog(attacker,1952,"PARE DE USAR ELFBOT! Seu ataque foi bloqueado. Para destravar basta relogar. Obrigado. (Sistema exclusivo do ot)")
		return FALSE
	end
	
	return TRUE
end

function onCombat(cid, target)
	if isPlayer(cid) then
		if not playerBlocked[cid] then
			registerCreatureEvent(target, "AntiBot2")
		else
			return false
		end
	end
	return true
end

function onCast(cid, target)
	if isPlayer(cid) then
		if playerBlocked[cid] then
			return false
		end
	end
	return true
end