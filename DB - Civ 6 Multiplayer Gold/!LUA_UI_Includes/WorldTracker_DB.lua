include('DB_Includes_UI')

DB_WorldTracker_RealizeCurrentResearch_LeaderIconIM = {}
DB_WorldTracker_RealizeCurrentCivic_LeaderIconIM = {}

PRIOR_RealizeCurrentResearch = RealizeCurrentResearch
function RealizeCurrentResearch(playerID, kData, kControl)
	if kControl == nil then
		kControl = Controls
	end

	PRIOR_RealizeCurrentResearch(playerID, kData, kControl)

	if not GameConfiguration.GetValue("DB_LEARN_FROM_OTHER_CIVS") or kData == nil or kData.TechType == nil then return end

	for _, v in pairs(DB_WorldTracker_RealizeCurrentResearch_LeaderIconIM) do
		v:ResetInstances()
	end
	PlaceLeaderIcons(DB_WorldTracker_RealizeCurrentResearch_LeaderIconIM, kControl.DB_TitleStack, kControl, kData.TechType, GameInfo.Technologies[kData.TechType].Index, "S", -5, -15)

	return kControl
end

PRIOR_RealizeCurrentCivic = RealizeCurrentCivic
function RealizeCurrentCivic(playerID, kData, kControl, cachedModifiers)
	if kControl == nil then
		kControl = Controls
	end

	PRIOR_RealizeCurrentCivic(playerID, kData, kControl, cachedModifiers)

	if not GameConfiguration.GetValue("DB_LEARN_FROM_OTHER_CIVS") or kData == nil or kData.CivicType == nil then return end

	for _, v in pairs(DB_WorldTracker_RealizeCurrentCivic_LeaderIconIM) do
		v:ResetInstances()
	end
	PlaceLeaderIcons(DB_WorldTracker_RealizeCurrentCivic_LeaderIconIM, kControl.DB_TitleStack, kControl, kData.CivicType, GameInfo.Civics[kData.CivicType].Index, "C", -5, -15)
end