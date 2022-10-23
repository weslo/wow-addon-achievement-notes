AchievementNotes.Chat:Print("Loaded main.lua")

function AchievementNotes.OnEvent(self, event, arg1, ...)
    if (event == "ADDON_LOADED" and arg1 == "Blizzard_AchievementUI") then
        AchievementNotes.Chat:Print(arg1.." loaded")
        for i,button in ipairs(AchievementFrameAchievementsContainer.buttons) do
            button:HookScript("OnUpdate", AchievementNotes.OnAchievementButtonUpdate)
            button:HookScript("OnClick", AchievementNotes.OnAchievementButtonClicked)
            button.eb = CreateFrame("EditBox", "eb", button)
            button.eb:SetMultiLine(true)
            button.eb:SetAutoFocus(false)
            button.eb:SetPoint("BOTTOM")
            button.eb:SetSize(400, 200)
            button.eb:SetFontObject("ChatFontNormal")
            button.eb:Show()
        end
    end
end

function AchievementNotes.OnAchievementButtonUpdate(self)
    local _, achievementName, points, completed = GetAchievementInfo(self.id)
end

function AchievementNotes.OnAchievementButtonClicked(self)
    local _, achievementName = GetAchievementInfo(self.id)
end

AchievementNotes.MainFrame = CreateFrame("Frame")
AchievementNotes.MainFrame:Hide()
AchievementNotes.MainFrame:RegisterEvent("ADDON_LOADED")
AchievementNotes.MainFrame:SetScript("OnEvent", AchievementNotes.OnEvent)