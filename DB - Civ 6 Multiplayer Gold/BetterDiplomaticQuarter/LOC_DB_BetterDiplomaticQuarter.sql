UPDATE LocalizedText SET Text = REPLACE(Text, ' at a time', '') WHERE Tag IN ('LOC_DISTRICT_DIPLOMATIC_QUARTER_DESCRIPTION', 'LOC_DISTRICT_DIPLOMATIC_QUARTER_EXPANSION2_DESCRIPTION') AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = Text || '[NEWLINE][NEWLINE]With{LOC_GOLD_LABEL}, two new projects are available:[NEWLINE][ICON_Bullet]{LOC_NAME_DB_EXPAND_DIPLOMACY}: {LOC_DESC_DB_EXPAND_DIPLOMACY}[NEWLINE][ICON_Bullet]{LOC_NAME_DB_EXPAND_ESPIONAGE}: {LOC_DESC_DB_EXPAND_ESPIONAGE}' WHERE Tag IN ('LOC_DISTRICT_DIPLOMATIC_QUARTER_DESCRIPTION', 'LOC_DISTRICT_DIPLOMATIC_QUARTER_EXPANSION2_DESCRIPTION') AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = REPLACE(Text, '+2 Influence Points per turn.', '+4{LOC_GOLD_LABEL} Influence Points per turn.') WHERE Tag = 'LOC_BUILDING_CONSULATE_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Consulate building', '+8{LOC_GOLD_LABEL} in your Consulate') WHERE Language = 'en_US' AND Tag = 'LOC_MINOR_CIV_TRADE_TRAIT_MEDIUM_INFLUENCE_BONUS' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Consulate building', '+4{LOC_GOLD_LABEL} in your Consulate') WHERE Language = 'en_US' AND Tag IN (
'LOC_MINOR_CIV_SCIENTIFIC_TRAIT_MEDIUM_INFLUENCE_BONUS',
'LOC_MINOR_CIV_RELIGIOUS_TRAIT_MEDIUM_INFLUENCE_BONUS',
'LOC_MINOR_CIV_CULTURAL_TRAIT_MEDIUM_INFLUENCE_BONUS') ;
UPDATE LocalizedText SET Text = '+2 [ICON_Production] Production in every Armory and +4{LOC_GOLD_LABEL} in your Consulate when producing units.' WHERE Language = 'en_US' AND Tag  = 'LOC_MINOR_CIV_MILITARISTIC_TRAIT_MEDIUM_INFLUENCE_BONUS' ;
UPDATE LocalizedText SET Text = '+2 [ICON_Production] Production in every Factory and +4{LOC_GOLD_LABEL} in your Consulate when producing wonders, buildings, and districts.' WHERE Language = 'en_US' AND Tag  = 'LOC_MINOR_CIV_INDUSTRIAL_TRAIT_MEDIUM_INFLUENCE_BONUS' ;


UPDATE LocalizedText SET Text = REPLACE(Text, '+3 Influence Points per turn.', '+6{LOC_GOLD_LABEL} Influence Points per turn.') WHERE Tag = 'LOC_BUILDING_CHANCERY_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, '50 [ICON_Science] Science for every level of the enemy Spy.', '100{LOC_GOLD_LABEL} [ICON_Science] Science for every level of the enemy Spy.') WHERE Tag = 'LOC_BUILDING_CHANCERY_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Chancery building', '+12{LOC_GOLD_LABEL} in your Chancery') WHERE Language = 'en_US' AND Tag = 'LOC_MINOR_CIV_TRADE_TRAIT_LARGE_INFLUENCE_BONUS' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Chancery building', '+6{LOC_GOLD_LABEL} in your Chancery') WHERE Language = 'en_US' AND Tag IN (
'LOC_MINOR_CIV_SCIENTIFIC_TRAIT_LARGE_INFLUENCE_BONUS',
'LOC_MINOR_CIV_RELIGIOUS_TRAIT_LARGE_INFLUENCE_BONUS',
'LOC_MINOR_CIV_CULTURAL_TRAIT_LARGE_INFLUENCE_BONUS') ;
UPDATE LocalizedText SET Text = '+3 [ICON_Production] Production in every Military Academy and +6{LOC_GOLD_LABEL} in your Chancery when producing units.' WHERE Language = 'en_US' AND Tag  = 'LOC_MINOR_CIV_MILITARISTIC_TRAIT_LARGE_INFLUENCE_BONUS' ;
UPDATE LocalizedText SET Text = '+3 [ICON_Production] Production in every Power Plant and +6{LOC_GOLD_LABEL} in your Chancery when producing wonders, buildings, and districts.' WHERE Language = 'en_US' AND Tag  = 'LOC_MINOR_CIV_INDUSTRIAL_TRAIT_LARGE_INFLUENCE_BONUS' ;


INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES
('LOC_NAME_DB_EXPAND_DIPLOMACY',		'Recruit Envoy', 'en_US'),
('LOC_SHORT_NAME_DB_EXPAND_DIPLOMACY',	'{LOC_NAME_DB_EXPAND_DIPLOMACY}', 'en_US'),
('LOC_DESC_DB_EXPAND_DIPLOMACY',		'+1 Envoy', 'en_US'),
('LOC_NAME_DB_EXPAND_ESPIONAGE',		'Expand Espionage', 'en_US'),
('LOC_SHORT_NAME_DB_EXPAND_ESPIONAGE',	'{LOC_NAME_DB_EXPAND_ESPIONAGE}', 'en_US'),
('LOC_DESC_DB_EXPAND_ESPIONAGE',		'+1 Spy slot', 'en_US')
;