include('DB_Includes_UI')
DB_TechPopulateNode_LeaderIconIM = {}

PRIOR_PopulateNode = PopulateNode
function PopulateNode(uiNode, playerTechData)
	PRIOR_PopulateNode(uiNode, playerTechData)

	if not GameConfiguration.GetValue("DB_LEARN_FROM_OTHER_CIVS") then return end

	-- skip unrevealed nodes
	if not playerTechData[DATA_FIELD_LIVEDATA][uiNode.Type].IsRevealed then return end

	PlaceLeaderIcons(DB_TechPopulateNode_LeaderIconIM, uiNode.DB_NameStack, uiNode, uiNode.Type, GameInfo.Technologies[uiNode.Type].Index, "S", -5, -25)
end

-- Remove the tech filter when playing in the random tech tree mode [ALL]
PRIOR_OnFilterClicked = OnFilterClicked
function OnFilterClicked(filter)
	if not GameConfiguration.GetValue("GAMEMODE_TREE_RANDOMIZER") then
		PRIOR_OnFilterClicked(filter)
	end
end