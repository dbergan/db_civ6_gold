-- ------------------------------------
-- ------------------------------------
--  Wall of Righteousness
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_WALL_OF_RIGHTEOUSNESS', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_WALL_OF_RIGHTEOUSNESS', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_WALL_OF_RIGHTEOUSNESS', 'LOC_SDG_ABILITY_WALL_OF_RIGHTEOUSNESS_NAME', 'LOC_SDG_ABILITY_WALL_OF_RIGHTEOUSNESS_DESC', 1) ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_WALL_OF_RIGHTEOUSNESS', 'LOC_SDG_WALL_OF_RIGHTEOUSNESS', 'LOC_SDG_WALL_OF_RIGHTEOUSNESS_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS', 'SDG_WALL_OF_RIGHTEOUSNESS_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_WALL_OF_RIGHTEOUSNESS_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_WALL_OF_RIGHTEOUSNESS_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_WALL_OF_RIGHTEOUSNESS_COMBAT', 'AbilityType', 'SDG_ABILITY_WALL_OF_RIGHTEOUSNESS') ;

INSERT INTO Requirements (RequirementId, RequirementType, ProgressWeight) VALUES ('SDG_REQ_UNIT_HAS_WALL_OF_RIGHTEOUSNESS', 'REQUIREMENT_UNIT_HAS_ABILITY', 1) ;
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('SDG_REQ_UNIT_HAS_WALL_OF_RIGHTEOUSNESS', 'UnitAbilityType', 'SDG_ABILITY_WALL_OF_RIGHTEOUSNESS') ;
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('SDG_REQSET_UNIT_HAS_WALL_OF_RIGHTEOUSNESS', 'REQUIREMENTSET_TEST_ALL') ;
INSERT INTO RequirementSetRequirements	(RequirementSetId, RequirementId) VALUES
										('SDG_REQSET_UNIT_HAS_WALL_OF_RIGHTEOUSNESS', 'SDG_REQ_UNIT_HAS_WALL_OF_RIGHTEOUSNESS'),
										('SDG_REQSET_UNIT_HAS_WALL_OF_RIGHTEOUSNESS', 'DB_REQ_INSIDE_HOME_TERRITORY_WITH_BELIEF') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS', 'SDG_WALL_OF_RIGHTEOUSNESS_UNIT_APPLIES_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS_UNIT_APPLIES_MODIFIER', 'MODIFIER_ALL_UNITS_ATTACH_MODIFIER', 'SDG_REQSET_UNIT_HAS_WALL_OF_RIGHTEOUSNESS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS_UNIT_APPLIES_MODIFIER', 'ModifierId', 'SDG_WALL_OF_RIGHTEOUSNESS_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS_COMBAT', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_DEFENDING_IS_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS_COMBAT', 'Amount', 10) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_WALL_OF_RIGHTEOUSNESS_COMBAT', 'Preview', 'LOC_SDG_WALL_OF_RIGHTEOUSNESS_COMBAT_DESC') ;


-- ------------------------------------
-- ------------------------------------
--  Joshua's Trumpet
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_JOSHUAS_TRUMPET', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES
('SDG_ABILITY_JOSHUAS_TRUMPET', 'CLASS_MELEE'),
('SDG_ABILITY_JOSHUAS_TRUMPET', 'CLASS_ANTI_CAVALRY') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_JOSHUAS_TRUMPET', 'LOC_SDG_ABILITY_JOSHUAS_TRUMPET_NAME', 'LOC_SDG_ABILITY_JOSHUAS_TRUMPET_DESC', 1) ;

INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	SELECT DISTINCT 'SDG_ABILITY_JOSHUAS_TRUMPET', 'SDG_MOD_' || SUBSTR(PromotionClass, 17) || '_CAN_WALL_ATTACK' FROM Units WHERE PromotionClass = 'PROMOTION_CLASS_MELEE' OR PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' ;
INSERT INTO Modifiers (ModifierId, ModifierType)
	SELECT DISTINCT 'SDG_MOD_' || SUBSTR(PromotionClass, 17) || '_CAN_WALL_ATTACK', 'DB_DM_CAN_WALL_ATTACK_PROMOTION_CLASS' FROM Units WHERE PromotionClass = 'PROMOTION_CLASS_MELEE' OR PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'SDG_MOD_' || SUBSTR(PromotionClass, 17) || '_CAN_WALL_ATTACK', 'PromotionClass', PromotionClass FROM Units WHERE PromotionClass = 'PROMOTION_CLASS_MELEE' OR PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' ;

INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	SELECT DISTINCT 'SDG_ABILITY_JOSHUAS_TRUMPET', 'SDG_MOD_' || SUBSTR(PromotionClass, 17) || '_CAN_BYPASS_WALLS' FROM Units WHERE PromotionClass = 'PROMOTION_CLASS_MELEE' OR PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' ;
INSERT INTO Modifiers (ModifierId, ModifierType)
	SELECT DISTINCT 'SDG_MOD_' || SUBSTR(PromotionClass, 17) || '_CAN_BYPASS_WALLS', 'DB_DM_CAN_BYPASS_WALLS_PROMOTION_CLASS' FROM Units WHERE PromotionClass = 'PROMOTION_CLASS_MELEE' OR PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'SDG_MOD_' || SUBSTR(PromotionClass, 17) || '_CAN_BYPASS_WALLS', 'PromotionClass', PromotionClass FROM Units WHERE PromotionClass = 'PROMOTION_CLASS_MELEE' OR PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' ;

/*
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_JOSHUAS_TRUMPET', 'SDG_MOD_CAN_WALL_ATTACK') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_MOD_CAN_WALL_ATTACK', 'DB_DM_CAN_WALL_ATTACK') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_CAN_WALL_ATTACK', 'Enable', 1) ;

INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_JOSHUAS_TRUMPET', 'SDG_MOD_CAN_BYPASS_WALLS') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_MOD_CAN_BYPASS_WALLS', 'DB_DM_CAN_BYPASS_WALLS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_CAN_BYPASS_WALLS', 'Enable', 1) ;
*/

INSERT INTO Types (Type, Kind) VALUES ('SDG_JOSHUAS_TRUMPET', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_JOSHUAS_TRUMPET', 'LOC_SDG_JOSHUAS_TRUMPET', 'LOC_SDG_JOSHUAS_TRUMPET_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JOSHUAS_TRUMPET', 'SDG_JOSHUAS_TRUMPET_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOSHUAS_TRUMPET_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JOSHUAS_TRUMPET_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_JOSHUAS_TRUMPET_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_JOSHUAS_TRUMPET_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_JOSHUAS_TRUMPET_COMBAT', 'AbilityType', 'SDG_ABILITY_JOSHUAS_TRUMPET') ;


/* TODO: find a way to remove the ram/tower protection on upper level walls
UPDATE Modifiers SET SubjectRequirementSetId = '' WHERE ModifierId = 'CASTLE_PREVENT_MELEE_ATTACK_OUTER_DEFENSES' ;
UPDATE Modifiers SET SubjectRequirementSetId = '' WHERE ModifierId = 'STAR_FORT_PREVENT_MELEE_ATTACK_OUTER_DEFENSES' ;
UPDATE Modifiers SET SubjectRequirementSetId = '' WHERE ModifierId = 'STAR_FORT_PREVENT_BYPASS_OUTER_DEFENSE' ;
<ModifierType>MODIFIER_SINGLE_CITY_ADJUST_PREVENT_MELEE_ATTACK_OUTER_DEFENSES</ModifierType>
<ModifierType>MODIFIER_SINGLE_CITY_ADJUST_PREVENT_MELEE_ATTACK_OUTER_DEFENSES</ModifierType>
<ModifierType>MODIFIER_SINGLE_CITY_ADJUST_PREVENT_BYPASS_OUTER_DEFENSE</ModifierType>
*/

-- ------------------------------------
-- ------------------------------------
--  Ecrasez l'Infame
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_ECRASEZ_LINFAME', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_ECRASEZ_LINFAME', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_ECRASEZ_LINFAME', 'LOC_SDG_ABILITY_ECRASEZ_LINFAME_NAME', 'LOC_SDG_ABILITY_ECRASEZ_LINFAME_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES 
('SDG_ABILITY_ECRASEZ_LINFAME', 'SDG_ECRASEZ_LINFAME_CITY_TO_MY_RELIGION_ON_CAPTURE'),
('SDG_ABILITY_ECRASEZ_LINFAME', 'SDG_ECRASEZ_LINFAME_VICTORY_SPREADS_RELIGION') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ECRASEZ_LINFAME_CITY_TO_MY_RELIGION_ON_CAPTURE', 'DB_DM_CITY_TO_MY_RELIGION_ON_CAPTURE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ECRASEZ_LINFAME_CITY_TO_MY_RELIGION_ON_CAPTURE', 'Enable', 1) ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ECRASEZ_LINFAME_VICTORY_SPREADS_RELIGION', 'DB_DM_VICTORY_SPREADS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ECRASEZ_LINFAME_VICTORY_SPREADS_RELIGION', 'LandVictorySpread', 1) ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_ECRASEZ_LINFAME', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ECRASEZ_LINFAME', 'LOC_SDG_ECRASEZ_LINFAME', 'LOC_SDG_ECRASEZ_LINFAME_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ECRASEZ_LINFAME', 'SDG_ECRASEZ_LINFAME_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ECRASEZ_LINFAME_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ECRASEZ_LINFAME_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_ECRASEZ_LINFAME_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_ECRASEZ_LINFAME_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_ECRASEZ_LINFAME_COMBAT', 'AbilityType', 'SDG_ABILITY_ECRASEZ_LINFAME') ;



-- ------------------------------------
-- ------------------------------------
--  A Mighty Fortress
-- ------------------------------------
-- ------------------------------------

INSERT INTO Types (Type, Kind) VALUES ('SDG_A_MIGHTY_FORTRESS', 'KIND_BELIEF') ;
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_A_MIGHTY_FORTRESS', 'LOC_SDG_A_MIGHTY_FORTRESS', 'LOC_SDG_A_MIGHTY_FORTRESS_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('SDG_REQSET_FOLLOWS_RELIGION_AND_HAS_WALLS', 'REQUIREMENTSET_TEST_ALL') ;
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('SDG_REQSET_FOLLOWS_RELIGION_AND_HAS_WALLS', 'DB_REQ_CITY_FOLLOWS_RELIGION'), 
('SDG_REQSET_FOLLOWS_RELIGION_AND_HAS_WALLS', 'DB_REQ_CITY_HAS_WALLS') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_A_MIGHTY_FORTRESS', 'SDG_MIGHTY_FORTRESS_ADJUST_ATTACKS_PER_TURN') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MIGHTY_FORTRESS_ADJUST_ATTACKS_PER_TURN', 'DB_DM_CITIES_ADJUST_ATTACKS_PER_TURN', 'SDG_REQSET_FOLLOWS_RELIGION_AND_HAS_WALLS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MIGHTY_FORTRESS_ADJUST_ATTACKS_PER_TURN', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_A_MIGHTY_FORTRESS', 'SDG_MIGHTY_FORTRESS_ADJUST_ATTACK_RANGE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MIGHTY_FORTRESS_ADJUST_ATTACK_RANGE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'SDG_REQSET_FOLLOWS_RELIGION_AND_HAS_WALLS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MIGHTY_FORTRESS_ADJUST_ATTACK_RANGE', 'ModifierId', 'SDG_MIGHTY_FORTRESS_ADJUST_ATTACK_RANGE2') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MIGHTY_FORTRESS_ADJUST_ATTACK_RANGE2', 'DB_DM_CITIES_ADJUST_ATTACK_RANGE', 'DB_REQSET_IS_CITY_CENTER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MIGHTY_FORTRESS_ADJUST_ATTACK_RANGE2', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_A_MIGHTY_FORTRESS', 'SDG_MIGHTY_FORTRESS_PREVENT_RAM') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MIGHTY_FORTRESS_PREVENT_RAM', 'DB_DM_CITIES_PREVENT_RAM', 'SDG_REQSET_FOLLOWS_RELIGION_AND_HAS_WALLS') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_A_MIGHTY_FORTRESS', 'SDG_MIGHTY_FORTRESS_PREVENT_TOWER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MIGHTY_FORTRESS_PREVENT_TOWER', 'DB_DM_CITIES_PREVENT_TOWER', 'SDG_REQSET_FOLLOWS_RELIGION_AND_HAS_WALLS') ;


-- ------------------------------------
-- ------------------------------------
--  Eternal Father Strong to Save
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_ETERNAL_FATHER_HEAL', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_ETERNAL_FATHER_HEAL', 'DB_CLASS_NAVAL_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_ETERNAL_FATHER_HEAL', 'LOC_SDG_ABILITY_ETERNAL_FATHER_HEAL_NAME', 'LOC_SDG_ABILITY_ETERNAL_FATHER_HEAL_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_ETERNAL_FATHER_HEAL', 'SDG_ABILITY_EF_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ABILITY_EF_MODIFIER', 'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_ABILITY_EF_MODIFIER', 'Amount', 20),
							  ('SDG_ABILITY_EF_MODIFIER', 'Type', 'NEUTRAL') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_ETERNAL_FATHER', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_NAVAL_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_NAVAL_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ETERNAL_FATHER', 'LOC_SDG_ETERNAL_FATHER', 'LOC_SDG_ETERNAL_FATHER_DESC', 'SDG_BELIEF_CLASS_NAVAL_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ETERNAL_FATHER', 'SDG_ETERNAL_FATHER_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ETERNAL_FATHER_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ETERNAL_FATHER_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_EF_HEALING') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_EF_HEALING', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_EF_HEALING', 'AbilityType', 'SDG_ABILITY_ETERNAL_FATHER_HEAL') ;


-- ------------------------------------
-- ------------------------------------
--  Wilderness Preachers
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_WILDERNESS_PREACHERS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_CULTURE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_CULTURE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_WILDERNESS_PREACHERS', 'LOC_SDG_WILDERNESS_PREACHERS', 'LOC_SDG_WILDERNESS_PREACHERS_DESC', 'SDG_BELIEF_CLASS_CULTURE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_WILDERNESS_PREACHERS', 'SDG_WILDERNESS_PREACHERS_CULTUREBORDER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_WILDERNESS_PREACHERS_CULTUREBORDER', 'MODIFIER_ALL_CITIES_CULTURE_BORDER_EXPANSION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_WILDERNESS_PREACHERS_CULTUREBORDER', 'Amount', 100) ;


-- ------------------------------------
-- ------------------------------------
--  Itinerant Ministers
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ITINERANT_MINISTERS', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_CULTURE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ITINERANT_MINISTERS', 'LOC_SDG_ITINERANT_MINISTERS', 'LOC_SDG_ITINERANT_MINISTERS_DESC', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ITINERANT_MINISTERS', 'SDG_ITINERANT_MINISTERS_SPREAD') ; 
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ITINERANT_MINISTERS_SPREAD', 'MODIFIER_PLAYER_RELIGION_ADJUST_RELIGIOUS_SPREAD_DISTANCE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ITINERANT_MINISTERS_SPREAD', 'DistanceChange', '3') ;


-- ------------------------------------
-- ------------------------------------
--  Desert Anchorites
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_DESERT_ANCHORITES', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_CULTURE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_DESERT_ANCHORITES', 'LOC_SDG_DESERT_ANCHORITES', 'LOC_SDG_DESERT_ANCHORITES_DESC', 'SDG_BELIEF_CLASS_RELIGION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES', 'SDG_DESERT_ANCHORITES_CITIES_ATTACH_MODIFIER_' || x FROM counter ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_CITIES_ATTACH_MODIFIER_' || x, 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'DB_REQSET_CITY_FOLLOWS_RELIGION_AND_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS' FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_CITIES_ATTACH_MODIFIER_' || x, 'ModifierId', 'SDG_DESERT_ANCHORITES_GPP_' || x FROM counter ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_GPP_' || x, 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_CITY_CENTER' FROM counter ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_GPP_' || x, 'GreatPersonClassType', 'GREAT_PERSON_CLASS_PROPHET' FROM counter ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 36) 
  SELECT 'SDG_DESERT_ANCHORITES_GPP_' || x, 'Amount', 1 FROM counter ;
  
  
  -- ------------------------------------
-- ------------------------------------
--  POLYHYMNIA
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_POLYHYMNIA', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MUSES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_POLYHYMNIA', 'LOC_SDG_POLYHYMNIA', 'LOC_SDG_POLYHYMNIA_DESC', 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_POLYHYMNIA', 'SDG_POLYHYMNIA_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_POLYHYMNIA_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_POLYHYMNIA_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_POLYHYMNIA_GPP') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_POLYHYMNIA_GPP', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_POLYHYMNIA_GPP', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_PROPHET'),
							  ('SDG_POLYHYMNIA_GPP', 'Amount', 1) ;



-- ------------------------------------
-- ------------------------------------
--  HANDCART_PIONEERS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HANDCART_PIONEERS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_HANDCART_PIONEERS', 'LOC_SDG_HANDCART_PIONEERS', 'LOC_SDG_HANDCART_PIONEERS_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HANDCART_PIONEERS', 'SDG_HANDCART_PIONEERS_SETTLERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HANDCART_PIONEERS_SETTLERS', 'DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HANDCART_PIONEERS_SETTLERS', 'Tag', 'CLASS_SETTLER') ;


-- ------------------------------------
-- ------------------------------------
--  HABITAT_FOR_HUMANITY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HABITAT_FOR_HUMANITY', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_HABITAT_FOR_HUMANITY', 'LOC_SDG_HABITAT_FOR_HUMANITY', 'LOC_SDG_HABITAT_FOR_HUMANITY_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HABITAT_FOR_HUMANITY', 'SDG_HABITAT_FOR_HUMANITY_BUILDERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HABITAT_FOR_HUMANITY_BUILDERS', 'DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HABITAT_FOR_HUMANITY_BUILDERS', 'Tag', 'CLASS_BUILDER') ;


-- ------------------------------------
-- ------------------------------------
--  SEA_ORG
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SEA_ORG', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SEA_ORG', 'LOC_SDG_SEA_ORG', 'LOC_SDG_SEA_ORG_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SEA_ORG', 'SDG_SEA_ORG_NAVAL_UNITS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SEA_ORG_NAVAL_UNITS', 'DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SEA_ORG_NAVAL_UNITS', 'Tag', 'DB_CLASS_NAVAL_ALL') ;


-- ------------------------------------
-- ------------------------------------
--  PHARAOH_AND_JOSEPH
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_PHARAOH_AND_JOSEPH', 'LOC_SDG_PHARAOH_AND_JOSEPH', 'LOC_SDG_PHARAOH_AND_JOSEPH_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_GRANARY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_GRANARY', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_GRANARY', 'BuildingType', 'BUILDING_GRANARY') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_MONUMENT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_MONUMENT', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_PHARAOH_AND_JOSEPH_FAITH_PURCHASE_MONUMENT', 'BuildingType', 'BUILDING_MONUMENT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'SDG_PHARAOH_AND_JOSEPH_GRANARY_PURCHASE_DISCOUNT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PHARAOH_AND_JOSEPH_GRANARY_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
	('SDG_PHARAOH_AND_JOSEPH_GRANARY_PURCHASE_DISCOUNT', 'BuildingType', 'BUILDING_GRANARY'),
	('SDG_PHARAOH_AND_JOSEPH_GRANARY_PURCHASE_DISCOUNT', 'Amount', 20) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PHARAOH_AND_JOSEPH', 'SDG_PHARAOH_AND_JOSEPH_MONUMENT_PURCHASE_DISCOUNT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PHARAOH_AND_JOSEPH_MONUMENT_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
	('SDG_PHARAOH_AND_JOSEPH_MONUMENT_PURCHASE_DISCOUNT', 'BuildingType', 'BUILDING_MONUMENT'),
	('SDG_PHARAOH_AND_JOSEPH_MONUMENT_PURCHASE_DISCOUNT', 'Amount', 20) ;

-- ------------------------------------
-- ------------------------------------
--  NEHEMIAH
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_NEHEMIAH', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_NEHEMIAH', 'LOC_SDG_NEHEMIAH', 'LOC_SDG_NEHEMIAH_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NEHEMIAH', 'SDG_NEHEMIAH_FAITH_PURCHASE_WALLS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_WALLS', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_WALLS', 'BuildingType', 'BUILDING_WALLS') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NEHEMIAH', 'SDG_NEHEMIAH_FAITH_PURCHASE_CASTLE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_CASTLE', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_CASTLE', 'BuildingType', 'BUILDING_CASTLE') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NEHEMIAH', 'SDG_NEHEMIAH_FAITH_PURCHASE_STAR_FORT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_STAR_FORT', 'DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_NEHEMIAH_FAITH_PURCHASE_STAR_FORT', 'BuildingType', 'BUILDING_STAR_FORT') ;


-- ------------------------------------
-- ------------------------------------
--  YORISHIRO
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_YORISHIRO', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_YORISHIRO', 'LOC_SDG_YORISHIRO', 'LOC_SDG_YORISHIRO_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_YORISHIRO', 'SDG_YORISHIRO_SCIENCE_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_YORISHIRO_SCIENCE_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_YORISHIRO_SCIENCE_BUILDINGS', 'DistrictType', 'DISTRICT_PRESERVE') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_YORISHIRO', 'SDG_YORISHIRO_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_PRESERVE' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_YORISHIRO_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_PRESERVE' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_YORISHIRO_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_PRESERVE' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_YORISHIRO_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_PRESERVE' ;


-- ------------------------------------
-- ------------------------------------
--  JESUIT_EDUCATION
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JESUIT_EDUCATION', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_JESUIT_EDUCATION', 'LOC_SDG_JESUIT_EDUCATION', 'LOC_SDG_JESUIT_EDUCATION_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JESUIT_EDUCATION', 'SDG_JESUIT_EDUCATION_SCIENCE_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JESUIT_EDUCATION_SCIENCE_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JESUIT_EDUCATION_SCIENCE_BUILDINGS', 'DistrictType', 'DISTRICT_CAMPUS') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_JESUIT_EDUCATION', 'SDG_JESUIT_EDUCATION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_JESUIT_EDUCATION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JESUIT_EDUCATION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JESUIT_EDUCATION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS' ;


-- ------------------------------------
-- ------------------------------------
--  JIHAD
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JIHAD', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_JIHAD', 'LOC_SDG_JIHAD', 'LOC_SDG_JIHAD_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JIHAD', 'SDG_JIHAD_ENCAMPMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JIHAD_ENCAMPMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JIHAD_ENCAMPMENT_BUILDINGS', 'DistrictType', 'DISTRICT_ENCAMPMENT') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_JIHAD', 'SDG_JIHAD_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENCAMPMENT' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_JIHAD_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENCAMPMENT' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JIHAD_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENCAMPMENT' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JIHAD_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_ENCAMPMENT' ;


-- ------------------------------------
-- ------------------------------------
--  XMAS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_XMAS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_XMAS', 'LOC_SDG_XMAS', 'LOC_SDG_XMAS_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_XMAS', 'SDG_XMAS_COMMERCIAL_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_XMAS_COMMERCIAL_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_XMAS_COMMERCIAL_BUILDINGS', 'DistrictType', 'DISTRICT_COMMERCIAL_HUB') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_XMAS', 'SDG_XMAS_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_XMAS_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_XMAS_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_XMAS_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' ;


-- ------------------------------------
-- ------------------------------------
--  FISHERS_OF_MEN
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FISHERS_OF_MEN', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_FISHERS_OF_MEN', 'LOC_SDG_FISHERS_OF_MEN', 'LOC_SDG_FISHERS_OF_MEN_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FISHERS_OF_MEN', 'SDG_FISHERS_OF_MEN_HARBOR_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FISHERS_OF_MEN_HARBOR_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FISHERS_OF_MEN_HARBOR_BUILDINGS', 'DistrictType', 'DISTRICT_HARBOR') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_FISHERS_OF_MEN', 'SDG_FISHERS_OF_MEN_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HARBOR' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_FISHERS_OF_MEN_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HARBOR' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_FISHERS_OF_MEN_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HARBOR' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_FISHERS_OF_MEN_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HARBOR' ;


-- ------------------------------------
-- ------------------------------------
--  ECCLESIASTICAL_COMMISSION
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ECCLESIASTICAL_COMMISSION', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ECCLESIASTICAL_COMMISSION', 'LOC_SDG_ECCLESIASTICAL_COMMISSION', 'LOC_SDG_ECCLESIASTICAL_COMMISSION_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ECCLESIASTICAL_COMMISSION', 'SDG_ECCLESIASTICAL_COMMISSION_THEATER_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ECCLESIASTICAL_COMMISSION_THEATER_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ECCLESIASTICAL_COMMISSION_THEATER_BUILDINGS', 'DistrictType', 'DISTRICT_THEATER') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_ECCLESIASTICAL_COMMISSION', 'SDG_ECCLESIASTICAL_COMMISSION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_ECCLESIASTICAL_COMMISSION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_ECCLESIASTICAL_COMMISSION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_ECCLESIASTICAL_COMMISSION_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER' ;


-- ------------------------------------
-- ------------------------------------
--  SOLIDARITY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SOLIDARITY', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SOLIDARITY', 'LOC_SDG_SOLIDARITY', 'LOC_SDG_SOLIDARITY_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SOLIDARITY', 'SDG_SOLIDARITY_INDUSTRIAL_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SOLIDARITY_INDUSTRIAL_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SOLIDARITY_INDUSTRIAL_BUILDINGS', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_SOLIDARITY', 'SDG_SOLIDARITY_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_SOLIDARITY_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_SOLIDARITY_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_SOLIDARITY_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' ;


-- ------------------------------------
-- ------------------------------------
--  FAMILY_HOME_EVENING
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FAMILY_HOME_EVENING', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_FAMILY_HOME_EVENING', 'LOC_SDG_FAMILY_HOME_EVENING', 'LOC_SDG_FAMILY_HOME_EVENING_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FAMILY_HOME_EVENING', 'SDG_FAMILY_HOME_EVENING_NEIGHBORHOOD_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FAMILY_HOME_EVENING_NEIGHBORHOOD_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FAMILY_HOME_EVENING_NEIGHBORHOOD_BUILDINGS', 'DistrictType', 'DISTRICT_NEIGHBORHOOD') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FAMILY_HOME_EVENING', 'SDG_FAMILY_HOME_EVENING_ENTERTAINMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FAMILY_HOME_EVENING_ENTERTAINMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FAMILY_HOME_EVENING_ENTERTAINMENT_BUILDINGS', 'DistrictType', 'DISTRICT_ENTERTAINMENT_COMPLEX') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FAMILY_HOME_EVENING', 'SDG_FAMILY_HOME_EVENING_WATER_ENTERTAINMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FAMILY_HOME_EVENING_WATER_ENTERTAINMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FAMILY_HOME_EVENING_WATER_ENTERTAINMENT_BUILDINGS', 'DistrictType', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_FAMILY_HOME_EVENING', 'SDG_FAMILY_HOME_EVENING_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_NEIGHBORHOOD' OR PrereqDistrict = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR PrereqDistrict = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_FAMILY_HOME_EVENING_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_NEIGHBORHOOD' OR PrereqDistrict = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR PrereqDistrict = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_FAMILY_HOME_EVENING_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_NEIGHBORHOOD' OR PrereqDistrict = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR PrereqDistrict = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_FAMILY_HOME_EVENING_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_NEIGHBORHOOD' OR PrereqDistrict = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR PrereqDistrict = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' ;


-- ------------------------------------
-- ------------------------------------
--  JOHN_FRUM
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JOHN_FRUM', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_JOHN_FRUM', 'LOC_SDG_JOHN_FRUM', 'LOC_SDG_JOHN_FRUM_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

-- Faith Purchases
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JOHN_FRUM', 'SDG_JOHN_FRUM_AERODROME_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOHN_FRUM_AERODROME_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JOHN_FRUM_AERODROME_BUILDINGS', 'DistrictType', 'DISTRICT_AERODROME') ;

-- Discounts
INSERT INTO BeliefModifiers (BeliefType, ModifierID)
SELECT 'SDG_JOHN_FRUM', 'SDG_JOHN_FRUM_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_AERODROME' ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
SELECT 'SDG_JOHN_FRUM_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'DB_DM_CITIES_ADJUST_BUILDING_COST', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_AERODROME' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JOHN_FRUM_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_AERODROME' ;

INSERT INTO ModifierArguments (ModifierId, Name, Value) 
SELECT 'SDG_JOHN_FRUM_' || SUBSTR(BuildingType, 10) || '_PURCHASE_DISCOUNT', 'Amount', 20 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_AERODROME' ;

-- Airstrips
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JOHN_FRUM', 'SDG_JOHN_FRUM_FAITH_CITY_APPLIES_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOHN_FRUM_FAITH_CITY_APPLIES_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JOHN_FRUM_FAITH_CITY_APPLIES_MODIFIER', 'ModifierId', 'SDG_JOHN_FRUM_FAITH_INCREASES_ON_AIRSTRIP') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOHN_FRUM_FAITH_INCREASES_ON_AIRSTRIP', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_AIRSTRIP') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_JOHN_FRUM_FAITH_INCREASES_ON_AIRSTRIP', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_JOHN_FRUM_FAITH_INCREASES_ON_AIRSTRIP', 'Amount', 25) ;



-- ------------------------------------
-- ------------------------------------
--  SHAKER_CELIBACY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SHAKER_CELIBACY', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SHAKER_CELIBACY', 'LOC_SDG_SHAKER_CELIBACY', 'LOC_SDG_SHAKER_CELIBACY_DESC', 'SDG_BELIEF_CLASS_FAITHPURCHASES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_PLAYERS_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_PLAYERS_ATTACH_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_PLAYERS_ATTACH_MODIFIER', 'ModifierId', 'SDG_SHAKER_CELIBACY_GROWTH') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_SHAKER_CELIBACY_GROWTH', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_GROWTH', 'Amount', -150) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_GOLD_PURCHASE_DISTRICTS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_GOLD_PURCHASE_DISTRICTS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICTS_W_GOLD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_GOLD_PURCHASE_DISTRICTS', 'CanPurchase', '1') ;

-- Doesn't work (even though the gold one does and it's structured the same way)
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_FAITH_PURCHASE_DISTRICTS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_FAITH_PURCHASE_DISTRICTS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICTS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_FAITH_PURCHASE_DISTRICTS', 'CanPurchase', '1') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_AERODROME_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_AERODROME_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_AERODROME_BUILDINGS', 'DistrictType', 'DISTRICT_AERODROME') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_AQUEDUCT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_AQUEDUCT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_AQUEDUCT_BUILDINGS', 'DistrictType', 'DISTRICT_AQUEDUCT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_CAMPUS_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_CAMPUS_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_CAMPUS_BUILDINGS', 'DistrictType', 'DISTRICT_CAMPUS') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_CANAL_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_CANAL_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_CANAL_BUILDINGS', 'DistrictType', 'DISTRICT_CANAL') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_CITY_CENTER_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_CITY_CENTER_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_CITY_CENTER_BUILDINGS', 'DistrictType', 'DISTRICT_CITY_CENTER') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_COMMERCIAL_HUB_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_COMMERCIAL_HUB_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_COMMERCIAL_HUB_BUILDINGS', 'DistrictType', 'DISTRICT_COMMERCIAL_HUB') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_DAM_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_DAM_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_DAM_BUILDINGS', 'DistrictType', 'DISTRICT_DAM') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_ENCAMPMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_ENCAMPMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_ENCAMPMENT_BUILDINGS', 'DistrictType', 'DISTRICT_ENCAMPMENT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_ENTERTAINMENT_COMPLEX_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_ENTERTAINMENT_COMPLEX_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_ENTERTAINMENT_COMPLEX_BUILDINGS', 'DistrictType', 'DISTRICT_ENTERTAINMENT_COMPLEX') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_GOVERNMENT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_GOVERNMENT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_GOVERNMENT_BUILDINGS', 'DistrictType', 'DISTRICT_GOVERNMENT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_HARBOR_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_HARBOR_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_HARBOR_BUILDINGS', 'DistrictType', 'DISTRICT_HARBOR') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_HOLY_SITE_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_HOLY_SITE_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_HOLY_SITE_BUILDINGS', 'DistrictType', 'DISTRICT_HOLY_SITE') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_INDUSTRIAL_ZONE_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_INDUSTRIAL_ZONE_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_INDUSTRIAL_ZONE_BUILDINGS', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_NEIGHBORHOOD_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_NEIGHBORHOOD_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_NEIGHBORHOOD_BUILDINGS', 'DistrictType', 'DISTRICT_NEIGHBORHOOD') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_SPACEPORT_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_SPACEPORT_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_SPACEPORT_BUILDINGS', 'DistrictType', 'DISTRICT_SPACEPORT') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_THEATER_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_THEATER_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_THEATER_BUILDINGS', 'DistrictType', 'DISTRICT_THEATER') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_WATER_ENTERTAINMENT_COMPLEX_BUILDINGS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_WATER_ENTERTAINMENT_COMPLEX_BUILDINGS', 'DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_WATER_ENTERTAINMENT_COMPLEX_BUILDINGS', 'DistrictType', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_UNITS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_UNITS', 'DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_UNITS', 'Tag', 'DB_CLASS_ALL') ;


-- RESOURCES

-- ------------------------------------
-- ------------------------------------
--  Freemasonry
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FREEMASONRY', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_FREEMASONRY', 'LOC_SDG_FREEMASONRY', 'LOC_SDG_FREEMASONRY_DESC', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FREEMASONRY', 'SDG_FREEMASONRY_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FREEMASONRY_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_FREEMASONRY_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_FREEMASONRY_FAITH_ON_STONE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_FREEMASONRY_FAITH_ON_STONE', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_STONE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_FREEMASONRY_FAITH_ON_STONE', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_FREEMASONRY_FAITH_ON_STONE', 'Amount', 3) ;

-- ------------------------------------
-- ------------------------------------
--  Land of Milk and Honey
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_LAND_OF_MILK_AND_HONEY', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;


INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_LAND_OF_MILK_AND_HONEY', 'LOC_SDG_LAND_OF_MILK_AND_HONEY', 'LOC_SDG_LAND_OF_MILK_AND_HONEY_DESC', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'SDG_LAND_OF_MILK_AND_HONEY', 'SDG_LAND_OF_MILK_AND_HONEY_' || SUBSTR(ResourceType, 10) || '_CITIES_ATTACH_MODIFIER' FROM Resources WHERE ResourceType IN ('RESOURCE_CATTLE', 'RESOURCE_HONEY') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'SDG_LAND_OF_MILK_AND_HONEY_' || SUBSTR(ResourceType, 10) || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Resources WHERE ResourceType IN ('RESOURCE_CATTLE', 'RESOURCE_HONEY') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_LAND_OF_MILK_AND_HONEY_' || SUBSTR(ResourceType, 10) || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_LAND_OF_MILK_AND_HONEY_FAITH_ON_' || SUBSTR(ResourceType, 10) FROM Resources WHERE ResourceType IN ('RESOURCE_CATTLE', 'RESOURCE_HONEY') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'SDG_LAND_OF_MILK_AND_HONEY_FAITH_ON_' || SUBSTR(ResourceType, 10), 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_' || SUBSTR(ResourceType, 10) FROM Resources WHERE ResourceType IN ('RESOURCE_CATTLE', 'RESOURCE_HONEY') ;
	
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_LAND_OF_MILK_AND_HONEY_FAITH_ON_' || SUBSTR(ResourceType, 10), 'YieldType', 'YIELD_FAITH' FROM Resources WHERE ResourceType IN ('RESOURCE_CATTLE', 'RESOURCE_HONEY') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_LAND_OF_MILK_AND_HONEY_FAITH_ON_' || SUBSTR(ResourceType, 10), 'Amount', 3 FROM Resources WHERE ResourceType IN ('RESOURCE_CATTLE', 'RESOURCE_HONEY') ;


-- ------------------------------------
-- ------------------------------------
--  Entheogens
-- ------------------------------------
-- ------------------------------------
INSERT OR IGNORE INTO Tags (Tag, Vocabulary) VALUES ('SDG_CLASS_ENTHEOGENS_RESOURCES', 'RESOURCE_CLASS') ;
INSERT OR IGNORE INTO TypeTags (Type, Tag) VALUES 
('RESOURCE_TRUFFLES',	'SDG_CLASS_ENTHEOGENS_RESOURCES'),
('RESOURCE_TOBACCO',	'SDG_CLASS_ENTHEOGENS_RESOURCES') ;

--		City has improved resource requirements (SDG_REQSET_CITY_HAS_IMPROVED_ENTHEOGENS_RESOURCE)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
SELECT 'SDG_REQ_CITY_HAS_' || SUBSTR(Type, 10), 'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED' FROM TypeTags WHERE Tag = 'SDG_CLASS_ENTHEOGENS_RESOURCES' ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'SDG_REQ_CITY_HAS_' || SUBSTR(Type, 10), 'ResourceType', Type FROM TypeTags WHERE Tag = 'SDG_CLASS_ENTHEOGENS_RESOURCES' ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('SDG_REQSET_CITY_HAS_IMPROVED_ENTHEOGENS_RESOURCE', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
SELECT 'SDG_REQSET_CITY_HAS_IMPROVED_ENTHEOGENS_RESOURCE', 'SDG_REQ_CITY_HAS_' || SUBSTR(Type, 10) FROM TypeTags WHERE Tag = 'SDG_CLASS_ENTHEOGENS_RESOURCES' ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_ENTHEOGENS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ENTHEOGENS', 'LOC_SDG_ENTHEOGENS', 'LOC_SDG_ENTHEOGENS_DESC', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ENTHEOGENS', 'SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER2') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER2', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'SDG_REQSET_CITY_HAS_IMPROVED_ENTHEOGENS_RESOURCE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ENTHEOGENS_CITIES_ATTACH_MODIFIER2', 'ModifierId', 'SDG_ENTHEOGENS_GPP') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ENTHEOGENS_GPP', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_CITY_CENTER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ENTHEOGENS_GPP', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_PROPHET'),
							  ('SDG_ENTHEOGENS_GPP', 'Amount', 3) ;


-- ------------------------------------
-- ------------------------------------
--  Salt of the Earth
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SALT_OF_THE_EARTH', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SALT_OF_THE_EARTH', 'LOC_SDG_SALT_OF_THE_EARTH', 'LOC_SDG_SALT_OF_THE_EARTH_DESC', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SALT_OF_THE_EARTH', 'SDG_SALT_OF_THE_EARTH_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SALT_OF_THE_EARTH_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SALT_OF_THE_EARTH_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_SALT_OF_THE_EARTH_FAITH_ON_SALT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SALT_OF_THE_EARTH_FAITH_ON_SALT', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_SALT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_SALT_OF_THE_EARTH_FAITH_ON_SALT', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_SALT_OF_THE_EARTH_FAITH_ON_SALT', 'Amount', 5) ;


-- ------------------------------------
-- ------------------------------------
--  Jonah
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JONAH', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_JONAH', 'LOC_SDG_JONAH', 'LOC_SDG_JONAH_DESC', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JONAH', 'SDG_JONAH_WHALES_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JONAH_WHALES_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JONAH_WHALES_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_JONAH_WHALES_FAITH_ON_WHALES') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JONAH_WHALES_FAITH_ON_WHALES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_WHALES') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_JONAH_WHALES_FAITH_ON_WHALES', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_JONAH_WHALES_FAITH_ON_WHALES', 'Amount', 5) ;

							  
-- ------------------------------------
-- ------------------------------------
--  Pearl of Great Price
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PEARL_OF_GREAT_PRICE', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_PEARL_OF_GREAT_PRICE', 'LOC_SDG_PEARL_OF_GREAT_PRICE', 'LOC_SDG_PEARL_OF_GREAT_PRICE_DESC', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PEARL_OF_GREAT_PRICE', 'SDG_PEARL_OF_GREAT_PRICE_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PEARL_OF_GREAT_PRICE_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_PEARL_OF_GREAT_PRICE_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_PEARL_OF_GREAT_PRICE_FAITH_ON_PEARLS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PEARL_OF_GREAT_PRICE_FAITH_ON_PEARLS', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_PEARLS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_PEARL_OF_GREAT_PRICE_FAITH_ON_PEARLS', 'YieldType', 'YIELD_FAITH'),
							  ('SDG_PEARL_OF_GREAT_PRICE_FAITH_ON_PEARLS', 'Amount', 5) ;



-- ------------------------------------
-- ------------------------------------
--  Turtles All The Way Down
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_TURTLES_ALL_THE_WAY_DOWN', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_TURTLES_ALL_THE_WAY_DOWN', 'LOC_SDG_TURTLES_ALL_THE_WAY_DOWN', 'LOC_SDG_TURTLES_ALL_THE_WAY_DOWN_DESC', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'SDG_TURTLES_ALL_THE_WAY_DOWN', 'SDG_TURTLES_ALL_THE_WAY_DOWN_CITIES_ATTACH_MODIFIER' FROM Resources WHERE ResourceType IN ('RESOURCE_TURTLES') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'SDG_TURTLES_ALL_THE_WAY_DOWN_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Resources WHERE ResourceType IN ('RESOURCE_TURTLES') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_TURTLES_ALL_THE_WAY_DOWN_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_TURTLES_ALL_THE_WAY_DOWN_FAITH_ON_TURTLES' FROM Resources WHERE ResourceType IN ('RESOURCE_TURTLES') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'SDG_TURTLES_ALL_THE_WAY_DOWN_FAITH_ON_TURTLES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_' || SUBSTR(ResourceType, 10) FROM Resources WHERE ResourceType IN ('RESOURCE_TURTLES') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_TURTLES_ALL_THE_WAY_DOWN_FAITH_ON_TURTLES', 'YieldType', 'YIELD_FAITH' FROM Resources WHERE ResourceType IN ('RESOURCE_TURTLES') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_TURTLES_ALL_THE_WAY_DOWN_FAITH_ON_TURTLES', 'Amount', 5 FROM Resources WHERE ResourceType IN ('RESOURCE_TURTLES') ;
							  
							  
-- ------------------------------------
-- ------------------------------------
--  I Am Death
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_I_AM_DEATH', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_I_AM_DEATH', 'LOC_SDG_I_AM_DEATH', 'LOC_SDG_I_AM_DEATH_DESC', 'SDG_BELIEF_CLASS_RESOURCES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_I_AM_DEATH', 'SDG_I_AM_DEATH_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_I_AM_DEATH_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_I_AM_DEATH_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_I_AM_DEATH_SCIENCE_ON_URANIUM') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_I_AM_DEATH_SCIENCE_ON_URANIUM', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_URANIUM') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_I_AM_DEATH_SCIENCE_ON_URANIUM', 'YieldType', 'YIELD_SCIENCE'),
							  ('SDG_I_AM_DEATH_SCIENCE_ON_URANIUM', 'Amount', 5) ;