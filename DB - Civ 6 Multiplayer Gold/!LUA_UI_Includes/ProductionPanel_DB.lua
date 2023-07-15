PRIOR_Close = Close

function Close()
	PRIOR_Close()
	DB_UpdateCityNumbers()
end

-- DB
function DB_UpdateCityNumbers()
	local pSelectedCity	:table = UI.GetHeadSelectedCity();
	local pCitizens		:table = pSelectedCity:GetCitizens();
	local tParameters = {}
	tParameters[CityCommandTypes.PARAM_YIELD_TYPE] = YieldTypes.FOOD -- Yield type 

	-- Sends a do-nothing focus command to update all the city's numbers
	if pCitizens:IsFavoredYield(YieldTypes.FOOD) then
		tParameters[CityCommandTypes.PARAM_FLAGS] = 0	-- Set Favored
		tParameters[CityCommandTypes.PARAM_DATA0] = 1	-- boolean (1=true, 0=false)
	elseif pCitizens:IsDisfavoredYield(YieldTypes.FOOD) then
		tParameters[CityCommandTypes.PARAM_FLAGS] = 1	-- Set Ignored
		tParameters[CityCommandTypes.PARAM_DATA0] = 1	-- boolean (1=true, 0=false)
	else
		tParameters[CityCommandTypes.PARAM_FLAGS] = 0	-- Set Favored
		tParameters[CityCommandTypes.PARAM_DATA0] = 0	-- boolean (1=true, 0=false)
	end
	CityManager.RequestCommand(pSelectedCity, CityCommandTypes.SET_FOCUS, tParameters)
end
-- /DB