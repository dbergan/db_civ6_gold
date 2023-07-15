PRIOR_GetDetails = GetDetails

function GetDetails(data)
	details = PRIOR_GetDetails(data)

	local HasHeader = false
	local IsMountain = false

	local op1 = {}
	op1['Desert'] = '{LOC_OP_HELIOS_UPPER}[NEWLINE]{LOC_OP_HELIOS_DESC}'
	op1['Snow'] = '{LOC_OP_PERSEPHONE_UPPER}[NEWLINE]{LOC_OP_PERSEPHONE_DESC}'
	op1['Tundra'] = '{LOC_OP_PERSEPHONE_UPPER}[NEWLINE]{LOC_OP_PERSEPHONE_DESC}'
	op1['Ocean'] = '{LOC_OP_POSEIDON_UPPER}[NEWLINE]{LOC_OP_POSEIDON_DESC}'

	local op2 = {}
	op2['Sheep'] = '{LOC_OP_APOLLO_UPPER}[NEWLINE]{LOC_OP_APOLLO_DESC}'
	op2['Iron'] = '{LOC_OP_ARES_UPPER}[NEWLINE]{LOC_OP_ARES_DESC}[NEWLINE][NEWLINE][NEWLINE]{LOC_OP_HEPHAESTUS_UPPER}[NEWLINE]{LOC_OP_HEPHAESTUS_DESC}'
	op2['Niter'] = '{LOC_OP_ARES_UPPER}[NEWLINE]{LOC_OP_ARES_DESC}'
	op2['Uranium'] = '{LOC_OP_ARES_UPPER}[NEWLINE]{LOC_OP_ARES_DESC}'
	op2['Deer'] = '{LOC_OP_ARTEMIS_UPPER}[NEWLINE]{LOC_OP_ARTEMIS_DESC}'
	op2['Furs'] = '{LOC_OP_ARTEMIS_UPPER}[NEWLINE]{LOC_OP_ARTEMIS_DESC}'
	op2['Ivory'] = '{LOC_OP_ARTEMIS_UPPER}[NEWLINE]{LOC_OP_ARTEMIS_DESC}'
	op2['Cotton'] = '{LOC_OP_ATHENA_UPPER}[NEWLINE]{LOC_OP_ATHENA_DESC}'
	op2['Olives'] = '{LOC_OP_ATHENA_UPPER}[NEWLINE]{LOC_OP_ATHENA_DESC}'
	op2['Stone'] = '{LOC_OP_ATLAS_UPPER}[NEWLINE]{LOC_OP_ATLAS_DESC}'
	op2['Wheat'] = '{LOC_OP_DEMETER_UPPER}[NEWLINE]{LOC_OP_DEMETER_DESC}'
	op2['Wine'] = '{LOC_OP_DIONYSUS_UPPER}[NEWLINE]{LOC_OP_DIONYSUS_DESC}'
	op2['Tobacco'] = '{LOC_OP_DIONYSUS_UPPER}[NEWLINE]{LOC_OP_DIONYSUS_DESC}'
	op2['Diamonds'] = '{LOC_OP_HADES_UPPER}[NEWLINE]{LOC_OP_HADES_DESC}'
	op2['Silver'] = '{LOC_OP_HADES_UPPER}[NEWLINE]{LOC_OP_HADES_DESC}'
	op2['Jade'] = '{LOC_OP_HADES_UPPER}[NEWLINE]{LOC_OP_HADES_DESC}'
	op2['Pearls'] = '{LOC_OP_HADES_UPPER}[NEWLINE]{LOC_OP_HADES_DESC}'
	op2['Amber'] = '{LOC_OP_HADES_UPPER}[NEWLINE]{LOC_OP_HADES_DESC}'
	op2['Copper'] = '{LOC_OP_HEPHAESTUS_UPPER}[NEWLINE]{LOC_OP_HEPHAESTUS_DESC}'
	op2['Coal'] = '{LOC_OP_HEPHAESTUS_UPPER}[NEWLINE]{LOC_OP_HEPHAESTUS_DESC}'
	op2['Aluminum'] = '{LOC_OP_HEPHAESTUS_UPPER}[NEWLINE]{LOC_OP_HEPHAESTUS_DESC}'
	op2['Cattle'] = '{LOC_OP_HERA_UPPER}[NEWLINE]{LOC_OP_HERA_DESC}'
	op2['Mercury'] = '{LOC_OP_HERMES_UPPER}[NEWLINE]{LOC_OP_HERMES_DESC}'
	op2['Oil'] = '{LOC_OP_HERMES_UPPER}[NEWLINE]{LOC_OP_HERMES_DESC}'
	op2['Horses'] = '{LOC_OP_POSEIDON_UPPER}[NEWLINE]{LOC_OP_POSEIDON_DESC}'

	op2['Appeal: Breathtaking'] = '{LOC_OP_APHRODITE_UPPER}[NEWLINE]{LOC_OP_APHRODITE_DESC}'
	op2['Volcanic Soil'] = '{LOC_OP_HEPHAESTUS_UPPER}[NEWLINE]{LOC_OP_HEPHAESTUS_DESC}'
	op2['Marsh'] = '{LOC_OP_PAN_UPPER}[NEWLINE]{LOC_OP_PAN_DESC}'

	if GameConfiguration.GetValue("DB_OLYMPIC_PANTHEONS") and IsMountain == false and Locale.Lookup(data.TerrainTypeName):find('Mountain') then
		IsMountain = true
		HasHeader = AddPantheonHeader(details, HasHeader)
		for k, v in ipairs(details) do
			if v:find('Volcano') then
				table.insert(details, Locale.Lookup('[NEWLINE][NEWLINE]' .. op2['Volcanic Soil']))
				break
			end
		end

		table.insert(details, Locale.Lookup('[NEWLINE][NEWLINE]{LOC_OP_ZEUS_UPPER}[NEWLINE]{LOC_OP_ZEUS_DESC}'))
	end	

	-- Search terrain type (e.g. Desert, Snow, Tundra, etc)
	for k2, v2 in pairs(op1) do
		if GameConfiguration.GetValue("DB_OLYMPIC_PANTHEONS") and IsMountain == false and Locale.Lookup(data.TerrainTypeName):find(k2) == 1 then
			HasHeader = AddPantheonHeader(details, HasHeader)
			table.insert(details, Locale.Lookup('[NEWLINE][NEWLINE]' .. v2))
		end
	end

	-- Search tile details for resources & features (e.g. Sheep, Marsh, Breathtaking)
	for k, v in ipairs(details) do
		details[k] = v:gsub('%( Require', '(Require')
		if v == '------------------' then
			details[k] = string.rep('-', 40)
		end

		
		for k2, v2 in pairs(op2) do
			if GameConfiguration.GetValue("DB_OLYMPIC_PANTHEONS") and IsMountain == false and v:find(k2) == 1 then
				HasHeader = AddPantheonHeader(details, HasHeader)
				table.insert(details, Locale.Lookup('[NEWLINE][NEWLINE]' .. v2))
			end
		end
	end

	return details
end

function AddPantheonHeader(details, HasHeader)
	if HasHeader == false then
		table.insert(details, string.rep('-', 40))
		table.insert(details, Locale.Lookup('[NEWLINE]Olympic Pantheons {LOC_GOLD_LABEL}'))
	end
	return true
end