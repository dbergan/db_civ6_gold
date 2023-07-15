--[[
-- Copyright (c) 2017-2018 Firaxis Games
--]]
-- ===========================================================================
-- INCLUDE BASE FILE
-- ===========================================================================
include("WorldInput_DB");


-- ===========================================================================
--	CACHE BASE FUNCTIONS
-- ===========================================================================
BASE_LateInitialize			= LateInitialize;


------------------------------------------------------------------------------------------------
-- Code related to the Unit's 'Airdrop' mode
------------------------------------------------------------------------------------------------
function OnMouseParadropEnd(pInputStruct)
	-- If a drag was occurring, end it; otherwise raise event.
	if g_isMouseDragging then
		g_isMouseDragging = false;
	elseif IsSelectionAllowedAt( UI.GetCursorPlotID() ) then		
		UnitParadrop(pInputStruct);
	end
	EndDragMap();
	g_isMouseDownInWorld = false;
	return true;
end
------------------------------------------------------------------------------------------------
function UnitParadrop(pInputStruct)
	local plotID = UI.GetCursorPlotID();
	if Map.IsPlot(plotID) then
		local plot = Map.GetPlotByIndex(plotID);
			
		local tParameters = {};
		tParameters[UnitCommandTypes.PARAM_X] = plot:GetX();
		tParameters[UnitCommandTypes.PARAM_Y] = plot:GetY();

		local pSelectedUnit = UI.GetHeadSelectedUnit();
		if (UnitManager.CanStartCommand( pSelectedUnit, UnitCommandTypes.PARADROP, tParameters)) then
			UnitManager.RequestCommand( pSelectedUnit, UnitCommandTypes.PARADROP, tParameters);
			UI.SetInterfaceMode(InterfaceModeTypes.SELECTION);
			UI.PlaySound("Unit_Airlift");
		end
	end
	return true;
end
------------------------------------------------------------------------------------------------
function OnInterfaceModeChange_UnitParadrop(eNewMode)
	UIManager:SetUICursor(CursorTypes.RANGE_ATTACK);
	local pSelectedUnit = UI.GetHeadSelectedUnit();
	local tResults = UnitManager.GetCommandTargets(pSelectedUnit, UnitCommandTypes.PARADROP );
	local allPlots = tResults[CityCommandResults.PLOTS];
	if allPlots then
		g_targetPlots = {};
		for i,modifier in ipairs(tResults[CityCommandResults.PLOTS]) do
			table.insert(g_targetPlots, allPlots[i]);
		end 

		-- Highlight the plots available to airdrop to
		if (table.count(g_targetPlots) ~= 0) then
			UILens.ToggleLayerOn(g_HexColoringMovement);
			UILens.SetLayerHexesArea(g_HexColoringMovement, Game.GetLocalPlayer(), g_targetPlots);
		end
	end
end
--------------------------------------------------------------------------------------------------
function OnInterfaceModeLeave_UnitParadrop(eNewMode:number)
	UIManager:SetUICursor(CursorTypes.NORMAL);
	UILens.ToggleLayerOff(g_HexColoringMovement);
	UILens.ClearLayerHexes(g_HexColoringMovement);
end






------------------------------------------------------------------------------------------------
-- Code related to the Unit's 'PriorityTarget' mode
------------------------------------------------------------------------------------------------
function OnMousePriorityTargetEnd(pInputStruct)
	-- If a drag was occurring, end it; otherwise raise event.
	if g_isMouseDragging then
		g_isMouseDragging = false;
	elseif IsSelectionAllowedAt( UI.GetCursorPlotID() ) then		
		PriorityTarget(pInputStruct);
	end
	EndDragMap();
	g_isMouseDownInWorld = false;
	return true;
end
------------------------------------------------------------------------------------------------
function PriorityTarget(pInputStruct)
	local plotID = UI.GetCursorPlotID();
	if Map.IsPlot(plotID) then
		local plot = Map.GetPlotByIndex(plotID);
			
		local tParameters = {};
		tParameters[UnitCommandTypes.PARAM_X] = plot:GetX();
		tParameters[UnitCommandTypes.PARAM_Y] = plot:GetY();

		local pSelectedUnit = UI.GetHeadSelectedUnit();
		if (UnitManager.CanStartCommand( pSelectedUnit, UnitCommandTypes.PRIORITY_TARGET, tParameters)) then
			UnitManager.RequestCommand( pSelectedUnit, UnitCommandTypes.PRIORITY_TARGET, tParameters);
			UI.SetInterfaceMode(InterfaceModeTypes.SELECTION);
		end
	end
	return true;
end
------------------------------------------------------------------------------------------------
function OnInterfaceModeChange_PriorityTarget(eNewMode)
	UIManager:SetUICursor(CursorTypes.RANGE_ATTACK);
	local pSelectedUnit = UI.GetHeadSelectedUnit();
	local tResults = UnitManager.GetCommandTargets(pSelectedUnit, UnitCommandTypes.PRIORITY_TARGET );
	local allPlots = tResults[CityCommandResults.PLOTS];
	if allPlots then
		g_targetPlots = {};
		for i,modifier in ipairs(tResults[CityCommandResults.MODIFIERS]) do
			if(modifier == CityCommandResults.MODIFIER_IS_TARGET) then	
				table.insert(g_targetPlots, allPlots[i]);
			end
		end

		-- Highlight the plots available to attack a priority target
		if (table.count(g_targetPlots) ~= 0) then
			UILens.ToggleLayerOn(g_HexColoringMovement);
			UILens.SetLayerHexesArea(g_HexColoringMovement, Game.GetLocalPlayer(), g_targetPlots);
		end
	end
end
--------------------------------------------------------------------------------------------------
function OnInterfaceModeLeave_PriorityTarget(eNewMode:number)
	UIManager:SetUICursor(CursorTypes.NORMAL);
	UILens.ToggleLayerOff(g_HexColoringMovement);
	UILens.ClearLayerHexes(g_HexColoringMovement);
end

-- ===========================================================================
--	OVERRIDE
-- ===========================================================================
function LateInitialize()

	BASE_LateInitialize();

	InterfaceModeMessageHandler[InterfaceModeTypes.PARADROP] = {};
	InterfaceModeMessageHandler[InterfaceModeTypes.PARADROP][INTERFACEMODE_ENTER]= OnInterfaceModeChange_UnitParadrop;
	InterfaceModeMessageHandler[InterfaceModeTypes.PARADROP][INTERFACEMODE_LEAVE] = OnInterfaceModeLeave_UnitParadrop;
	InterfaceModeMessageHandler[InterfaceModeTypes.PARADROP][MouseEvents.LButtonUp] = OnMouseParadropEnd;
	InterfaceModeMessageHandler[InterfaceModeTypes.PARADROP][KeyEvents.KeyUp]		= OnPlacementKeyUp;

	InterfaceModeMessageHandler[InterfaceModeTypes.PRIORITY_TARGET] = {};
	InterfaceModeMessageHandler[InterfaceModeTypes.PRIORITY_TARGET][INTERFACEMODE_ENTER]= OnInterfaceModeChange_PriorityTarget;
	InterfaceModeMessageHandler[InterfaceModeTypes.PRIORITY_TARGET][INTERFACEMODE_LEAVE] = OnInterfaceModeLeave_PriorityTarget;
	InterfaceModeMessageHandler[InterfaceModeTypes.PRIORITY_TARGET][MouseEvents.LButtonUp] = OnMousePriorityTargetEnd;
	InterfaceModeMessageHandler[InterfaceModeTypes.PRIORITY_TARGET][KeyEvents.KeyUp]		= OnPlacementKeyUp;
	
	if g_isTouchEnabled then
		InterfaceModeMessageHandler[InterfaceModeTypes.PARADROP][MouseEvents.PointerUp] = OnMouseParadropEnd;
		InterfaceModeMessageHandler[InterfaceModeTypes.PRIORITY_TARGET][MouseEvents.PointerUp] = OnMousePriorityTargetEnd;
	end
end


-- ===========================================================================
--	CACHE BASE FUNCTIONS
-- ===========================================================================
XP1_LateInitialize			= LateInitialize;


-- ===========================================================================
-- Code related to the Unit's 'BuildImprovementAdjacent' mode
-- ===========================================================================
function OnMouseBuildImprovementAdjacentEnd( pInputStruct:table )
	-- If a drag was occurring, end it; otherwise raise event.
	if g_isMouseDragging then
		g_isMouseDragging = false;
	elseif IsSelectionAllowedAt( UI.GetCursorPlotID() ) then		
		BuildImprovementAdjacent(pInputStruct);
	end
	EndDragMap();
	g_isMouseDownInWorld = false;
	return true;
end

-- ===========================================================================
function BuildImprovementAdjacent( pInputStruct:table )
	local plotID = UI.GetCursorPlotID();
	if Map.IsPlot(plotID) then
		local plot = Map.GetPlotByIndex(plotID);
			
		local tParameters = {};
		tParameters[UnitOperationTypes.PARAM_X] = plot:GetX();
		tParameters[UnitOperationTypes.PARAM_Y] = plot:GetY();
		tParameters[UnitOperationTypes.PARAM_IMPROVEMENT_TYPE] = UI.GetInterfaceModeParameter(UnitOperationTypes.PARAM_IMPROVEMENT_TYPE);

		local pSelectedUnit = UI.GetHeadSelectedUnit();
		if (UnitManager.CanStartOperation( pSelectedUnit, UnitOperationTypes.BUILD_IMPROVEMENT_ADJACENT, nil, tParameters)) then
			UnitManager.RequestOperation( pSelectedUnit, UnitOperationTypes.BUILD_IMPROVEMENT_ADJACENT, tParameters);
			UI.SetInterfaceMode(InterfaceModeTypes.SELECTION);
		end
	end
	return true;
end

-- ===========================================================================
function OnInterfaceModeChange_BuildImprovementAdjacent( eNewMode:number )
	UIManager:SetUICursor(CursorTypes.RANGE_ATTACK);
	local pSelectedUnit = UI.GetHeadSelectedUnit();
	local eOperation = UI.GetInterfaceModeParameter(UnitOperationTypes.PARAM_OPERATION_TYPE);
	local tParameters = {};
	tParameters[UnitOperationTypes.PARAM_IMPROVEMENT_TYPE] = UI.GetInterfaceModeParameter(UnitOperationTypes.PARAM_IMPROVEMENT_TYPE);
	local tResults = UnitManager.GetOperationTargets(pSelectedUnit, eOperation, tParameters);
	local allPlots = tResults[UnitOperationResults.PLOTS];
	if allPlots then
		g_targetPlots = allPlots;

		-- Highlight the plots available to attack a priority target
		if (table.count(g_targetPlots) ~= 0) then
			local pOverlay:object = UILens.GetOverlay("PlacementValidOverlay");
			if pOverlay ~= nil then
				pOverlay:CreateSprites( g_targetPlots, "Placement_Valid", 0 );
			end
		end
	end
end

-- ===========================================================================
function OnInterfaceModeLeave_BuildImprovementAdjacent( eNewMode:number )
	UIManager:SetUICursor(CursorTypes.NORMAL);
	local pOverlay:object = UILens.GetOverlay("PlacementValidOverlay");
	if pOverlay ~= nil then
		pOverlay:ClearAll();
	end
end


------------------------------------------------------------------------------------------------
-- Code related to a Unit's 'Jump' move ability
------------------------------------------------------------------------------------------------
function OnMouseMoveJumpEnd(pInputStruct)
	-- If a drag was occurring, end it; otherwise raise event.
	if g_isMouseDragging then
		g_isMouseDragging = false;
	elseif IsSelectionAllowedAt( UI.GetCursorPlotID() ) then		
		MoveJump(pInputStruct);
	end
	EndDragMap();
	g_isMouseDownInWorld = false;
	return true;
end
------------------------------------------------------------------------------------------------
function MoveJump(pInputStruct)
	local plotID = UI.GetCursorPlotID();
	if Map.IsPlot(plotID) then
		local plot = Map.GetPlotByIndex(plotID);
			
		local tParameters = {};
		tParameters[UnitCommandTypes.PARAM_X] = plot:GetX();
		tParameters[UnitCommandTypes.PARAM_Y] = plot:GetY();

		local pSelectedUnit = UI.GetHeadSelectedUnit();
		if (UnitManager.CanStartCommand( pSelectedUnit, UnitCommandTypes.MOVE_JUMP, tParameters)) then
			UnitManager.RequestCommand( pSelectedUnit, UnitCommandTypes.MOVE_JUMP, tParameters);
			UI.SetInterfaceMode(InterfaceModeTypes.SELECTION);
		end
	end
	return true;
end
------------------------------------------------------------------------------------------------
function OnInterfaceModeChange_MoveJump(eNewMode)
	UIManager:SetUICursor(CursorTypes.RANGE_ATTACK);
	local pSelectedUnit = UI.GetHeadSelectedUnit();
	local tResults = UnitManager.GetCommandTargets(pSelectedUnit, UnitCommandTypes.MOVE_JUMP );
	local allPlots = tResults[CityCommandResults.PLOTS];
	if allPlots then
		g_targetPlots = {};
		for i,modifier in ipairs(tResults[CityCommandResults.PLOTS]) do
			table.insert(g_targetPlots, allPlots[i]);
		end 

		-- Highlight the plots available to jump to
		if (table.count(g_targetPlots) ~= 0) then
			UILens.ToggleLayerOn(g_HexColoringMovement);
			UILens.SetLayerHexesArea(g_HexColoringMovement, Game.GetLocalPlayer(), g_targetPlots);
		end
	end
end
--------------------------------------------------------------------------------------------------
function OnInterfaceModeLeave_MoveJump(eNewMode:number)
	UIManager:SetUICursor(CursorTypes.NORMAL);
	UILens.ToggleLayerOff(g_HexColoringMovement);
	UILens.ClearLayerHexes(g_HexColoringMovement);
end



-- ===========================================================================
--	OVERRIDE
-- ===========================================================================
function LateInitialize()

	XP1_LateInitialize();

	InterfaceModeMessageHandler[InterfaceModeTypes.BUILD_IMPROVEMENT_ADJACENT] = {};
	InterfaceModeMessageHandler[InterfaceModeTypes.BUILD_IMPROVEMENT_ADJACENT][INTERFACEMODE_ENTER]= OnInterfaceModeChange_BuildImprovementAdjacent;
	InterfaceModeMessageHandler[InterfaceModeTypes.BUILD_IMPROVEMENT_ADJACENT][INTERFACEMODE_LEAVE] = OnInterfaceModeLeave_BuildImprovementAdjacent;
	InterfaceModeMessageHandler[InterfaceModeTypes.BUILD_IMPROVEMENT_ADJACENT][MouseEvents.LButtonUp] = OnMouseBuildImprovementAdjacentEnd;
	InterfaceModeMessageHandler[InterfaceModeTypes.BUILD_IMPROVEMENT_ADJACENT][KeyEvents.KeyUp]		= OnPlacementKeyUp;

	InterfaceModeMessageHandler[InterfaceModeTypes.MOVE_JUMP] = {};
	InterfaceModeMessageHandler[InterfaceModeTypes.MOVE_JUMP][INTERFACEMODE_ENTER]= OnInterfaceModeChange_MoveJump;
	InterfaceModeMessageHandler[InterfaceModeTypes.MOVE_JUMP][INTERFACEMODE_LEAVE] = OnInterfaceModeLeave_MoveJump;
	InterfaceModeMessageHandler[InterfaceModeTypes.MOVE_JUMP][MouseEvents.LButtonUp] = OnMouseMoveJumpEnd;
	InterfaceModeMessageHandler[InterfaceModeTypes.MOVE_JUMP][KeyEvents.KeyUp]		= OnPlacementKeyUp;

	if g_isTouchEnabled then
		InterfaceModeMessageHandler[InterfaceModeTypes.BUILD_IMPROVEMENT_ADJACENT][MouseEvents.PointerUp] = OnMouseBuildImprovementAdjacentEnd;
		InterfaceModeMessageHandler[InterfaceModeTypes.MOVE_JUMP][MouseEvents.PointerUp] = OnMouseMoveJumpEnd;
	end
end