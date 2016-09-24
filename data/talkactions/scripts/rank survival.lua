function onSay(cid, words, param)

local rankStorage = 456321 -- Rank Storage.
local limite = 5 -- Numero de players que podem aparecer no Rank.

rank = "          ~Survival of the Fittest~\n     ('Nome do Jogador' - Matança)\n\n"
 
 local query = db.getResult("SELECT `player_id`, `value` FROM `player_storage` WHERE `key` = "..rankStorage.." and `value` > 0 ORDER BY `value` DESC")

if query:getID() == -1 then
    rank = "Survival of the Fittest, ainda não tem um rank.\n"
 else
  a = 1
    while a ~= limite do
     rank = rank..""..a.."º - '"..getPlayerNameByGUID(query:getDataInt("player_id")).."' ["..query:getDataInt("value").."]\n"
      a = a + 1
         if not query:next() or a >= limite then
           break
         end
    end
end

 doShowTextDialog(cid, 2472, rank)
 
 return true
end