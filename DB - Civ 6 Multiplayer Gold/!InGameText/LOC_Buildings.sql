-- ('', '', 'en_US'),

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES

-- Water Mill (default description says they need farms, but they do not)
('LOC_BUILDING_WATER_MILL_DESCRIPTION', 'Bonus resources with a farm gain +1 [ICON_Food] Food each. City must be adjacent to a River.', 'en_US')
;

UPDATE LocalizedText SET Text = REPLACE(Text, 'Outer Defenses', 'Walls') ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Outer defenses', 'Walls') ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'outer defenses', 'walls') ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Outer defense', 'Wall health') ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'outer defense', 'wall') ;

UPDATE LocalizedText SET Text = REPLACE(Text, 'all land units', 'melee, anti-cav, ranged, siege, and cavalry units') WHERE Tag = 'LOC_BUILDING_ARMORY_DESCRIPTION' ;

UPDATE LocalizedText SET Text = REPLACE(Text, 'all land units', 'melee, anti-cav, ranged, siege, and cavalry units') WHERE Tag = 'LOC_BUILDING_MILITARY_ACADEMY_DESCRIPTION' ;
