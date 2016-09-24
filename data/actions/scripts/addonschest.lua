local addons = {
        [8913] = {[0] = 136, [1] = 128, name = "Citizen"},
        [8914] = {[0] = 137, [1] = 129, name = "Hunter"},
        [8915] = {[0] = 138, [1] = 130, name = "Mage"},
        [8916] = {[0] = 139, [1] = 131, name = "Knight"},
        [8917] = {[0] = 140, [1] = 132, name = "Nobleman/Noblewoman"},
        [8918] = {[0] = 141, [1] = 133, name = "Summoner"},
        [8919] = {[0] = 142, [1] = 134, name = "Warrior"},
        [8920] = {[0] = 147, [1] = 143, name = "Barbarian"},
        [8921] = {[0] = 148, [1] = 144, name = "Druid"},
        [8922] = {[0] = 149, [1] = 145, name = "Wizard"},
        [8923] = {[0] = 150, [1] = 146, name = "Oriental"},
        [8924] = {[0] = 155, [1] = 151, name = "Pirate"},
        [8925] = {[0] = 156, [1] = 152, name = "Assassin"},
        [8926] = {[0] = 157, [1] = 153, name = "Beggar"},
        [8927] = {[0] = 158, [1] = 154, name = "Shaman"},
        [8928] = {[0] = 252, [1] = 251, name = "Norseman/Norsewoman"},
        [8929] = {[0] = 269, [1] = 268, name = "Nightmare"},
        [8930] = {[0] = 270, [1] = 273, name = "Jester"},
        [8931] = {[0] = 279, [1] = 278, name = "Brotherhood"},
        [8932] = {[0] = 288, [1] = 289, name = "Demonhunter"},
        [8933] = {[0] = 324, [1] = 325, name = "Yalaharian"},
		[8934] = {[0] = 366, [1] = 367, name = "Wayfarer"}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if addons[item.uid] then
                local storage = item.uid + 10000
                if getPlayerStorageValue(cid, storage) == -1 then
                        doPlayerSendTextMessage(cid, 25, "Você achou o conjunto de addons ".. addons[item.uid].name ..".")
                        doPlayerAddOutfit(cid, addons[item.uid][getPlayerSex(cid)], 3)
                        setPlayerStorageValue(cid, storage, 1)
                else
                        doPlayerSendTextMessage(cid, 25, "Você já possui este addon.")
                end
                return true
        end
end