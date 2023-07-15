function OnUnitFlagClick( playerID : number, unitID : number )
	local pPlayer = Players[playerID];
	if (pPlayer == nil) then return; end

	local pUnit = pPlayer:GetUnits():FindID(unitID);
	if (pUnit == nil ) then
		print("Player clicked a unit flag for unit '"..tostring(unitID).."' but that unit doesn't exist.");
		Controls.PanelTop:ForceAnAssertDueToAboveCondition();
		return;
	end

	if Game.GetLocalPlayer() ~= pUnit:GetOwner() then

		-- Enemy unit; this may start an attack...
		-- Does player have a selected unit?
		local pSelectedUnit = UI.GetHeadSelectedUnit();
		if ( pSelectedUnit ~= nil ) then
			local tParameters = {};
			tParameters[UnitOperationTypes.PARAM_X] = pUnit:GetX();
			tParameters[UnitOperationTypes.PARAM_Y] = pUnit:GetY();
			tParameters[UnitOperationTypes.PARAM_MODIFIERS] = UnitOperationMoveModifiers.ATTACK;
			if (UnitManager.CanStartOperation( pSelectedUnit, UnitOperationTypes.RANGE_ATTACK, nil, tParameters) ) then
				UnitManager.RequestOperation(pSelectedUnit, UnitOperationTypes.RANGE_ATTACK, tParameters);
			elseif (UnitManager.CanStartOperation( pSelectedUnit, UnitOperationTypes.MOVE_TO, nil, tParameters) ) then
				UnitManager.RequestOperation(pSelectedUnit, UnitOperationTypes.MOVE_TO, tParameters);
			end
		end		
	elseif CanSelectUnit(playerID, unitID) then
		-- Player's unit; show info:
		UI.DeselectAllUnits();
		UI.DeselectAllCities();
-- DB	
		-- Fix Firaxis bug where clicking your own unit while viewing City/District Ranged Attack targets would mess up the UI 
		UI.SetInterfaceMode(InterfaceModeTypes.SELECTION)
-- /DB
		UI.SelectUnit( pUnit );
	end
end