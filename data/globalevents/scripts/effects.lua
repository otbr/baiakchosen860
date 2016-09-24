function onThink(interval, lastExecution)

local texts =
{
        ["Inqui"] = {{x=150, y=53, z=7}, CONST_ME_ENERGYAREA, TEXTCOLOR_DARKYELLOW},
		["Addons"] = {{x=151, y=53, z=7}, CONST_ME_ENERGYAREA, TEXTCOLOR_LIGHTBLUE},
		["Teleports"] = {{x=152, y=53, z=7}, CONST_ME_ENERGYAREA, TEXTCOLOR_GREEN},

		["Eventos"] = {{x=153, y=53, z=7}, CONST_ME_ENERGYAREA, TEXTCOLOR_WHITE},
		["Trainers"] = {{x=154, y=53, z=7}, CONST_ME_ENERGYAREA, TEXTCOLOR_PINK},
		
		["VIP 1"] = {{x=157, y=48, z=7}, CONST_ME_ENERGYAREA, TEXTCOLOR_DARKYELLOW},
		["VIP 2"] = {{x=161, y=48, z=7}, CONST_ME_ENERGYAREA, TEXTCOLOR_GREEN},
		["ArenaPVP"] = {{x=167, y=52, z=7}, CONST_ME_ENERGYAREA, TEXTCOLOR_DARKRED},
		
		["Rotworm"] = {{x=157, y=52, z=7}, CONST_ME_CARNIPHILA, TEXTCOLOR_BROWN}

}

        for text, param in pairs(texts) do
                doSendAnimatedText(param[1], text, param[3])
                doSendMagicEffect(param[1], param[2])
        end
        return TRUE
end