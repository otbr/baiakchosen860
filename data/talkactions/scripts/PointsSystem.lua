-- #######################################
-- ####### Developed by Ygnus Baiak #######
-- ####### Level Points System     #######
-- ####### Version: 1.0            #######
-- #######################################

function onSay(cid, words, param)
	if not (L_LvlPoints.vocPoints[getPlayerVocation(cid)]) then
		return false
	end

	local param = param:lower()
	local p2 = string.explode(param, ",")

	if (getPlayerStorageValue(cid, 14574) < 0) then
		setPlayerStorageValue(cid, 14574, 0)
	end

	local skillids = {
		["shielding"] = 5,
		["sword"] = 2,
		["axe"] = 3,
		["club"] = 1,
		["distance"] = 4
	}

	if (param == "check") then
		doPlayerPopupFYI(cid, "~*~*~ Level Points System by MaXwEllDeN ~*~*~\n\nPontos disponíveis: ".. getPlayerStorageValue(cid, 14574) .."\nPontos por level: ".. L_LvlPoints.vocPoints[getPlayerVocation(cid)])
	elseif (p2[1] and p2[1] == "add") and (L_LvlPoints.attributes[p2[2]]) and (tonumber(p2[3])) then
		if (getPlayerStorageValue(cid, 14574) < tonumber(p2[3]) * L_LvlPoints.attributes[p2[2]].np) then
			doPlayerSendCancel(cid, "Você não tem pontos suficientes para distribuir!")
			return doSendMagicEffect(getThingPos(cid), 2)
		end

		if (p2[2] == "vitalidade") then
			setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) + L_LvlPoints.attributes[p2[2]].vl * tonumber(p2[3]))
			doCreatureAddHealth(cid, L_LvlPoints.attributes[p2[2]].vl * tonumber(p2[3]))
		elseif (p2[2] == "energy") then
			setCreatureMaxMana(cid, getCreatureMaxMana(cid) + L_LvlPoints.attributes[p2[2]].vl * tonumber(p2[3]))
			doCreatureAddMana(cid, L_LvlPoints.attributes[p2[2]].vl * tonumber(p2[3]))
		elseif(skillids[p2[2]]) then
			for a = 1, tonumber(p2[3]) do
				doPlayerAddSkillTry(cid, skillids[p2[2]], getPlayerRequiredSkillTries(cid, skillids[p2[2]], getPlayerSkillLevel(cid, skillids[p2[2]]) + 1) - getPlayerSkillTries(cid, skillids[p2[2]]), false)
			end
		end


		doSendMagicEffect(getThingPos(cid), 29)
		doSendMagicEffect(getThingPos(cid), 30)
		doSendAnimatedText(getThingPos(cid), "-" .. tonumber(p2[3]) * L_LvlPoints.attributes[p2[2]].np, 180)
		setPlayerStorageValue(cid, 14574, getPlayerStorageValue(cid, 14574) - tonumber(p2[3]) * L_LvlPoints.attributes[p2[2]].np)
	else
		local msgx = ""
		for i, v in pairs(L_LvlPoints.attributes) do
			local add = (v.np > 1) and "s" or ""
			msgx = msgx .. string.upper(i:sub(1,1)) .. i:sub(2, #i) .. " - ".. v.np .. " ponto".. add .. " ~ " .. v.vl .. " ".. v.nm .. "\n"
		end

		doPlayerPopupFYI(cid, "~*~*~ Level Points System by MaXwEllDeN ~*~*~\n\nPontos necessários para aumentar os stats:\n\n".. msgx .. "\nExemplo de uso: ".. words .." add, vitalidade, 5\n\nPontos disponíveis: ".. getPlayerStorageValue(cid, 14574))
	end

	return true
end
