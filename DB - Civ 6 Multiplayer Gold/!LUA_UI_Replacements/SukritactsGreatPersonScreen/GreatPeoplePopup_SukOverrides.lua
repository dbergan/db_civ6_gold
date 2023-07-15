-- Suk_GreatPeoplePopup_Override
-- Author: Sukritact
-- DateCreated: 12/6/2020 11:31:31 PM
-- ===========================================================================
--	Load the custom context
-- ===========================================================================
local m_pSukGreatPersonPopupContext = ContextPtr:LoadNewContext("Suk_GreatPeoplePopup", Controls.RecruitedArea);
-- ===========================================================================
--	Replace ViewPast and ViewCurrent
-- ===========================================================================
local BASE_VIEWPAST = ViewPast
function ViewPast(kData)
	if ContextPtr:IsHidden() then return end

	m_pSukGreatPersonPopupContext:SetHide(true)
-- DB
-- reverse data so that the most recent recruits are on top
	local len = #kData.Timeline
	for i = len - 1, 1, -1 do
		kData.Timeline[len] = table.remove(kData.Timeline, i)
	end
-- /DB

	BASE_VIEWPAST(kData)
end

local BASE_VIEWCURRENT = ViewCurrent
function ViewCurrent(kData)
	if ContextPtr:IsHidden() then return end

	BASE_VIEWCURRENT(kData)
	Controls.PeopleScroller:SetHide(true)
	Controls.RecruitedArea:SetHide(false)
	m_pSukGreatPersonPopupContext:SetHide(false)

	LuaEvents.Suk_GreatPeoplePopup(kData)
end
-- ===========================================================================
-- ===========================================================================