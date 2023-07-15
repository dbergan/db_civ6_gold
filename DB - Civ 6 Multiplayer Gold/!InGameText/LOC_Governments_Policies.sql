-- ('', '', 'en_US'),

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES

-- GOVERNMENTS

-- Fascism
('LOC_PEDIA_GOVERNMENTS_PAGEGROUP_GOVERNMENTS_NAME', 'Governments{LOC_GOLD_LABEL}', 'en_US'),
('LOC_ABILITY_FASCISM_ATTACK_BUFF_DESCRIPTION', '+5 [ICON_Strength]Combat Strength, [ICON_Ranged] Ranged Strength, or [ICON_Bombard] Bombard Strength when attacking with the Fascism government.{LOC_GOLD_LABEL}', 'en_US'),
('LOC_GOVT_INHERENT_BONUS_FASCISM', '+5 [ICON_Strength]Combat Strength, [ICON_Ranged] Ranged Strength, or [ICON_Bombard] Bombard Strength when attacking.{LOC_GOLD_LABEL}', 'en_US'),
('LOC_GOVT_INHERENT_BONUS_FASCISM_XP1', '+5 [ICON_Strength]Combat Strength, [ICON_Ranged] Ranged Strength, or [ICON_Bombard] Bombard Strength when attacking.  War Weariness reduced by 20%.{LOC_GOLD_LABEL}', 'en_US'),

-- Finest Hour
('LOC_PEDIA_GOVERNMENTS_PAGEGROUP_WILDCARD_POLICIES_NAME', 'Wildcard Policies{LOC_GOLD_LABEL}', 'en_US'),
('LOC_POLICY_FINEST_HOUR_DESCRIPTION_XP2', '+5 [ICON_Strength]Combat Strength, [ICON_Ranged] Ranged Strength, or [ICON_Bombard] Bombard Strength when either: (a) attacking a tile inside home territory or (b) attacking from a tile adjacent to home territory.[NEWLINE]+5 [ICON_Strength]Combat Strength when defending on a tile inside or adjacent to home territory.[NEWLINE]Does not apply to cities and encampments.{LOC_GOLD_LABEL}', 'en_US'), -- GS description


-- POLICIES

-- After Action Reports (text says 25%, but it's actually 50%)
('LOC_POLICY_AFTER_ACTION_REPORTS_DESCRIPTION', 'All units gain +50% combat experience.{LOC_GOLD_LABEL}', 'en_US'),


-- Bastions (combat preview was missing)
('LOC_POLICY_BASTIONS_DESCRIPTION', 'Walled cities & encampments get +6 [ICON_Strength] Defense. +10 City [ICON_Ranged] Ranged Strength. (5 is added directly to the city''s "Base Strength" number, with no mention. The other 5 shows up as a standard modifier. With{LOC_GOLD_LABEL} both are explained in the Combat Preview.).{LOC_GOLD_LABEL}', 'en_US'),

-- Limes
('LOC_POLICY_LIMES_DESCRIPTION', '+100% [ICON_Production] Production toward walls.{LOC_GOLD_LABEL}', 'en_US'),


-- GOVERNORS

-- Air Defense Initiative
('LOC_GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE_DESCRIPTION', '+25 [ICON_Strength] Combat Strength within the city''s territory while defending against aircraft and ICBMs if using units with anti-air capability.{LOC_GOLD_LABEL}', 'en_US')

;
