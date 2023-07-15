-- ('', '', 'en_US'),

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES

-- combat preview descriptors (why do they call it a "major defeat" when you actually take the city?)
('LOC_HUD_UNIT_PANEL_OUTCOME_DECISIVE_VICTORY',	'', 'en_US'),	-- Miniscule Losses
('LOC_HUD_UNIT_PANEL_OUTCOME_MAJOR_VICTORY',	'', 'en_US'),	-- Minimal Losses
('LOC_HUD_UNIT_PANEL_OUTCOME_MINOR_VICTORY',	'', 'en_US'),	-- Minor Losses
('LOC_HUD_UNIT_PANEL_OUTCOME_STALEMATE',		'', 'en_US'),	-- Medium Losses
('LOC_HUD_UNIT_PANEL_OUTCOME_MINOR_DEFEAT',		'', 'en_US'),	-- Major Losses
('LOC_HUD_UNIT_PANEL_OUTCOME_MAJOR_DEFEAT',		'', 'en_US'),	-- Massive Losses
('LOC_HUD_UNIT_PANEL_OUTCOME_TOTAL_DEFEAT',		'', 'en_US'),	-- Massacred

-- missing in base; added by BR (see ModifierStrings.sql)
('LOC_DB_PREVIEW_BARDING', '{DB_POS_AMOUNT_DARK_BG}{LOC_PROMOTION_BARDING_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}', 'en_US'),
('LOC_DB_PREVIEW_INTERCEPTOR', '{DB_POS_AMOUNT_DARK_BG}{LOC_PROMOTION_INTERCEPTOR_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}', 'en_US'),
('LOC_DB_PREVIEW_DRONE_STRENGTH', '{DB_POS_VALUE_DARK_BG}adjacent {LOC_UNIT_DRONE_NAME}', 'en_US'),
('LOC_DB_PREVIEW_REDOUBT', '{DB_POS_AMOUNT_DARK_BG}{LOC_GOVERNOR_PROMOTION_REDOUBT_NAME} {LOC_GOVERNOR_DESCRIPTOR_PREVIEW_TEXT}', 'en_US'),

-- more clear wording
('LOC_ABILITY_FASCISM_ATTACK_BUFF_MODIFIER_DESCRIPTION', '+5 Fascism {LOC_GOVERNMENT_DESCRIPTOR_PREVIEW_TEXT}', 'en_US'),
('LOC_ABILITY_FINEST_HOUR_FRIENDLY_TERRITORY_DESCRIPTION', '+5 {LOC_POLICY_FINEST_HOUR_NAME} {LOC_POLICY_DESCRIPTOR_PREVIEW_TEXT}', 'en_US'),
('LOC_COMBAT_DIFFICULTY_SCALING', '{DB_POS_VALUE_DARK_BG}{LOC_GAME_HANDICAP}', 'en_US'),  -- didn't use DB_LABEL because it causes a newline (and this modifer is ubiquitous)
('LOC_COMBAT_PREVIEW_DAMAGED_DISTRICT_DESC', '{DB_NEG_VALUE}Damage to city/encampment', 'en_US'),
('LOC_COMBAT_PREVIEW_DISTRICT_ATTACK_BONUS', '{DB_POS_VALUE_DARK_BG}{LOC_POLICY_BASTIONS_NAME} {LOC_POLICY_DESCRIPTOR_PREVIEW_TEXT}[NEWLINE](also {LOC_POLICY_BASTIONS_NAME} added another {DB_POS_VALUE_DARK_BG} to the Base Strength)', 'en_US'),
('LOC_COMBAT_PREVIEW_DISTRICT_ENHANCED_WALLS_BONUS', '{DB_POS_VALUE_DARK_BG}{LOC_POLICY_BASTIONS_NAME} {LOC_POLICY_DESCRIPTOR_PREVIEW_TEXT}', 'en_US'),
('LOC_COMBAT_PREVIEW_DEFENSIVE_IMPROVEMENT_BONUS_DESCRIPTION', '{DB_POS_VALUE_DARK_BG}Fort', 'en_US'),
('LOC_COMBAT_PREVIEW_ESPIONAGE_BONUS', '{DB_POS_VALUE_DARK_BG}Higher Diplomatic Visibility', 'en_US'),
('LOC_COMBAT_PREVIEW_FORTIFIED_DEFENSE_DESCRIPTION', '{DB_POS_VALUE_DARK_BG}Fortified Unit', 'en_US'),
('LOC_COMBAT_PREVIEW_LESS_EFFECTIVE_VS_WALLS_DESC', '{DB_NEG_VALUE_MINUS}Less effective vs cities and encampments', 'en_US'), -- when archers, etc attack
('LOC_COMBAT_PREVIEW_BONUS_VS_BARBARIANS', '{DB_POS_VALUE_DARK_BG}{LOC_POLICY_DISCIPLINE_NAME} {LOC_POLICY_DESCRIPTOR_PREVIEW_TEXT}', 'en_US'),
('LOC_COMBAT_PREVIEW_DISTRICT_PALACE_BONUS', '{DB_POS_VALUE_DARK_BG}Palace Guard/Victor', 'en_US'),	-- Used by the Capital (palace guard) and Victor's promotion

-- consistent red/green font on modifier numbers
('LOC_COMBAT_PREVIEW_TERRAIN_PENALTY', '{DB_NEG_VALUE}Unfavorable Terrain', 'en_US'),
('LOC_COMBAT_PREVIEW_TERRAIN_BONUS_DESC', '{DB_POS_VALUE_DARK_BG}Good Terrain', 'en_US'),
('LOC_COMBAT_PREVIEW_DEFENSIVE_IMPROVEMENT_BONUS_DESC', '{DB_POS_VALUE_DARK_BG}Fort', 'en_US'),
('LOC_COMBAT_PREVIEW_EMBARKED_UNIT_STRENGTH', '[COLOR_RED]Modifiers do not appear in combat previews vs embarked units, but will be applied to the attack. See Civilopedia: Embarking Units.[ENDCOLOR]', 'en_US'),
('LOC_COMBAT_PREVIEW_DAMAGE_FROM_INTERCEPTOR', '{DB_NEG_VALUE_MINUS}due to damage from interceptor', 'en_US'),
('LOC_COMBAT_PREVIEW_DAMAGE_FROM_ANTI_AIR', '{DB_NEG_VALUE_MINUS}due to damage from anti-air', 'en_US'),
('LOC_COMBAT_PREVIEW_AMPHIBIOUS_ATTACK_PENALTY', '{DB_NEG_AMOUNT}Amphibious attack penalty', 'en_US'),
('LOC_COMBAT_PREVIEW_LESS_EFFECTIVE_VS_UNITS_DESC', '{DB_NEG_VALUE_MINUS}Less effective vs units', 'en_US'),
('LOC_COMBAT_PREVIEW_LESS_EFFECTIVE_VS_LAND_UNITS_DESC', '{DB_NEG_VALUE_MINUS}Less effective vs land units', 'en_US') -- bombard vs units
;
