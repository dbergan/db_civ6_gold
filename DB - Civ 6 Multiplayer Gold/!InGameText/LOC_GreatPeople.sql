-- ('', '', 'en_US'),

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES

('LOC_GREAT_PERSON_INDIVIDUAL_TRUNG_TRAC_PERMANENT_ACTIVE', 'Accumulate 25% less war weariness than usual.', 'en_US')
;

UPDATE LocalizedText SET Text = REPLACE(Text, '[ICON_Capital] Capital city', 'empire') WHERE Tag = 'LOC_GREATPERSON_GRANT_PLOT_RESOURCE' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, '[ICON_Capital] Capital city', 'empire') WHERE Tag = 'LOC_GREATPERSON_FERDINAND_MAGELLAN_ACTIVE' AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = REPLACE(Text, 'Classical and Medieval era', 'Medieval era and earlier') WHERE Tag IN ('LOC_GREATPERSON_COMBAT_STRENGTH_AOE_CLASSICAL_LAND', 'LOC_GREATPERSON_COMBAT_STRENGTH_AOE_CLASSICAL_SEA') AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Medieval and Renaissance era', 'Renaissance era and earlier') WHERE Tag IN ('LOC_GREATPERSON_COMBAT_STRENGTH_AOE_MEDIEVAL_LAND', 'LOC_GREATPERSON_COMBAT_STRENGTH_AOE_MEDIEVAL_SEA') AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Renaissance and Industrial era', 'Industrial era and earlier') WHERE Tag IN ('LOC_GREATPERSON_COMBAT_STRENGTH_AOE_RENAISSANCE_LAND', 'LOC_GREATPERSON_COMBAT_STRENGTH_AOE_RENAISSANCE_SEA') AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Industrial and Modern era', 'Modern era and earlier') WHERE Tag IN ('LOC_GREATPERSON_COMBAT_STRENGTH_AOE_INDUSTRIAL_LAND', 'LOC_GREATPERSON_COMBAT_STRENGTH_AOE_INDUSTRIAL_SEA') AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Modern and Atomic era', 'Atomic era and earlier') WHERE Tag IN ('LOC_GREATPERSON_COMBAT_STRENGTH_AOE_MODERN_LAND', 'LOC_GREATPERSON_COMBAT_STRENGTH_AOE_MODERN_SEA') AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Atomic and Information era', 'Information era and earlier') WHERE Tag IN ('LOC_GREATPERSON_COMBAT_STRENGTH_AOE_ATOMIC_LAND', 'LOC_GREATPERSON_COMBAT_STRENGTH_AOE_ATOMIC_SEA') AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Information era', 'Future era and earlier') WHERE Tag IN ('LOC_GREATPERSON_COMBAT_STRENGTH_AOE_INFORMATION_LAND', 'LOC_GREATPERSON_COMBAT_STRENGTH_AOE_INFORMATION_SEA') AND Language = 'en_US' ;
