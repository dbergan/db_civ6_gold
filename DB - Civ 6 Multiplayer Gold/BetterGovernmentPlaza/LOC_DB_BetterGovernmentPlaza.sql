UPDATE LocalizedText SET Text = REPLACE(Text, '5 turns', '10 turns') WHERE Tag = 'LOC_BUILDING_GOV_CONQUEST_DESCRIPTION' AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = REPLACE(Text, 'costs half [ICON_Gold] Gold.', 'costs nothing{LOC_GOLD_LABEL}.') WHERE Tag IN ('LOC_BUILDING_GOV_CITYSTATES_DESCRIPTION', 'LOC_BUILDING_GOV_CITYSTATES_EXPANSION2_DESCRIPTION') AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'units gain +4 [ICON_Strength] Combat Strength', 'units gain +7{LOC_GOLD_LABEL} [ICON_Strength] Combat Strength') WHERE Tag IN ('LOC_BUILDING_GOV_CITYSTATES_DESCRIPTION', 'LOC_BUILDING_GOV_CITYSTATES_EXPANSION2_DESCRIPTION') AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = '+7{LOC_GOLD_LABEL} from Foreign Ministry' WHERE Tag IN ('GOV_CITYSTATES_LEVIED_COMBAT_STRENGTH_DESCRIPTION', 'GOV_CITYSTATES_COMBAT_STRENGTH_DESCRIPTION') AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = REPLACE(Text, 'Grants the ability to buy land units with [ICON_Faith] Faith.', 'Spreads religious pressure to cities within 6 tiles upon killing a non-barbarian military unit. (Distance counted from the attacker''s location at the end of combat.){LOC_GOLD_LABEL}') WHERE Tag = 'LOC_BUILDING_GOV_FAITH_DESCRIPTION' AND Language = 'en_US' ;

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES
('LOC_NAME_DB_ABILITY_RELIGIOUS_PRESSURE_ON_KILL',	'Grandmaster''s Chapel', 'en_US'),
('LOC_DESC_DB_ABILITY_RELIGIOUS_PRESSURE_ON_KILL',	'Spreads religious pressure to cities within 6 tiles upon killing a non-barbarian military unit. (Distance counted from the attacker''s location at the end of combat.){LOC_GOLD_LABEL}', 'en_US')
;