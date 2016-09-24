-- #######################################
-- ####### Developed by Ygnus Baiak #######
-- ####### Level Points System     #######
-- ####### Version: 1.0            #######
-- #######################################

L_LvlPoints = {
	vocPoints = {
		-- [Skill] = Pontos que ganha,
		[1] = 3,
		[2] = 3,
		[3] = 3,
		[4] = 5,
		[5] = 5,
		[6] = 5,
		[7] = 5,
		[8] = 8,
	},

	attributes = {
		["vitalidade"] = {np = 2, vl = 5, nm = "Hit Points"}, -- Precisa usar 2 points para adicionar 10 de hp
		["energy"] = {np = 4, vl = 2, nm = "Mana Points"},
		["magic"] = {np = 30, vl = 1, nm = "Magic Level"},
		["shielding"] = {np = 40, vl = 1, nm = "Shielding Skill"},
		["sword"] = {np = 20, vl = 1, nm = "Sword Skill"},
		["axe"] = {np = 20, vl = 1, nm = "Axe Skill"},
		["club"] = {np = 20, vl = 1, nm = "Club Skill"},
		["distance"] = {np = 20, vl = 1, nm = "Distance Skill"},
	}

}
