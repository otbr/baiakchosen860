local npcHandler = NpcHandler:new(keywordHandler)
local think = os.clock()
function onThink()
        npcHandler:onThink()
        local direction = getCreatureLookDirection(getNpcId())
        if os.clock() > think then
                doCreatureSetLookDirection(getNpcId(), (direction == 3 and 0 or (direction + 1)))
                think = think + 2
        end
end

