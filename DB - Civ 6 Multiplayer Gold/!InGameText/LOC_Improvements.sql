-- ('', '', 'en_US'),

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES

('LOC_PEDIA_IMPROVEMENTS_PAGEGROUP_IMPROVEMENTS_NAME', 'Improvements{LOC_GOLD_LABEL}', 'en_US'),

-- Military improvements that can't be built on resources
('LOC_IMPROVEMENT_AIRSTRIP_DESCRIPTION', 'Airstrips are air bases that can station 3 air units. Military Engineers can construct Airstrips in friendly or neutral territory, but only on a flat featureless land tile. -1 appeal to adjacent tiles.[NEWLINE][NEWLINE]Can be built on resources.{LOC_GOLD_LABEL}', 'en_US'),
('LOC_IMPROVEMENT_MISSILE_SILO_DESCRIPTION', 'Missile Silos are a launch site for Nuclear and Thermonuclear Devices. Military Engineers can construct Missile Silos in friendly territory, but only on a flat featureless land tile.[NEWLINE][NEWLINE]Can be built on resources.{LOC_GOLD_LABEL}', 'en_US'),
('LOC_IMPROVEMENT_FORT_DESCRIPTION', 'Forts give an occupying unit +4 [ICON_Strength] Combat Strength on defense, and 2 turns of fortification (an additional +6 [ICON_Strength] Combat Strength). Military Engineers can construct Forts in friendly or neutral territory, but only on a featureless land tile.[NEWLINE][NEWLINE]Can be built on resources.{LOC_GOLD_LABEL}', 'en_US'),
('LOC_IMPROVEMENT_ROMAN_FORT_DESCRIPTION', 'Roman Forts give an occupying unit +4 [ICON_Strength] Combat Strength on defense, and 2 turns of fortification (an additional +6 [ICON_Strength] Combat Strength). Roman Legions can construct Roman Forts in friendly or neutral territory, but only on a featureless land tile.[NEWLINE][NEWLINE]Can be built on resources.{LOC_GOLD_LABEL}', 'en_US'),
('LOC_IMPROVEMENT_MAORI_PA_DESCRIPTION', 'Pas give an occupying unit +4 [ICON_Strength] Combat Strength on defense, and 2 turns of fortification (an additional +6 [ICON_Strength] Combat Strength). A Maori unit occupying a Pa heals even if they just moved or attacked. Toas can construct Pas in friendly or neutral territory, but only on a featureless land tile.[NEWLINE][NEWLINE]Can be built on resources.{LOC_GOLD_LABEL}', 'en_US'),
('LOC_IMPROVEMENT_ALCAZAR_DESCRIPTION', 'Alcazars give an occupying unit +4 [ICON_Strength] Combat Strength on defense, and 2 turns of fortification (an additional +6 [ICON_Strength] Combat Strength). Provides +2 [ICON_Culture] Culture. Builders can construct Alcazars in friendly or neutral territory, but only on a featureless land tile. Cannot be built next to another Alcazar.[NEWLINE][NEWLINE]Can be built on resources.{LOC_GOLD_LABEL}', 'en_US'),
('LOC_IMPROVEMENT_ALCAZAR_EXPANSION2_DESCRIPTION', 'Alcazars give an occupying unit +4 [ICON_Strength] Combat Strength on defense, and 2 turns of fortification (an additional +6 [ICON_Strength] Combat Strength). Provides +2 [ICON_Culture] Culture, [ICON_SCIENCE] Science equal to 50% of the tile''s Appeal, and [ICON_TOURISM] Tourism after researching Flight. Builders can construct Alcazars in friendly or neutral territory, but only on a featureless land tile. Cannot be built next to another Alcazar.[NEWLINE][NEWLINE]Can be built on resources.{LOC_GOLD_LABEL}', 'en_US'),

-- Fishery can't be built on Reefs
('LOC_IMPROVEMENT_FISHERY_DESCRIPTION', 'A [ICON_Governor] Governor unique improvement that can be built in a city when a Governor has the Aquaculture promotion. Yields 1 [ICON_Food] Food, +1 additional [ICON_Food] Food if adjacent to a sea resource. Must be built on a coastal plot. Cannot be built on a reef.{LOC_GOLD_LABEL}', 'en_US')

;