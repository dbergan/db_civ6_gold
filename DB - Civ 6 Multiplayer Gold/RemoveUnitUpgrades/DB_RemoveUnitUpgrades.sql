-- DELETE FROM UnitUpgrades ; -- Not using this method so that city-states may still upgrade their units
DELETE FROM UnitCommands WHERE CommandType = 'UNITCOMMAND_UPGRADE' ;
UPDATE GlobalParameters SET Value = 999 WHERE Name = 'EXPERIENCE_MAXIMUM_ONE_COMBAT' ;

-- Promotions no longer heal
UPDATE GlobalParameters SET Value = 0 WHERE Name = 'EXPERIENCE_PROMOTE_HEALED' ;

-- Change Warrior Monks such that Exploding Palms and Cobra Strike only apply on attack
UPDATE Modifiers SET SubjectRequirementSetId = 'DB_REQSET_ATTACKING' WHERE ModifierId IN ('EXPLODING_PALMS_INCREASED_COMBAT_STRENGTH', 'COBRA_STRIKE_INCREASED_COMBAT_STRENGTH') ;


-- Increase XP modifiers

UPDATE ModifierArguments SET Value = Value * 3 WHERE Name = 'Increment' AND ModifierId = 'OLIGARCHY_UNIT_EXPERIENCE_ACCUMULATING' ;					-- LOC_GOVT_ACCUMULATED_BONUS_OLIGARCHY

UPDATE ModifierArguments SET Value = Value * 3 WHERE Name = 'Amount' 
AND ModifierId IN (
'TOQUI_GOVERNOR_UNIT_EXPERIENCE',				-- 10	LOC_TRAIT_CIVILIZATION_MAPUCHE_TOQUI_DESCRIPTION			LOC_ABILITY_TOQUI_XP_FROM_GOVERNOR_DESCRIPTION
'TOQUI_GOVERNOR_UNIT_EXPERIENCE_NOT_FOUNDED',	-- 30																LOC_ABILITY_TOQUI_XP_FROM_GOVERNOR_NOT_FOUNDED_DESCRIPTION

'OLIGARCHY_UNIT_EXPERIENCE',					-- 20	LOC_GOVT_ACCUMULATED_BONUS_OLIGARCHY
--														LOC_GOVT_ACCUMULATED_BONUS_BRIEF_OLIGARCHY_XP1

'BARRACKS_TRAINED_UNIT_XP',						-- 25	LOC_BUILDING_BARRACKS_DESCRIPTION							LOC_ABILITY_BARRACKS_TRAINED_UNIT_XP_DESCRIPTION
--														LOC_BUILDING_BARRACKS_EXPANSION2_DESCRIPTION
'STABLE_TRAINED_UNIT_XP',						-- 25	LOC_BUILDING_STABLE_DESCRIPTION								LOC_ABILITY_STABLE_TRAINED_UNIT_XP_DESCRIPTION
--														LOC_BUILDING_STABLE_EXPANSION2_DESCRIPTION
'ARMORY_TRAINED_UNIT_XP',						-- 25	LOC_BUILDING_ARMORY_DESCRIPTION								LOC_ABILITY_ARMORY_TRAINED_UNIT_XP_DESCRIPTION
--														LOC_BUILDING_ARMORY_EXPANSION2_DESCRIPTION
'MILITARY_ACADEMY_TRAINED_UNIT_XP',				-- 25	LOC_BUILDING_MILITARY_ACADEMY_DESCRIPTION					LOC_ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_XP_DESCRIPTION
--														LOC_BUILDING_MILITARY_ACADEMY_EXPANSION2_DESCRIPTION
'LIGHTHOUSE_TRAINED_UNIT_XP',					-- 25	LOC_BUILDING_LIGHTHOUSE_DESCRIPTION							LOC_ABILITY_LIGHTHOUSE_TRAINED_UNIT_XP_DESCRIPTION
--														LOC_BUILDING_LIGHTHOUSE_EXPANSION1_DESCRIPTION
--														LOC_BUILDING_LIGHTHOUSE_EXPANSION2_DESCRIPTION
'SHIPYARD_TRAINED_UNIT_XP',						-- 25	LOC_BUILDING_SHIPYARD_DESCRIPTION							LOC_ABILITY_SHIPYARD_TRAINED_UNIT_XP_DESCRIPTION
--														LOC_BUILDING_SHIPYARD_EXPANSION2_DESCRIPTION
'SEAPORT_TRAINED_UNIT_XP',						-- 25	LOC_BUILDING_SEAPORT_DESCRIPTION							LOC_ABILITY_SEAPORT_TRAINED_UNIT_XP_DESCRIPTION
'HANGAR_TRAINED_AIRCRAFT_XP',					-- 25	LOC_BUILDING_HANGAR_DESCRIPTION								LOC_ABILITY_HANGAR_TRAINED_AIRCRAFT_XP_DESCRIPTION
'ORDU_TRAINED_XP',								-- 25	LOC_BUILDING_ORDU_DESCRIPTION								LOC_ABILITY_ORDU_TRAINED_UNIT_XP_DESCRIPTION
--														LOC_BUILDING_ORDU_EXPANSION2_DESCRIPTION
'BASILIKOI_TRAINED_UNIT_XP',					-- 25	LOC_BUILDING_BASILIKOI_PAIDES_DESCRIPTION					LOC_ABILITY_BASILIKOI_TRAINED_UNIT_XP_DESCRIPTION
--														LOC_BUILDING_ALEXANDER_SCENARIO_BASILIKOI_PAIDES_DESCRIPTION
--														LOC_BUILDING_BASILIKOI_PAIDES_EXPANSION2_DESCRIPTION
'IMPI_FASTER_COMBAT_XP',						-- 25	LOC_UNIT_ZULU_IMPI_DESCRIPTION								LOC_ABILITY_ZULU_IMPI_DESCRIPTION
'SDG_SWORD_OF_GIDEON_COMBAT',					-- 25	LOC_SDG_SWORD_OF_GIDEON_DESCRIPTION							LOC_SDG_ABILITY_SWORD_OF_GIDEON_DESCRIPTION

'AIRPORT_TRAINED_AIRCRAFT_XP',					-- 50	LOC_BUILDING_AIRPORT_DESCRIPTION							LOC_ABILITY_AIRPORT_TRAINED_AIRCRAFT_XP_DESCRIPTION
'AFTERACTIONREPORTS_EXPERIENCE',				-- 50	LOC_POLICY_AFTER_ACTION_REPORTS_DESCRIPTION
'POLICY_TO_ARMS_GA_XP',							-- 50	LOC_POLICY_TO_ARMS_DESCRIPTION
'NUBIA_RANGED_EXPERIENCE_MODIFIER',				-- 50	LOC_TRAIT_CIVILIZATION_TA_SETI_DESCRIPTION					LOC_ABILITY_NUBIA_RANGED_EXPERIENCE_MODIFIER_DESCRIPTION
--														LOC_TRAIT_NUBIA_SCENARIO_CIVILIZATION_TA_SETI_DESCRIPTION
'MUSTANG_MORE_EXPERIENCE',						-- 50	LOC_UNIT_AMERICAN_P51_DESCRIPTION							LOC_ABILITY_MUSTANG_DESCRIPTION

-- Exclude Survey because it leads to getting the Ambush promotion far too quickly
-- 'SURVEY_RECONUNITEXPERIENCE',				-- 100	LOC_POLICY_SURVEY_DESCRIPTION

-- Exclude Kabul because +400% xp is OP for the civ that starts next to it
-- 'MINOR_CIV_KABUL_UNIT_EXPERIENCE_BONUS',		-- 100	LOC_LEADER_TRAIT_KABUL_DESCRIPTION

'COMMEMORATION_AERONAUTICAL_GA_AIR',			-- 100	LOC_MOMENT_CATEGORY_AERONAUTICAL_BONUS_EXPANSION2_GOLDEN_AGE
'ELITEFORCES_EXPERIENCE_BOOST'					-- 100	LOC_POLICY_ELITE_FORCES_DESCRIPTION							
--														LOC_POLICY_ELITE_FORCES_DA_DESCRIPTION
) ;


-- Great Generals & Admirals (all give +200% like Clancy Fernando)
UPDATE ModifierArguments SET Value = 200 WHERE Name = 'Amount' 
AND ModifierId IN (
'GREATPERSON_GENGHIS_KHAN_ACTIVE_UNIT_BONUS',	-- 25	LOC_GREATPERSON_GENGHIS_KHAN_ACTIVE
'HIMERIOS_BONUS_EXPERIENCE',					-- 25	LOC_GREAT_PERSON_INDIVIDUAL_HIMERIOS_ACTIVE					LOC_ABILITY_HIMERIOS_BONUS_EXPERIENCE_DESCRIPTION
'TIMUR_BONUS_EXPERIENCE',						-- 25	LOC_GREATPERSON_TIMUR_ACTIVE								LOC_ABILITY_TIMUR_BONUS_EXPERIENCE_DESCRIPTION
'LASKARINA_BOUBOULINA_BONUS_EXPERIENCE',		-- 50	LOC_GREATPERSON_LASKARINA_BOUBOULINA_ACTIVE					LOC_ABILITY_LASKARINA_BOUBOULINA_BONUS_EXPERIENCE_DESCRIPTION
'JOHN_MONASH_BONUS_EXPERIENCE',					-- 75	LOC_GREATPERSON_JOHN_MONASH_ACTIVE							LOC_ABILITY_JOHN_MONASH_BONUS_EXPERIENCE_DESCRIPTION
'GREATPERSON_TOGO_HEIHACHIRO_ACTIVE_UNIT_BONUS',-- 75	LOC_GREATPERSON_TOGO_HEIHACHIRO_ACTIVE
'SERGEY_GORSHKOV_BONUS_EXPERIENCE',				-- 100	LOC_GREATPERSON_SERGEY_GORSHKOV_ACTIVE						LOC_ABILITY_SERGEY_GORSHKOV_BONUS_EXPERIENCE_DESCRIPTION
'VIJAYA_WIMALARATNE_BONUS_EXPERIENCE',			-- 100	LOC_GREATPERSON_VIJAYA_WIMALARATNE_ACTIVE					LOC_ABILITY_VIJAYA_WIMALARATNE_BONUS_EXPERIENCE_DESCRIPTION
'GREATPERSON_SUDIRMAN_ACTIVE_UNIT_BONUS',		-- 100	LOC_GREATPERSON_SUDIRMAN_ACTIVE
'CLANCY_FERNANDO_BONUS_EXPERIENCE'				-- 200	LOC_GREATPERSON_CLANCY_FERNANDO_ACTIVE						LOC_ABILITY_CLANCY_FERNANDO_BONUS_EXPERIENCE_DESCRIPTION
) ;


-- Add +200% XP ability to Hannibal
INSERT OR IGNORE INTO Types (Type, Kind) VALUES 
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'KIND_ABILITY') ;

INSERT OR IGNORE INTO TypeTags (Type, Tag) VALUES
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'CLASS_RECON'),
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'CLASS_MELEE'),
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'CLASS_RANGED'),
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'CLASS_ANTI_CAVALRY'),
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'CLASS_LIGHT_CAVALRY'),
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'CLASS_HEAVY_CAVALRY'),
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'CLASS_SIEGE') ;

INSERT OR IGNORE INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'LOC_DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE_NAME', 'LOC_DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE_DESC', 1) ;

INSERT OR IGNORE INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES
('DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE', 'DB_HANNIBAL_BONUS_EXPERIENCE') ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES 
('DB_HANNIBAL_BONUS_EXPERIENCE', 'MODIFIER_PLAYER_UNIT_ADJUST_UNIT_EXPERIENCE_MODIFIER') ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
('DB_HANNIBAL_BONUS_EXPERIENCE', 'Amount', 200) ;


INSERT OR IGNORE INTO GreatPersonIndividualActionModifiers (GreatPersonIndividualType, ModifierId, AttachmentTargetType) VALUES
('GREAT_PERSON_INDIVIDUAL_HANNIBAL_BARCA', 'DB_GREATPERSON_HANNIBAL_ACTIVE_UNIT_BONUS', 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_DOMAIN_MILITARY_IN_TILE') ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent) VALUES 
('DB_GREATPERSON_HANNIBAL_ACTIVE_UNIT_BONUS', 'MODIFIER_PLAYER_UNIT_GRANT_ABILITY', 1, 1) ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
('DB_GREATPERSON_HANNIBAL_ACTIVE_UNIT_BONUS', 'AbilityType', 'DB_ABILITY_HANNIBAL_BONUS_EXPERIENCE') ;


-- Add +200% XP ability to Artemisia
INSERT OR IGNORE INTO Types (Type, Kind) VALUES 
('DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE', 'KIND_ABILITY') ;

INSERT OR IGNORE INTO TypeTags (Type, Tag) VALUES
('DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE', 'CLASS_NAVAL_MELEE'),
('DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE', 'CLASS_NAVAL_RANGED'),
('DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE', 'CLASS_NAVAL_RAIDER'),
('DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE', 'CLASS_NAVAL_CARRIER') ;

INSERT OR IGNORE INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES
('DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE', 'LOC_DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE_NAME', 'LOC_DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE_DESC', 1) ;

INSERT OR IGNORE INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES
('DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE', 'DB_ARTEMISIA_BONUS_EXPERIENCE') ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES 
('DB_ARTEMISIA_BONUS_EXPERIENCE', 'MODIFIER_PLAYER_UNIT_ADJUST_UNIT_EXPERIENCE_MODIFIER') ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
('DB_ARTEMISIA_BONUS_EXPERIENCE', 'Amount', 200) ;


INSERT OR IGNORE INTO GreatPersonIndividualActionModifiers (GreatPersonIndividualType, ModifierId, AttachmentTargetType) VALUES
('GREAT_PERSON_INDIVIDUAL_ARTEMISIA', 'DB_GREATPERSON_ARTEMISIA_ACTIVE_UNIT_BONUS', 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_DOMAIN_MILITARY_IN_TILE') ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent) VALUES 
('DB_GREATPERSON_ARTEMISIA_ACTIVE_UNIT_BONUS', 'MODIFIER_PLAYER_UNIT_GRANT_ABILITY', 1, 1) ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
('DB_GREATPERSON_ARTEMISIA_ACTIVE_UNIT_BONUS', 'AbilityType', 'DB_ABILITY_ARTEMISIA_BONUS_EXPERIENCE') ;