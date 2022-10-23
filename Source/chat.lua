DEFAULT_CHAT_FRAME:AddMessage("Loaded chat.lua")

AchievementNotes.Chat = {}

function AchievementNotes.Chat:Print(str)
    DEFAULT_CHAT_FRAME:AddMessage("[AchievementNotes] "..str)
end

function AchievementNotes.Chat:Dump(o)
    if type(o) == 'table' then
       for k,v in pairs(o) do
            AchievementNotes.Chat:Print('['..tostring(k)..'] = ' .. tostring(v))
        end
    else
        AchievementNotes.Chat:Print(tostring(o))
    end
 end
