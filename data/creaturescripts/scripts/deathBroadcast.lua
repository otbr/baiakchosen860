local config = {
	affected = 30, -- how many players (deathAssits) from table deathList should this script be executed for?

	killStorageValue = 3943,
	deathStorageValue = 3944,

	-- commands for the texts (those inside of ||, example: |KILLS| to show skills): KILLS, KILLERNAME, TARGETNAME
	rewardItem = {
		use = true,
		itemid = 5925,
		minLevel = false, -- false if you don't want any level req
		minLevelDiff = false, -- false if you don't want any level diff req (negative numbers allowed).
	},

	killMessage = {
		use = true,
		text = "Owned |TARGETNAME|! Você tem agora |KILLERKILLS| Kills!",
		messageClass = MESSAGE_STATUS_CONSOLE_BLUE
	},

	broadcastMessage = {
		use = true,
		minLevel = false, -- false if you don't want any level req
		minLevelDiff = false, -- false if you don't want any level diff req (negative numbers allowed).
		text = "|KILLERNAME| [|KILLERLEVEL|] just killed |TARGETNAME| [|TARGETLEVEL|]!",
		messageClass = MESSAGE_STATUS_WARNING
	},

	killerAnimation = {
		use = true,
		text = "SOU FODA", -- Only 30 letters! No "commands" here.
		color = 144
	},

	targetAnimation = {
		use = true,
		text = "LIXAO", -- Only 30 letters! No "commands" here.
		color = 180
	}
}

function onDeath(cid, corpse, deathList)
	for i = 1, math.min(config.affected, getConfigInfo('deathAssistCount')) do
		local killer = deathList[i]
		if(isPlayer(killer) == TRUE) then
			local targetKills = math.max(0, getPlayerStorageValue(cid, config.killStorageValue)) + 1
			local targetDeaths = math.max(0, getPlayerStorageValue(cid, config.deathStorageValue)) + 1
		
			local killerKills = math.max(0, getPlayerStorageValue(killer, config.killStorageValue)) + 1
			local killerDeaths = math.max(0, getPlayerStorageValue(killer, config.deathStorageValue)) + 1
		
			setPlayerStorageValue(killer, config.killStorageValue, targetKills)
			setPlayerStorageValue(cid, config.deathStorageValue, targetDeaths)

			local killerLevel = getPlayerLevel(killer)
			local targetLevel = getPlayerLevel(cid)
			local levelDiff = targetLevel - killerLevel

			local values = {
				["KILLERKILLS"]         = killerKills,
				["KILLERDEATHS"]        = killerDeaths,
				["KILLERNAME"]          = getCreatureName(killer),
				["KILLERLEVEL"]         = killerLevel,
			
				["TARGETKILLS"]         = targetKills,
				["TARGETDEATHS"]        = targetDeaths,
				["TARGETNAME"]          = getCreatureName(cid),
				["TARGETLEVEL"]         = targetLevel
			}

			function formateString(str)
				return(str:gsub("|([A-Z]+)|", (function(a) return values[a] end)))
			end
		
			if(config.rewardItem.use and (not config.rewardItem.minLevel or targetLevel >= config.rewardItem.minLevel) and (not config.rewardItem.minLevelDiff or levelDiff >= config.rewardItem.minLevelDiff)) then
				local uid = doPlayerAddItem(killer, config.rewardItem.itemid, 1)
			end
			if(config.killMessage.use) then
				doPlayerSendTextMessage(killer, config.killMessage.messageClass, formateString(config.killMessage.text))
			end
			if(config.broadcastMessage.use and (not config.broadcastMessage.minLevel or getPlayerLevel(cid) >= config.broadcastMessage.minLevel) and (not config.broadcastMessage.minLevelDiff or levelDiff >= config.broadcastMessage.minLevelDiff)) then
				broadcastMessage(formateString(config.broadcastMessage.text), config.broadcastMessage.messageClass)
			end
			if(config.killerAnimation.use) then
				doSendAnimatedText(getCreaturePosition(killer), config.killerAnimation.text, config.killerAnimation.color)
			end
			if(config.targetAnimation.use) then
				doSendAnimatedText(getCreaturePosition(cid), config.targetAnimation.text, config.targetAnimation.color)
			end
		end
	end

	return true
end
