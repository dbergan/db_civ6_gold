-- DB - CityBannerManager.lua uses a wildcard include [include("CityBannerManager_", true);] so it should automatically include this
local BANNERTYPE_AERODROME	    = UIManager:GetHash("BANNERTYPE_AERODROME");
local PLOT_HIDDEN				:number	= 0;
local PLOT_REVEALED				:number	= 1;
local PLOT_VISIBLE				:number	= 2;
local m_HexColoringReligion		: number = UILens.CreateLensLayerHash("Hex_Coloring_Religion");
local m_CulturalIdentityLens	: number = UILens.CreateLensLayerHash("Cultural_Identity_Lens");
local m_isReligionLensActive = false
local m_isLoyaltyLensActive = false

PRIOR_OnLensLayerOn = OnLensLayerOn
function OnLensLayerOn(layerNum)
	if layerNum == m_HexColoringReligion then
		m_isReligionLensActive = true
	elseif layerNum == m_CulturalIdentityLens then
		m_isLoyaltyLensActive = true;
	end
	PRIOR_OnLensLayerOn(layerNum)
end

PRIOR_OnLensLayerOff = OnLensLayerOff
function OnLensLayerOff(layerNum)
	if layerNum == m_HexColoringReligion then
		m_isReligionLensActive = false
	elseif layerNum == m_CulturalIdentityLens then
		m_isLoyaltyLensActive = false;
	end
	PRIOR_OnLensLayerOff(layerNum)
end

function CityBanner:UpdateStats()
	if Modding.IsModActive("4873eb62-8ccc-4574-b784-dda455e74e68") then
		self:DB_UpdateStats_XP2()
	elseif Modding.IsModActive("1B28771A-C749-434B-9053-D1380C553DE9") then
		self:DB_UpdateStats_XP1()
	else
		self:DB_UpdateStats_Base()
	end
end

function CityBanner:UpdateDetails()
	if Modding.IsModActive("4873eb62-8ccc-4574-b784-dda455e74e68") then
		self:DB_UpdateDetails_XP2()
	elseif Modding.IsModActive("1B28771A-C749-434B-9053-D1380C553DE9") then
		self:DB_UpdateDetails_XP1()
	end
end

function CityBanner:UpdateEncampmentBanner()
	if Modding.IsModActive("4873eb62-8ccc-4574-b784-dda455e74e68") then
		self:DB_UpdateEncampmentBanner_XP2()
	elseif Modding.IsModActive("1B28771A-C749-434B-9053-D1380C553DE9") then
		self:DB_UpdateEncampmentBanner_XP1()
	else
		self:DB_UpdateEncampmentBanner_Base()
	end
end

function CityBanner:UpdateInfo(pCity)
	if Modding.IsModActive("4873eb62-8ccc-4574-b784-dda455e74e68") then
		self:DB_UpdateInfo_XP2(pCity)
	elseif Modding.IsModActive("1B28771A-C749-434B-9053-D1380C553DE9") then
		self:DB_UpdateInfo_XP1(pCity)
	end
end

if Modding.IsModActive("4873eb62-8ccc-4574-b784-dda455e74e68") and GameConfiguration.GetValue("DB_REMOVE_FOREIGN_INFO") then
	function CityBanner:UpdateReligion()
		local pCity				:table = self:GetCity();
		local pCityReligion		:table = pCity:GetReligion();
		local localPlayerID		:number = Game.GetLocalPlayer();
		local eMajorityReligion	:number = pCityReligion:GetMajorityReligion();

		self.m_eMajorityReligion = eMajorityReligion;
		self:UpdateInfo(pCity);

		local cityInst			:table = self.m_Instance;
		if cityInst.ReligionInfo then
			cityInst.ReligionInfo.ReligionInfoContainer:SetHide(true)
		end
		local religionsInCity	:table = pCityReligion:GetReligionsInCity();

		-- Hide the meter and bail out if the religion lens isn't active
		if(not m_isReligionLensActive or table.count(religionsInCity) == 0) then
			return
		end
	
		-- Update religion icon + religious pressure animation
		local majorityReligionColor:number = COLOR_RELIGION_DEFAULT;
		if(eMajorityReligion >= 0) then
			majorityReligionColor = UI.GetColorValue(GameInfo.Religions[eMajorityReligion].Color);
		end
	
		-- Preallocate total fill so we can stagger the meters
		local totalFillPercent:number = 0;
		local iCityPopulation:number = pCity:GetPopulation();

		-- Get a list of religions present in this city
		local activeReligions:table = {};
		local numOfActiveReligions:number = 0;
		local pReligionsInCity:table = pCityReligion:GetReligionsInCity();
		for _, cityReligion in pairs(pReligionsInCity) do
			local religion:number = cityReligion.Religion;
			if(religion >= 0) then
				local followers:number = cityReligion.Followers;
				local fillPercent:number = followers / iCityPopulation;
				totalFillPercent = totalFillPercent + fillPercent;

				table.insert(activeReligions, {
					Religion=religion,
					Followers=followers,
					Pressure=pCityReligion:GetTotalPressureOnCity(religion),
					LifetimePressure=cityReligion.Pressure,
					FillPercent=fillPercent,
					Color=GameInfo.Religions[religion].Color });

				numOfActiveReligions = numOfActiveReligions + 1;
			end
		end

		-- Sort religions by largest number of followers
		table.sort(activeReligions, function(a,b) return a.Followers > b.Followers; end);

		-- After sort update accumulative fill percent
		local accumulativeFillPercent = 0.0;
		for i, religion in ipairs(activeReligions) do
			accumulativeFillPercent = accumulativeFillPercent + religion.FillPercent;
			religion.AccumulativeFillPercent = accumulativeFillPercent;
		end

		if(table.count(activeReligions) > 0) then
			local localPlayerVis:table = PlayersVisibility[localPlayerID];
			if (localPlayerVis ~= nil) then
				-- Holy sites get a different color and texture
				local holySitePlotIDs:table = {};
				local cityDistricts:table = pCity:GetDistricts();
				local playerDistricts:table = self.m_Player:GetDistricts();
				for i, district in cityDistricts:Members() do
					local districtType:string = GameInfo.Districts[district:GetType()].DistrictType;
					if(districtType == "DISTRICT_HOLY_SITE") then
						local locX:number = district:GetX();
						local locY:number = district:GetY();
						if localPlayerVis:IsVisible(locX, locY) then
							local plot:table  = Map.GetPlot(locX, locY);
							local holySiteFaithYield:number = district:GetReligionHealRate();
							SpawnHolySiteIconAtLocation(locX, locY, "+" .. holySiteFaithYield);
							holySitePlotIDs[plot:GetIndex()] = true;
						end
						break;
					end
				end

				-- Color hexes in this city the same color as religion
				local plots:table = Map.GetCityPlots():GetPurchasedPlots(pCity);
				if(table.count(plots) > 0) then
					UILens.SetLayerHexesColoredArea( m_HexColoringReligion, localPlayerID, plots, majorityReligionColor );
				end
			end
		end
	end
end


if Modding.IsModActive("4873eb62-8ccc-4574-b784-dda455e74e68") and GameConfiguration.GetValue("DB_REMOVE_FOREIGN_INFO") then
	function CityBanner:UpdateLoyalty()
		-- Always update the loyalty warning, even if the lens isnt active
		self:UpdateLoyaltyWarning();

		local instance:table = self.m_Instance.LoyaltyInfo;
		if instance then
			if not m_isLoyaltyLensActive then
				instance.Top:SetHide(true);
				return;
			end
			local pCity:table = self:GetCity();
			if pCity then
				local pCityCulturalIdentity:table = pCity:GetCulturalIdentity();
				if pCityCulturalIdentity then
					local ownerID:number = pCity:GetOwner();

					local playerIdentitiesInCity = pCityCulturalIdentity:GetPlayerIdentitiesInCity();
					local cityIdentityPressures = pCityCulturalIdentity:GetCityIdentityPressures();
					local identitySourcesBreakdown = pCityCulturalIdentity:GetIdentitySourcesBreakdown();

					-- Update owner icon
					local pOwnerConfig:table = PlayerConfigurations[ownerID];
					local ownerIcon:string = "ICON_" .. pOwnerConfig:GetCivilizationTypeName();
					local ownerSecondaryColor, ownerPrimaryColor = UI.GetPlayerColors( ownerID );
					local ownerCivIconTooltip:string = Locale.Lookup("LOC_LOYALTY_CITY_IS_LOYAL_TO_TT", pOwnerConfig:GetCivilizationDescription());
					instance.OwnerCivIcon:SetIcon(ownerIcon);
					instance.OwnerCivIcon:SetColor(ownerPrimaryColor);
					instance.OwnerCivIcon:SetToolTipString(ownerCivIconTooltip);
					instance.OwnerCivIconBacking:SetColor(ownerSecondaryColor);
					instance.OwnerCivIconExtended:SetIcon(ownerIcon);
					instance.OwnerCivIconExtended:SetColor(ownerPrimaryColor);
					instance.OwnerCivIconExtended:SetToolTipString(ownerCivIconTooltip);
					instance.OwnerCivIconBackingExtended:SetColor(ownerSecondaryColor);

					-- Update potential transfer player icon
					local transferPlayerID:number = pCityCulturalIdentity:GetPotentialTransferPlayer();
					if transferPlayerID ~= -1 then
						instance.TopCivIconBacking:SetHide(false);
						instance.TopCivIconBackingExtended:SetHide(false);

						local pTopConfig:table = PlayerConfigurations[transferPlayerID];
						local topIcon:string = "ICON_" .. pTopConfig:GetCivilizationTypeName();
						local topSecondaryColor, topPrimaryColor = UI.GetPlayerColors( transferPlayerID );
						local topCivIconTooltip:string = Locale.Lookup("LOC_LOYALTY_CITY_WILL_FALL_TO_TT", pTopConfig:GetCivilizationDescription());
						instance.TopCivIcon:SetIcon(topIcon);
						instance.TopCivIcon:SetColor(topPrimaryColor);
						instance.TopCivIcon:SetToolTipString(topCivIconTooltip);

						instance.TopCivIconBacking:SetColor(topSecondaryColor);
						instance.TopCivIconExtended:SetIcon(topIcon);
						instance.TopCivIconExtended:SetColor(topPrimaryColor);
						instance.TopCivIconBackingExtended:SetColor(topSecondaryColor);
						instance.TopCivIconExtended:SetToolTipString(topCivIconTooltip);
					else
						instance.TopCivIconBacking:SetHide(true);
						instance.TopCivIconBackingExtended:SetHide(false);
					end

					-- Determine which pressure font icon to use
					local loyaltyPerTurn:number = pCityCulturalIdentity:GetLoyaltyPerTurn();
					local loyaltyFontIcon:string = loyaltyPerTurn >= 0 and "[ICON_PressureUp]" or "[ICON_PressureDown]";

					-- Update loyalty precentage
					local currentLoyalty:number = pCityCulturalIdentity:GetLoyalty();
					local maxLoyalty:number = pCityCulturalIdentity:GetMaxLoyalty();
					local loyalPercent:number = currentLoyalty / maxLoyalty;
					instance.LoyaltyFill:SetPercent(loyalPercent);
					instance.LoyaltyFillExtended:SetPercent(loyalPercent);

					local loyalStatusTooltip:string = GetLoyaltyStatusTooltip(pCity);
					local loyaltyFillToolTip:string = Locale.Lookup("LOC_LOYALTY_STATUS_TT", loyaltyFontIcon, Round(currentLoyalty,1), maxLoyalty, loyalStatusTooltip);
					instance.LoyaltyFill:SetToolTipString(loyaltyFillToolTip);
					instance.LoyaltyFillExtended:SetToolTipString(loyaltyFillToolTip);

					-- Update loyalty percentage string
					local loyaltyText:string = Locale.Lookup("LOC_CULTURAL_IDENTITY_LOYALTY_PERCENTAGE", Round(currentLoyalty, 1), maxLoyalty, loyaltyFontIcon, Round(loyaltyPerTurn, 1));
					instance.LoyaltyPercentageLabel:SetText(loyaltyText);
					instance.LoyaltyPercentageLabel:SetToolTipString(loyaltyFillToolTip);
					instance.LoyaltyPressureIcon:SetText(loyaltyFontIcon);
					instance.LoyaltyPressureIcon:SetToolTipString(GetLoyaltyPressureIconTooltip(loyaltyPerTurn, ownerID));


					--Update Loyalty breakdown
					if self.m_LoyaltyBreakdownIM ~= nil then
						self.m_LoyaltyBreakdownIM:ResetInstances();
					end
				end
			end
		end
	end
end
-- /DB

-- function copied from G:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization VI\Base\Assets\UI\WorldView\CityBannerManager.lua
function CityBanner:DB_UpdateStats_Base()
	local pDistrict:table = self:GetDistrict();
	local localPlayerID:number = Game.GetLocalPlayer();

	if (pDistrict ~= nil) then
		
		local districtHitpoints		:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_GARRISON);
		local currentDistrictDamage :number = pDistrict:GetDamage(DefenseTypes.DISTRICT_GARRISON);
		local wallHitpoints			:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_OUTER);
		local currentWallDamage		:number = pDistrict:GetDamage(DefenseTypes.DISTRICT_OUTER);
		local garrisonDefense		:number = math.floor(pDistrict:GetDefenseStrength() + 0.5);

		if self.m_Type == BANNERTYPE_CITY_CENTER then
			local pCity				:table = self:GetCity();
			local currentPopulation	:number = pCity:GetPopulation();
			local pCityGrowth		:table  = pCity:GetGrowth();
			local pBuildQueue		:table  = pCity:GetBuildQueue();
			local pCityData         :table  = GetCityData(pCity);
			local foodSurplus		:number = pCityGrowth:GetFoodSurplus();
			local isGrowing			:boolean= pCityGrowth:GetTurnsUntilGrowth() ~= -1;
			local isStarving		:boolean= pCityGrowth:GetTurnsUntilStarvation() ~= -1;

			local iModifiedFood;
			local total :number;

			if pCityData.TurnsUntilGrowth > -1 then
				local growthModifier =  math.max(1 + (pCityData.HappinessGrowthModifier/100) + pCityData.OtherGrowthModifiers, 0); -- This is unintuitive but it's in parity with the logic in City_Growth.cpp
				iModifiedFood = Round(pCityData.FoodSurplus * growthModifier, 2);
				total = iModifiedFood * pCityData.HousingMultiplier;		
			else
				total = pCityData.FoodSurplus;
			end

			local turnsUntilGrowth:number = 0;	-- It is possible for zero... no growth and no starving.
			if isGrowing then
				turnsUntilGrowth = pCityGrowth:GetTurnsUntilGrowth();
			elseif isStarving then
				turnsUntilGrowth = -pCityGrowth:GetTurnsUntilStarvation();	-- Make negative
			end

			if turnsUntilGrowth > 0 then
				self.m_Instance.CityPopTurnsLeft:SetColorByName("StatGoodCS");
			elseif turnsUntilGrowth < 0 then
				self.m_Instance.CityPopTurnsLeft:SetColorByName("StatBadCS");
			else
				self.m_Instance.CityPopTurnsLeft:SetColorByName("StatNormalCS");
			end

			self.m_Instance.CityPopulation:SetText(tostring(currentPopulation));

			if (self.m_Player == Players[localPlayerID]) then			--Only show growth data if the player is you
				--- POPULATION AND GROWTH INFO ---
				local popTooltip:string = Locale.Lookup("LOC_CITY_BANNER_POPULATION") .. ": " .. currentPopulation;
				if turnsUntilGrowth > 0 then
					popTooltip = popTooltip .. "[NEWLINE]  " .. Locale.Lookup("LOC_CITY_BANNER_TURNS_GROWTH", turnsUntilGrowth);
					popTooltip = popTooltip .. "[NEWLINE]  " .. Locale.Lookup("LOC_CITY_BANNER_FOOD_SURPLUS", toPlusMinusString(foodSurplus));
				elseif turnsUntilGrowth == 0 then
					popTooltip = popTooltip .. "[NEWLINE]  " .. Locale.Lookup("LOC_CITY_BANNER_STAGNATE");
				elseif turnsUntilGrowth < 0 then
					popTooltip = popTooltip .. "[NEWLINE]  " .. Locale.Lookup("LOC_CITY_BANNER_TURNS_STARVATION", -turnsUntilGrowth);
				end

				self.m_Instance.CityPopulation:SetToolTipString(popTooltip);
				if turnsUntilGrowth ~= 0 then
					self.m_Instance.CityPopTurnsLeft:SetText(turnsUntilGrowth);
				else
					self.m_Instance.CityPopTurnsLeft:SetText("-");
				end
			end

			local food             :number = pCityGrowth:GetFood();
			local growthThreshold  :number = pCityGrowth:GetGrowthThreshold();
			local foodpct          :number = Clamp( food / growthThreshold, 0.0, 1.0 );
			local foodpctNextTurn  :number = 0;
			if turnsUntilGrowth > 0 then
				local foodGainNextTurn = foodSurplus * pCityGrowth:GetOverallGrowthModifier();
				foodpctNextTurn = (food + foodGainNextTurn) / growthThreshold;
				foodpctNextTurn = Clamp( foodpctNextTurn, 0.0, 1.0 );
			end

			self.m_Instance.CityPopulationMeter:SetPercent(foodpct);
			self.m_Instance.CityPopulationNextTurn:SetPercent(foodpctNextTurn);

			-- Update insufficient housing icon
			if self.m_Instance.CityHousingInsufficientIcon ~= nil then
				self.m_Instance.CityHousingInsufficientIcon:SetToolTipString(Locale.Lookup("LOC_CITY_BANNER_HOUSING_INSUFFICIENT"));
				if pCityGrowth:GetHousing() < pCity:GetPopulation() then
					self.m_Instance.CityHousingInsufficientIcon:SetHide(false);
				else
					self.m_Instance.CityHousingInsufficientIcon:SetHide(true);
				end
			end

			--- CITY PRODUCTION ---
			self:UpdateProduction();

			--- DEFENSE INFO ---
-- DB - update city defense to include damaged district and terrain
			local damagedDistrictCS = currentDistrictDamage - 11 ;
			if damagedDistrictCS > 0 then
				damagedDistrictCS = math.floor(damagedDistrictCS / 20) + 1 ;
				if damagedDistrictCS > 10 then
					damagedDistrictCS = 10 ;
				end
				garrisonDefense = garrisonDefense - damagedDistrictCS ;
			end

			local cityPlot = Map.GetPlot(self.m_PlotX, self.m_PlotY);
			if (cityPlot ~= nil) then
				local hillDef = cityPlot:GetDefenseModifier() ;
				garrisonDefense = garrisonDefense + hillDef ;
			end
-- /DB

			local garrisonDefString :string = Locale.Lookup("LOC_CITY_BANNER_GARRISON_DEFENSE_STRENGTH");
			local defValue = garrisonDefense;
			local defTooltip = garrisonDefString .. ": " .. garrisonDefense;
-- DB
			local healthTooltip :string = "" 
-- /DB
			if (wallHitpoints > 0) then
				self.m_Instance.DefenseIcon:SetHide(true);
				self.m_Instance.ShieldsIcon:SetHide(false);
				self.m_Instance.CityDefenseBarBacking:SetHide(false);
				self.m_Instance.CityHealthBarBacking:SetHide(false);
				self.m_Instance.CityDefenseBar:SetHide(false);
-- DB
				healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_OUTER_DEFENSE_HITPOINTS", ((wallHitpoints-currentWallDamage) .. "/" .. wallHitpoints)) .. "[NEWLINE]"
				healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_GARRISON_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints))
-- /DB
				self.m_Instance.CityDefenseBar:SetPercent((wallHitpoints-currentWallDamage) / wallHitpoints);
			else
				self.m_Instance.CityDefenseBar:SetHide(true)
				self.m_Instance.CityDefenseBarBacking:SetHide(true);
				self.m_Instance.CityHealthBarBacking:SetHide(true);
-- DB
				healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_GARRISON_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints))
-- /DB
			end

			self.m_Instance.DefenseNumber:SetText(defValue);
			self.m_Instance.DefenseNumber:SetToolTipString(defTooltip);
			self.m_Instance.CityHealthBarBacking:SetToolTipString(healthTooltip);
			self.m_Instance.CityHealthBarBacking:SetHide(false);
			if(districtHitpoints > 0) then
				self.m_Instance.CityHealthBar:SetPercent((districtHitpoints-currentDistrictDamage) / districtHitpoints);	
			else
				self.m_Instance.CityHealthBar:SetPercent(0);	
			end
			self:SetHealthBarColor();	
			
			if (((districtHitpoints-currentDistrictDamage) / districtHitpoints) == 1 and wallHitpoints == 0) then
				self.m_Instance.CityHealthBar:SetHide(true);
				self.m_Instance.CityHealthBarBacking:SetHide(true);
			else
				self.m_Instance.CityHealthBar:SetHide(false);
				self.m_Instance.CityHealthBarBacking:SetHide(false);
			end
			self.m_Instance.DefenseStack:CalculateSize();
			self.m_Instance.DefenseStack:ReprocessAnchoring();
			self.m_Instance.BannerStrengthBacking:SetSizeX(self.m_Instance.DefenseStack:GetSizeX()+30);
			self.m_Instance.BannerStrengthBacking:SetToolTipString(defTooltip);

			-- Update under siege icon
			if pDistrict:IsUnderSiege() then
				self.m_Instance.CityUnderSiegeIcon:SetHide(false);
			else
				self.m_Instance.CityUnderSiegeIcon:SetHide(true);
			end

			-- Update occupied icon
			if pCity:IsOccupied() then
				self.m_Instance.CityOccupiedIcon:SetHide(false);
			else
				self.m_Instance.CityOccupiedIcon:SetHide(true);
			end

			-- Update insufficient amenities icon
			if self.m_Instance.CityAmenitiesInsufficientIcon ~= nil then
				self.m_Instance.CityAmenitiesInsufficientIcon:SetToolTipString(Locale.Lookup("LOC_CITY_BANNER_AMENITIES_INSUFFICIENT"));
				if pCityGrowth:GetAmenitiesNeeded() > pCityGrowth:GetAmenities() then
					self.m_Instance.CityAmenitiesInsufficientIcon:SetHide(false);
				else
					self.m_Instance.CityAmenitiesInsufficientIcon:SetHide(true);
				end
			end
-- DB - Hide defense and population values for foreign cities
			if GameConfiguration.GetValue("DB_REMOVE_FOREIGN_INFO") and self.m_Player ~= Players[localPlayerID] then
				self.m_Instance.CityPopulation:SetText('')
				self.m_Instance.DefenseIcon:SetHide(true)
				self.m_Instance.ShieldsIcon:SetHide(true)
				self.m_Instance.DefenseNumber:SetHide(true)
				self.m_Instance.DefenseNumber:SetToolTipString('')
				self.m_Instance.BannerStrengthBacking:SetSizeX(140)
				self.m_Instance.BannerStrengthBacking:SetToolTipString('')

				if self.m_FogState == PLOT_VISIBLE then
					self.m_Instance.CityHealthBar:SetHide(false)
					self.m_Instance.CityHealthBarBacking:SetHide(false)
				else
					self.m_Instance.CityHealthBar:SetHide(true)
					self.m_Instance.CityHealthBarBacking:SetHide(true)
					self.m_Instance.CityDefenseBar:SetHide(true)
					self.m_Instance.CityDefenseBarBacking:SetHide(true)	
				end
			end
-- /DB
			--------------------------------------
		else -- it should be a miniBanner
			
			if (self.m_Type == BANNERTYPE_ENCAMPMENT) then 
				self:UpdateEncampmentBanner();
			elseif (self.m_Type == BANNERTYPE_AERODROME) then
				self:UpdateAerodromeBanner();
			elseif (self.m_Type == BANNERTYPE_OTHER_DISTRICT) then
				self:UpdateDistrictBanner();
			end
			
		end

	else  --it's a banner not associated with a district
		if (self.m_IsImprovementBanner) then
			local bannerPlot = Map.GetPlot(self.m_PlotX, self.m_PlotY);
			if (bannerPlot ~= nil) then
				if (self.m_Type == BANNERTYPE_AERODROME) then
					self:UpdateAerodromeBanner();
				elseif (self.m_Type == BANNERTYPE_MISSILE_SILO) then
					self:UpdateWMDBanner();
				else
					self:UpdateOtherImprovementBannerTypes();
				end
			end
		end
	end
end

-- function copied from G:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization VI\DLC\Expansion1\UI\CityBanners\CityBannerManager.lua
function CityBanner:DB_UpdateStats_XP1()
	local pDistrict:table = self:GetDistrict();
	local localPlayerID:number = Game.GetLocalPlayer();

	if (pDistrict ~= nil) then

		if self.m_Type == BANNERTYPE_CITY_CENTER then

			local pCity				:table = self:GetCity();
			local iCityOwner		:number = pCity:GetOwner();
			local pCityGrowth		:table  = pCity:GetGrowth();
			local populationIM		:table;

			if (localPlayerID == iCityOwner) then
				self:UpdatePopulation(true, pCity, pCityGrowth);
				self:UpdateGovernor(pCity);
				self:UpdateProduction(pCity);
			else
				self:UpdatePopulation(false, pCity, pCityGrowth);
				self:UpdateGovernor(pCity);
			end

			--- DEFENSE INFO ---
			local districtHitpoints		:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_GARRISON);
			local currentDistrictDamage :number = pDistrict:GetDamage(DefenseTypes.DISTRICT_GARRISON);
			local wallHitpoints			:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_OUTER);
			local currentWallDamage		:number = pDistrict:GetDamage(DefenseTypes.DISTRICT_OUTER);
			local garrisonDefense		:number = math.floor(pDistrict:GetDefenseStrength() + 0.5);

-- DB - update city defense to include damaged district and terrain
			local damagedDistrictCS = currentDistrictDamage - 11 ;
			if damagedDistrictCS > 0 then
				damagedDistrictCS = math.floor(damagedDistrictCS / 20) + 1 ;
				if damagedDistrictCS > 10 then
					damagedDistrictCS = 10 ;
				end
				garrisonDefense = garrisonDefense - damagedDistrictCS ;
			end

			local cityPlot = Map.GetPlot(self.m_PlotX, self.m_PlotY);
			if (cityPlot ~= nil) then
				local hillDef = cityPlot:GetDefenseModifier() ;
				garrisonDefense = garrisonDefense + hillDef ;
			end
-- /DB

			local garrisonDefString :string = Locale.Lookup("LOC_CITY_BANNER_GARRISON_DEFENSE_STRENGTH");
			local defValue = garrisonDefense;
			local defTooltip = garrisonDefString .. ": " .. garrisonDefense;
-- DB
			local healthTooltip :string = ""
-- /DB
			if (wallHitpoints > 0) then
				self.m_Instance.DefenseIcon:SetHide(true);
				self.m_Instance.ShieldsIcon:SetHide(false);
				self.m_Instance.CityDefenseBarBacking:SetHide(false);
				self.m_Instance.CityHealthBarBacking:SetHide(false);
				self.m_Instance.CityDefenseBar:SetHide(false);
-- DB
				healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_OUTER_DEFENSE_HITPOINTS", ((wallHitpoints-currentWallDamage) .. "/" .. wallHitpoints)) .. "[NEWLINE]"
				healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_GARRISON_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));
-- /DB
				self.m_Instance.CityDefenseBar:SetPercent((wallHitpoints-currentWallDamage) / wallHitpoints);
				self.m_Instance.CityDefenseBarBacking:SetToolTipString(healthTooltip);
			else
				self.m_Instance.CityDefenseBar:SetHide(true);
				self.m_Instance.CityDefenseBarBacking:SetHide(true);
				self.m_Instance.CityHealthBarBacking:SetHide(true);
-- DB
				healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_GARRISON_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));
-- /DB
			end
			self.m_Instance.DefenseNumber:SetText(defValue);
			self.m_Instance.DefenseNumber:SetToolTipString(defTooltip);
			self.m_Instance.CityHealthBarBacking:SetToolTipString(healthTooltip);
			self.m_Instance.CityHealthBarBacking:SetHide(false);
			if(districtHitpoints > 0) then
				self.m_Instance.CityHealthBar:SetPercent((districtHitpoints-currentDistrictDamage) / districtHitpoints);	
			else
				self.m_Instance.CityHealthBar:SetPercent(0);	
			end
			self:SetHealthBarColor();	
			
			if (((districtHitpoints-currentDistrictDamage) / districtHitpoints) == 1 and wallHitpoints == 0) then
				self.m_Instance.CityHealthBar:SetHide(true);
				self.m_Instance.CityHealthBarBacking:SetHide(true);
			else
				self.m_Instance.CityHealthBar:SetHide(false);
				self.m_Instance.CityHealthBarBacking:SetHide(false);
			end

-- DB - Hide defense and population values for foreign cities
			if GameConfiguration.GetValue("DB_REMOVE_FOREIGN_INFO") and iCityOwner ~= localPlayerID then
				self.m_StatPopulationIM:ResetInstances()
				self.m_Instance.DefenseNumber:SetHide(true)
				self.m_Instance.DefenseNumber:SetToolTipString('')

				if self.m_FogState ~= PLOT_VISIBLE then
					self.m_Instance.CityDetails:SetHide(true)
				else
					self.m_Instance.CityDetails:SetHide(false)
					self.m_Instance.CityHealthBar:SetHide(false)
					self.m_Instance.CityHealthBarBacking:SetHide(false)
				end
			end
-- /DB
			self:UpdateDetails();
			--------------------------------------
		else -- it should be a miniBanner
			
			if (self.m_Type == BANNERTYPE_ENCAMPMENT) then 
				self:UpdateEncampmentBanner();
			elseif (self.m_Type == BANNERTYPE_AERODROME) then
				self:UpdateAerodromeBanner();
			elseif (self.m_Type == BANNERTYPE_OTHER_DISTRICT) then
				self:UpdateDistrictBanner();
			end
			
		end

	else  --it's a banner not associated with a district
		if (self.m_IsImprovementBanner) then
			local bannerPlot = Map.GetPlot(self.m_PlotX, self.m_PlotY);
			if (bannerPlot ~= nil) then
				if (self.m_Type == BANNERTYPE_AERODROME) then
					self:UpdateAerodromeBanner();
				elseif (self.m_Type == BANNERTYPE_MISSILE_SILO) then
					self:UpdateWMDBanner();
				else
					self:UpdateOtherImprovementBannerTypes();
				end
			end
		end
	end
end


-- function copied from G:\Program Files (x86)\Steam\steamapps\common\Sid Meier's Civilization VI\DLC\Expansion2\UI\CityBanners\CityBannerManager.lua
function CityBanner:DB_UpdateStats_XP2()
	local pDistrict:table = self:GetDistrict();
	local localPlayerID:number = Game.GetLocalPlayer();

	if (pDistrict ~= nil) then

		if self.m_Type == BANNERTYPE_CITY_CENTER then

			local pCity				:table = self:GetCity();
			local iCityOwner		:number = pCity:GetOwner();
			local pCityGrowth		:table  = pCity:GetGrowth();
			local populationIM		:table;

			if (localPlayerID == iCityOwner) then
				self:UpdatePopulation(true, pCity, pCityGrowth);
				self:UpdateGovernor(pCity);
				self:UpdateProduction(pCity);
			else
				self:UpdatePopulation(false, pCity, pCityGrowth);
				self:UpdateGovernor(pCity);

				-- Espionage View should show a cities production if they have the proper diplo visibility
				if HasEspionageView(iCityOwner, pCity:GetID()) then
					self:UpdateProduction(pCity);
				elseif self.m_StatProductionIM ~= nil then
					self.m_StatProductionIM:ResetInstances();
				end
			end

			--- DEFENSE INFO ---
			local districtHitpoints		:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_GARRISON);
			local currentDistrictDamage :number = pDistrict:GetDamage(DefenseTypes.DISTRICT_GARRISON);
			local wallHitpoints			:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_OUTER);
			local currentWallDamage		:number = pDistrict:GetDamage(DefenseTypes.DISTRICT_OUTER);
			local garrisonDefense		:number = math.floor(pDistrict:GetDefenseStrength() + 0.5);

-- DB - update city defense to include damaged district and terrain
			local damagedDistrictCS = currentDistrictDamage - 11 ;
			if damagedDistrictCS > 0 then
				damagedDistrictCS = math.floor(damagedDistrictCS / 20) + 1 ;
				if damagedDistrictCS > 10 then
					damagedDistrictCS = 10 ;
				end
				garrisonDefense = garrisonDefense - damagedDistrictCS ;
			end

			local cityPlot = Map.GetPlot(self.m_PlotX, self.m_PlotY);
			if (cityPlot ~= nil) then
				local hillDef = cityPlot:GetDefenseModifier() ;
				garrisonDefense = garrisonDefense + hillDef ;
			end
-- /DB

			local garrisonDefString :string = Locale.Lookup("LOC_CITY_BANNER_GARRISON_DEFENSE_STRENGTH");
			local defValue = garrisonDefense;
			local defTooltip = garrisonDefString .. ": " .. garrisonDefense;
-- DB
			local healthTooltip :string = "" 
-- /DB
			if (wallHitpoints > 0) then
				self.m_Instance.DefenseIcon:SetHide(true);
				self.m_Instance.ShieldsIcon:SetHide(false);
				self.m_Instance.CityDefenseBarBacking:SetHide(false);
				self.m_Instance.CityHealthBarBacking:SetHide(false);
				self.m_Instance.CityDefenseBar:SetHide(false);
-- DB
				healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_OUTER_DEFENSE_HITPOINTS", ((wallHitpoints-currentWallDamage) .. "/" .. wallHitpoints)) .. "[NEWLINE]"
				healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_GARRISON_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));
-- /DB
				self.m_Instance.CityDefenseBar:SetPercent((wallHitpoints-currentWallDamage) / wallHitpoints);
				self.m_Instance.CityDefenseBarBacking:SetToolTipString(healthTooltip);
			else
				self.m_Instance.CityDefenseBar:SetHide(true);
				self.m_Instance.CityDefenseBarBacking:SetHide(true);
				self.m_Instance.CityHealthBarBacking:SetHide(true);
-- DB
				healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_GARRISON_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));
-- /DB
			end
			self.m_Instance.DefenseNumber:SetText(defValue);
			self.m_Instance.DefenseNumber:SetToolTipString(defTooltip);
			self.m_Instance.CityHealthBarBacking:SetToolTipString(healthTooltip);
			self.m_Instance.CityHealthBarBacking:SetHide(false);
			if(districtHitpoints > 0) then
				self.m_Instance.CityHealthBar:SetPercent((districtHitpoints-currentDistrictDamage) / districtHitpoints);	
			else
				self.m_Instance.CityHealthBar:SetPercent(0);	
			end
			self:SetHealthBarColor();	
			
			if (((districtHitpoints-currentDistrictDamage) / districtHitpoints) == 1 and wallHitpoints == 0) then
				self.m_Instance.CityHealthBar:SetHide(true);
				self.m_Instance.CityHealthBarBacking:SetHide(true);
			else
				self.m_Instance.CityHealthBar:SetHide(false);
				self.m_Instance.CityHealthBarBacking:SetHide(false);
			end

				
-- DB - Hide defense and population values for foreign cities
			if GameConfiguration.GetValue("DB_REMOVE_FOREIGN_INFO") and iCityOwner ~= localPlayerID then
				self.m_Instance.DefenseNumber:SetHide(true)
				self.m_Instance.DefenseNumber:SetToolTipString('')

				if self.m_FogState ~= PLOT_VISIBLE then
					self.m_Instance.CityDetails:SetHide(true)
					self.m_StatPopulationIM:ResetInstances()
				else
					self.m_Instance.CityDetails:SetHide(false)
					self.m_Instance.CityHealthBar:SetHide(false)
					self.m_Instance.CityHealthBarBacking:SetHide(false)
				end
			end
-- /DB
			self:UpdateDetails();
			--------------------------------------
		else -- it should be a miniBanner
			
			if (self.m_Type == BANNERTYPE_ENCAMPMENT) then 
				self:UpdateEncampmentBanner();
			elseif (self.m_Type == BANNERTYPE_AERODROME) then
				self:UpdateAerodromeBanner();
			elseif (self.m_Type == BANNERTYPE_OTHER_DISTRICT) then
				self:UpdateDistrictBanner();
			end
			
		end

	else  --it's a banner not associated with a district
		if (self.m_IsImprovementBanner) then
			local bannerPlot = Map.GetPlot(self.m_PlotX, self.m_PlotY);
			if (bannerPlot ~= nil) then
				if (self.m_Type == BANNERTYPE_AERODROME) then
					self:UpdateAerodromeBanner();
				elseif (self.m_Type == BANNERTYPE_MISSILE_SILO) then
					self:UpdateWMDBanner();
				else
					self:UpdateOtherImprovementBannerTypes();
				end
			end
		end
	end
end



function CityBanner:DB_UpdateDetails_XP1()
	local pCity:table = self:GetCity();
	local pDistrict:table = self:GetDistrict();
	if pCity and pDistrict then
		local cityOwner:number = pCity:GetOwner();
		local localPlayerID:number = Game.GetLocalPlayer();

		-- RESET INSTANCES
		self.m_DetailStatusIM:ResetInstances();
		self.m_DetailEffectsIM:ResetInstances();
		
		local bHasQuests: boolean = false;
		local questsManager: table = Game.GetQuestsManager();
		local questTooltip: string = Locale.Lookup("LOC_CITY_STATES_QUESTS");
		if questsManager then
			for questInfo in GameInfo.Quests() do
				if questsManager:HasActiveQuestFromPlayer(localPlayerID, cityOwner, questInfo.Index) then
					bHasQuests = true;
					questTooltip = questTooltip .. "[NEWLINE]" .. questInfo.IconString .. questsManager:GetActiveQuestName(localPlayerID, cityOwner, questInfo.Index);
				end
			end
		end

		if bHasQuests then
			SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_QUEST", Locale.Lookup(questTooltip));
		end

		if m_isTradeSelectionActive then
			local pCityTrade:table = pCity:GetTrade();
			if pCityTrade:HasActiveTradingPost(localPlayer) then
				SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_TRADE_ACTIVE", Locale.Lookup("LOC_CITY_BANNER_ACTIVE_TRADING"));
			elseif pCityTrade:HasInactiveTradingPost(localPlayer) then
				SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_TRADE_INACTIVE", Locale.Lookup("LOC_CITY_BANNER_INACTIVE_TRADING"));
			end
		end

-- DB
		if GameConfiguration.GetValue("DB_BALANCED_WALLS") and pCity:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_CASTLE"].Index) and pDistrict:CanAttack() then 
			SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_STRIKE", Locale.Lookup("LOC_CITY_BANNER_CAN_STRIKE", pDistrict:GetAttackStrength()));
		elseif not GameConfiguration.GetValue("DB_BALANCED_WALLS") and pDistrict:CanAttack() then
-- /DB
			SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_STRIKE", Locale.Lookup("LOC_CITY_BANNER_CAN_STRIKE", pDistrict:GetAttackStrength()));
		end
		
		self.m_Instance.CityDetailsStatus:CalculateSize();

		-- Update under siege icon
		if pDistrict:IsUnderSiege() then
			SetDetailIcon(self.m_DetailEffectsIM:GetInstance(), "ICON_CITY_EFFECTS_SIEGE", Locale.Lookup("LOC_HUD_REPORTS_STATUS_UNDER_SEIGE"));
		end

		if cityOwner == localPlayerID then
			local pCityGrowth:table = pCity:GetGrowth();

			-- Update occupied icon
			if pCity:IsOccupied() then
				local pCityIdentity		:table = pCity:GetCulturalIdentity();		
				local loyaltyLevel		:number = pCityIdentity:GetLoyaltyLevel();
				local loyaltyLevelName	:string = GameInfo.LoyaltyLevels[loyaltyLevel].Name;
				SetDetailIcon(self.m_DetailEffectsIM:GetInstance(), "ICON_CITY_EFFECTS_OCCUPIED", Locale.Lookup("LOC_HUD_CITY_OCCUPIED_LOYALITY_STATUS", loyaltyLevelName));
			end

			-- Update insufficient housing icon
			if pCityGrowth:GetHousing() < pCity:GetPopulation() then
				SetDetailIcon(self.m_DetailEffectsIM:GetInstance(), "ICON_CITY_EFFECTS_HOUSING", Locale.Lookup("LOC_CITY_BANNER_HOUSING_INSUFFICIENT"));
			end

			-- Update insufficient amenities icon
			if pCityGrowth:GetAmenitiesNeeded() > pCityGrowth:GetAmenities() then
				SetDetailIcon(self.m_DetailEffectsIM:GetInstance(), "ICON_CITY_EFFECTS_AMENITIES", Locale.Lookup("LOC_CITY_BANNER_AMENITIES_INSUFFICIENT"));
			end	
		end

		self.m_Instance.CityDetailsEffects:CalculateSize();
	end

	self:Resize();
end

function CityBanner:DB_UpdateDetails_XP2()
	local pCity:table = self:GetCity();
	local pDistrict:table = self:GetDistrict();
	if pCity and pDistrict then
		local cityOwner:number = pCity:GetOwner();
		local localPlayerID:number = Game.GetLocalPlayer();

		-- RESET INSTANCES
		self.m_DetailStatusIM:ResetInstances();
		self.m_DetailEffectsIM:ResetInstances();
		
		local bHasQuests: boolean = false;
		local questsManager: table = Game.GetQuestsManager();
		local questTooltip: string = Locale.Lookup("LOC_CITY_STATES_QUESTS");
		if questsManager then
			for questInfo in GameInfo.Quests() do
				if questsManager:HasActiveQuestFromPlayer(localPlayerID, cityOwner, questInfo.Index) then
					bHasQuests = true;
					questTooltip = questTooltip .. "[NEWLINE]" .. questInfo.IconString .. questsManager:GetActiveQuestName(localPlayerID, cityOwner, questInfo.Index);
				end
			end
		end

		if bHasQuests then
			SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_QUEST", Locale.Lookup(questTooltip));
		end

		if m_isTradeSelectionActive then
			local pCityTrade:table = pCity:GetTrade();
			if pCityTrade:HasActiveTradingPost(localPlayer) then
				SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_TRADE_ACTIVE", Locale.Lookup("LOC_CITY_BANNER_ACTIVE_TRADING"));
			elseif pCityTrade:HasInactiveTradingPost(localPlayer) then
				SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_TRADE_INACTIVE", Locale.Lookup("LOC_CITY_BANNER_INACTIVE_TRADING"));
			end
		end

-- DB
		if GameConfiguration.GetValue("DB_BALANCED_WALLS") and pCity:GetBuildings():HasBuilding(GameInfo.Buildings["BUILDING_CASTLE"].Index) and pDistrict:CanAttack() then 
			SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_STRIKE", Locale.Lookup("LOC_CITY_BANNER_CAN_STRIKE", pDistrict:GetAttackStrength()));
		elseif not GameConfiguration.GetValue("DB_BALANCED_WALLS") and pDistrict:CanAttack() then
			SetDetailIcon(self.m_DetailStatusIM:GetInstance(), "ICON_CITY_STATUS_STRIKE", Locale.Lookup("LOC_CITY_BANNER_CAN_STRIKE", pDistrict:GetAttackStrength()));
-- /DB
		end
		
		self.m_Instance.CityDetailsStatus:CalculateSize();

		-- Update under siege icon
		if pDistrict:IsUnderSiege() then
			SetDetailIcon(self.m_DetailEffectsIM:GetInstance(), "ICON_CITY_EFFECTS_SIEGE", Locale.Lookup("LOC_HUD_REPORTS_STATUS_UNDER_SEIGE"));
		end

		if cityOwner == localPlayerID then
			local pCityGrowth:table = pCity:GetGrowth();

			-- Update occupied icon
			if pCity:IsOccupied() then
				local pCityIdentity		:table = pCity:GetCulturalIdentity();		
				local loyaltyLevel		:number = pCityIdentity:GetLoyaltyLevel();
				local loyaltyLevelName	:string = GameInfo.LoyaltyLevels[loyaltyLevel].Name;
				SetDetailIcon(self.m_DetailEffectsIM:GetInstance(), "ICON_CITY_EFFECTS_OCCUPIED", Locale.Lookup("LOC_HUD_CITY_OCCUPIED_LOYALITY_STATUS", loyaltyLevelName));
			end

			-- Update insufficient housing icon
			if pCityGrowth:GetHousing() < pCity:GetPopulation() then
				SetDetailIcon(self.m_DetailEffectsIM:GetInstance(), "ICON_CITY_EFFECTS_HOUSING", Locale.Lookup("LOC_CITY_BANNER_HOUSING_INSUFFICIENT"));
			end

			-- Update insufficient amenities icon
			if pCityGrowth:GetAmenitiesNeeded() > pCityGrowth:GetAmenities() then
				SetDetailIcon(self.m_DetailEffectsIM:GetInstance(), "ICON_CITY_EFFECTS_AMENITIES", Locale.Lookup("LOC_CITY_BANNER_AMENITIES_INSUFFICIENT"));
			end	
		end

		local pCityPower	:table = pCity:GetPower();
		local freePower		:number = pCityPower:GetFreePower();
		local temporaryPower:number = pCityPower:GetTemporaryPower();
		local requiredPower :number = pCityPower:GetRequiredPower();
		local powerTooltip	:string = "";
		local powerIconKey  :string= "PowerInsufficient";
		if (pCityPower:IsFullyPowered()) then
			powerIconKey = "Power";
			powerTooltip = Locale.Lookup("LOC_CITY_BANNER_POWERED_CITY", requiredPower, freePower, temporaryPower);
			if (pCityPower:IsFullyPoweredByActiveProject()) then
				powerTooltip = powerTooltip .. "[NEWLINE]" .. Locale.Lookup("LOC_CITY_BANNER_POWERED_CITY_FROM_ACTIVE_PROJECT");
			end
		else
			powerTooltip = Locale.Lookup("LOC_CITY_BANNER_UNPOWERED_CITY", requiredPower, freePower, temporaryPower);
		end
		if (freePower > 0 or temporaryPower > 0 or requiredPower > 0) then
			local kPowerDetailEffectInst:table = self.m_DetailEffectsIM:GetInstance();
			SetDetailIcon(kPowerDetailEffectInst, powerIconKey, powerTooltip);
			kPowerDetailEffectInst.Button:RegisterCallback( Mouse.eLClick, function() OnPowerIconClicked(cityOwner, pCity:GetID()); end );
		end

		self.m_Instance.CityDetailsEffects:CalculateSize();		
	end

	self:Resize();
end



function CityBanner:DB_UpdateEncampmentBanner_Base()
	-- Update wall/district health
	local pDistrict:table = self:GetDistrict();

	local districtDefense:number = math.floor(pDistrict:GetDefenseStrength() + 0.5);
	local districtHitpoints		:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_GARRISON);
	local currentDistrictDamage :number = pDistrict:GetDamage(DefenseTypes.DISTRICT_GARRISON);
	local wallHitpoints			:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_OUTER);
	local currentWallDamage		:number = pDistrict:GetDamage(DefenseTypes.DISTRICT_OUTER);
-- DB
	local healthTooltip :string = "" 
-- /DB
-- DB - update encampment defense to include damaged district and terrain
	local damagedDistrictCS = currentDistrictDamage - 11 ;
	if damagedDistrictCS > 0 then
		damagedDistrictCS = math.floor(damagedDistrictCS / 20) + 1 ;
		if damagedDistrictCS > 10 then
			damagedDistrictCS = 10 ;
		end
		districtDefense = districtDefense - damagedDistrictCS ;
	end

	local districtPlot = Map.GetPlot(self.m_PlotX, self.m_PlotY);
	if (districtPlot ~= nil) then
		local hillDef = districtPlot:GetDefenseModifier() ;
		districtDefense = districtDefense + hillDef ;
	end
-- /DB
	local defTooltip = Locale.Lookup("LOC_CITY_BANNER_DISTRICT_DEFENSE_STRENGTH", districtDefense);

	if (wallHitpoints > 0) then
		self.m_Instance.CityDefenseBar:SetHide(false);
-- DB
		healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_OUTER_DEFENSE_HITPOINTS", ((wallHitpoints-currentWallDamage) .. "/" .. wallHitpoints)) .. "[NEWLINE]"
		healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_DISTRICT_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));	
-- /DB
		self.m_Instance.CityDefenseBar:SetPercent((wallHitpoints-currentWallDamage) / wallHitpoints);
		self:SetHealthBarColor();
	else
		self.m_Instance.CityDefenseBar:SetHide(true);
-- DB
		healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_DISTRICT_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));	
-- /DB
	end

	if districtHitpoints < 0 or (((districtHitpoints-currentDistrictDamage) / districtHitpoints) == 1 and wallHitpoints == 0) then
		self.m_Instance.CityHealthBar:SetHide(true);
	else
		self.m_Instance.CityHealthBar:SetHide(false);
		self.m_Instance.CityHealthBar:SetPercent((districtHitpoints-currentDistrictDamage) / districtHitpoints);	
	end

	self.m_Instance.EncampmentBannerContainer:SetToolTipString(healthTooltip);
	self.m_Instance.DistrictDefenseGrid:SetToolTipString(defTooltip);
	self.m_Instance.DistrictDefenseStrengthLabel:SetText(districtDefense);
end



function CityBanner:DB_UpdateEncampmentBanner_XP1()
	-- Update wall/district health
	local pDistrict:table = self:GetDistrict();

	local districtDefense		:number = math.floor(pDistrict:GetDefenseStrength() + 0.5);
	local districtHitpoints		:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_GARRISON);
	local currentDistrictDamage :number = pDistrict:GetDamage(DefenseTypes.DISTRICT_GARRISON);
	local wallHitpoints			:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_OUTER);
	local currentWallDamage		:number = pDistrict:GetDamage(DefenseTypes.DISTRICT_OUTER);
-- DB
	local healthTooltip			:string = ""
-- /DB
-- DB - update encampment defense to include damaged district and terrain
	local damagedDistrictCS = currentDistrictDamage - 11 ;
	if damagedDistrictCS > 0 then
		damagedDistrictCS = math.floor(damagedDistrictCS / 20) + 1 ;
		if damagedDistrictCS > 10 then
			damagedDistrictCS = 10 ;
		end
		districtDefense = districtDefense - damagedDistrictCS ;
	end

	local districtPlot = Map.GetPlot(self.m_PlotX, self.m_PlotY);
	if (districtPlot ~= nil) then
		local hillDef = districtPlot:GetDefenseModifier() ;
		districtDefense = districtDefense + hillDef ;
	end
-- /DB
	local defTooltip			:string = Locale.Lookup("LOC_CITY_BANNER_DISTRICT_DEFENSE_STRENGTH", districtDefense);

	if (wallHitpoints > 0) then
		self.m_Instance.CityDefenseBar:SetHide(false);
-- DB
		healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_OUTER_DEFENSE_HITPOINTS", ((wallHitpoints-currentWallDamage) .. "/" .. wallHitpoints)) .. "[NEWLINE]"
		healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_DISTRICT_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));	
-- /DB
		self.m_Instance.CityDefenseBar:SetPercent((wallHitpoints-currentWallDamage) / wallHitpoints);
		self:SetHealthBarColor();
	else
		self.m_Instance.CityDefenseBar:SetHide(true);
-- DB
		healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_DISTRICT_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));	
-- /DB
	end

	if districtHitpoints < 0 or (((districtHitpoints-currentDistrictDamage) / districtHitpoints) == 1 and wallHitpoints == 0) then
		self.m_Instance.CityHealthBar:SetHide(true);
	else
		self.m_Instance.CityHealthBar:SetHide(false);
		self.m_Instance.CityHealthBar:SetPercent((districtHitpoints-currentDistrictDamage) / districtHitpoints);	
	end

	self.m_Instance.EncampmentBannerContainer:SetToolTipString(healthTooltip);
	self.m_Instance.DistrictDefenseGrid:SetToolTipString(defTooltip);
	self.m_Instance.DistrictDefenseStrengthLabel:SetText(districtDefense);
end



function CityBanner:DB_UpdateEncampmentBanner_XP2()
	-- Update wall/district health
	local pDistrict:table = self:GetDistrict();

	local districtDefense		:number = math.floor(pDistrict:GetDefenseStrength() + 0.5);
	local districtHitpoints		:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_GARRISON);
	local currentDistrictDamage :number = pDistrict:GetDamage(DefenseTypes.DISTRICT_GARRISON);
	local wallHitpoints			:number = pDistrict:GetMaxDamage(DefenseTypes.DISTRICT_OUTER);
	local currentWallDamage		:number = pDistrict:GetDamage(DefenseTypes.DISTRICT_OUTER);
-- DB - update encampment defense to include damaged district and terrain
	local healthTooltip			:string = ""
	local damagedDistrictCS = currentDistrictDamage - 11 ;
	if damagedDistrictCS > 0 then
		damagedDistrictCS = math.floor(damagedDistrictCS / 20) + 1 ;
		if damagedDistrictCS > 10 then
			damagedDistrictCS = 10 ;
		end
		districtDefense = districtDefense - damagedDistrictCS ;
	end

	local districtPlot = Map.GetPlot(self.m_PlotX, self.m_PlotY);
	if (districtPlot ~= nil) then
		local hillDef = districtPlot:GetDefenseModifier() ;
		districtDefense = districtDefense + hillDef ;
	end
-- /DB
	local defTooltip			:string = Locale.Lookup("LOC_CITY_BANNER_DISTRICT_DEFENSE_STRENGTH", districtDefense);

	if (wallHitpoints > 0) then
		self.m_Instance.CityDefenseBar:SetHide(false);
-- DB
		healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_OUTER_DEFENSE_HITPOINTS", ((wallHitpoints-currentWallDamage) .. "/" .. wallHitpoints)) .. "[NEWLINE]"
		healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_DISTRICT_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));	
-- /DB
		self.m_Instance.CityDefenseBar:SetPercent((wallHitpoints-currentWallDamage) / wallHitpoints);
		self:SetHealthBarColor();
	else
		self.m_Instance.CityDefenseBar:SetHide(true);
-- DB
		healthTooltip = healthTooltip .. Locale.Lookup("LOC_CITY_BANNER_DISTRICT_HITPOINTS", ((districtHitpoints-currentDistrictDamage) .. "/" .. districtHitpoints));	
-- /DB
	end

	if districtHitpoints < 0 or (((districtHitpoints-currentDistrictDamage) / districtHitpoints) == 1 and wallHitpoints == 0) then
		self.m_Instance.CityHealthBar:SetHide(true);
	else
		self.m_Instance.CityHealthBar:SetHide(false);
		self.m_Instance.CityHealthBar:SetPercent((districtHitpoints-currentDistrictDamage) / districtHitpoints);	
	end

	self.m_Instance.EncampmentBannerContainer:SetToolTipString(healthTooltip);
	self.m_Instance.DistrictDefenseGrid:SetToolTipString(defTooltip);
	self.m_Instance.DistrictDefenseStrengthLabel:SetText(districtDefense);

-- DB
	if GameConfiguration.GetValue("DB_REMOVE_FOREIGN_INFO") then
		if self:GetCity():GetOwner() ~= Game.GetLocalPlayer() then
			self.m_Instance.EncampmentBannerContainer:SetToolTipString('')
			self.m_Instance.DistrictDefenseGrid:SetToolTipString('')
			self.m_Instance.DistrictDefenseStrengthLabel:SetText('')
			if self.m_FogState ~= PLOT_VISIBLE then
				self.m_Instance.CityHealthBar:SetHide(true)
				self.m_Instance.CityDefenseBar:SetHide(true)
			end
		end
	end
-- /DB
end



function CityBanner:DB_UpdateInfo_XP1( pCity : table )
	
	self.m_CivIconInstance = nil;
	self.m_InfoIconIM:ResetInstances();
	self.m_InfoConditionIM:ResetInstances();

	if pCity ~= nil then
		local playerID		:number = pCity:GetOwner();
		local cityID		:number = pCity:GetID();
		local pPlayer		:table	= Players[playerID];
		local pPlayerConfig	:table	= PlayerConfigurations[playerID];

		-- CAPITAL ICON
		if pPlayer then
			local instance:table = self.m_InfoIconIM:GetInstance();
			local tooltip:string = "";

			if pPlayer:IsMajor() then
				if pCity:IsOriginalCapital() and pCity:GetOriginalOwner() == pCity:GetOwner() then
					if pCity:IsCapital() then
						-- Original capitial still owned by original owner
						instance.Icon:SetIcon("ICON_CITY_CAPITAL");
					else
						-- Former original capital
						instance.Icon:SetIcon("ICON_FORMER_CAPITAL");
					end
					tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_ORIGINAL_CAPITAL_TT", pPlayerConfig:GetCivilizationShortDescription());
				elseif pCity:IsCapital() then
					-- New capital
					instance.Icon:SetIcon("ICON_NEW_CAPITAL");
					tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_NEW_CAPITAL_TT", pPlayerConfig:GetCivilizationShortDescription());
				else
					-- Other cities
					instance.Icon:SetIcon("ICON_OTHER_CITIES");
					tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_OTHER_CITY_TT", pPlayerConfig:GetCivilizationShortDescription());
				end

			elseif pPlayer:IsFreeCities() then
				instance.Icon:SetIcon("ICON_CIVILIZATION_FREE_CITIES");
				tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_FREE_CITY_TT");
			else
				instance.Icon:SetIcon("ICON_CITY_STATE");
				tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_CITY_STATE_TT");
			end

			instance.Button:SetTexture("Banner_TypeSlot");
			instance.Button:RegisterCallback(Mouse.eLClick, OnCapitalIconClicked);
			instance.Button:SetVoid1(playerID);
			instance.Button:SetVoid2(cityID);
			instance.Button:SetToolTipString(tooltip);

			-- ORIGINAL OWNER CAPITAL ICON
			if pCity:GetOwner() ~= pCity:GetOriginalOwner() and pCity:IsOriginalCapital() then
				local pOriginalOwner:table = Players[pCity:GetOriginalOwner()];
				-- Only show the captured capital icon for major civs
				if pOriginalOwner:IsMajor() then
					local instance:table = self.m_InfoIconIM:GetInstance();
					instance.Icon:SetIcon("ICON_CAPTURED_CAPITAL");
					local pOriginalOwnerConfig:table = PlayerConfigurations[pCity:GetOriginalOwner()];
					instance.Button:SetToolTipString(Locale.Lookup("LOC_CITY_BANNER_CAPTURED_CAPITAL_TT", pOriginalOwnerConfig:GetCivilizationShortDescription()));
					instance.Button:RegisterCallback(Mouse.eLClick, OnCapitalIconClicked);
					instance.Button:SetVoid1(pCity:GetOriginalOwner());
					instance.Button:SetVoid2(cityID);
				end
			end
		end

		-- CIV ICON
		local civType:string = pPlayerConfig:GetCivilizationTypeName();
		if civType ~= nil then
			self.m_CivIconInstance = self.m_InfoConditionIM:GetInstance();
			self.m_CivIconInstance.Icon:SetIcon("ICON_" .. civType);
			self.m_CivIconInstance.Button:SetTexture("Banner_TypeSlot");

			local tooltip, isLoyaltyRising, isLoyaltyFalling = GetLoyaltyStatusTooltip(pCity);
			-- Add belongs to string at the beginning of the tooltip
			if civType == "CIVILIZATION_FREE_CITIES" then
				tooltip = Locale.Lookup("LOC_CITY_BELONGS_FREECITY_TT") .. "[NEWLINE]" .. tooltip;
			else
				tooltip = Locale.Lookup("LOC_CITY_BELONGS_TT", pPlayerConfig:GetCivilizationShortDescription()) .. "[NEWLINE]" .. tooltip;
			end

			self.m_CivIconInstance.ConditionRising:SetHide(not isLoyaltyRising or isLoyaltyFalling);
			self.m_CivIconInstance.ConditionFalling:SetHide(not isLoyaltyFalling or isLoyaltyRising);
			self.m_CivIconInstance.Button:SetToolTipString(tooltip);
	
			self.m_CivIconInstance.Button:RegisterCallback( Mouse.eLClick, OnCivIconClicked );
			self.m_CivIconInstance.Button:SetVoid1(playerID);
			self.m_CivIconInstance.Button:SetVoid2(cityID);
		else
			if WorldBuilder.IsActive()==false then
				UI.DataError("Invalid type name returned by GetCivilizationTypeName");
			end
		end

		-- RELIGION ICON
		local pCityReligion:table = pCity:GetReligion();
		local eMajorityReligion:number = self.m_eMajorityReligion;
		if (eMajorityReligion > 0) then
			local instance:table = self.m_InfoConditionIM:GetInstance();
			local majorityReligionColor:number = UI.GetColorValue(GameInfo.Religions[eMajorityReligion].Color);
			instance.Icon:SetColor(majorityReligionColor and majorityReligionColor or COLOR_HOLY_SITE);
			instance.Icon:SetIcon("ICON_" .. GameInfo.Religions[eMajorityReligion].ReligionType);
			instance.Button:SetTexture("Banner_TypeSlot_Religion");
			instance.Button:SetToolTipString(Locale.Lookup("LOC_HUD_CITY_RELIGION_TT", Game.GetReligion():GetName(eMajorityReligion)));
			instance.Button:RegisterCallback( Mouse.eLClick, OnReligionIconClicked );
			instance.Button:SetVoid1(playerID);
			instance.Button:SetVoid2(cityID);

			-- Get a list of religions present in this city
			local otherReligionPressure:number = 0;
			local pReligionsInCity:table = pCityReligion:GetReligionsInCity();
			for _, cityReligion in pairs(pReligionsInCity) do
				local religion:number = cityReligion.Religion;
				if religion >= 0 and religion ~= eMajorityReligion then
					otherReligionPressure = otherReligionPressure + pCityReligion:GetTotalPressureOnCity(religion);
				end
			end

			local majorityPressure:number = pCityReligion:GetTotalPressureOnCity(eMajorityReligion);

			local isPressureRising:boolean = majorityPressure > otherReligionPressure;
			local isPressureFalling:boolean = majorityPressure < otherReligionPressure;

			instance.ConditionRising:SetHide(not isPressureRising or isPressureFalling);
			instance.ConditionFalling:SetHide(not isPressureFalling or isPressureRising);
		else
			local activePantheon:number = pCityReligion:GetActivePantheon();
			if (activePantheon >= 0) then
				local instance:table = self.m_InfoIconIM:GetInstance();
				instance.Icon:SetIcon("ICON_" .. GameInfo.Religions[0].ReligionType);
				instance.Icon:SetColor(COLOR_HOLY_SITE);
				instance.Button:SetTexture("Banner_TypeSlot_Religion");
				instance.Button:SetToolTipString(Locale.Lookup("LOC_HUD_CITY_PANTHEON_TT", GameInfo.Beliefs[activePantheon].Name));
				instance.Button:RegisterCallback( Mouse.eLClick, OnReligionIconClicked );
				instance.Button:SetVoid1(playerID);
				instance.Button:SetVoid2(cityID);
			end
		end

		-- LOYALTY WARNING
		self:UpdateLoyaltyWarning();
	end

	self:Resize();
end



function CityBanner:DB_UpdateInfo_XP2( pCity : table )
	
	self.m_CivIconInstance = nil;
	self.m_InfoIconIM:ResetInstances();
	self.m_InfoConditionIM:ResetInstances();

	if pCity ~= nil then
		local playerID		:number = pCity:GetOwner();
		local cityID		:number = pCity:GetID();
		local pPlayer		:table	= Players[playerID];
		local pPlayerConfig	:table	= PlayerConfigurations[playerID];

		-- CAPITAL ICON
		if pPlayer then
			local instance:table = self.m_InfoIconIM:GetInstance();
			local tooltip:string = "";

			if pPlayer:IsMajor() then
				if pCity:IsOriginalCapital() and pCity:GetOriginalOwner() == pCity:GetOwner() then
					if pCity:IsCapital() then
						-- Original capitial still owned by original owner
						instance.Icon:SetIcon("ICON_CITY_CAPITAL");
					else
						-- Former original capital
						instance.Icon:SetIcon("ICON_FORMER_CAPITAL");
					end
					tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_ORIGINAL_CAPITAL_TT", pPlayerConfig:GetCivilizationShortDescription());
				elseif pCity:IsCapital() then
					-- New capital
					instance.Icon:SetIcon("ICON_NEW_CAPITAL");
					tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_NEW_CAPITAL_TT", pPlayerConfig:GetCivilizationShortDescription());
				else
					-- Other cities
					instance.Icon:SetIcon("ICON_OTHER_CITIES");
					tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_OTHER_CITY_TT", pPlayerConfig:GetCivilizationShortDescription());
				end

				if GameCapabilities.HasCapability("CAPABILITY_ESPIONAGE") then			
					if Game.GetLocalPlayer() == playerID or HasEspionageView(playerID, cityID) then
						tooltip = tooltip .. Locale.Lookup("LOC_ESPIONAGE_VIEW_ENABLED_TT");
					else
						tooltip = tooltip .. Locale.Lookup("LOC_ESPIONAGE_VIEW_DISABLED_TT");
					end
				end

			elseif pPlayer:IsFreeCities() then
				instance.Icon:SetIcon("ICON_CIVILIZATION_FREE_CITIES");
				tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_FREE_CITY_TT");
			else
				instance.Icon:SetIcon("ICON_CITY_STATE");
				tooltip = tooltip .. Locale.Lookup("LOC_CITY_BANNER_CITY_STATE_TT");
			end

			instance.Button:SetTexture("Banner_TypeSlot");
			instance.Button:RegisterCallback(Mouse.eLClick, OnCapitalIconClicked);
			instance.Button:SetVoid1(playerID);
			instance.Button:SetVoid2(cityID);
			instance.Button:SetToolTipString(tooltip);

			-- ORIGINAL OWNER CAPITAL ICON
			if pCity:GetOwner() ~= pCity:GetOriginalOwner() and pCity:IsOriginalCapital() then
				local pOriginalOwner:table = Players[pCity:GetOriginalOwner()];
				-- Only show the captured capital icon for major civs
				if pOriginalOwner:IsMajor() then
					local instance:table = self.m_InfoIconIM:GetInstance();
					instance.Icon:SetIcon("ICON_CAPTURED_CAPITAL");
					local pOriginalOwnerConfig:table = PlayerConfigurations[pCity:GetOriginalOwner()];
					instance.Button:SetToolTipString(Locale.Lookup("LOC_CITY_BANNER_CAPTURED_CAPITAL_TT", pOriginalOwnerConfig:GetCivilizationShortDescription()));
					instance.Button:RegisterCallback(Mouse.eLClick, OnCapitalIconClicked);
					instance.Button:SetVoid1(pCity:GetOriginalOwner());
					instance.Button:SetVoid2(cityID);
				end
			end
		end

		-- CIV ICON
		local civType:string = pPlayerConfig:GetCivilizationTypeName();
		if civType ~= nil then
			self.m_CivIconInstance = self.m_InfoConditionIM:GetInstance();
			self.m_CivIconInstance.Icon:SetIcon("ICON_" .. civType);
			self.m_CivIconInstance.Button:SetTexture("Banner_TypeSlot");
			local tooltip, isLoyaltyRising, isLoyaltyFalling = GetLoyaltyStatusTooltip(pCity);
			-- Add belongs to string at the beginning of the tooltip
			if civType == "CIVILIZATION_FREE_CITIES" then
				tooltip = Locale.Lookup("LOC_CITY_BELONGS_FREECITY_TT") .. "[NEWLINE]" .. tooltip;
			else
				tooltip = Locale.Lookup("LOC_CITY_BELONGS_TT", pPlayerConfig:GetCivilizationShortDescription()) .. "[NEWLINE]" .. tooltip;
			end

-- DB
			if not GameConfiguration.GetValue("DB_REMOVE_FOREIGN_INFO") or self.m_FogState == PLOT_VISIBLE then
				self.m_CivIconInstance.ConditionRising:SetHide(not isLoyaltyRising or isLoyaltyFalling);
				self.m_CivIconInstance.ConditionFalling:SetHide(not isLoyaltyFalling or isLoyaltyRising);
				self.m_CivIconInstance.Button:SetToolTipString(tooltip);
	
				self.m_CivIconInstance.Button:RegisterCallback( Mouse.eLClick, OnCivIconClicked );
			else
				self.m_CivIconInstance.ConditionRising:SetHide(true);
				self.m_CivIconInstance.ConditionFalling:SetHide(true);
				self.m_CivIconInstance.Button:SetToolTipString('');
	
				self.m_CivIconInstance.Button:RegisterCallback( Mouse.eLClick, function() end);
			end
-- /DB
			self.m_CivIconInstance.Button:SetVoid1(playerID);
			self.m_CivIconInstance.Button:SetVoid2(cityID);
		else
			if WorldBuilder.IsActive()==false then
				UI.DataError("Invalid type name returned by GetCivilizationTypeName");
			end
		end

		-- RELIGION ICON
-- DB
		if not GameConfiguration.GetValue("DB_REMOVE_FOREIGN_INFO") or self.m_FogState == PLOT_VISIBLE then
-- /DB
			local pCityReligion:table = pCity:GetReligion();
			local eMajorityReligion:number = self.m_eMajorityReligion;
			if (eMajorityReligion > 0) then
				local instance:table = self.m_InfoConditionIM:GetInstance();
				local majorityReligionColor:number = UI.GetColorValue(GameInfo.Religions[eMajorityReligion].Color);
				instance.Icon:SetColor(majorityReligionColor and majorityReligionColor or COLOR_HOLY_SITE);
				instance.Icon:SetIcon("ICON_" .. GameInfo.Religions[eMajorityReligion].ReligionType);
				instance.Button:SetTexture("Banner_TypeSlot_Religion");
				instance.Button:SetToolTipString(Locale.Lookup("LOC_HUD_CITY_RELIGION_TT", Game.GetReligion():GetName(eMajorityReligion)));
				instance.Button:RegisterCallback( Mouse.eLClick, OnReligionIconClicked );
				instance.Button:SetVoid1(playerID);
				instance.Button:SetVoid2(cityID);

				-- Get a list of religions present in this city
				local otherReligionPressure:number = 0;
				local pReligionsInCity:table = pCityReligion:GetReligionsInCity();
				for _, cityReligion in pairs(pReligionsInCity) do
					local religion:number = cityReligion.Religion;
					if religion >= 0 and religion ~= eMajorityReligion then
						otherReligionPressure = otherReligionPressure + pCityReligion:GetTotalPressureOnCity(religion);
					end
				end

				local majorityPressure:number = pCityReligion:GetTotalPressureOnCity(eMajorityReligion);

				local isPressureRising:boolean = majorityPressure > otherReligionPressure;
				local isPressureFalling:boolean = majorityPressure < otherReligionPressure;

				instance.ConditionRising:SetHide(not isPressureRising or isPressureFalling);
				instance.ConditionFalling:SetHide(not isPressureFalling or isPressureRising);
			else
				local activePantheon:number = pCityReligion:GetActivePantheon();
				if (activePantheon >= 0) then
					local instance:table = self.m_InfoIconIM:GetInstance();
					instance.Icon:SetIcon("ICON_" .. GameInfo.Religions[0].ReligionType);
					instance.Icon:SetColor(COLOR_HOLY_SITE);
					instance.Button:SetTexture("Banner_TypeSlot_Religion");
					instance.Button:SetToolTipString(Locale.Lookup("LOC_HUD_CITY_PANTHEON_TT", GameInfo.Beliefs[activePantheon].Name));
					instance.Button:RegisterCallback( Mouse.eLClick, OnReligionIconClicked );
					instance.Button:SetVoid1(playerID);
					instance.Button:SetVoid2(cityID);
				end
			end
-- DB
		end
-- /DB

		-- LOYALTY WARNING
-- DB
		if not GameConfiguration.GetValue("DB_REMOVE_FOREIGN_INFO") or self.m_FogState == PLOT_VISIBLE then
			self:UpdateLoyaltyWarning();
		end
-- /DB
	end

	self:Resize();
end