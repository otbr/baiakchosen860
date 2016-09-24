-- #######################################
-- ####### Developed by Ygnus Baiak #######
-- ####### Level Points System     #######
-- ####### Version: 1.0            #######
-- #######################################

local VocPoints = L_LvlPoints.vocPoints

function onAdvance(cid, skill, oldlevel, newlevel)
	if not (VocPoints[getPlayerVocation(cid)]) then
		return true
	end

	if skill == 8 and getPlayerStorageValue(cid, 14573) < newlevel then
		if (getPlayerStorageValue(cid, 14574) < 0) then
			setPlayerStorageValue(cid, 14574, 0)
			setPlayerStorageValue(cid, 14573, 0)
		end

		setPlayerStorageValue(cid, 14573, newlevel)
		setPlayerStorageValue(cid, 14574, getPlayerStorageValue(cid, 14574) + (newlevel - oldlevel) * (VocPoints[getPlayerVocation(cid)]))
		doSendAnimatedText(getThingPos(cid), "+" .. (newlevel - oldlevel) * (VocPoints[getPlayerVocation(cid)]), 18)
	end

	return true
end
