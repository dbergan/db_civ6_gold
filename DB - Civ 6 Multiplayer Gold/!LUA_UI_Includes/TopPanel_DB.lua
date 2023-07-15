include('DB_Includes_UI')

-- DB - more yield precision [ALL]
-- function copied from G:\SteamLibrary\steamapps\common\Sid Meier's Civilization VI\Base\Assets\UI\TopPanel.lua
function FormatValuePerTurn( value:number )
	if(value == 0) then
		return Locale.ToNumber(value);
	else
-- DB
		return Locale.Lookup("{1: number +#,###.##;-#,###.##}", value)
-- /DB
	end
end


-- DB - extend tech/civic tooltip [DB_LFOC], extend tourism tooltip [BR]
-- function copied from G:\SteamLibrary\steamapps\common\Sid Meier's Civilization VI\Base\Assets\UI\TopPanel.lua

function RefreshYields()
	local ePlayer		:number = Game.GetLocalPlayer();
	local localPlayer	:table= nil;
	if ePlayer ~= -1 then
		localPlayer = Players[ePlayer];
		if localPlayer == nil then
			return;
		end
	else
		return;
	end

	---- SCIENCE ----
	if GameCapabilities.HasCapability("CAPABILITY_SCIENCE") and GameCapabilities.HasCapability("CAPABILITY_DISPLAY_TOP_PANEL_YIELDS") then
		m_ScienceYieldButton = m_ScienceYieldButton or m_YieldButtonSingleManager:GetInstance();
		local playerTechnology		:table	= localPlayer:GetTechs();
		local currentScienceYield	:number = playerTechnology:GetScienceYield();
-- DB - extend tech tooltip to include bonus [DB_LFOC]
		if GameConfiguration.GetValue("DB_LEARN_FROM_OTHER_CIVS") then
			local Bonus = 0
			local Note = ""
			Bonus, Note, _ = ProspectInformation(ePlayer, playerTechnology:GetResearchingTech(), "S")
			currentScienceYield = currentScienceYield + Bonus
			if Note ~= "" then
				Note = "{LOC_DB_LEARN_FROM_OTHER_CIVS_TOOLTIP_HEADER}" .. Note
			end
			m_ScienceYieldButton.YieldBacking:LocalizeAndSetToolTip( GetScienceTooltip()  .. Note );
		end
-- /DB
		m_ScienceYieldButton.YieldPerTurn:SetText( FormatValuePerTurn(currentScienceYield) );	

		m_ScienceYieldButton.YieldIconString:SetText("[ICON_ScienceLarge]");
		m_ScienceYieldButton.YieldButtonStack:CalculateSize();
	end	
	
	---- CULTURE----
	if GameCapabilities.HasCapability("CAPABILITY_CULTURE") and GameCapabilities.HasCapability("CAPABILITY_DISPLAY_TOP_PANEL_YIELDS") then
		m_CultureYieldButton = m_CultureYieldButton or m_YieldButtonSingleManager:GetInstance();
		local playerCulture			:table	= localPlayer:GetCulture();
		local currentCultureYield	:number = playerCulture:GetCultureYield();
-- DB - extend culture tooltip to include bonus [DB_LFOC]
		if GameConfiguration.GetValue("DB_LEARN_FROM_OTHER_CIVS") then
			local Bonus = 0
			local Note = ""
			Bonus, Note, _ = ProspectInformation(ePlayer, playerCulture:GetProgressingCivic(), "C")
			currentCultureYield = currentCultureYield + Bonus
			if Note ~= "" then
				Note = "{LOC_DB_LEARN_FROM_OTHER_CIVS_TOOLTIP_HEADER}" .. Note
			end
			m_CultureYieldButton.YieldBacking:LocalizeAndSetToolTip( GetCultureTooltip() .. Note );
		end
-- /DB
		m_CultureYieldButton.YieldPerTurn:SetText( FormatValuePerTurn(currentCultureYield) );	
		m_CultureYieldButton.YieldPerTurn:SetColorByName("ResCultureLabelCS");

		m_CultureYieldButton.YieldBacking:SetColor(UI.GetColorValueFromHexLiteral(0x99fe2aec));
		m_CultureYieldButton.YieldIconString:SetText("[ICON_CultureLarge]");
		m_CultureYieldButton.YieldButtonStack:CalculateSize();
	end

	---- FAITH ----
	if GameCapabilities.HasCapability("CAPABILITY_FAITH") and GameCapabilities.HasCapability("CAPABILITY_DISPLAY_TOP_PANEL_YIELDS") then
		m_FaithYieldButton = m_FaithYieldButton or m_YieldButtonDoubleManager:GetInstance();
		local playerReligion		:table	= localPlayer:GetReligion();
		local faithYield			:number = playerReligion:GetFaithYield();
		local faithBalance			:number = playerReligion:GetFaithBalance();
		m_FaithYieldButton.YieldBalance:SetText( Locale.ToNumber(faithBalance, "#,###.#") );	
		m_FaithYieldButton.YieldPerTurn:SetText( FormatValuePerTurn(faithYield) );
		m_FaithYieldButton.YieldBacking:SetToolTipString( GetFaithTooltip() );
		m_FaithYieldButton.YieldIconString:SetText("[ICON_FaithLarge]");
		m_FaithYieldButton.YieldButtonStack:CalculateSize();	
	end

	---- GOLD ----
	if GameCapabilities.HasCapability("CAPABILITY_GOLD") and GameCapabilities.HasCapability("CAPABILITY_DISPLAY_TOP_PANEL_YIELDS") then
		m_GoldYieldButton = m_GoldYieldButton or m_YieldButtonDoubleManager:GetInstance();
		local playerTreasury:table	= localPlayer:GetTreasury();
		local goldYield		:number = playerTreasury:GetGoldYield() - playerTreasury:GetTotalMaintenance();
-- DB
		if GameConfiguration.GetValue("DB_GOLD_FROM_TOURISM") and DB_GetGoldFromForeignTourists(ePlayer) > 0 then
			goldYield = goldYield + DB_GetGoldFromForeignTourists(ePlayer)
		end
-- /DB
		local goldBalance	:number = math.floor(playerTreasury:GetGoldBalance());
		m_GoldYieldButton.YieldBalance:SetText( Locale.ToNumber(goldBalance, "#,###.#") );
		m_GoldYieldButton.YieldBalance:SetColorByName("ResGoldLabelCS");	
		m_GoldYieldButton.YieldPerTurn:SetText( FormatValuePerTurn(goldYield) );
		m_GoldYieldButton.YieldIconString:SetText("[ICON_GoldLarge]");
		m_GoldYieldButton.YieldPerTurn:SetColorByName("ResGoldLabelCS");

-- DB
		if GameConfiguration.GetValue("DB_GOLD_FROM_TOURISM") and DB_GetGoldFromForeignTourists(ePlayer) > 0 then
			-- Gold per [ICON_Turn] Turn[NEWLINE][NEWLINE]Income: +5 [ICON_Gold][NEWLINE]+5 from Cities[NEWLINE][NEWLINE]Expense: -0 [ICON_Gold]
			local TT = GetGoldTooltip()
			local _, Start = TT:find('Income: %+')
			local sEnd = TT:find(' %[ICON_Gold', Start)
			local IncomeValue = TT:match('(%d*%.?%d+)', Start) + DB_GetGoldFromForeignTourists(ePlayer)
			TT = TT:sub(0, Start) .. IncomeValue .. TT:sub(sEnd)

			local CityText = "from Cities"
			local TourismText = Locale.Lookup("[NEWLINE]+" .. DB_GetGoldFromForeignTourists(ePlayer) .. " from Foreign Tourists{LOC_GOLD_LABEL}")
			TT = TT:gsub(CityText, CityText .. TourismText, 1)

			m_GoldYieldButton.YieldBacking:SetToolTipString(TT)
		else
			m_GoldYieldButton.YieldBacking:SetToolTipString( GetGoldTooltip() );
		end
-- /DB
		m_GoldYieldButton.YieldBacking:SetColorByName("ResGoldLabelCS");
		m_GoldYieldButton.YieldButtonStack:CalculateSize();	
	end

	---- TOURISM ----
	if GameCapabilities.HasCapability("CAPABILITY_TOURISM") and GameCapabilities.HasCapability("CAPABILITY_DISPLAY_TOP_PANEL_YIELDS") then
		local OtherPlayerCount = PlayerManager.GetAliveMajorsCount() - 1
		m_TourismYieldButton = m_TourismYieldButton or m_YieldButtonSingleManager:GetInstance();
		local tourismRate = Round(localPlayer:GetStats():GetTourism(), 1);
		local tourismRateTT:string = Locale.Lookup("LOC_WORLD_RANKINGS_OVERVIEW_CULTURE_TOURISM_RATE", tourismRate);
		local tourismBreakdown = localPlayer:GetStats():GetTourismToolTip();
		if(tourismBreakdown and #tourismBreakdown > 0) then
			tourismRateTT = tourismRateTT .. "[NEWLINE][NEWLINE]" .. tourismBreakdown;
		end
-- DB - expand tourism tooltip [BR]
		local LocalPlayerCulture = localPlayer:GetCulture()
		tourismRateTT = tourismRateTT .. Locale.Lookup("LOC_DB_TOURISM_TOOLTIP_HEADER")
		-- Domestic Tourists: 153
		tourismRateTT = tourismRateTT .. Locale.Lookup("LOC_DB_MY_DOMESTIC_TOURISTS", string.format("%d", LocalPlayerCulture:GetStaycationers()))
        
		-- Visting Tourists: 12
		local OtherPlayers = PlayerManager.GetWasEverAliveMajors()
		local LoopTT = ""
		local LoopSum = 0
		for _, LoopPlayer in ipairs(OtherPlayers) do
			local LoopPlayerID = LoopPlayer:GetID()
			if ePlayer ~= LoopPlayerID and localPlayer:GetDiplomacy():HasMet(LoopPlayerID) == true then
				local Temp = LocalPlayerCulture:GetTouristsFromTooltip(LoopPlayerID)
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
				LoopSum = LoopSum + Lifetime
				local LoopCivName = Locale.Lookup("LOC_" .. PlayerConfigurations[LoopPlayerID]:GetCivilizationTypeName() .. "_NAME")

				if LoopPlayer:IsAlive() == false then
					-- From Egypt: 63 (+0/turn)
					LoopTT = LoopTT .. "[NEWLINE]" .. Locale.Lookup("LOC_DB_VISITING_TOURIST_LINE_DEAD", LoopCivName, Lifetime)
				elseif GameConfiguration.GetValue("DB_GOLD_FROM_TOURISM") then
					-- From Egypt: 63 (+3/turn, +0.5[ICON_Gold])
					local TourismGold = tonumber(PerTurn) / tonumber(OtherPlayerCount)
					TourismGold = Locale.Lookup("{1: number #,###.#;-#,###.#}", TourismGold)
					LoopTT = LoopTT .. "[NEWLINE]" .. Locale.Lookup("LOC_DB_VISITING_TOURIST_LINE_WITH_GOLD", LoopCivName, Lifetime, PerTurn, TourismGold)
				else
					-- From Egypt: 63 (+3/turn)
					LoopTT = LoopTT .. "[NEWLINE]" .. Locale.Lookup("LOC_DB_VISITING_TOURIST_LINE", LoopCivName, Lifetime, PerTurn)
				end
			end
		end
		tourismRateTT = tourismRateTT .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_DB_MY_VISITING_TOURISTS", string.format("%d", LocalPlayerCulture:GetTouristsTo()))
		tourismRateTT = tourismRateTT .. LoopTT
		tourismRateTT = tourismRateTT .. "[NEWLINE]" .. Locale.Lookup("LOC_DB_TOTAL_LINE", string.format("%d", LoopSum))
        
		-- My Citizens Traveling Elsewhere: 54
		LoopTT = ""
		LoopSum = 0
		for _, LoopPlayer in ipairs(OtherPlayers) do
			local LoopPlayerID = LoopPlayer:GetID()
			if ePlayer ~= LoopPlayerID and localPlayer:GetDiplomacy():HasMet(LoopPlayerID) == true then
				local LoopPlayerCulture = LoopPlayer:GetCulture()
				local Temp = LoopPlayerCulture:GetTouristsFromTooltip(ePlayer)
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
				LoopSum = LoopSum + Lifetime
				local LoopCivName = Locale.Lookup("LOC_" .. PlayerConfigurations[LoopPlayerID]:GetCivilizationTypeName() .. "_NAME")
				-- To Egypt: 22 (+2/turn)
				LoopTT = LoopTT .. "[NEWLINE]" .. Locale.Lookup("LOC_DB_TRAVELING_TOURIST_LINE", LoopCivName, Lifetime, PerTurn)
			end
		end
		tourismRateTT = tourismRateTT .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_DB_MY_TRAVELING_TOURISTS")
		tourismRateTT = tourismRateTT .. LoopTT
		tourismRateTT = tourismRateTT .. "[NEWLINE]" .. Locale.Lookup("LOC_DB_TOTAL_LINE", string.format("%d", LoopSum))
        
		tourismRateTT = tourismRateTT .. "[NEWLINE][NEWLINE]" .. Locale.Lookup("LOC_DB_CULTURE_VICTORY")
-- /DB
		
		m_TourismYieldButton.YieldPerTurn:SetText( tourismRate );	
		m_TourismYieldButton.YieldBacking:SetToolTipString(tourismRateTT);
		m_TourismYieldButton.YieldPerTurn:SetColorByName("ResTourismLabelCS");
		m_TourismYieldButton.YieldBacking:SetColorByName("ResTourismLabelCS");
		m_TourismYieldButton.YieldIconString:SetText("[ICON_TourismLarge]");
		if (tourismRate > 0) then
			m_TourismYieldButton.Top:SetHide(false);
		else
			m_TourismYieldButton.Top:SetHide(true);
		end 
	end

	Controls.YieldStack:CalculateSize();
	Controls.StaticInfoStack:CalculateSize();
	Controls.InfoStack:CalculateSize();

	Controls.YieldStack:RegisterSizeChanged( RefreshResources );
	Controls.StaticInfoStack:RegisterSizeChanged( RefreshResources );

-- DB - add in code from the Firaxis's XP2 RefreshYields for world congress values
	if GameCapabilities.HasCapability("CAPABILITY_WORLD_CONGRESS") then
		local localPlayerID = Game.GetLocalPlayer();
		if localPlayerID ~= -1 then 
			local localPlayer = Players[localPlayerID];

			--Favor
			m_FavorYieldButton = m_FavorYieldButton or m_YieldButtonDoubleManager:GetInstance();
			local playerFavor	:number = localPlayer:GetFavor();
			local favorPerTurn	:number = localPlayer:GetFavorPerTurn();
			local tooltip		:string = Locale.Lookup("LOC_WORLD_CONGRESS_TOP_PANEL_FAVOR_TOOLTIP");

			local details = localPlayer:GetFavorPerTurnToolTip();
			if(details and #details > 0) then
				tooltip = tooltip .. "[NEWLINE]" .. details;
			end

			m_FavorYieldButton.YieldBalance:SetText(Locale.ToNumber(playerFavor, "#,###.#"));
			m_FavorYieldButton.YieldBalance:SetColorByName("ResFavorLabelCS");
			m_FavorYieldButton.YieldPerTurn:SetText(FormatValuePerTurn(favorPerTurn));	
			m_FavorYieldButton.YieldPerTurn:SetColorByName("ResFavorLabelCS");
			m_FavorYieldButton.YieldBacking:SetToolTipString(tooltip);
			m_FavorYieldButton.YieldBacking:SetColorByName("ResFavorLabelCS");
			m_FavorYieldButton.YieldIconString:SetText("[ICON_FAVOR_LARGE]");
			m_FavorYieldButton.YieldButtonStack:CalculateSize();
		end	
	end
-- /DB
end

-- DB - Refresh science/culture yields after tech/civic changed
PRIOR_LateInitialize = LateInitialize
function LateInitialize()
	if GameConfiguration.GetValue("DB_LEARN_FROM_OTHER_CIVS") then
		Events.CivicChanged.Add(OnRefreshYields)
		Events.ResearchChanged.Add(OnRefreshYields)
	end
	PRIOR_LateInitialize()
end
