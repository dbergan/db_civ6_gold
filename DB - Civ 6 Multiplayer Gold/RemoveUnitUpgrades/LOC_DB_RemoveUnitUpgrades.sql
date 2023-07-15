UPDATE LocalizedText SET Text = REPLACE(Text, 'in all situations.', 'when attacking.{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_PROMOTION_MONK_EXPLODING_PALMS_DESCRIPTION',
'LOC_PROMOTION_MONK_COBRA_STRIKE_DESCRIPTION') ;

UPDATE LocalizedText SET Text = REPLACE(REPLACE(Text, '1%', '3%{LOC_GOLD_LABEL}'), '20%', '60%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_GOVT_ACCUMULATED_BONUS_OLIGARCHY',
'LOC_GOVT_ACCUMULATED_BONUS_BRIEF_OLIGARCHY_XP1') ;

UPDATE LocalizedText SET Text = REPLACE(Text, '+10%', '+30%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_TRAIT_CIVILIZATION_MAPUCHE_TOQUI_DESCRIPTION',
'LOC_ABILITY_TOQUI_XP_FROM_GOVERNOR_DESCRIPTION') ;

UPDATE LocalizedText SET Text = REPLACE(Text, '+30%', '+90%{LOC_GOLD_LABEL}') WHERE Tag = 'LOC_ABILITY_TOQUI_XP_FROM_GOVERNOR_NOT_FOUNDED_DESCRIPTION' ;

UPDATE LocalizedText SET Text = REPLACE(Text, '+25%', '+75%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_BUILDING_BARRACKS_DESCRIPTION',
'LOC_ABILITY_BARRACKS_TRAINED_UNIT_XP_DESCRIPTION',
'LOC_BUILDING_BARRACKS_EXPANSION2_DESCRIPTION',
'LOC_BUILDING_STABLE_DESCRIPTION',
'LOC_ABILITY_STABLE_TRAINED_UNIT_XP_DESCRIPTION',
'LOC_BUILDING_STABLE_EXPANSION2_DESCRIPTION',
'LOC_BUILDING_ARMORY_DESCRIPTION',
'LOC_ABILITY_ARMORY_TRAINED_UNIT_XP_DESCRIPTION',
'LOC_BUILDING_ARMORY_EXPANSION2_DESCRIPTION',
'LOC_BUILDING_MILITARY_ACADEMY_DESCRIPTION',
'LOC_ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_XP_DESCRIPTION',
'LOC_BUILDING_MILITARY_ACADEMY_EXPANSION2_DESCRIPTION',
'LOC_BUILDING_LIGHTHOUSE_DESCRIPTION',
'LOC_ABILITY_LIGHTHOUSE_TRAINED_UNIT_XP_DESCRIPTION',
'LOC_BUILDING_LIGHTHOUSE_EXPANSION1_DESCRIPTION',
'LOC_BUILDING_LIGHTHOUSE_EXPANSION2_DESCRIPTION',
'LOC_BUILDING_SHIPYARD_DESCRIPTION',
'LOC_ABILITY_SHIPYARD_TRAINED_UNIT_XP_DESCRIPTION',
'LOC_BUILDING_SHIPYARD_EXPANSION2_DESCRIPTION',
'LOC_BUILDING_SEAPORT_DESCRIPTION',
'LOC_ABILITY_SEAPORT_TRAINED_UNIT_XP_DESCRIPTION',
'LOC_BUILDING_HANGAR_DESCRIPTION',
'LOC_ABILITY_HANGAR_TRAINED_AIRCRAFT_XP_DESCRIPTION',
'LOC_BUILDING_ORDU_DESCRIPTION',
'LOC_ABILITY_ORDU_TRAINED_UNIT_XP_DESCRIPTION',
'LOC_BUILDING_ORDU_EXPANSION2_DESCRIPTION',
'LOC_BUILDING_BASILIKOI_PAIDES_DESCRIPTION',
'LOC_ABILITY_BASILIKOI_TRAINED_UNIT_XP_DESCRIPTION',
'LOC_BUILDING_ALEXANDER_SCENARIO_BASILIKOI_PAIDES_DESCRIPTION',
'LOC_BUILDING_BASILIKOI_PAIDES_EXPANSION2_DESCRIPTION',
'LOC_UNIT_ZULU_IMPI_DESCRIPTION',
'LOC_ABILITY_ZULU_IMPI_DESCRIPTION',
'LOC_ABILITY_ZULU_IMPI_NAME',
'LOC_SDG_SWORD_OF_GIDEON_DESC',
'LOC_SDG_ABILITY_SWORD_OF_GIDEON_DESC') ;

UPDATE LocalizedText SET Text = REPLACE(Text, '+25%', '+50%') WHERE Tag = 'LOC_POLICY_AFTER_ACTION_REPORTS_DESC' ; -- original says 25% when the modifier actually does 50%
UPDATE LocalizedText SET Text = REPLACE(Text, '+50%', '+150%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_BUILDING_AIRPORT_DESCRIPTION',
'LOC_ABILITY_AIRPORT_TRAINED_AIRCRAFT_XP_DESCRIPTION',
'LOC_POLICY_AFTER_ACTION_REPORTS_DESCRIPTION',
'LOC_POLICY_TO_ARMS_DESCRIPTION',
'LOC_TRAIT_CIVILIZATION_TA_SETI_DESCRIPTION',
'LOC_ABILITY_NUBIA_RANGED_EXPERIENCE_MODIFIER_DESCRIPTION',
'LOC_TRAIT_NUBIA_SCENARIO_CIVILIZATION_TA_SETI_DESCRIPTION',
'LOC_UNIT_AMERICAN_P51_DESCRIPTION',
'LOC_ABILITY_MUSTANG_DESCRIPTION',
'LOC_ABILITY_MUSTANG_NAME') ;


UPDATE LocalizedText SET Text = REPLACE(Text, '+100%', '+300%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_MOMENT_CATEGORY_AERONAUTICAL_BONUS_EXPANSION2_GOLDEN_AGE',
'LOC_POLICY_ELITE_FORCES_DESCRIPTION',
'LOC_POLICY_ELITE_FORCES_DA_DESCRIPTION') ;

-- Exclude Survey because it leads to getting the Ambush promotion far too quickly
-- Exclude Kabul because +400% xp is OP for the civ that starts next to it
-- Thus, this update just changes the word "double" to "+100%"
UPDATE LocalizedText SET Text = REPLACE(REPLACE(Text, 'Double', '+100%'), 'double', '+100%') WHERE Language = 'en_US' AND Tag IN
('LOC_POLICY_SURVEY_DESCRIPTION',
'LOC_LEADER_TRAIT_KABUL_DESCRIPTION') ;


-- Great Generals & Admirals (all give +200% like Clancy Fernando)

UPDATE LocalizedText SET Text = REPLACE(Text, '+25%', '+200%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_GREATPERSON_GENGHIS_KHAN_ACTIVE',
'LOC_GREAT_PERSON_INDIVIDUAL_HIMERIOS_ACTIVE',
'LOC_ABILITY_HIMERIOS_BONUS_EXPERIENCE_DESCRIPTION',
'LOC_GREATPERSON_TIMUR_ACTIVE',
'LOC_ABILITY_TIMUR_BONUS_EXPERIENCE_DESCRIPTION') ;

UPDATE LocalizedText SET Text = REPLACE(Text, '+50%', '+200%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_GREATPERSON_LASKARINA_BOUBOULINA_ACTIVE',
'LOC_ABILITY_LASKARINA_BOUBOULINA_BONUS_EXPERIENCE_DESCRIPTION') ;



UPDATE LocalizedText SET Text = REPLACE(Text, '+75 ', '+75% ') WHERE Language = 'en_US' AND Tag = 'LOC_ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_DESCRIPTION' ;				-- original was missing %
UPDATE LocalizedText SET Text = REPLACE(Text, '+75%', '+200%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_GREATPERSON_JOHN_MONASH_ACTIVE',
'LOC_ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_DESCRIPTION',
'LOC_GREATPERSON_TOGO_HEIHACHIRO_ACTIVE') ;

UPDATE LocalizedText SET Text = REPLACE(Text, '+100 ', '+100% ') WHERE Language = 'en_US' AND Tag = 'LOC_ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_DESCRIPTION' ;		-- original was missing %
UPDATE LocalizedText SET Text = REPLACE(Text, '+100%', '+200%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_GREATPERSON_SERGEY_GORSHKOV_ACTIVE',
'LOC_ABILITY_SERGEY_GORSHKOV_BONUS_EXPERIENCE_DESCRIPTION',
'LOC_GREATPERSON_VIJAYA_WIMALARATNE_ACTIVE',
'LOC_ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_DESCRIPTION',
'LOC_GREATPERSON_SUDIRMAN_ACTIVE') ;

/* Exclude Clancy because he didn't change
UPDATE LocalizedText SET Text = REPLACE(Text, '+200%', '+200%{LOC_GOLD_LABEL}') WHERE Tag IN
('LOC_GREATPERSON_CLANCY_FERNANDO_ACTIVE',
'LOC_ABILITY_CLANCY_FERNANDO_BONUS_EXPERIENCE_DESC') ;
*/


UPDATE LocalizedText SET Text = REPLACE(Text, 'level to a military land unit.', 'level and +200% combat experience to a military land unit.{LOC_GOLD_LABEL}') WHERE Tag = 'LOC_GREATPERSON_HANNIBAL_BARCA_ACTIVE' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'level to a military naval unit.', 'level and +200% combat experience to a military naval unit.{LOC_GOLD_LABEL}') WHERE Tag = 'LOC_GREATPERSON_ARTEMISIA_ACTIVE' ;

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES
('LOC_DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE_NAME', 'Hannibal Barca{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE_NAME', 'Artemisia{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE_DESC', '+200% Earned experience from combat', 'en_US'),
('LOC_DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE_DESC', '+200% Earned experience from combat', 'en_US') ;
