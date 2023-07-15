UPDATE LocalizedText SET Text = 'Your units defending in the city''s territory or attacking a unit that''s in the city''s territory gain +5 [ICON_Strength] Combat Strength.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_HEAD_FALCONER_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = '+{1_Amount} Head Falconer ({LOC_NAME_DB_GOVERNOR_DEFENSE})' WHERE Tag = 'LOC_COMBAT_PREVIEW_CITY_FRIENDLY_COMBAT_BONUS' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = '{DB_POS_VALUE_DARK_BG}{LOC_POLICY_BASTIONS_NAME}/{LOC_NAME_DB_GOVERNOR_DEFENSE}[NEWLINE]({LOC_POLICY_BASTIONS_NAME}/{LOC_NAME_DB_GOVERNOR_DEFENSE} also added {DB_POS_VALUE_DARK_BG} to the Base Strength)' WHERE Tag = 'LOC_COMBAT_PREVIEW_DISTRICT_ATTACK_BONUS' AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = 'Chrysostom' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_NAME' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = '+2 [ICON_Faith] Faith and +4 [ICON_Gold] Gold per turn for each [ICON_Citizen] Citizen in the city.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = '{Value : number +#.#;-#.#} from Population' WHERE Tag = 'LOC_CITY_GOLD_FROM_POPULATION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = 'Euangelion' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_CARDINAL_BISHOP_NAME' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = 'City ignores incoming religious pressure. Religious pressure to adjacent cities is 200% stronger.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_CARDINAL_BISHOP_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = 'Apostles purchased or granted in this city receive an extra promotion.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = 'Inquisitors purchased or granted in this city receive +2 spreads.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = 'On this city''s tiles, your units heal fully in one turn.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS_DESCRIPTION' AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = '+50%[ICON_Production]Production towards constructing districts in this city.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_DESCRIPTION' AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = 'Bustle' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_BUILDER_GUILDMASTER_NAME' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = 'Builders trained, purchased, or granted in this city get +2 build actions.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_BUILDER_GUILDMASTER_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = 'Can construct the Fishery improvement in this city.[NEWLINE][NEWLINE](+0.5[ICON_Housing]Housing, +1[ICON_Food]Food, and an additional +1[ICON_Food]Food per adjacent sea resource.)' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_AQUACULTURE_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = 'Can construct the City Park improvement in this city.[NEWLINE][NEWLINE](+2 Appeal and +1[ICON_Culture]Culture. +1[ICON_Amenities]Amenity when adjacent to water.)' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_PARKS_RECREATION_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = '+0.5[ICON_Housing]Housing, +1[ICON_Food]Food, and an additional +1[ICON_Food]Food per adjacent sea resource.[NEWLINE][NEWLINE]Must be built on a coastal tile.' WHERE Tag = 'LOC_IMPROVEMENT_FISHERY_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = '+2 Appeal and 1[ICON_Culture]Culture. +1[ICON_Amenities]Amenity when adjacent to water.[NEWLINE][NEWLINE]Cannot be built on floodplains. Cannot be adjacent to another City Park.' WHERE Tag = 'LOC_IMPROVEMENT_CITY_PARK_DESCRIPTION' AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = '+50%[ICON_Science]Science in this city.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_EDUCATOR_LIBRARIAN_DESCRIPTION' AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = 'Acquire new tiles in city 200% faster.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = '{DB_POS_VALUE_DARK_BG}Palace Guard/{LOC_NAME_DB_GOVERNOR_DEFENSE}' WHERE Tag = 'LOC_COMBAT_PREVIEW_DISTRICT_PALACE_BONUS' AND Language = 'en_US' ;

/*
UPDATE LocalizedText SET Text = Text || '[NEWLINE][NEWLINE][ICON_Bullet]{LOC_NAME_DB_GOVERNOR_CULTURE}''s "{LOC_NAME_DB_GOV_PROMOTION_DIPLOMATIC_VISIBILITY}" governor title +20% (when not at war)' WHERE Tag = 'LOC_DB_LEARN_FROM_OTHER_CIVS_LIST_OF_BONUSES' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, '180', '200') WHERE Tag = 'LOC_DB_LEARN_FROM_OTHER_CIVS_EXPLANATION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Alliance and Top Secret diplomatic visibility)', 'Alliance, Top Secret diplomatic visibility, and {LOC_NAME_DB_GOVERNOR_CULTURE}''s "{LOC_NAME_DB_GOV_PROMOTION_DIPLOMATIC_VISIBILITY}" governor title)') WHERE Tag = 'LOC_DB_LEARN_FROM_OTHER_CIVS_EXPLANATION' AND Language = 'en_US' ;
*/

-- UPDATE LocalizedText SET Text = 'Your [ICON_TradeRoute] Trade Routes ending here provide +2 [ICON_Food] Food to this city.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS_DESCRIPTION' AND Language = 'en_US' ;
	

-- UPDATE LocalizedText SET Text = 'Resource Logistics' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_NAME' AND Language = 'en_US' ;
-- UPDATE LocalizedText SET Text = 'Strategic resources in the city accrue an additional +2 per turn.' WHERE Tag = 'LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_DESCRIPTION' AND Language = 'en_US' ;

