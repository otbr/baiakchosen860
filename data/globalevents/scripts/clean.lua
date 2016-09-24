function executeClean()
	doCleanMap()
	doBroadcastMessage("[CLEAN] A limpeza do mapa foi executada com sucesso.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("[CLEAN] O mapa será limpo automaticamente, por favor retire seus items do chao.")
	addEvent(executeClean, 50000)
	return true
end
