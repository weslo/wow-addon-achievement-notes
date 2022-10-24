AchievementNotes.Chat:Print("Loaded main.lua")
local data = {}

ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT = 124

StaticPopupDialogs["AchievementUrl"] = {
    text = "Copy & Paste the link into your browser",
    button1 = "Close",
    OnAccept = function()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
    OnShow =
        function (self, data)
            self.editBox:SetText(data.url)
            self.editBox:SetWidth(self.editBox:GetParent():GetWidth() - 50)
            self.editBox:HighlightText()
            self.editBox:SetScript("OnEditFocusLost", function()
                self:Hide()
            end)
        end,
    hasEditBox = true
}

function AchievementNotes.OnEvent(self, event, arg1, ...)
    if (event == "ADDON_LOADED" and arg1 == "Blizzard_AchievementUI") then
        AchievementNotes.Chat:Print(arg1.." loaded")
        for i,button in ipairs(AchievementFrameAchievementsContainer.buttons) do
            button:HookScript("OnUpdate", AchievementNotes.OnAchievementButtonUpdate)
            button:HookScript("OnClick", AchievementNotes.OnAchievementButtonClicked)local
            b = CreateFrame("Button", "MyButton", button, "UIPanelButtonTemplate")
            b:SetSize(65, 16)
            b:SetText("wowhead")
            b:SetPoint("BOTTOMLEFT", 6, 2)
            b:SetScript("OnClick", function()
                local d = {}
                d.url = "https://www.wowhead.com/achievement=" .. button.id .. "/"
                StaticPopup_Show("AchievementUrl", "", "", d)
            end)
            b:Show()
        end
    end
end

function AchievementNotes.OnAchievementButtonUpdate(self)
    local id, achievementName, points, completed = GetAchievementInfo(self.id)
    if data[id] then
        self.eb:SetText(data[id])
    end
end

function AchievementNotes.OnAchievementButtonClicked(self)
    local id, achievementName = GetAchievementInfo(self.id)
end

AchievementNotes.MainFrame = CreateFrame("Frame")
AchievementNotes.MainFrame:Hide()
AchievementNotes.MainFrame:RegisterEvent("ADDON_LOADED")
AchievementNotes.MainFrame:SetScript("OnEvent", AchievementNotes.OnEvent)