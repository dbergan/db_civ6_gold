if not ExposedMembers.DB_GOLD then ExposedMembers.DB_GOLD = {} end
local DB_GOLD = ExposedMembers.DB_GOLD

if not DB_RevealedPlots then DB_RevealedPlots = {} end


function DB_GetPlotTable(Center, Radius)
	local TempTable = {}
	if Center ~= nil then
		local x, y = Center:GetX(), Center:GetY()
		if Radius == 0 then
			local TempPlot = Map.GetPlotXYWithRangeCheck(x, y, 0, 0, Radius)
			if TempPlot then
				table.insert(TempTable, TempPlot)
			end
		else
			for TempX = (Radius * -1), Radius do
				for TempY = (Radius * -1), Radius do
					local TempPlot = Map.GetPlotXYWithRangeCheck(x, y, TempX, TempY, Radius)
					if TempPlot then
						table.insert(TempTable, TempPlot)
					end
				end
			end
		end
	end
	return TempTable
end

function HideRevealedPlots(PlayerID)
	local Vis = PlayersVisibility[PlayerID]
	if DB_RevealedPlots[PlayerID] ~= nil then
		for _, value in pairs(DB_RevealedPlots[PlayerID]) do
			local TempPlot = Map.GetPlotByIndex(value)
			if Vis:IsVisible(TempPlot:GetX(), TempPlot:GetY()) == true then
				Vis:ChangeVisibilityCount(value, -1)
			end
		end
	end
	DB_RevealedPlots[PlayerID] = {}
end

function DB_DisloyalInformants_Gameplay_PlayerTurnActivated(ActivePlayerID, blsFirstTime)
	if (not GameConfiguration.GetValue("DB_DISLOYAL_INFORMANTS") or blsFirstTime ~= true or ActivePlayerID == -1 or ActivePlayerID > 62 or DB_GOLD.DB_DisloyalInformants_UI == nil) then return nil end

	local CityVision = DB_GOLD.DB_DisloyalInformants_UI(ActivePlayerID)
	for _, v in pairs(CityVision) do
		DB_RevealPlots(ActivePlayerID, v.PlotX, v.PlotY, v.Radius)
	end
end

function DB_DrownReligiousUnitsWithoutBoat (turn)
	if not GameConfiguration.GetValue("DB_EMBARKED_RELIGIOUS_UNITS") then return end

	if Game == nil then return end
	local LocalPlayerID = Game.GetLocalPlayer()
	if LocalPlayerID == nil then return end

	if Players == nil then return end
	local Units = Players[LocalPlayerID]:GetUnits()
	if Units == nil then return end

	for _, Unit in Units:Members() do
		if Unit ~= nil then
			-- local UnitType = GameInfo.Units[Unit:GetType()].UnitType

			-- embarked religious units turn invisible when not next to a boat, hence why we're checking for Invisible
			local Invisible = Unit:HasHiddenVisibility()
			local Embarked = Unit:IsEmbarked()
			local SpreadCharges = Unit:GetReligion():GetSpreadCharges()
			local HealCharges = Unit:GetReligion():GetReligiousHealCharges()
		
			if Invisible == true and Embarked == true and (SpreadCharges > 1 or HealCharges > 1) then
				UnitManager.Kill(Unit)
			end
		end
	end
end

-- this function triggers immediately after the player received their normal science/culture yields for the turn
function DB_GoldFromTourism(ActivePlayerID, blsFirstTime)
	if (not GameConfiguration.GetValue("DB_GOLD_FROM_TOURISM") or blsFirstTime ~= true or ActivePlayerID == -1 or ActivePlayerID > 61 or DB_GOLD.DB_GetGoldFromForeignTourists == nil) then return nil end

	local GoldFromForeignTourists = 0
	GoldFromForeignTourists = DB_GOLD.DB_GetGoldFromForeignTourists(ActivePlayerID)

	if GoldFromForeignTourists > 0 then
		Players[ActivePlayerID]:GetTreasury():ChangeGoldBalance(GoldFromForeignTourists)
	end
end

-- this function triggers immediately after the player received their normal science/culture yields for the turn
function DB_GiveActivePlayerBoost(ActivePlayerID, blsFirstTime)
	if (not GameConfiguration.GetValue("DB_LEARN_FROM_OTHER_CIVS") or blsFirstTime ~= true or ActivePlayerID == -1 or ActivePlayerID > 61 or DB_GOLD.GetBoosts == nil) then return nil end

	local ActivePlayer = Players[ActivePlayerID]
	if ActivePlayer:IsMajor() == false then
		return nil
	end

	local ActiveTechID = ActivePlayer:GetTechs():GetResearchingTech()
	local ActiveCivicID = ActivePlayer:GetCulture():GetProgressingCivic()	

	local ScienceBoost = 0
	local CultureBoost = 0

	ScienceBoost, CultureBoost = DB_GOLD.GetBoosts(ActivePlayerID, ActiveTechID, ActiveCivicID, true)

	if ScienceBoost > 0 then
		ActivePlayer:GetTechs():ChangeCurrentResearchProgress(ScienceBoost)
	end
	if CultureBoost > 0 then
		ActivePlayer:GetCulture():ChangeCurrentCulturalProgress(CultureBoost)
	end
end


function DB_GiveCityStatesKnownTech(ActivePlayerID, blsFirstTime)
	if (not GameConfiguration.GetValue("DB_CITYSTATES_ARENT_BACKWARDS") or blsFirstTime ~= true or ActivePlayerID == -1 or ActivePlayerID > 62 or DB_GOLD.TechsOrCivicsMetButDontHave == nil) then return nil end

	local ActivePlayer = Players[ActivePlayerID]
	if ActivePlayer:IsMajor() == true or ActivePlayer:IsBarbarian() == true then
		return nil
	end

	local TechsMetButDontHave = DB_GOLD.TechsOrCivicsMetButDontHave(ActivePlayerID, 'S')
	local CivicsMetButDontHave = DB_GOLD.TechsOrCivicsMetButDontHave(ActivePlayerID, 'C')

	for _, Tech in ipairs(TechsMetButDontHave) do
		ActivePlayer:GetTechs():SetTech(Tech.Index, true)
	end

	for _, Civic in ipairs(CivicsMetButDontHave) do
		ActivePlayer:GetCulture():SetCivic(Civic.Index, true)
	end
end

--[[
function OP_PantheonUpkeep(ActivePlayerID) 
	if (not GameConfiguration.GetValue("DB_OLYMPIC_PANTHEONS") or ActivePlayerID == -1 or ActivePlayerID > 61 or DB_GOLD.DB_NeedToRemoveAmenities == nil) then return nil end

	for _, City in Players[ActivePlayerID]:GetCities():Members() do
		-- if we have the Dionysus pantheon, we need to create the Peace and Love "building"
		local Pantheon = GameInfo.Beliefs[City:GetReligion():GetActivePantheon()]
		if Pantheon ~= nil and Pantheon.PrimaryKey == 'OP_DIONYSUS' then
			if not City:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index) then
				WorldBuilder.CityManager():CreateBuilding(City, GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index, 100)
			end
		-- elseif we have the "building" but no longer Dionysus, we should remove it from the city
		elseif City:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index) then
			WorldBuilder.CityManager():RemoveBuilding(City, GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index)
		end

		-- if we have Dionysus, we'll have the building at this point, check for war weariness... if we have it, Peace and Love gets pillaged
		if Pantheon ~= nil and Pantheon.PrimaryKey == 'OP_DIONYSUS' then
			if DB_GOLD.DB_NeedToRemoveAmenities(ActivePlayerID, City:GetID()) then
				City:GetBuildings():SetPillaged(GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index, true)
			else
				City:GetBuildings():SetPillaged(GameInfo.Buildings["BUILDING_OP_PEACE_AND_LOVE"].Index, false)
			end
		end

		-- if we have Alpheus, free water mill
		if Pantheon ~= nil and Pantheon.PrimaryKey == 'OP_ALPHEUS' then
			if not City:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_WATER_MILL"].Index) then
				WorldBuilder.CityManager():CreateBuilding(City, GameInfo.Buildings["BUILDING_WATER_MILL"].Index, 100)
			end
			City:GetBuildings():SetPillaged(GameInfo.Buildings["BUILDING_WATER_MILL"].Index, false)
		end
	end
end
--]]

function DB_PantheonObeliskCheck(ActivePlayerID) 
	if (not GameConfiguration.GetValue("DB_PANTHEON_OBELISK") or ActivePlayerID == -1 or ActivePlayerID > 61 or DB_GOLD.HasPantheon == nil or Players[ActivePlayerID]:IsMajor() == false) then return nil end

	if DB_GOLD.HasPantheon(ActivePlayerID) == false then
		Players[ActivePlayerID]:GetReligion():SetFaithBalance(0)

		local AIHasObelisk = false
		local AIHasHolySite = false

		for _, City in Players[ActivePlayerID]:GetCities():Members() do
			-- Give the AI an obelisk once they make a Holy Site (or Stonehenge) in any city, because they won't build one normally
			if Players[ActivePlayerID]:IsHuman() == false then
				if City:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_DB_PANTHEON"].Index) == true then
					AIHasObelisk = true
				end

				if City:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_HOLY_SITE"].Index) == true or City:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_LAVRA"].Index) == true or City:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_STONEHENGE"].Index) == true then
					AIHasHolySite = true
				end
			end

			if City:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_DB_PANTHEON"].Index) then
				Players[ActivePlayerID]:GetReligion():SetFaithBalance( DB_GOLD.FaithForPantheon() )
			end
		end

		if AIHasHolySite == true and AIHasObelisk == false then
			for _, City in Players[ActivePlayerID]:GetCities():Members() do
				if DB_GOLD.IsCapital(City.Index) == true then
					WorldBuilder.CityManager():CreateBuilding(City, GameInfo.Buildings["BUILDING_DB_PANTHEON"].Index, 100)
				end
			end
		end
	end
end

function DB_TakeawayTooEarlyResources (playerID, resourceID)
	if not GameConfiguration.GetValue("DB_REVEAL_STRATEGIC_RESOURCES") then return end

	local DB_pPlayer = Players[playerID] ;
	local DB_playerResources = DB_pPlayer:GetResources();

	if resourceID == GameInfo.Resources['RESOURCE_HORSES'].Index and DB_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_ANIMAL_HUSBANDRY"].Index) == false and DB_playerResources:GetResourceAmount('RESOURCE_HORSES') > 0 then
		DB_playerResources:ChangeResourceAmount (resourceID, -1 * DB_playerResources:GetResourceAmount('RESOURCE_HORSES'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_IRON'].Index and DB_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_BRONZE_WORKING"].Index) == false and DB_playerResources:GetResourceAmount('RESOURCE_IRON') > 0 then
		DB_playerResources:ChangeResourceAmount (resourceID, -1 * DB_playerResources:GetResourceAmount('RESOURCE_IRON'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_NITER'].Index and DB_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_MILITARY_ENGINEERING"].Index) == false and DB_playerResources:GetResourceAmount('RESOURCE_NITER') > 0 then
		DB_playerResources:ChangeResourceAmount (resourceID, -1 * DB_playerResources:GetResourceAmount('RESOURCE_NITER'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_COAL'].Index and DB_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_INDUSTRIALIZATION"].Index) == false and DB_playerResources:GetResourceAmount('RESOURCE_COAL') > 0 then
		DB_playerResources:ChangeResourceAmount (resourceID, -1 * DB_playerResources:GetResourceAmount('RESOURCE_COAL'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_OIL'].Index and DB_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_REFINING"].Index) == false and DB_playerResources:GetResourceAmount('RESOURCE_OIL') > 0 then
		DB_playerResources:ChangeResourceAmount (resourceID, -1 * DB_playerResources:GetResourceAmount('RESOURCE_OIL'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_ALUMINUM'].Index and DB_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_RADIO"].Index) == false and DB_playerResources:GetResourceAmount('RESOURCE_ALUMINUM') > 0 then
		DB_playerResources:ChangeResourceAmount (resourceID, -1 * DB_playerResources:GetResourceAmount('RESOURCE_ALUMINUM'));
	end

	if resourceID == GameInfo.Resources['RESOURCE_URANIUM'].Index and DB_pPlayer:GetTechs():HasTech(GameInfo.Technologies["TECH_COMBINED_ARMS"].Index) == false and DB_playerResources:GetResourceAmount('RESOURCE_URANIUM') > 0 then
		DB_playerResources:ChangeResourceAmount (resourceID, -1 * DB_playerResources:GetResourceAmount('RESOURCE_URANIUM'));
	end
end


function DB_GetAdjacentPlots(plot, includeCenter)
	local iX 	= plot:GetX()
	local iY 	= plot:GetY()

	local list	= {}
	
	if includeCenter then
		table.insert(list, plot)
	end

	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local adjacentPlot 	= Map.GetAdjacentPlot(iX, iY, direction)
		if adjacentPlot then
			table.insert(list, adjacentPlot)
		end		
	end
	return list
end

function DB_XPFromObservation(combatResult)
	if not GameConfiguration.GetValue("DB_EXPERIENCE_FROM_OBSERVATION") and not GameConfiguration.GetValue("DB_BETTER_SCOUTS") then return end

	local CType = combatResult[CombatResultParameters.COMBAT_TYPE]
	-- Melee is 748940753
	-- Ranged is 784649805
	if CType ~= 748940753 then return end


	local ObserverXP = 1
	local ScoutXP = 1
	if GameConfiguration.GetValue("DB_BETTER_SCOUTS") == true then
		ScoutXP = 2
	end

	local attackerID = combatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].id
	local attackerPlayerID = combatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player
	local attackerPlot = Map.GetPlotXYWithRangeCheck(combatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].x, combatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].y)
	local attackerAdjacentPlots = DB_GetAdjacentPlots(attackerPlot, true)

	local defenderID = combatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].id
	local defenderPlayerID = combatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].player
	local defenderPlot = Map.GetPlotXYWithRangeCheck(combatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x, combatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].y)
	local defenderAdjacentPlots = DB_GetAdjacentPlots(defenderPlot, true)

	-- Non-combatants adjacent to a defender get XP
	for i, plot in ipairs(defenderAdjacentPlots) do
		local aUnits = Units.GetUnitsInPlot(plot)
		for _, pUnit in ipairs(aUnits) do
			if pUnit:GetID() ~= attackerID and pUnit:GetID() ~= defenderID then
				if GameInfo.Units[pUnit:GetType()].UnitType == "UNIT_SCOUT" then
					pUnit:GetExperience():ChangeExperience(ScoutXP)
				elseif GameInfo.Units[pUnit:GetType()].Combat > 0 and GameConfiguration.GetValue("DB_EXPERIENCE_FROM_OBSERVATION") and GameInfo.Units[pUnit:GetType()].UnitType:find("UNIT_HERO") == nil then
					pUnit:GetExperience():ChangeExperience(ObserverXP)
				end
			end
		end
	end

	-- Non-combatants adjacent to an enemy attacker get XP
	for i, plot in ipairs(attackerAdjacentPlots) do
		local aUnits = Units.GetUnitsInPlot(plot)
		for _, pUnit in ipairs(aUnits) do
			if Players[pUnit:GetOwner()]:GetID() ~= attackerPlayerID and pUnit:GetID() ~= attackerID and pUnit:GetID() ~= defenderID then
				if GameInfo.Units[pUnit:GetType()].UnitType == "UNIT_SCOUT" then
					pUnit:GetExperience():ChangeExperience(ScoutXP)
				elseif GameInfo.Units[pUnit:GetType()].Combat > 0 and GameConfiguration.GetValue("DB_EXPERIENCE_FROM_OBSERVATION") and GameInfo.Units[pUnit:GetType()].UnitType:find("UNIT_HERO") == nil then
					pUnit:GetExperience():ChangeExperience(ObserverXP)
				end
			end
		end
	end

	-- Non-combatants adjacent to an enemy defender get XP
	for i, plot in ipairs(defenderAdjacentPlots) do
		local aUnits = Units.GetUnitsInPlot(plot)
		for _, pUnit in ipairs(aUnits) do
			if Players[pUnit:GetOwner()]:GetID() ~= defenderPlayerID and pUnit:GetID() ~= attackerID and pUnit:GetID() ~= defenderID then
				if GameInfo.Units[pUnit:GetType()].UnitType == "UNIT_SCOUT" then
					pUnit:GetExperience():ChangeExperience(ScoutXP)
				elseif GameInfo.Units[pUnit:GetType()].Combat > 0 and GameConfiguration.GetValue("DB_EXPERIENCE_FROM_OBSERVATION") and GameInfo.Units[pUnit:GetType()].UnitType:find("UNIT_HERO") == nil then
					pUnit:GetExperience():ChangeExperience(ObserverXP)
				end
			end
		end
	end

end



-- --------------------------------------------------
--	Exposed Members
-- --------------------------------------------------

function DB_RevealPlots(PlayerID, X, Y, Radius)
	local Vis = PlayersVisibility[PlayerID]
	local Center = Map.GetPlot(X, Y)
	local PlotTable = DB_GetPlotTable(Center, Radius)
	
	for _, TempPlot in pairs(PlotTable) do
		if Vis:IsVisible(TempPlot:GetX(), TempPlot:GetY()) == false then
			if not DB_RevealedPlots[PlayerID] then DB_RevealedPlots[PlayerID] = {} end
			Vis:ChangeVisibilityCount(TempPlot:GetIndex(), 1)
			table.insert(DB_RevealedPlots[PlayerID], TempPlot:GetIndex())
		end
    end
end


function DB_Includes_Gameplay_Init()
	DB_GOLD.DB_RevealPlots = DB_RevealPlots

	Events.Combat.Add(DB_XPFromObservation)

	Events.PlayerTurnActivated.Add(DB_GoldFromTourism)
	Events.PlayerTurnActivated.Add(DB_GiveActivePlayerBoost)
	Events.PlayerTurnActivated.Add(DB_GiveCityStatesKnownTech)
	Events.PlayerTurnActivated.Add(DB_DisloyalInformants_Gameplay_PlayerTurnActivated)
	-- GameEvents.PlayerTurnStartComplete.Add(OP_PantheonUpkeep)
	GameEvents.PlayerTurnStartComplete.Add(DB_PantheonObeliskCheck)

	Events.PlayerTurnDeactivated.Add(HideRevealedPlots)
	Events.TurnEnd.Add(DB_DrownReligiousUnitsWithoutBoat)

	Events.PlayerResourceChanged.Add(DB_TakeawayTooEarlyResources)
end
DB_Includes_Gameplay_Init()
