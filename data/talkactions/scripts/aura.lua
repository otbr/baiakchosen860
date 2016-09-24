-- CONFIGURAÇÕES
	aurastr = 25950 -- storage da aura
	estr = 25951 -- storage para o exhaust
	porcentagem = 40 -- chance de curar em cada volta da aura, em porcentagem
	quantheal = 20 -- porcentagem do hp máximo que cada cura irá curar. (No caso, irá curar 10% do hp máximo cada cura)
	tempo = 1180 -- tempo para dar uma volta no player (este tempo foi o que achei mais agradável visualmente, é recomendável não mudar)
	tipoaura = 30 -- número do efeito da aura (efeito de distância, pode ser identificado com /x no jogo)
	efeitocura = 49 -- número do efeito quando a cura chega ao player (efeito de posição fixa, pode ser identificado com /z no jogo)

-- Função que chama a aura
function efeitosAura(i,tm,cid)
	if(isCreature(cid)) then
        	local atual = getCreaturePosition(cid)
		local posaura = {
			{x=(atual.x)-1, y=(atual.y)-1, z=atual.z},
			{x=atual.x, y=(atual.y)-1, z=atual.z},
			{x=(atual.x)+1, y=(atual.y)-1, z=atual.z},
			{x=(atual.x)+1, y=atual.y, z=atual.z},
			{x=(atual.x)+1, y=(atual.y)+1, z=atual.z},
			{x=atual.x, y=(atual.y)+1, z=atual.z},
			{x=(atual.x)-1, y=(atual.y)+1, z=atual.z},
			{x=(atual.x)-1, y=atual.y, z=atual.z},
		}
		local chances = math.random(100)
		if(chances<=porcentagem/8 and getCreatureHealth(cid)<getCreatureMaxHealth(cid)) then
			doCreatureAddHealth(cid, getCreatureMaxHealth(cid)/quantheal)
			if(i<=8 and i>1) then
				doSendDistanceShoot({x=posaura[i].x, y=posaura[i].y, z=posaura[i].z}, atual, tipoaura)
			else
				doSendDistanceShoot({x=posaura[1].x, y=posaura[1].y, z=posaura[1].z}, atual, tipoaura)
			end
			doSendMagicEffect(atual, efeitocura)
		end
		if(i==8) then
			doSendDistanceShoot({x=posaura[i].x, y=posaura[i].y, z=posaura[i].z}, {x=posaura[1].x, y=posaura[1].y, z=posaura[1].z}, tipoaura)
		elseif(i<8) then
			doSendDistanceShoot({x=posaura[i].x, y=posaura[i].y, z=posaura[i].z}, {x=posaura[i+1].x, y=posaura[i+1].y, z=posaura[i+1].z}, tipoaura)
		end
		if(i<=8 and getPlayerStorageValue(cid, aurastr)==2) then
			i = i+1
			tm = tempo/8
			return addEvent(efeitosAura,tm,i,tm,cid)
		elseif(i>8 and getPlayerStorageValue(cid, aurastr)==2) then
			return efeitosAura(1,0,cid)
		else
			return TRUE
		end
	else
		return TRUE
	end
end

-- Função principal
function onSay(cid, words, param, channel)
	if(param=="on") then
		if getPlayerStorageValue(cid, estr) > os.time() then
			doPlayerSendCancel(cid, "Espere "..(getPlayerStorageValue(cid, estr) - os.time()).." segundos para poder habilitar aura novamente.")
		else
			if(getPlayerStorageValue(cid, aurastr)==2) then
				doPlayerSendCancel(cid,"Sua aura já está habilitada.")
			elseif(getPlayerStorageValue(cid, aurastr)==-1) then
				doPlayerSendCancel(cid,"Aura ligada!")
				setPlayerStorageValue(cid, aurastr, 2)
				efeitosAura(1,tempo/8,cid)
			end
		end
	elseif(param=="off") then
		if(getPlayerStorageValue(cid, aurastr)==2) then
			setPlayerStorageValue(cid, estr, os.time()+2)
			setPlayerStorageValue(cid, aurastr, -1)
			doPlayerSendCancel(cid,"Aura desligada!")
		end
	else	
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Digite '!aura on' para ligar sua aura, e '!aura off' para desligá-la.")
	end
	return TRUE
end 