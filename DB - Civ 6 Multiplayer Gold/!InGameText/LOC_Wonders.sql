-- ('', '', 'en_US'),

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES

('LOC_PEDIA_WONDERS_PAGEGROUP_WONDERS_NAME', 'Wonders{LOC_GOLD_LABEL}', 'en_US'),

-- Meenakshi Temple doesn't give guru bonuses
('LOC_BUILDING_MEENAKSHI_TEMPLE_DESCRIPTION', 'Grants 2 Gurus. Gurus are 30% cheaper to purchase. Religious units adjacent to a Guru receive +5 [ICON_Religion] Religious Strength in Theological Combat and +1 [ICON_Movement] Movement. (Another Guru does not provide additional strength or movement.) Must be built adjacent to a Holy Site and you must have founded a Religion.{LOC_GOLD_LABEL}', 'en_US'),

('LOC_DB_ABILITY_ENHANCE_COMBAT_WHEN_ADJ_GURU_NAME', 'Meenakshi Adjacent Guru Combat{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_ABILITY_ENHANCE_COMBAT_WHEN_ADJ_GURU_DESC', 'When next to a Guru, +5 [ICON_Religion] Religious Strength{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_ABILITY_ENHANCE_COMBAT_WHEN_ADJ_GURU_COMBAT_DESC', '+{1_Value} Meenakshi Temple{LOC_GOLD_LABEL}', 'en_US'),

('LOC_DB_ABILITY_ENHANCE_MOVEMENT_WHEN_ADJ_GURU_NAME', 'Meenakshi Adjacent Guru Movement{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_ABILITY_ENHANCE_MOVEMENT_WHEN_ADJ_GURU_DESC', 'When next to a Guru, +1 [ICON_Movement] Movement{LOC_GOLD_LABEL}', 'en_US')
;

