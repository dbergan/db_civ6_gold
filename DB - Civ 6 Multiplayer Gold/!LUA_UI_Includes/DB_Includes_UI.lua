if not ExposedMembers.DB_GOLD then ExposedMembers.DB_GOLD = {} end
local DB_GOLD = ExposedMembers.DB_GOLD

-- ---------------------------------------------
-- Global constants that might want to be edited
-- Radius of 1 = the unit and each tile around it, 2 = each tile around the tiles in 1, etc.
DB_DefenderRadius = 1
DB_NuclearRadius = 1
DB_ThermonuclearRadius = 2
DB_EnemyRGB = "255,47,47"
DB_MyRGB = "36,119,255"
-- ---------------------------------------------


-- DB original functions
DB_HasMet = false
function DB_HasMetAllMajors()
	if DB_HasMet then
		return true
	end

	local LocalPlayerID = Game.GetLocalPlayer()
    for i = 0, PlayerManager.GetWasEverAliveCount() - 1 do
		local pPlayer = Players[i]
		if pPlayer:GetID() > 0 and pPlayer:GetID() ~= LocalPlayerID then
			if pPlayer:IsAlive() == true then
				if pPlayer:IsMajor() == true then
					if pPlayer:GetDiplomacy():HasMet(LocalPlayerID) == false then
						return false
					end
				end
			end
		end
	end

	-- set global variable to true so we don't have to keep querying
	DB_HasMet = true
	return true
end
-- /DB



-- from TutorialScenarioBase.lua
function GetUnitType( playerID: number, unitID : number )
	local pPlayer	:table = Players[playerID]
	local pUnit		:table = pPlayer:GetUnits():FindID(unitID)

	if pUnit == nil then return "" end

	return GameInfo.Units[pUnit:GetUnitType()].UnitType
end

function DB_Combat_DebugPrintNotificationData(notificationData)

	print("****************************************************************************************")
	print(notificationData[ParameterTypes.MESSAGE])
	print(notificationData[ParameterTypes.SUMMARY])
	print("****************************************************************************************")
end

function DB_Combat_DebugPrintAllCombatResult(CombatResult)

	print("========================================================================================")
	print("CombatResult[CombatResultParameters.COMBAT_TYPE]", CombatResult[CombatResultParameters.COMBAT_TYPE])
	print("CombatResult[CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.LOCATION].y)
	print("CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].x", CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].x)
	print("CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].y", CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].y)
	print("CombatResult[CombatResultParameters.DEFENDER_RETALIATES]", CombatResult[CombatResultParameters.DEFENDER_RETALIATES])
	print("CombatResult[CombatResultParameters.ATTACKER_ADVANCES]", CombatResult[CombatResultParameters.ATTACKER_ADVANCES])
	print("CombatResult[CombatResultParameters.DEFENDER_CAPTURED]", CombatResult[CombatResultParameters.DEFENDER_CAPTURED])
	print("CombatResult[CombatResultParameters.LOCATION_PILLAGED]", CombatResult[CombatResultParameters.LOCATION_PILLAGED])
	print("CombatResult[CombatResultParameters.WMD_STATUS]", CombatResult[CombatResultParameters.WMD_STATUS])
	print("CombatResult[CombatResultParameters.WMD_TYPE]", CombatResult[CombatResultParameters.WMD_TYPE])
	print("CombatResult[CombatResultParameters.WMD_STRIKE_RANGE]", CombatResult[CombatResultParameters.WMD_STRIKE_RANGE])
	print("CombatResult[CombatResultParameters.DAMAGE_MEMBER_COUNT]", CombatResult[CombatResultParameters.DAMAGE_MEMBER_COUNT])
	print("CombatResult[CombatResultParameters.VISUALIZE]", CombatResult[CombatResultParameters.VISUALIZE])
	print("CombatResult[CombatResultParameters.ATTACKER_ADVANCED_DURING_VISUALIZATION]", CombatResult[CombatResultParameters.ATTACKER_ADVANCED_DURING_VISUALIZATION])
	print(" ")
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].type", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].type)	-- unit (1), city (3), or encamp (3)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].id", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].id)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_SUB_TYPE]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_SUB_TYPE])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.MAX_HIT_POINTS]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.MAX_HIT_POINTS])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DAMAGE_TO]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.FINAL_DAMAGE_TO]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.FINAL_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.EXPERIENCE_CHANGE]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.EXPERIENCE_CHANGE])
	print("CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ERA]", CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ERA])
	print(" ")
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type)	-- unit (1), city (3), or encamp (3)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].id", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].id)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].player", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].player)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_SUB_TYPE]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_SUB_TYPE])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_HIT_POINTS]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_HIT_POINTS])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DAMAGE_TO]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DAMAGE_TO])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DAMAGE_TO]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.EXPERIENCE_CHANGE]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.EXPERIENCE_CHANGE])
	print("CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ERA]", CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ERA])
	print(" ")
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].type", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].type)	-- unit (1), city (3), or encamp (3)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].id", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].id)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].player", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ID].player)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_STRENGTH]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_STRENGTH])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.STRENGTH_MODIFIER]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.STRENGTH_MODIFIER])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_SUB_TYPE]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_SUB_TYPE])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.MAX_HIT_POINTS]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.MAX_HIT_POINTS])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.DAMAGE_TO]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.FINAL_DAMAGE_TO]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.FINAL_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.MAX_DEFENSE_HIT_POINTS])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.EXPERIENCE_CHANGE]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.EXPERIENCE_CHANGE])
	print("CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ERA]", CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.ERA])
	print(" ")
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].type", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].type)	-- unit (1), city (3), or encamp (3)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].id", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].id)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].player", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ID].player)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.LOCATION].x", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.LOCATION].y", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.LOCATION].x)
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_STRENGTH]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_STRENGTH])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.STRENGTH_MODIFIER]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.STRENGTH_MODIFIER])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_SUB_TYPE]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_SUB_TYPE])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.MAX_HIT_POINTS]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.MAX_HIT_POINTS])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.DAMAGE_TO]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.DAMAGE_TO])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.FINAL_DAMAGE_TO]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.FINAL_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.MAX_DEFENSE_HIT_POINTS])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.EXPERIENCE_CHANGE]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.EXPERIENCE_CHANGE])
	print("CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ERA]", CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.ERA])
	print("========================================================================================")
end

function ExpectedDmg(AttStr, DefStr, WallMaxHP, WallDamage, HasTower)
	local NormalDmg = 29.5*2.6553^(0.04*(AttStr-DefStr))
	local WallAdjustedDmg = NormalDmg
	if WallMaxHP ~= nil and WallMaxHP > 0 and (HasTower == nil or HasTower == false) then
		WallAdjustedDmg = WallAdjustedDmg * WallDamage / WallMaxHP
	end
	return string.format("%.1f", WallAdjustedDmg)
end

function ExpectedWallDmg(AttStr, DefStr, CombatType, HasRam)
	local NormalDmg = 29.5*2.6553^(0.04*(AttStr-DefStr))
	local WallDmg = NormalDmg
	if CombatType == CombatTypes.MELEE and (HasRam == nil or HasRam == false) then
		WallDmg = WallDmg * 0.15
	elseif CombatType == CombatTypes.RANGED then
		WallDmg = WallDmg * 0.50
	end
	return string.format("%.1f", WallDmg)
end

function DB_CombatIcon(CombatType, WMDType)
	if CombatType == CombatTypes.MELEE then
		return "[ICON_Strength]"
	elseif CombatType == CombatTypes.RANGED then
		return "[ICON_Ranged]"
	elseif CombatType == CombatTypes.BOMBARD then
		return "[ICON_Bombard]"
	elseif CombatType == CombatTypes.RELIGIOUS then
		return "[ICON_Religion]"
	elseif CombatType == CombatTypes.AIR then
		return "[ICON_Range]"
	elseif CombatType == CombatTypes.ICBM and WMDType == 0 then
		return "[ICON_Nuclear]"
	elseif CombatType == CombatTypes.ICBM then
		return "[ICON_ThermoNuclear]"
	end
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function DB_CombatantShortName(CombatResult, Combatant)
	local a = ""
	if CombatResult[Combatant][CombatResultParameters.ID].type == 3 then -- type 3 = district (city or encampment)
		local district = CityManager.GetDistrictAt(CombatResult[Combatant][CombatResultParameters.LOCATION].x, CombatResult[Combatant][CombatResultParameters.LOCATION].y)
		if district:GetType() == 3 then						-- district type 3 = encampment >> "Paris Encampment"
			local city = district:GetCity() ;
			a = a .. Locale.Lookup(city:GetName())
			a = a .. " Encampment"
		else												-- district type = city >> "Paris"
			local city = Cities.GetCityInPlot(CombatResult[Combatant][CombatResultParameters.LOCATION].x, CombatResult[Combatant][CombatResultParameters.LOCATION].y)
			a = a .. Locale.Lookup(city:GetName())
		end
	elseif CombatResult[Combatant][CombatResultParameters.ID].type == 1 then	-- type 1 = unit >> "French Warrior" OR "The Iron Marksmen"
		local unit = UnitManager.GetUnit(CombatResult[Combatant][CombatResultParameters.ID].player, CombatResult[Combatant][CombatResultParameters.ID].id)
		local name = Locale.Lookup(unit:GetName())
		local vetname = unit:GetExperience():GetVeteranName()

		if vetname ~= "" then
			a = a .. vetname
		elseif PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() == 'CIVILIZATION_FREE_CITIES' then
			a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_NAME")
			a = a .. ' ' .. name
		else
			a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_ADJECTIVE")
			a = a .. ' ' .. name
		end
	end
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function DB_CombatantFinalHealth(CombatResult, Combatant)
	if Combatant == CombatResultParameters.ATTACKER and CombatResult[CombatResultParameters.DEFENDER_RETALIATES] == false then
		return ""
	end

	local EndHP = CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[Combatant][CombatResultParameters.FINAL_DAMAGE_TO]
	if EndHP > 0 then
		return " <" .. EndHP .. "[ICON_Damaged]>"
	else
		return ""
	end
end

function DB_CombatantLongName(CombatResult, Combatant)
	local a = DB_CombatantShortName(CombatResult, Combatant)

	if CombatResult[Combatant][CombatResultParameters.ID].type == 1 then
		local unit = UnitManager.GetUnit(CombatResult[Combatant][CombatResultParameters.ID].player, CombatResult[Combatant][CombatResultParameters.ID].id)
		local level = unit:GetExperience():GetLevel()
		local milform = unit:GetMilitaryFormation()
		local unitType = unit:GetUnitType()
		local unitInfo = GameInfo.Units[unitType]
		local name = Locale.Lookup(unit:GetName())
		local vetname = unit:GetExperience():GetVeteranName()

		if PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() == 'CIVILIZATION_FREE_CITIES' then
			a = Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_NAME")
		else
			a = Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[Combatant][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_ADJECTIVE")
		end
		a = a .. ' ' .. Locale.Lookup("LOC_" .. unitInfo.UnitType .. "_NAME")

		if vetname ~= "" then
			a = a .. ' "' .. vetname .. '"'
		end

		if milform == MilitaryFormationTypes.CORPS_FORMATION then
			a = a .. " [ICON_Corps]"
		elseif milform == MilitaryFormationTypes.ARMY_FORMATION then
			a = a .. " [ICON_Army]"
		end

		a = a .. " (Lvl " .. level .. ")"
	end
	return a
end

function DB_Combat_Summary(CombatResult, AttackerOrDefender) -- AttackerOrDefender = 'A' or 'D'
	-- "French Warrior attacked Greek Slinger" || "Greek Slinger attacked Paris" || "Paris Encampment attacked Greek Slinger" || "Greek Warrior captured Paris"
	local a = ''
	if AttackerOrDefender == 'A' then
		a = a .. "[COLOR:" .. DB_MyRGB .. ",255]"
	else
		a = a .. "[COLOR:" .. DB_EnemyRGB .. ",255]"
	end
	a = a .. DB_CombatantShortName(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. DB_CombatantFinalHealth(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. "[ENDCOLOR]"

	local EndHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DAMAGE_TO]

	-- "attacked"
	if CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type == 3 and CombatResult[CombatResultParameters.ATTACKER_ADVANCES] then
		a = a .. " captured "
	elseif CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type == 1 and EndHP <= 0 then
		a = a .. " killed "
	else
		a = a .. " attacked "
	end

	-- defender name
	if AttackerOrDefender == 'D' then
		a = a .. "[COLOR:" .. DB_MyRGB .. ",255]"
	else
		a = a .. "[COLOR:" .. DB_EnemyRGB .. ",255]"
	end
	a = a .. DB_CombatantShortName(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. DB_CombatantFinalHealth(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. "[ENDCOLOR]"
	
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function DB_CombatantLocationString(CombatResult, Combatant)
	local a = ""
	if DB_HasMetAllMajors() then
		if Combatant == CombatResultParameters.ATTACKER then
			a = a .. "from ("
		else
			a = a .. "at ("
		end
		a = a .. CombatResult[Combatant][CombatResultParameters.LOCATION].x .. ", " .. CombatResult[Combatant][CombatResultParameters.LOCATION].y .. ") "
	end
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function DB_CombatStrengthString(CombatResult, Combatant)
	local a = "with "
	a = a .. tostring(CombatResult[Combatant][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[Combatant][CombatResultParameters.STRENGTH_MODIFIER])
	if Combatant == CombatResultParameters.ATTACKER then
		a = a .. DB_CombatIcon(CombatResult[CombatResultParameters.COMBAT_TYPE], CombatResult[CombatResultParameters.WMD_TYPE])
	elseif Combatant == CombatResultParameters.DEFENDER then
		a = a .. "[ICON_Strength]"
	elseif Combatant == CombatResultParameters.INTERCEPTOR then
		a = a .. "[ICON_AntiAir_Large]"
	else
		a = a .. "[ICON_AntiAir_Large]"
	end
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function DB_HealthChangeString(CombatResult, Combatant)
	local MaxHP = CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS]
	local StartHP = CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[Combatant][CombatResultParameters.FINAL_DAMAGE_TO] + CombatResult[Combatant][CombatResultParameters.DAMAGE_TO]
	local NewDamage = CombatResult[Combatant][CombatResultParameters.DAMAGE_TO]
	local EndHP = CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[Combatant][CombatResultParameters.FINAL_DAMAGE_TO]
	if EndHP < 0 then
		EndHP = 0
	end

	local ExpectedDamage = ""
	if Combatant == CombatResultParameters.ATTACKER then
		ExpectedDamage = ExpectedDmg(CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER])
	elseif Combatant == CombatResultParameters.DEFENDER then
		ExpectedDamage = ExpectedDmg(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS], CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO])
	end

	local a = "[NEWLINE]"
	if Combatant == CombatResultParameters.ATTACKER and CombatResult[CombatResultParameters.DEFENDER_RETALIATES] == false then		-- ranged attack
		return ""
	else
		a = a .. tostring(StartHP) .. "[ICON_Damaged] - "
		a = a .. tostring(NewDamage) .. " Dmg "
		a = a .. "(expected " .. tostring(ExpectedDamage) .. ") = "
		a = a .. EndHP
		
		if CombatResult[Combatant][CombatResultParameters.ID].type == 1 and EndHP > 0 then
			a = a .. "[ICON_Damaged]"
		end
	end
	return a
end

-- Combatant = CombatResultParameters.ATTACKER, CombatResultParameters.DEFENDER, CombatResultParameters.ANTI_AIR, or CombatResultParameters.INTERCEPTOR
function DB_XPChangeString(CombatResult, Combatant)
	local a = ""
	if CombatResult[Combatant][CombatResultParameters.ID].type == 1 and CombatResult[Combatant][CombatResultParameters.MAX_HIT_POINTS] <= CombatResult[Combatant][CombatResultParameters.FINAL_DAMAGE_TO] then		-- don't print for a dead unit
		a = ""
	elseif CombatResult[Combatant][CombatResultParameters.EXPERIENCE_CHANGE] > 0 or CombatResult[Combatant][CombatResultParameters.ID].type == 1 then		-- print if there's XP or if it's an alive unit (they can have 0 if they are sitting on a promotion)
		a = "[NEWLINE]+" .. CombatResult[Combatant][CombatResultParameters.EXPERIENCE_CHANGE] .. "xp"
	end
	return a
end

function DB_AntiAirString(CombatResult)
	local a = ""
	if CombatResult[CombatResultParameters.COMBAT_TYPE] == CombatTypes.AIR and CombatResult[CombatResultParameters.ANTI_AIR][CombatResultParameters.COMBAT_STRENGTH] > 0 then
		a = a .. "[NEWLINE]Anti-Air: " .. DB_CombatStrengthString(CombatResult, CombatResultParameters.ANTI_AIR)
		a = a .. " did "
		a = a .. tostring(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DAMAGE_TO])
		a = a .. " Dmg"
	end
	return a
end

function DB_InterceptorString(CombatResult)
	local a = ""
	if CombatResult[CombatResultParameters.COMBAT_TYPE] == CombatTypes.AIR and CombatResult[CombatResultParameters.INTERCEPTOR][CombatResultParameters.COMBAT_STRENGTH] > 0 then
		a = a .. "[NEWLINE]Interceptor: " .. DB_CombatStrengthString(CombatResult, CombatResultParameters.INTERCEPTOR)
		a = a .. " did "
		a = a .. tostring(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.DAMAGE_TO])
		a = a .. " Dmg"
	end
	return a
end

function DB_WallString(CombatResult)
	local a = ""
	if CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS] > 0 then
		local MaxHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS]
		local StartHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO] + CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO]
		local NewDamage = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.DEFENSE_DAMAGE_TO]
		local EndHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_DEFENSE_HIT_POINTS] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DEFENSE_DAMAGE_TO]
		if EndHP < 0 then
			EndHP = 0
		end

		local ExpectedDamage = ExpectedWallDmg(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.COMBAT_STRENGTH] + CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.STRENGTH_MODIFIER], CombatResult[CombatResultParameters.COMBAT_TYPE])

		a = a .. "[NEWLINE]Wall: "
		a = a .. tostring(StartHP) .. "[ICON_Fortified] - "
		a = a .. tostring(NewDamage) .. " Dmg "
		a = a .. "(expected " .. tostring(ExpectedDamage) .. ") = "
		a = a .. EndHP .. "[ICON_Fortified]"
	end
	return a
end


function DB_AttackerDetails(CombatResult, AttackerOrDefender)	-- AttackerOrDefender = 'A' or 'D'
	local a = ''
	if AttackerOrDefender == 'A' then
		a = a .. "[COLOR:" .. DB_MyRGB .. ",255]"
	else
		a = a .. "[COLOR:" .. DB_EnemyRGB .. ",255]"
	end
	a = a .. DB_CombatantLongName(CombatResult, CombatResultParameters.ATTACKER) .. " attacked "
	a = a .. DB_CombatantLocationString(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. DB_CombatStrengthString(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. DB_HealthChangeString(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. DB_XPChangeString(CombatResult, CombatResultParameters.ATTACKER)
	a = a .. DB_AntiAirString(CombatResult)
	a = a .. DB_InterceptorString(CombatResult)
	a = a .. "[ENDCOLOR]"
	return a
end

function DB_DefenderDetails(CombatResult, AttackerOrDefender)	-- AttackerOrDefender = 'A' or 'D'
	local a = ''
	if AttackerOrDefender == 'D' then
		a = a .. "[COLOR:" .. DB_MyRGB .. ",255]"
	else
		a = a .. "[COLOR:" .. DB_EnemyRGB .. ",255]"
	end
	a = a .. DB_CombatantLongName(CombatResult, CombatResultParameters.DEFENDER) .. " defended "
	a = a .. DB_CombatantLocationString(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. DB_CombatStrengthString(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. DB_HealthChangeString(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. DB_XPChangeString(CombatResult, CombatResultParameters.DEFENDER)
	a = a .. DB_WallString(CombatResult)
	a = a .. "[ENDCOLOR]"
	return a
end


function DB_Combat(CombatResult)
	if not GameConfiguration.GetValue("DB_BATTLE_NOTIFICATIONS") then return end

	if CombatResult == nil then print("CombatResult is nil") return end
	if CombatResultParameters == nil then print("CombatResultParameters is nil") return end

	if CombatResult[-1480090105] > -1 then		-- CombatResultParameters.WMD_TYPE = -1480090105 (sometimes CombatResultParameters.WMD_TYPE is nil)
		DB_Combat_WMD(CombatResult)
		return
	end
	
-- DB_Combat_DebugPrintAllCombatResult(CombatResult)

	local AttackerNotificationData = {}
	local DefenderNotificationData = {}
	AttackerNotificationData[ParameterTypes.LOCATION] = { x = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x, y = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].y }
	AttackerNotificationData[ParameterTypes.MESSAGE] = DB_Combat_Summary(CombatResult, 'A')
	AttackerNotificationData[ParameterTypes.SUMMARY] = DB_AttackerDetails(CombatResult, 'A') .. "[NEWLINE][NEWLINE]" .. DB_DefenderDetails(CombatResult, 'A')
	NotificationManager.SendNotification(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player, NotificationTypes.USER_DEFINED_3, AttackerNotificationData)	-- USER_DEFINED_3 for attacker reports

	DefenderNotificationData[ParameterTypes.LOCATION] = { x = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].x, y = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.LOCATION].y }
	DefenderNotificationData[ParameterTypes.MESSAGE] = DB_Combat_Summary(CombatResult, 'D')
	DefenderNotificationData[ParameterTypes.SUMMARY] = DB_AttackerDetails(CombatResult, 'D') .. "[NEWLINE][NEWLINE]" .. DB_DefenderDetails(CombatResult, 'D')
	NotificationManager.SendNotification(CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].player, DB_DefenderNotificationType(CombatResult), DefenderNotificationData)

	-- drop pins on attacker tile (for defender to see)
-- DB_Combat_DebugPrintNotificationData(notificationData)


end

function DB_Combat_WMD(CombatResult)
	local notificationData = {}
	notificationData[ParameterTypes.LOCATION] = { x = CombatResult[CombatResultParameters.LOCATION].x, y = CombatResult[CombatResultParameters.LOCATION].y }

	local a = ""
	local icon = ""

	if PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() == 'CIVILIZATION_FREE_CITIES' then
		a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_NAME")
	else
		a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_ADJECTIVE")
	end
	a = a .. " "
	if CombatResult[CombatResultParameters.WMD_TYPE] == 0 then
		a = a .. "Nuclear"
		icon = "[ICON_Nuclear]"
	else
		a = a .. "Thermonuclear"
		icon = "[ICON_ThermoNuclear]"
	end
	a = a .. " weapon detonated"
	notificationData[ParameterTypes.MESSAGE] = a

	a = "Source" .. icon .. ": "

	if CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].type == 1 then
		local Attacker = Players[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]
		local Unit = Attacker:GetUnits():FindID(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].id)
		if PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() == 'CIVILIZATION_FREE_CITIES' then
			a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_NAME")
		else
			a = a .. Locale.Lookup("LOC_" .. PlayerConfigurations[CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player]:GetCivilizationTypeName() .. "_ADJECTIVE")
		end
		a = a .. " "
		a = a .. "{LOC_" .. GetUnitType(CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].player, CombatResult[CombatResultParameters.ATTACKER][CombatResultParameters.ID].id) .. "_NAME} "
		a = a .. "(at " .. Unit:GetX() .. "," .. Unit:GetY() .. ")"
	elseif CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].x >= 0 then
		a = a .. "Missile Silo at (" .. CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].x .. ", " .. CombatResult[CombatResultParameters.ALT_SOURCE_LOCATION].y .. ")"
	else
		a = a .. "???"
	end
	a = a .. "[NEWLINE]"
	a = a .. "Destination: "
	local Plot = Map.GetPlot(CombatResult[CombatResultParameters.LOCATION].x, CombatResult[CombatResultParameters.LOCATION].y)
	if Plot:IsCity() then
		local City = CityManager.GetCityAt(CombatResult[CombatResultParameters.LOCATION].x, CombatResult[CombatResultParameters.LOCATION].y)
		a = a .. "{" .. City:GetName() .. "} "
	end

	a = a .. "(" .. CombatResult[CombatResultParameters.LOCATION].x .. ", " .. CombatResult[CombatResultParameters.LOCATION].y .. ")"
	notificationData[ParameterTypes.SUMMARY] = a

	local AllPlayers = PlayerManager.GetAliveMajors()
	for _, Player in pairs(AllPlayers) do
		if CombatResult[CombatResultParameters.WMD_TYPE] == 0 then
			NotificationManager.SendNotification(Player:GetID(), NotificationTypes.USER_DEFINED_1, notificationData)	-- USER_DEFINED_1 for nuke reports
		else
			NotificationManager.SendNotification(Player:GetID(), NotificationTypes.USER_DEFINED_2, notificationData)	-- USER_DEFINED_2 for thermonuke reports
		end
	end

--[[
	-- drop pins
	print("ICON_" .. GameInfo.Projects["PROJECT_OPERATION_IVY"].ProjectType)
	local pPlayerCfg = PlayerConfigurations[0]
	local pMapPin = pPlayerCfg:GetMapPin(CombatResult[CombatResultParameters.LOCATION].x, CombatResult[CombatResultParameters.LOCATION].y)
	local playerMapPins = pPlayerCfg:GetMapPins()
	print("pMapPin", pMapPin)
	for key, value in pairs(pMapPin) do
		print("-",key, value)
	end
	print("pMapPin:SetName()", pMapPin:SetName("test"))
	print("pMapPin:SetIconName()", pMapPin:SetIconName("ICON_" .. GameInfo.Projects["PROJECT_OPERATION_IVY"].ProjectType))
	print("pMapPin:GetName(test)", pMapPin:GetName("test"))
	print("pMapPin:GetName()", pMapPin:GetName())
	print("pMapPin:GetIconName(ICON_PROJECT_OPERATION_IVY)", pMapPin:GetIconName("ICON_" .. GameInfo.Projects["PROJECT_OPERATION_IVY"].ProjectType))
	print("pMapPin:GetIconName()", pMapPin:GetIconName())
	print("pMapPin:GetID()", pMapPin:GetID())
--	print("pMapPin:GetVisibility()", pMapPin:GetVisibility())
	print("pMapPin:IsVisible()", pMapPin:IsVisible())
--	print("playerMapPins[pMapPin]", playerMapPins[pMapPin])

	local mapPinEntry = GetMapPinListEntry(0, pMapPin:GetID());
	print("mapPinEntry", mapPinEntry)
	local mapPinCfg = GetMapPinConfig(0, pMapPin:GetID());
	print("mapPinCfg", mapPinCfg)
--]]

--[[
	for key, value in pairs(playerMapPins) do
		print("--", key, value)
		for key2, value2 in pairs(value) do
			print("---", key2, value2)
			print("---", value2.__instance)
			for key3, value3 in pairs(value2) do
				print("----", key3, value3)
			end
		end
	end
--]]

--[[
	local mapPinCfg = GetMapPinConfig(pinPlayerID, pinID);
	if(mapPinCfg:GetName() ~= nil) then
		instance.MapPinButton:SetText(mapPinCfg:GetName());
	else
		instance.MapPinButton:SetText(Locale.Lookup("LOC_MAP_PIN_DEFAULT_NAME", mapPinCfg:GetID()));
	end
	instance.MapPinButton:SetOffsetVal(instance.PlayerString:GetSizeX(), 0);
	instance.MapPinButton:SetSizeX(instance.MapPinButton:GetTextControl():GetSizeX()+BUTTON_TEXT_PADDING);
	
	-- LuaEvents.MapPinPopup_RequestMapPin(CombatResult[CombatResultParameters.LOCATION].x+1, CombatResult[CombatResultParameters.LOCATION].y+1)


	if(imageControl ~= nil and mapPinIconName ~= nil) then
		local iconName = mapPinIconName;
		if(not imageControl:SetIcon(iconName)) then
			imageControl:SetIcon(MapTacks.UNKNOWN);
		end
	end
--]]

end

function DB_DefenderNotificationType(CombatResult)
	local EndHP = CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.MAX_HIT_POINTS] - CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.FINAL_DAMAGE_TO]

	if CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type == 3 and CombatResult[CombatResultParameters.ATTACKER_ADVANCES] then
		-- if city, and attacker advanced
		return NotificationTypes.USER_DEFINED_7
	elseif CombatResult[CombatResultParameters.DEFENDER][CombatResultParameters.ID].type == 3 then
		-- if city
		return NotificationTypes.USER_DEFINED_5
	elseif EndHP <= 0 then
		-- not city (must be unit), no HP left
		return NotificationTypes.USER_DEFINED_6
	else
		-- not city, has HP
		return NotificationTypes.USER_DEFINED_4
	end 
end

-- Add vision with NOTIFICATION_USER_DEFINED_1, 2, and 6
function DB_OnNotificationAdded(playerID, notificationID) 
	-- 2021-07-21: disabling in Play By Cloud because it leads to stuck vision issues
	-- 2021-10-18: disabling in HotSeat for the same reason
	if not GameConfiguration.GetValue("DB_BATTLE_NOTIFICATIONS") or GameConfiguration.IsPlayByCloud() or GameConfiguration.IsHotseat() or not DB_GOLD.DB_RevealPlots then return end

	if playerID == nil or Game == nil then return end

	if playerID ~= Game.GetLocalPlayer() then return end 

	local pPlayer : table = PlayerConfigurations[playerID]

	if (not pPlayer:IsAlive()) then return end 

	local pNotification : table = NotificationManager.Find( playerID, notificationID )

	if pNotification == nil then return end
		
	if (not pNotification:IsVisibleInUI()) then return end

	if (not pNotification:IsLocationValid()) then return end

	local x, y = pNotification:GetLocation()
	if pNotification:GetTypeName() == "NOTIFICATION_USER_DEFINED_1" then
		DB_GOLD.DB_RevealPlots(playerID, x, y, DB_NuclearRadius)
	elseif pNotification:GetTypeName() == "NOTIFICATION_USER_DEFINED_2" then
		DB_GOLD.DB_RevealPlots(playerID, x, y, DB_ThermonuclearRadius)
	elseif pNotification:GetTypeName() == "NOTIFICATION_USER_DEFINED_6" then
		DB_GOLD.DB_RevealPlots(playerID, x, y, DB_DefenderRadius)
	end
end

function PlaceLeaderIcons(LeaderIconIM, NameStack, ListInstance, TechOrCivicType, TechOrCivicID, SciOrCulture, OffsetX, OffsetY)
	if LeaderIconIM[TechOrCivicType] == nil then
		LeaderIconIM[TechOrCivicType] = InstanceManager:new("DB_LFOC_LeaderIconInstance", "Icon", NameStack)
	end
	LeaderIconIM[TechOrCivicType]:ResetInstances()

	if not GameConfiguration.GetValue("DB_LEARN_FROM_OTHER_CIVS") then return end

	local LocalPlayerID = Game.GetLocalPlayer()
	local AllPlayers = PlayerManager.GetAliveMajors()
	local Encounters = {}
	for _, Player in pairs(AllPlayers) do
		local PlayerID = Player:GetID()
		local IsNotLocalPlayer = PlayerID ~= LocalPlayerID
		local HasMet = Player:GetDiplomacy():HasMet(LocalPlayerID)
		local HasIt = false
		if SciOrCulture == 'S' then
			HasIt = Player:GetTechs():HasTech(TechOrCivicID)
		else
			HasIt = Player:GetCulture():HasCivic(TechOrCivicID)
		end
		
		if IsNotLocalPlayer and HasMet and HasIt then
			local temp = { PlayerID = PlayerID, OpponentName = PlayerConfigurations[PlayerID]:GetCivilizationTypeName() }
			temp.EncounterPoints = GetEncounterPoints(LocalPlayerID, PlayerID, 1, SciOrCulture)
			table.insert(Encounters, temp)
		end
		table.sort(Encounters, function(a,b) if a.EncounterPoints == nil or a.EncounterPoints == b.EncounterPoints then return a.OpponentName < b.OpponentName else return a.EncounterPoints > b.EncounterPoints end end)
	end


	for i, Encounter in ipairs(Encounters) do
		local pPlayerConfig = PlayerConfigurations[Encounter.PlayerID]
		local instance = LeaderIconIM[TechOrCivicType]:GetInstance()
		local iconName = "ICON_" .. pPlayerConfig:GetLeaderTypeName()
		local textureOffsetX, textureOffsetY, textureSheet = IconManager:FindIconAtlas(iconName)
		instance.Icon:SetTexture(textureOffsetX, textureOffsetY, textureSheet)
		local ToolTip = ""
		_, ToolTip = GetEncounterPoints(LocalPlayerID, Encounter.PlayerID, i, SciOrCulture)
		ToolTip = "Already learned by " .. Locale.Lookup("LOC_" .. pPlayerConfig:GetCivilizationTypeName() .. "_NAME") .. ToolTip

		instance.Icon:SetToolTipString(ToolTip)
		instance.Icon:SetOffsetVal(OffsetX, OffsetY)
		instance.Icon:SetHide(false)

	end	
	
	local Turns = 0
	_, _, Turns = ProspectInformation(LocalPlayerID, TechOrCivicID, SciOrCulture)

	if ListInstance.TurnsLeft ~= nil then
		if Turns <= 0 then
			ListInstance.TurnsLeft:SetText("")
		else
			ListInstance.TurnsLeft:SetText( "[ICON_Turn]" .. tostring(Turns) )
		end
	end

	if ListInstance.Turns ~= nil then
		if Turns <= 0 then
			ListInstance.Turns:SetText("")
		else
			ListInstance.Turns:SetText(tostring(Turns) .. " TURNS")
		end
	end
end















-- --------------------------------------------------
--	Exposed Members
-- --------------------------------------------------

function ProspectInformation(ActivePlayerID, ResearchItemID, SciOrCulture, TruncateOverflow)		-- SciOrCulture = "S" or "C"
	if ActivePlayerID == -1 or Players == nil then return 0, "", 0 end
	TruncateOverflow = TruncateOverflow or false

	local ActivePlayer = Players[ActivePlayerID]
	local ActivePlayerDiplomacy = ActivePlayer:GetDiplomacy()
	local ActivePlayerResearch = {}
	local CurrentYield = 0
	local ProgLeftTotal = 0
	if SciOrCulture == "S" then
		ActivePlayerResearch = ActivePlayer:GetTechs()
		CurrentYield = ActivePlayerResearch:GetScienceYield()
		ProgLeftTotal = ActivePlayerResearch:GetResearchCost(ResearchItemID) - ActivePlayerResearch:GetResearchProgress(ResearchItemID)
	else
		ActivePlayerResearch = ActivePlayer:GetCulture()
		CurrentYield = ActivePlayerResearch:GetCultureYield()
		ProgLeftTotal = ActivePlayerResearch:GetCultureCost(ResearchItemID) - ActivePlayerResearch:GetCulturalProgress(ResearchItemID)
	end

	local Encounters = {}
	for _, Opponent in ipairs(PlayerManager.GetAliveMajors()) do
		local OpponentID = Opponent:GetID()
		if OpponentID ~= ActivePlayerID then
			if ActivePlayerDiplomacy:HasMet(OpponentID) then
				if (SciOrCulture == "S" and Opponent:GetTechs():HasTech(ResearchItemID)) or (SciOrCulture == "C" and Opponent:GetCulture():HasCivic(ResearchItemID)) then
					local temp = { OpponentName = PlayerConfigurations[OpponentID]:GetCivilizationTypeName(), EncounterPoints = GetEncounterPoints(ActivePlayerID, OpponentID, 1, SciOrCulture) }
					table.insert(Encounters, temp)
				end
			end
		end
	end
	table.sort(Encounters, function(a,b) if a.EncounterPoints == b.EncounterPoints then return a.OpponentName < b.OpponentName else return a.EncounterPoints > b.EncounterPoints end end)

	local TotalBonus = 0
	local ProgLeftNow = ProgLeftTotal
	local Notifications = {}
	for i, Encounter in ipairs(Encounters) do
		local Bonus = CurrentYield * Encounter.EncounterPoints / 100
-- Redundant Information minus
--		Bonus = Bonus * (0.5 ^ (i - 1))
		if TruncateOverflow == true then
			if ProgLeftNow <= 0 then
				Bonus = 0
			elseif Bonus > ProgLeftNow then
				Bonus = ProgLeftNow + 0.01
			end
		end
		TotalBonus = TotalBonus + Bonus
		ProgLeftNow = ProgLeftNow - Bonus

		if Bonus > 0 then
			local temp = { OpponentName = Encounter.OpponentName, Bonus = Bonus }
			table.insert(Notifications, temp)
		end
	end

	local Note = ""
	for _, Notif in ipairs(Notifications) do
		if Note ~= "" then
			Note = Note .. "[NEWLINE]"
		end
		Note = Note .. " [ICON_Bullet]+" .. string.format("%.2f", Notif.Bonus) .. " from {LOC_" .. Notif.OpponentName .. "_NAME}"
	end

	local Turns = 0
	if (CurrentYield + TotalBonus) > 0 then
		Turns = math.ceil(ProgLeftTotal / (CurrentYield + TotalBonus))
		if Turns < 1 then
			Turns = 1
		end
	end

	return TotalBonus, Note, Turns
end

function GetBoosts(ActivePlayerID, ActiveTechID, ActiveCivicID, SendNotifications)
	if ActivePlayerID == -1 then return 0, 0 end

	local ScienceBoost = 0
	local CultureBoost = 0
	local ScienceNote = ""
	local CultureNote = ""

	ScienceBoost, ScienceNote = ProspectInformation(ActivePlayerID, ActiveTechID, "S", true)
	CultureBoost, CultureNote = ProspectInformation(ActivePlayerID, ActiveCivicID, "C", true)

	if SendNotifications == true and ScienceNote ~= "" then
		SendNotification(ActivePlayerID, "Learn From Other Civs{LOC_GOLD_LABEL}", ScienceNote, "S")
	end
	if SendNotifications == true and CultureNote ~= "" then
		SendNotification(ActivePlayerID, "Learn From Other Civs{LOC_GOLD_LABEL}", CultureNote, "C")
	end

	return ScienceBoost, CultureBoost
end

function GetCivicLeft(ActivePlayerID)
	if ActivePlayerID == -1 or Players == nil then return nil end

	local ActivePlayer = Players[ActivePlayerID]
	local ActivePlayerCulture = ActivePlayer:GetCulture()
	local ActivePlayersCivicID = ActivePlayerCulture:GetProgressingCivic()
	local ActivePlayerCulProgLeft = ActivePlayerCulture:GetCultureCost(ActivePlayersCivicID) - ActivePlayerCulture:GetCulturalProgress(ActivePlayersCivicID)
	return ActivePlayerCulProgLeft
end

function GetTechLeft(ActivePlayerID)
	if ActivePlayerID == -1 or Players == nil then return nil end

	local ActivePlayer = Players[ActivePlayerID]
	local ActivePlayerTechs = ActivePlayer:GetTechs()
	local ActivePlayersTechID = ActivePlayerTechs:GetResearchingTech()
	local ActivePlayerSciProgLeft = ActivePlayerTechs:GetResearchCost(ActivePlayersTechID) - ActivePlayerTechs:GetResearchProgress(ActivePlayersTechID)
	return ActivePlayerSciProgLeft
end

function SendNotification(ActivePlayerID, Header, Body, SciOrCulture)		-- SciOrCulture = "S" or "C"
	if ActivePlayerID == -1 then return end

	local notificationData = {}
	notificationData[ParameterTypes.MESSAGE] = Header
	notificationData[ParameterTypes.SUMMARY] = Body

	if SciOrCulture == "S" then
		NotificationManager.SendNotification(ActivePlayerID, NotificationTypes.USER_DEFINED_8, notificationData)
	elseif SciOrCulture == "C" then
		NotificationManager.SendNotification(ActivePlayerID, NotificationTypes.USER_DEFINED_9, notificationData)
	end
end

function GetEncounterPoints(ActivePlayerID, OpponentID, OpponentCount, SciOrCulture)		-- OpponentCount = 1 for full bonus, 2 for half, 3 for 0.25. etc   //   SciOrCulture = "S" or "C"
-- EncounterPoints: a 0-230 scale assessing how much the opponent is sharing the details of this tech
-- Each point means a +1% boost to our nation's science
-- 0 means we haven't met them
-- 230 means we're getting the max info from them (and our own tech is getting a +230% boost)

	if ActivePlayerID == nil or ActivePlayerID == -1 or Players == nil then return 0, "" end

	local ActivePlayer = Players[ActivePlayerID]
	local ActivePlayerDiplomacy = ActivePlayer:GetDiplomacy()
	local DiplomaticVisibility = ActivePlayerDiplomacy:GetVisibilityOn(OpponentID)

	local EncounterPoints = 0																		-- start at 20 for having met them and knowing the tech exists (e.g. saw gunpowder for the first time)
	-- local TooltipBreakdown = "[NEWLINE][ICON_Bullet]+20% Met"
	local TooltipBreakdown = ""
	
	EncounterPoints = EncounterPoints + (25 * DiplomaticVisibility)									-- 15 points for each level of visibility (subsumes any seperate need for bonuses re: traders, delegations, embassies, spy listening posts, alliance level 1, printing press, and Catherine de Medici)
	if DiplomaticVisibility == 0 then
		TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+0% No Diplomatic Visibility"
	elseif DiplomaticVisibility == 1 then
		TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+25% Limited Diplomatic Visibility"
	elseif DiplomaticVisibility == 2 then
		TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+50% Open Diplomatic Visibility"
	elseif DiplomaticVisibility == 3 then
		TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+75% Secret Diplomatic Visibility"
	elseif DiplomaticVisibility == 4 then
		TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+100% Top Secret Diplomatic Visibility"
	end
	
	local AllianceType = -1
	if not GameConfiguration.GetValue("DB_TEAM_ADJUSTMENTS") then
		if Modding.IsModActive("1B28771A-C749-434B-9053-D1380C553DE9") or Modding.IsModActive("4873eb62-8ccc-4574-b784-dda455e74e68") then
			AllianceType = ActivePlayerDiplomacy:GetAllianceType(OpponentID)
			if AllianceType ~= -1 then
				local AllianceLevel = ActivePlayerDiplomacy:GetAllianceLevel(OpponentID)
				local AlliancePoints = 20 + (10 * AllianceLevel)											-- 30/40/50 for level 1, 2, 3 alliance
				if (SciOrCulture == "S" and GameInfo.Alliances[AllianceType].AllianceType == "ALLIANCE_RESEARCH") or (SciOrCulture == "C" and GameInfo.Alliances[AllianceType].AllianceType == "ALLIANCE_CULTURAL") then
					AlliancePoints = AlliancePoints * 2														-- alliance points worth double (60/80/100) when the alliance type matches
					if SciOrCulture == "S" then
						TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+" .. tostring(AlliancePoints) .. "% Level " .. tostring(AllianceLevel) .. " Research Alliance"
					else
						TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+" .. tostring(AlliancePoints) .. "% Level " .. tostring(AllianceLevel) .. " Cultural Alliance"
					end
				else
					TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+" .. tostring(AlliancePoints) .. "% Level " .. tostring(AllianceLevel) .. " Alliance"
				end
				EncounterPoints = EncounterPoints + AlliancePoints
			else
				TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+0% No Alliance"
			end
		end
		if AllianceType == -1 then
			local DipState = Players[OpponentID]:GetDiplomaticAI():GetDiplomaticStateIndex(ActivePlayerID)
			if GameInfo.DiplomaticStates[DipState].StateType == "DIPLO_STATE_DECLARED_FRIEND" then
				EncounterPoints = EncounterPoints + 10													-- 10 points for declared friendship (if not in an alliance)
				TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+10% Declared Friendship"
			else
				TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+0% No Declared Friendship"
			end
			if ActivePlayerDiplomacy:HasOpenBordersFrom(OpponentID) then
				EncounterPoints = EncounterPoints + 10													-- 10 points for open borders in their territory (if not in an alliance)
				TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+10% Open Borders (in their territory)"
			else
				TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+0% No Open Borders (in their territory)"
			end
			if ActivePlayerDiplomacy:HasDefensivePact(OpponentID) then
				EncounterPoints = EncounterPoints + 10													-- 10 points for defensive pact (if not in an alliance)
				TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+10% Defensive Pact"
			else
				TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+0% No Defensive Pact"
			end
			if ActivePlayerDiplomacy:IsFightingAnyJointWarWith(OpponentID) then
				EncounterPoints = EncounterPoints + 10													-- 10 points for joint war (if not in an alliance)
				TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+10% Joint War"
			else
				TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]+0% No Joint War"
			end
--[[
			if not ActivePlayerDiplomacy:IsAtWarWith(OpponentID) then
				local HasEnhancingGovernorPromotion = false
				local _, ActivePlayerGovernorList = ActivePlayer:GetGovernors():GetGovernorList()
				for _, AppointedGovernor in ipairs(ActivePlayerGovernorList) do
					if AppointedGovernor:IsEstablished() and AppointedGovernor:HasPromotion(DB.MakeHash("DB_GOV_PROMOTION_DIPLOMATIC_VISIBILITY")) then
						HasEnhancingGovernorPromotion = true
					end
				end

				if HasEnhancingGovernorPromotion == true then
					EncounterPoints = EncounterPoints + 20													-- 20 points for the Foreign Connections governor promotion (when not at war)
					TooltipBreakdown = TooltipBreakdown .. Locale.Lookup("[NEWLINE][ICON_Bullet]+20% {LOC_NAME_DB_GOV_PROMOTION_DIPLOMATIC_VISIBILITY} ({LOC_NAME_DB_GOVERNOR_CULTURE})")
				end
			end
--]]
		end
	end


--[[ 
	-- Redundant information
	if OpponentCount > 1 then
		local RedundantDiff = EncounterPoints
		EncounterPoints = EncounterPoints * (0.5 ^ (OpponentCount - 1))
		RedundantDiff = RedundantDiff - EncounterPoints
		TooltipBreakdown = TooltipBreakdown .. "[NEWLINE][ICON_Bullet]-" .. string.format("%.0f", RedundantDiff) .. "% Redundant Information"
	end
--]]

	TooltipBreakdown = "[NEWLINE]+" .. tostring(EncounterPoints) .. "% bonus to our research" .. TooltipBreakdown

	return EncounterPoints, TooltipBreakdown
end

function DB_DisloyalInformants_UI(ActivePlayerID)
	if (ActivePlayerID == -1 or ActivePlayerID > 62) then return nil end

	local CityVision = {}

	local AlivePlayers = PlayerManager.GetAlive()
	for _, player in ipairs(AlivePlayers) do
		if player ~= nil then
			local TargetCityOwnerID = player:GetID()
			for _, city in player:GetCities():Members() do
				local CityIdentity = city:GetCulturalIdentity()
				if CityIdentity:GetLoyalty() <= 99 then
					local Radius = 0	-- Radius = 0 for just the city center tile
					if CityIdentity:GetLoyalty() < 80 then
						Radius = 2
					elseif CityIdentity:GetLoyalty() < 90 then
						Radius = 1
					end

					for _, PressureSource in ipairs(CityIdentity:GetCityIdentityPressures()) do
						if PressureSource.CityOwner ~= TargetCityOwnerID and PressureSource.CityOwner == ActivePlayerID and PressureSource.IdentityPressureTotal > 0 then
							local temp = { PlotX = city:GetX(), PlotY = city:GetY(), Radius = Radius }
							table.insert(CityVision, temp)
						end
					end
				end

--[[
print('', '', 'CityIdentity:GetConversionOutcome()', CityIdentity:GetConversionOutcome())
print('', '', 'CityIdentity:GetLoyalty()', CityIdentity:GetLoyalty())
print('', '', 'CityIdentity:GetLoyaltyLevel()', CityIdentity:GetLoyaltyLevel())
print('', '', 'CityIdentity:GetLoyaltyPerTurn()', CityIdentity:GetLoyaltyPerTurn())
print('', '', 'CityIdentity:GetLoyaltyPerTurnStatus()', CityIdentity:GetLoyaltyPerTurnStatus())
print('', '', 'CityIdentity:GetMaxLoyalty()', CityIdentity:GetMaxLoyalty())
print('', '', 'CityIdentity:GetPotentialTransferPlayer()', CityIdentity:GetPotentialTransferPlayer())
print('', '', 'CityIdentity:GetTurnsToConversion()', CityIdentity:GetTurnsToConversion())
print('', '', 'CityIdentity:IsAlwaysFullyLoyal()', CityIdentity:IsAlwaysFullyLoyal())

print('')
print('', '', 'CityIdentity:GetIdentitySourcesBreakdown()', CityIdentity:GetIdentitySourcesBreakdown())
				for key, value in ipairs(CityIdentity:GetIdentitySourcesBreakdown()) do
					for key2, value2 in pairs(value) do
print('', '', '', value2, key2)
					end
				end

print('')
print('', '', 'CityIdentity:GetIdentitySourcesDetailedBreakdown()', CityIdentity:GetIdentitySourcesDetailedBreakdown())
				for key, value in pairs(CityIdentity:GetIdentitySourcesDetailedBreakdown()) do
					for key2, value2 in pairs(value) do
print('', '', '', value2, key2)
					end
				end
		
	
print('')
print('', '', 'CityIdentity:GetCityIdentityPressures()', CityIdentity:GetCityIdentityPressures())
				for key, value in ipairs(CityIdentity:GetCityIdentityPressures()) do
					for key2, value2 in pairs(value) do
print('', '', '', value2, key2)
					end
				end
--]]



			end		-- city loop
		end		-- player if
	end		-- player loop

	return CityVision
end

function DB_GetGoldFromForeignTourists(ActivePlayerID)
	local ActivePlayer = Players[ActivePlayerID]
	local ActivePlayerCulture = ActivePlayer:GetCulture()
	local OtherPlayerIDs = PlayerManager.GetAliveMajorIDs()
	local PerTurnSum = 0
	for _, LoopPlayerID in ipairs(OtherPlayerIDs) do
		if ActivePlayerID ~= LoopPlayerID and ActivePlayer:GetDiplomacy():HasMet(LoopPlayerID) == true then
			local Temp = ActivePlayerCulture:GetTouristsFromTooltip(LoopPlayerID)
			local z = 0
			local PerTurn = 0
			local Lifetime = 0
			for y in string.gmatch(Temp, '(%d+)') do
				if z == 0 then
					PerTurn = y
				else
					Lifetime = y
				end
				z = z + 1
			end
			PerTurnSum = PerTurnSum + PerTurn
		end
	end
	local OtherPlayers = PlayerManager.GetAliveMajorsCount() - 1
	return PerTurnSum / OtherPlayers
end

function DB_NeedToRemoveAmenities(PlayerID, CityID)
	local City = CityManager.GetCity(PlayerID, CityID)

	local Growth = City:GetGrowth()
	if Growth:GetAmenitiesLostFromWarWeariness() == nil or Growth:GetAmenitiesLostFromWarWeariness() < 1 then 
		return false
	end

	return true
end

function HasPantheon(PlayerID)
	if Players[PlayerID] == nil or Players[PlayerID]:GetReligion() == nil or Players[PlayerID]:GetReligion():GetPantheon() == nil or Players[PlayerID]:GetReligion():GetPantheon() < 0 then
		return false
	end
	return true
end

function FaithForPantheon()
	 return Game.GetReligion():GetMinimumFaithNextPantheon()
end

function IsCapital(CityID)
	local City = CityManager.GetCity(PlayerID, CityID)
	if City ~= nil then
		return City:IsCapital()
	end
	return false
end

function TechsOrCivicsMetButDontHave(ActivePlayerID, SciOrCulture)
	local AllPlayers = PlayerManager.GetAlive()
	local MetPlayersTechOrCivicList = {}

	for _, Player in pairs(AllPlayers) do
		local PlayerID = Player:GetID()
		if(PlayerID < 61) then		-- Don't learn techs from barbarians or Free Cities
			local IsNotLocalPlayer = PlayerID ~= ActivePlayerID
			local HasMet = Player:GetDiplomacy():HasMet(ActivePlayerID)

			if IsNotLocalPlayer and HasMet then
				if SciOrCulture == 'S' then
					for Tech in GameInfo.Technologies() do
						if Player:GetTechs():HasTech(Tech.Index) then
							table.insert(MetPlayersTechOrCivicList, Tech)
						end
					end
				else
					for Civic in GameInfo.Civics() do
						if Player:GetCulture():HasCivic(Civic.Index) then
							table.insert(MetPlayersTechOrCivicList, Civic)
						end
					end
				end
			end
		end
	end

	local UnknownTechOrCivicList = {}
	local ActivePlayer = Players[ActivePlayerID]
	if SciOrCulture == 'S' then
		for _, Tech in ipairs(MetPlayersTechOrCivicList) do
			if not ActivePlayer:GetTechs():HasTech(Tech.Index) then
				table.insert(UnknownTechOrCivicList, Tech)
			end
		end
	else
		for _, Civic in ipairs(MetPlayersTechOrCivicList) do
			if not ActivePlayer:GetCulture():HasCivic(Civic.Index) then
				table.insert(UnknownTechOrCivicList, Civic)
			end
		end
	end

	-- remove duplicates
	-- https://stackoverflow.com/questions/20066835/lua-remove-duplicate-elements
	local hash = {}
	local UnknownTechOrCivicListNoDups = {}

	for _, v in ipairs(UnknownTechOrCivicList) do
		if (not hash[v]) then
			UnknownTechOrCivicListNoDups[#UnknownTechOrCivicListNoDups+1] = v
			hash[v] = true
		end
	end

	return UnknownTechOrCivicListNoDups
end





function DB_Includes_UI_Init()
	DB_GOLD.ProspectInformation = ProspectInformation
	DB_GOLD.GetBoosts = GetBoosts
	DB_GOLD.GetCivicLeft = GetCivicLeft
	DB_GOLD.GetTechLeft = GetTechLeft
	DB_GOLD.SendNotification = SendNotification
	DB_GOLD.GetEncounterPoints = GetEncounterPoints
	DB_GOLD.DB_DisloyalInformants_UI = DB_DisloyalInformants_UI
	DB_GOLD.DB_GetGoldFromForeignTourists = DB_GetGoldFromForeignTourists
	DB_GOLD.DB_NeedToRemoveAmenities = DB_NeedToRemoveAmenities
	DB_GOLD.HasPantheon = HasPantheon
	DB_GOLD.FaithForPantheon = FaithForPantheon
	DB_GOLD.IsCapital = IsCapital
	DB_GOLD.TechsOrCivicsMetButDontHave = TechsOrCivicsMetButDontHave

	Events.Combat.Add(DB_Combat)
	Events.NotificationAdded.Add(DB_OnNotificationAdded)
end
DB_Includes_UI_Init()

