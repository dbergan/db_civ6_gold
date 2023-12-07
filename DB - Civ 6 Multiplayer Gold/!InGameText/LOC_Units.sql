-- ('', '', 'en_US'),

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES

('LOC_FORMATION_CLASS_SUPPORT_NAME', 'Support{LOC_GOLD_LABEL}', 'en_US'),

-- Observation Balloons, Drones: add Range3 explanation
('LOC_UNIT_DRONE_DESCRIPTION', 'Atomic era support unit with sight of 5. Adds +5 [ICON_Bombard] Bombard Strength to Modern era or later siege units within 1 tile. Adds +1 [ICON_Range] Range to siege units within 1 tile. {DB_RANGE3_EXPLANATION} Drone movement ignores terrain costs.', 'en_US'),
('LOC_UNIT_OBSERVATION_BALLOON_DESCRIPTION', 'Modern era support unit with sight of 3. Adds +1 [ICON_Range] Range to siege units within 1 tile. {DB_RANGE3_EXPLANATION}', 'en_US'),

('LOC_FORMATION_CLASS_LAND_COMBAT_NAME', 'Land Combat', 'en_US'),

--Tank and Modern Armor: Adding "Wheeled" description
('LOC_UNIT_TANK_DESCRIPTION', 'Fast-moving Modern era heavy cavalry unit that ignores zone of control. Gains 1 bonus [ICON_Movement] Movement if it begins a turn on a flat tile with no Woods, Rainforest, or Hills.', 'en_US'),
('LOC_UNIT_MODERN_ARMOR_DESCRIPTION', 'Information era heavy cavalry unit that is fast and strong. Gains 1 bonus [ICON_Movement] Movement if it begins a turn on a flat tile with no Woods, Rainforest, or Hills.', 'en_US'),

-- Spec Ops
('LOC_UNIT_SPEC_OPS_DESCRIPTION', 'Atomic Era reconnaissance unit that has a [ICON_Ranged]Ranged Attack and a Priority Target attack. Priority Target attacks are not accurately represented in the combat preview, instead they work like this:[NEWLINE][ICON_Bullet]Are used only against enemy support units[NEWLINE][ICON_Bullet]Can target a support unit that''s sharing a tile with a front-line combat unit[NEWLINE][ICON_Bullet]Does exactly 65 damage to its target, no matter the modifiers (including Corp/Army)[NEWLINE][ICON_Bullet]The Spec Op takes no damage[NEWLINE][NEWLINE]Spec Ops also have a Paradrop ability that allows them to drop onto distant tiles. It works like this:[NEWLINE][ICON_Bullet]Must be used from friendly territory[NEWLINE][ICON_Bullet]Must drop onto land up to 7 tiles away (12 when starting from Aerodrome or Airstrip)[NEWLINE][ICON_Bullet]The Spec Ops must not have moved this turn. (Technically, the check is on whether the numerator is greater than or equal to the denominator of its movement.)', 'en_US'),

-- Warrior Monk
('LOC_UNIT_WARRIOR_MONK_DESCRIPTION', 'Fast-moving land combat unit with a unique promotion tree. Does not benefit from battering rams or siege towers.', 'en_US')
;

UPDATE LocalizedText SET Text = Text || ' {DB_RANGE3_EXPLANATION}' WHERE Language = 'en_US' AND Tag IN 
('LOC_UNIT_BATTLESHIP_DESCRIPTION',
'LOC_UNIT_BRAZILIAN_MINAS_GERAES_DESCRIPTION',
'LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION',
'LOC_UNIT_MISSILE_CRUISER_DESCRIPTION',
'LOC_UNIT_GIANT_DEATH_ROBOT_DESCRIPTION') ;