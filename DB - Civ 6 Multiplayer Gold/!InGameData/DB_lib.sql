-----------------------------------------------
-----------------------------------------------
-- Tags
-----------------------------------------------
-----------------------------------------------


-- Typetags for all, land combat, and naval combat units
INSERT OR IGNORE INTO Tags 
(Tag,							Vocabulary) 
VALUES 
('DB_CLASS_ALL',						'ABILITY_CLASS'),
('DB_CLASS_ALL_COMBAT',					'ABILITY_CLASS'),
('DB_CLASS_ALL_COMBAT_EXCEPT_HEROES',	'ABILITY_CLASS'),
('DB_CLASS_LAND_ALL',					'ABILITY_CLASS'),
('DB_CLASS_LAND_ALL_BUT_SCOUT',			'ABILITY_CLASS'),
('DB_CLASS_LAND_COMBAT',				'ABILITY_CLASS'),
('DB_CLASS_LAND_CAVALRY',				'ABILITY_CLASS'),
('DB_CLASS_LAND_NON_CAVALRY',			'ABILITY_CLASS'),
('DB_CLASS_LAND_MELEE_NON_CAVALRY',		'ABILITY_CLASS'),
('DB_CLASS_NAVAL_ALL',					'ABILITY_CLASS'),
('DB_CLASS_NAVAL_COMBAT',				'ABILITY_CLASS'),
('DB_CLASS_AIR_COMBAT',					'ABILITY_CLASS'),
('DB_CLASS_MELEE_ATTACKER',				'ABILITY_CLASS'),
('DB_CLASS_LAND_MELEE_ATTACKER',		'ABILITY_CLASS'),
('DB_CLASS_LAND_RANGED_ATTACKER',		'ABILITY_CLASS'),
('DB_CLASS_LAND_BOMBARD_ATTACKER',		'ABILITY_CLASS'),
('DB_CLASS_NAVAL_MELEE_ATTACKER',		'ABILITY_CLASS'),
('DB_CLASS_NAVAL_RANGED_ATTACKER',		'ABILITY_CLASS'),
('DB_CLASS_NAVAL_BOMBARD_ATTACKER',		'ABILITY_CLASS')
;
INSERT OR IGNORE INTO Tags (Tag, Vocabulary) 
  SELECT 'DB_CLASS_' || UnitType, 'ABILITY_CLASS' FROM Units ;

INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_ALL' FROM Units ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_ALL_COMBAT' FROM Units WHERE (Combat > 0 OR RangedCombat > 0 OR Bombard > 0) AND (FormationClass = 'FORMATION_CLASS_LAND_COMBAT' OR FormationClass = 'FORMATION_CLASS_NAVAL' OR FormationClass = 'FORMATION_CLASS_AIR') ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_ALL_COMBAT_EXCEPT_HEROES' FROM Units WHERE (Combat > 0 OR RangedCombat > 0 OR Bombard > 0) AND (FormationClass = 'FORMATION_CLASS_LAND_COMBAT' OR FormationClass = 'FORMATION_CLASS_NAVAL' OR FormationClass = 'FORMATION_CLASS_AIR') AND UnitType NOT LIKE 'UNIT_HERO%' ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_LAND_ALL' FROM Units WHERE Domain = 'DOMAIN_LAND' ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_LAND_ALL_BUT_SCOUT' FROM Units WHERE Domain = 'DOMAIN_LAND' AND UnitType != 'UNIT_SCOUT' ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_LAND_COMBAT' FROM Units WHERE (Combat > 0 OR RangedCombat > 0 OR Bombard > 0) AND FormationClass = 'FORMATION_CLASS_LAND_COMBAT' ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_NAVAL_ALL' FROM Units WHERE Domain = 'DOMAIN_SEA' ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_NAVAL_COMBAT' FROM Units WHERE (Combat > 0 OR RangedCombat > 0 OR Bombard > 0) AND FormationClass = 'FORMATION_CLASS_NAVAL' ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_AIR_COMBAT' FROM Units WHERE (Combat > 0 OR RangedCombat > 0 OR Bombard > 0) AND FormationClass = 'FORMATION_CLASS_AIR' ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_MELEE_ATTACKER' FROM Units WHERE Combat > 0 AND RangedCombat = 0 AND Bombard = 0 ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_LAND_MELEE_ATTACKER' FROM Units WHERE FormationClass = 'FORMATION_CLASS_LAND_COMBAT' AND Combat > 0 AND RangedCombat = 0 AND Bombard = 0 ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_LAND_RANGED_ATTACKER' FROM Units WHERE FormationClass = 'FORMATION_CLASS_LAND_COMBAT' AND RangedCombat > 0 ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_LAND_BOMBARD_ATTACKER' FROM Units WHERE FormationClass = 'FORMATION_CLASS_LAND_COMBAT' AND Bombard > 0 ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_LAND_CAVALRY' FROM Units WHERE FormationClass = 'FORMATION_CLASS_LAND_COMBAT' AND PromotionClass LIKE '%CAVALRY%' AND PromotionClass NOT LIKE '%ANTI_CAVALRY%' ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_LAND_NON_CAVALRY' FROM Units WHERE FormationClass = 'FORMATION_CLASS_LAND_COMBAT' AND (PromotionClass LIKE '%ANTI_CAVALRY%' OR PromotionClass NOT LIKE '%CAVALRY%') ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_LAND_MELEE_NON_CAVALRY' FROM Units WHERE FormationClass = 'FORMATION_CLASS_LAND_COMBAT' AND Combat > 0 AND RangedCombat = 0 AND Bombard = 0 AND (PromotionClass LIKE '%ANTI_CAVALRY%' OR PromotionClass NOT LIKE '%CAVALRY%') ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_NAVAL_MELEE_ATTACKER' FROM Units WHERE FormationClass = 'FORMATION_CLASS_NAVAL' AND Combat > 0 AND RangedCombat = 0 AND Bombard = 0 ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_NAVAL_RANGED_ATTACKER' FROM Units WHERE FormationClass = 'FORMATION_CLASS_NAVAL' AND RangedCombat > 0 ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_NAVAL_BOMBARD_ATTACKER' FROM Units WHERE FormationClass = 'FORMATION_CLASS_NAVAL' AND Bombard > 0 ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_NAVAL_BOMBARD_ATTACKER' FROM Units WHERE FormationClass = 'FORMATION_CLASS_NAVAL' AND Bombard > 0 ;
INSERT OR IGNORE INTO TypeTags (Type, Tag)
  SELECT UnitType, 'DB_CLASS_' || UnitType FROM Units ;



-----------------------------------------------
-----------------------------------------------
-- Requirements
-----------------------------------------------
-----------------------------------------------

-- Major Civ
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_PLAYER_IS_MAJOR', 'REQUIREMENT_PLAYER_IS_MAJOR') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_PLAYER_IS_MAJOR', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_PLAYER_IS_MAJOR', 'DB_REQ_PLAYER_IS_MAJOR') ;

-- Ally or not (not tested yet)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_PLAYER_IS_ALLY', 'REQUIREMENT_ALLY') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_PLAYER_IS_ALLY', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_PLAYER_IS_ALLY', 'DB_REQ_PLAYER_IS_ALLY') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) VALUES ('DB_REQ_PLAYER_IS_NOT_ALLY', 'REQUIREMENT_ALLY', 1) ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_PLAYER_IS_NOT_ALLY', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_PLAYER_IS_NOT_ALLY', 'DB_REQ_PLAYER_IS_NOT_ALLY') ;

-- Ally city at war or not (not tested yet)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_CITY_IS_ALLY_AT_WAR', 'REQUIREMENT_CITY_OWNER_ALLY_AT_WAR') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_CITY_IS_ALLY_AT_WAR', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_CITY_IS_ALLY_AT_WAR', 'DB_REQ_CITY_IS_ALLY_AT_WAR') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) VALUES ('DB_REQ_CITY_IS_NOT_ALLY_AT_WAR', 'REQUIREMENT_CITY_OWNER_ALLY_AT_WAR', 1) ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_CITY_IS_NOT_ALLY_AT_WAR', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_CITY_IS_NOT_ALLY_AT_WAR', 'DB_REQ_CITY_IS_NOT_ALLY_AT_WAR') ;


-- Game eras
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_ERA_IS_ANCIENT', 'REQUIREMENT_GAME_ERA_IS') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_ERA_IS_ANCIENT', 'EraType', 'ERA_ANCIENT') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_ERA_IS_ANCIENT', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_ERA_IS_ANCIENT', 'DB_REQ_ERA_IS_ANCIENT') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_ERA_IS_CLASSICAL', 'REQUIREMENT_GAME_ERA_IS') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_ERA_IS_CLASSICAL', 'EraType', 'ERA_CLASSICAL') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_ERA_IS_CLASSICAL', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_ERA_IS_CLASSICAL', 'DB_REQ_ERA_IS_CLASSICAL') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_ERA_IS_MEDIEVAL', 'REQUIREMENT_GAME_ERA_IS') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_ERA_IS_MEDIEVAL', 'EraType', 'ERA_MEDIEVAL') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_ERA_IS_MEDIEVAL', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_ERA_IS_MEDIEVAL', 'DB_REQ_ERA_IS_MEDIEVAL') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_ERA_IS_RENAISSANCE', 'REQUIREMENT_GAME_ERA_IS') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_ERA_IS_RENAISSANCE', 'EraType', 'ERA_RENAISSANCE') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_ERA_IS_RENAISSANCE', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_ERA_IS_RENAISSANCE', 'DB_REQ_ERA_IS_RENAISSANCE') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_ERA_IS_INDUSTRIAL', 'REQUIREMENT_GAME_ERA_IS') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_ERA_IS_INDUSTRIAL', 'EraType', 'ERA_INDUSTRIAL') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_ERA_IS_INDUSTRIAL', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_ERA_IS_INDUSTRIAL', 'DB_REQ_ERA_IS_INDUSTRIAL') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_ERA_IS_MODERN', 'REQUIREMENT_GAME_ERA_IS') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_ERA_IS_MODERN', 'EraType', 'ERA_MODERN') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_ERA_IS_MODERN', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_ERA_IS_MODERN', 'DB_REQ_ERA_IS_MODERN') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_ERA_IS_ATOMIC', 'REQUIREMENT_GAME_ERA_IS') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_ERA_IS_ATOMIC', 'EraType', 'ERA_ATOMIC') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_ERA_IS_ATOMIC', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_ERA_IS_ATOMIC', 'DB_REQ_ERA_IS_ATOMIC') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_ERA_IS_INFORMATION', 'REQUIREMENT_GAME_ERA_IS') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_ERA_IS_INFORMATION', 'EraType', 'ERA_INFORMATION') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_ERA_IS_INFORMATION', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_ERA_IS_INFORMATION', 'DB_REQ_ERA_IS_INFORMATION') ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_ERA_IS_FUTURE', 'REQUIREMENT_GAME_ERA_IS') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_ERA_IS_FUTURE', 'EraType', 'ERA_FUTURE') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_ERA_IS_FUTURE', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_ERA_IS_FUTURE', 'DB_REQ_ERA_IS_FUTURE') ;

-- Player has tech (DB_REQ_PLAYER_HAS_FLIGHT, DB_REQSET_PLAYER_HAS_FLIGHT)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT 'DB_REQ_PLAYER_HAS_' || SUBSTR(TechnologyType, 6), 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY' FROM Technologies ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_PLAYER_HAS_' || SUBSTR(TechnologyType, 6), 'TechnologyType', TechnologyType FROM Technologies ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_PLAYER_HAS_' || SUBSTR(TechnologyType, 6), 'REQUIREMENTSET_TEST_ALL' FROM Technologies ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_PLAYER_HAS_' || SUBSTR(TechnologyType, 6), 'DB_REQ_PLAYER_HAS_' || SUBSTR(TechnologyType, 6) FROM Technologies ;

-- Player has civic (DB_REQ_PLAYER_HAS_THEOLOGY, DB_REQSET_PLAYER_HAS_THEOLOGY)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT 'DB_REQ_PLAYER_HAS_' || SUBSTR(CivicType, 7), 'REQUIREMENT_PLAYER_HAS_CIVIC' FROM Civics ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_PLAYER_HAS_' || SUBSTR(CivicType, 7), 'CivicType', CivicType FROM Civics ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_PLAYER_HAS_' || SUBSTR(CivicType, 7), 'REQUIREMENTSET_TEST_ALL' FROM Civics ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_PLAYER_HAS_' || SUBSTR(CivicType, 7), 'DB_REQ_PLAYER_HAS_' || SUBSTR(CivicType, 7) FROM Civics ;

-- Civ not founded religion
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_PLAYER_NOT_FOUNDED_RELIGION', 'REQUIREMENT_PLAYER_FOUNDED_NO_RELIGION') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_PLAYER_NOT_FOUNDED_RELIGION', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_PLAYER_NOT_FOUNDED_RELIGION', 'DB_REQ_PLAYER_NOT_FOUNDED_RELIGION') ;

-- Civ founded religion
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) VALUES ('DB_REQ_PLAYER_FOUNDED_RELIGION', 'REQUIREMENT_PLAYER_FOUNDED_NO_RELIGION', 1) ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_PLAYER_FOUNDED_RELIGION', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_PLAYER_FOUNDED_RELIGION', 'DB_REQ_PLAYER_FOUNDED_RELIGION') ;

--  AI has founded religion
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_PLAYER_IS_AI_AND_HAS_FOUNDED_RELIGION', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
                                                  ('DB_REQSET_PLAYER_IS_AI_AND_HAS_FOUNDED_RELIGION', 'REQUIRES_PLAYER_IS_AI'),
									              ('DB_REQSET_PLAYER_IS_AI_AND_HAS_FOUNDED_RELIGION', 'DB_REQ_PLAYER_FOUNDED_RELIGION') ;

-- Major Civilization having a capital city and has not founded a religion (getting a free starting prophet when they settle their capital)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_FREE_PROPHET', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
                                                 ('DB_REQSET_FREE_PROPHET', 'DB_REQ_ERA_IS_ANCIENT'), 
                                                 ('DB_REQSET_FREE_PROPHET', 'DB_REQ_PLAYER_IS_MAJOR'), 
												 ('DB_REQSET_FREE_PROPHET', 'DB_REQ_PLAYER_NOT_FOUNDED_RELIGION'),
									             ('DB_REQSET_FREE_PROPHET', 'REQUIRES_CAPITAL_CITY') ;

-- Classical era with Capital City (Saladin's free prophet)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_CAPITAL_CITY_IN_CLASSICAL_ERA', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
                                                  ('DB_REQSET_CAPITAL_CITY_IN_CLASSICAL_ERA', 'DB_REQ_ERA_IS_CLASSICAL'), 
									              ('DB_REQSET_CAPITAL_CITY_IN_CLASSICAL_ERA', 'REQUIRES_CAPITAL_CITY') ;

-- City follows pantheon (DB_REQ_CITY_FOLLOWS_PANTHEON, DB_REQSET_CITY_FOLLOWS_PANTHEON)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_CITY_FOLLOWS_PANTHEON', 'REQUIREMENT_CITY_FOLLOWS_PANTHEON') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_CITY_FOLLOWS_PANTHEON', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_CITY_FOLLOWS_PANTHEON', 'DB_REQ_CITY_FOLLOWS_PANTHEON') ;

-- City follows religion (DB_REQ_CITY_FOLLOWS_RELIGION, DB_REQSET_CITY_FOLLOWS_RELIGION)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_CITY_FOLLOWS_RELIGION', 'REQUIREMENT_CITY_FOLLOWS_RELIGION') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_CITY_FOLLOWS_RELIGION', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_CITY_FOLLOWS_RELIGION', 'DB_REQ_CITY_FOLLOWS_RELIGION') ;

-- City has X population (DB_REQ_CITY_HAS_2_POPULATION, DB_REQSET_CITY_HAS_2_POPULATION)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_POPULATION', 'REQUIREMENT_CITY_HAS_X_POPULATION' FROM counter ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_POPULATION', 'Amount', x FROM counter ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_POPULATION', 'REQUIREMENTSET_TEST_ALL' FROM counter ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_POPULATION', 'DB_REQ_CITY_HAS_' || x || '_POPULATION' FROM counter ;

-- City has X population and follows religion (DB_REQ_CITY_HAS_2_POPULATION_AND_FOLLOWS_RELIGION, DB_REQSET_CITY_HAS_2_POPULATION_AND_FOLLOWS_RELIGION)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION', 'REQUIREMENTSET_TEST_ALL' FROM counter ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION', 'DB_REQ_CITY_HAS_' || x || '_POPULATION' FROM counter ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION', 'DB_REQ_CITY_FOLLOWS_RELIGION' FROM counter ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION', 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM counter ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 99) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION', 'RequirementSetId', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;


-- City has X specialty districts (DB_REQ_CITY_HAS_2_DISTRICTS, DB_REQSET_CITY_HAS_2_DISTRICTS)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 18) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_DISTRICTS', 'REQUIREMENT_CITY_HAS_X_SPECIALTY_DISTRICTS' FROM counter ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 18) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_DISTRICTS', 'Amount', x FROM counter ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 18) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS', 'REQUIREMENTSET_TEST_ALL' FROM counter ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 18) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS', 'DB_REQ_CITY_HAS_' || x || '_DISTRICTS' FROM counter ;

-- City has X specialty districts and follows religion (DB_REQ_CITY_HAS_2_DISTRICTS_AND_FOLLOWS_RELIGION, DB_REQSET_CITY_HAS_2_DISTRICTS_AND_FOLLOWS_RELIGION)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 18) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION', 'REQUIREMENTSET_TEST_ALL' FROM counter ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 18) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION', 'DB_REQ_CITY_HAS_' || x || '_DISTRICTS' FROM counter ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 18) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION', 'DB_REQ_CITY_FOLLOWS_RELIGION' FROM counter ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 18) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION', 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM counter ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 18) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION', 'RequirementSetId', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;


-- City has a certain building, including wonders (DB_REQ_CITY_HAS_LIBRARY, DB_REQSET_CITY_HAS_LIBRARY)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_CITY_HAS_' || SUBSTR(BuildingType, 10), 'REQUIREMENT_CITY_HAS_BUILDING' FROM Buildings ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_CITY_HAS_' || SUBSTR(BuildingType, 10), 'BuildingType', BuildingType FROM Buildings ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(BuildingType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Buildings ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(BuildingType, 10), 'DB_REQ_CITY_HAS_' || SUBSTR(BuildingType, 10) FROM Buildings ;


-- City has a certain building AND follows religion (DB_REQ_CITY_HAS_BROADCAST_CENTER_AND_FOLLOWS_RELIGION, DB_REQSET_CITY_HAS_BROADCAST_CENTER_AND_FOLLOWS_RELIGION)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(BuildingType, 10) || '_AND_FOLLOWS_RELIGION', 'REQUIREMENTSET_TEST_ALL' FROM Buildings ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(BuildingType, 10) || '_AND_FOLLOWS_RELIGION', 'DB_REQ_CITY_HAS_' || SUBSTR(BuildingType, 10) FROM Buildings ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(BuildingType, 10) || '_AND_FOLLOWS_RELIGION', 'DB_REQ_CITY_FOLLOWS_RELIGION' FROM Buildings ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_CITY_HAS_' || SUBSTR(BuildingType, 10) || '_AND_FOLLOWS_RELIGION', 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Buildings ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_CITY_HAS_' || SUBSTR(BuildingType, 10) || '_AND_FOLLOWS_RELIGION', 'RequirementSetId', 'DB_REQSET_CITY_HAS_' || SUBSTR(BuildingType, 10) || '_AND_FOLLOWS_RELIGION' FROM Buildings ;



-- City has any level-3 building (DB_REQ_CITY_HAS_LEVEL3_HSBUILDING, DB_REQSET_CITY_HAS_LEVEL3_HSBUILDING)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_CITY_HAS_LEVEL3_HSBUILDING', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_CITY_HAS_LEVEL3_HSBUILDING' , 'DB_REQ_CITY_HAS_' || SUBSTR(BuildingType, 10) || '_AND_FOLLOWS_RELIGION' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_CITY_HAS_LEVEL3_HSBUILDING', 'REQUIREMENT_REQUIREMENTSET_IS_MET') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_CITY_HAS_LEVEL3_HSBUILDING', 'RequirementSetId', 'DB_REQSET_CITY_HAS_LEVEL3_HSBUILDING') ;


-- City has any level-3 building AND follows religion (DB_REQ_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION, DB_REQSET_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
                                       ('DB_REQSET_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION', 'DB_REQ_CITY_HAS_LEVEL3_HSBUILDING'),
									   ('DB_REQSET_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION', 'REQUIRES_CITY_FOLLOWS_RELIGION') ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION', 'REQUIREMENT_REQUIREMENTSET_IS_MET') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION', 'RequirementSetId', 'DB_REQSET_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION') ;


-- City has a certain district (DB_REQ_CITY_HAS_HOLY_SITE, DB_REQSET_CITY_HAS_HOLY_SITE)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_CITY_HAS_' || SUBSTR(DistrictType, 10), 'REQUIREMENT_CITY_HAS_DISTRICT' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_CITY_HAS_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(DistrictType, 10), 'DB_REQ_CITY_HAS_' || SUBSTR(DistrictType, 10) FROM Districts WHERE TraitType IS NULL ;

-- City has a certain district AND follows religion (DB_REQ_CITY_HAS_HOLY_SITE_AND_FOLLOWS_RELIGION, DB_REQSET_CITY_HAS_HOLY_SITE_AND_FOLLOWS_RELIGION)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(DistrictType, 10) || '_AND_FOLLOWS_RELIGION', 'REQUIREMENTSET_TEST_ALL' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(DistrictType, 10) || '_AND_FOLLOWS_RELIGION', 'DB_REQ_CITY_HAS_' || SUBSTR(DistrictType, 10) FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_CITY_HAS_' || SUBSTR(DistrictType, 10) || '_AND_FOLLOWS_RELIGION', 'DB_REQ_CITY_FOLLOWS_RELIGION' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_CITY_HAS_' || SUBSTR(DistrictType, 10) || '_AND_FOLLOWS_RELIGION', 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_CITY_HAS_' || SUBSTR(DistrictType, 10) || '_AND_FOLLOWS_RELIGION', 'RequirementSetId', 'DB_REQSET_CITY_HAS_' || SUBSTR(DistrictType, 10) || '_AND_FOLLOWS_RELIGION' FROM Districts WHERE TraitType IS NULL ;

-- City has X terrain type (DB_REQ_CITY_HAS_2_DESERT, DB_REQSET_CITY_HAS_2_DESERT)
--  Currently just does deserts because that's the only terrain I'm interested in for this. Modify the where clauses to include other terrains. (Without the where clause it creates over a thousand unnecessary requirements.)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9), 'REQUIREMENT_CITY_HAS_X_TERRAIN_TYPE' FROM counter LEFT JOIN Terrains WHERE TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9), 'TerrainType', TerrainType FROM counter LEFT JOIN Terrains WHERE TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9), 'Hills', 0 FROM counter LEFT JOIN Terrains WHERE TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9), 'Amount', x FROM counter LEFT JOIN Terrains WHERE TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9), 'REQUIREMENTSET_TEST_ALL' FROM counter LEFT JOIN Terrains WHERE TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9), 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9) FROM counter LEFT JOIN Terrains WHERE TerrainType LIKE '%DESERT%' ;


-- City has X terrain type, including hill versions (DB_REQ_CITY_HAS_2_DESERT_OR_DESERT_HILLS, DB_REQSET_CITY_HAS_2_DESERT_OR_DESERT_HILLS)
--  Currently just does deserts because that's the only terrain I'm interested in for this. Modify the where clauses to include other terrains. (Without the where clause it creates over a thousand unnecessary requirements.)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS', 'REQUIREMENT_CITY_HAS_X_TERRAIN_TYPE' FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS', 'TerrainType', TerrainType FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS', 'Hills', 1 FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;

	-- For some reason, the "Amount" argument is off by 1. When Value is set to 2/4/6 the requirement is actually satisfied with 1/3/5 matching tiles... thus why this query sets the Value to x + 1
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS', 'Amount', x + 1 FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS', 'REQUIREMENTSET_TEST_ALL' FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQSET_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS', 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS' FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;


-- Follows religion AND has X terrain type, including hill versions (DB_REQSET_CITY_FOLLOWS_RELIGION_AND_HAS_2_DESERT_OR_DESERT_HILLS)
--  Currently just does deserts because that's the only terrain I'm interested in for this. Modify the where clauses to include other terrains. (Without the where clause it creates over a thousand unnecessary requirements.)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQSET_CITY_FOLLOWS_RELIGION_AND_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS', 'REQUIREMENTSET_TEST_ALL' FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQSET_CITY_FOLLOWS_RELIGION_AND_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS', 'DB_REQ_CITY_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS' FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 37) 
  SELECT 'DB_REQSET_CITY_FOLLOWS_RELIGION_AND_HAS_' || x || '_' || SUBSTR(TerrainType, 9) || '_OR_' || SUBSTR(TerrainType, 9) || '_HILLS', 'REQUIRES_CITY_FOLLOWS_RELIGION' FROM counter LEFT JOIN Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' AND TerrainType LIKE '%DESERT%' ;


-- District is... (DB_REQ_IS_HOLY_SITE, DB_REQSET_IS_HOLY_SITE)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_IS_' || SUBSTR(DistrictType, 10), 'REQUIREMENT_DISTRICT_TYPE_MATCHES' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_IS_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_IS_' || SUBSTR(DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_IS_' || SUBSTR(DistrictType, 10), 'DB_REQ_IS_' || SUBSTR(DistrictType, 10) FROM Districts WHERE TraitType IS NULL ;


-- Next to a certain district (DB_REQ_NEXT_TO_HOLY_SITE, DB_REQSET_NEXT_TO_HOLY_SITE)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_NEXT_TO_' || SUBSTR(DistrictType, 10), 'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_NEXT_TO_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_NEXT_TO_' || SUBSTR(DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_NEXT_TO_' || SUBSTR(DistrictType, 10), 'DB_REQ_NEXT_TO_' || SUBSTR(DistrictType, 10) FROM Districts WHERE TraitType IS NULL ;


-- District is X and next to district Y (DB_REQ_IS_CAMPUS_NEXT_TO_HOLY_SITE, DB_REQSET_IS_CAMPUS_NEXT_TO_HOLY_SITE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_IS_' || SUBSTR(a.DistrictType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Districts AS a LEFT JOIN Districts AS b WHERE a.TraitType IS NULL AND b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_IS_' || SUBSTR(a.DistrictType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_IS_' || SUBSTR(a.DistrictType, 10) FROM Districts AS a LEFT JOIN Districts AS b WHERE a.TraitType IS NULL AND b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_IS_' || SUBSTR(a.DistrictType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Districts AS a LEFT JOIN Districts AS b WHERE a.TraitType IS NULL AND b.TraitType IS NULL ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_IS_' || SUBSTR(a.DistrictType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Districts AS a LEFT JOIN Districts AS b WHERE a.TraitType IS NULL AND b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_IS_' || SUBSTR(a.DistrictType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'RequirementSetId', 'DB_REQSET_IS_' || SUBSTR(a.DistrictType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Districts AS a LEFT JOIN Districts AS b WHERE a.TraitType IS NULL AND b.TraitType IS NULL ;

-- Plot is terrain (DB_REQ_IS_PLAINS, DB_REQSET_IS_PLAINS)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_IS_' || SUBSTR(TerrainType, 9), 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES' FROM Terrains ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_IS_' || SUBSTR(TerrainType, 9), 'TerrainType', TerrainType FROM Terrains ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_IS_' || SUBSTR(TerrainType, 9), 'REQUIREMENTSET_TEST_ALL' FROM Terrains ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_' || SUBSTR(TerrainType, 9), 'DB_REQ_IS_' || SUBSTR(TerrainType, 9) FROM Terrains ;

-- Plot is not a city center (DB_REQ_IS_NOT_CITY_CENTER, DB_REQSET_IS_NOT_CITY_CENTER)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) VALUES ('DB_REQ_IS_NOT_CITY_CENTER', 'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES', 1) ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_IS_NOT_CITY_CENTER', 'DistrictType', 'DISTRICT_CITY_CENTER') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_IS_NOT_CITY_CENTER', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_IS_NOT_CITY_CENTER', 'DB_REQ_IS_NOT_CITY_CENTER') ;

-- Plot is terrain and not a city center (DB_REQ_IS_PLAINS_AND_NOT_CITY_CENTER, DB_REQSET_IS_PLAINS_AND_NOT_CITY_CENTER)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_IS_' || SUBSTR(TerrainType, 9) || '_AND_NOT_CITY_CENTER', 'REQUIREMENTSET_TEST_ALL' FROM Terrains ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_' || SUBSTR(TerrainType, 9) || '_AND_NOT_CITY_CENTER', 'DB_REQ_IS_' || SUBSTR(TerrainType, 9) FROM Terrains ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_' || SUBSTR(TerrainType, 9) || '_AND_NOT_CITY_CENTER', 'DB_REQ_IS_NOT_CITY_CENTER' FROM Terrains ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_IS_' || SUBSTR(TerrainType, 9) || '_AND_NOT_CITY_CENTER', 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Terrains ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_IS_' || SUBSTR(TerrainType, 9) || '_AND_NOT_CITY_CENTER', 'RequirementSetId', 'DB_REQSET_IS_' || SUBSTR(TerrainType, 9) || '_AND_NOT_CITY_CENTER' FROM Terrains ;


-- Plot is next to terrain (DB_REQ_IS_NEXT_TO_PLAINS, DB_REQSET_IS_NEXT_TO_PLAINS)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_IS_NEXT_TO_' || SUBSTR(TerrainType, 9), 'REQUIREMENT_PLOT_ADJACENT_TERRAIN_TYPE_MATCHES' FROM Terrains ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_IS_NEXT_TO_' || SUBSTR(TerrainType, 9), 'TerrainType', TerrainType FROM Terrains ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_IS_NEXT_TO_' || SUBSTR(TerrainType, 9), 'MinRange', 0 FROM Terrains ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_IS_NEXT_TO_' || SUBSTR(TerrainType, 9), 'MaxRange', 1 FROM Terrains ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_IS_NEXT_TO_' || SUBSTR(TerrainType, 9), 'REQUIREMENTSET_TEST_ALL' FROM Terrains ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_NEXT_TO_' || SUBSTR(TerrainType, 9), 'DB_REQ_IS_NEXT_TO_' || SUBSTR(TerrainType, 9) FROM Terrains ;

-- Plot is terrain X or next to terrain X (DB_REQ_IS_PLAINS_OR_NEXT_TO_PLAINS, DB_REQSET_IS_PLAINS_OR_NEXT_TO_PLAINS) [[NOT TESTED]]
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_IS_'  || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_' || SUBSTR(TerrainType, 9), 'REQUIREMENTSET_TEST_ANY' FROM Terrains ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_'  || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_' || SUBSTR(TerrainType, 9), 'DB_REQ_IS_' || SUBSTR(TerrainType, 9) FROM Terrains ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_'  || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_' || SUBSTR(TerrainType, 9), 'DB_REQ_IS_NEXT_TO_' || SUBSTR(TerrainType, 9) FROM Terrains ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_IS_' || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_' || SUBSTR(TerrainType, 9), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Terrains ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_IS_' || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_' || SUBSTR(TerrainType, 9), 'RequirementSetId', 'DB_REQSET_IS_'  || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_' || SUBSTR(TerrainType, 9) FROM Terrains ;


-- Plot is terrain X and is next to district Y (DB_REQ_IS_PLAINS_NEXT_TO_HOLY_SITE, DB_REQSET_IS_PLAINS_NEXT_TO_HOLY_SITE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_IS_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Terrains AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_IS_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_IS_' || SUBSTR(a.TerrainType, 9) FROM Terrains AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_IS_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Terrains AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_IS_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Terrains AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_IS_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'RequirementSetId', 'DB_REQSET_IS_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Terrains AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;

-- Plot is any terrain of a certain type (DB_REQ_IS_ANY_PLAINS, DB_REQSET_IS_ANY_PLAINS)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_IS_ANY_' || SUBSTR(TerrainType, 9), 'REQUIREMENTSET_TEST_ANY' FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_ANY_' || SUBSTR(a.TerrainType, 9), 'DB_REQ_IS_' || SUBSTR(b.TerrainType, 9) FROM Terrains AS a INNER JOIN Terrains AS b ON SUBSTR(a.TerrainType, 0, 12) = SUBSTR(b.TerrainType, 0, 12) WHERE a.TerrainType NOT LIKE '%HILLS%' AND a.TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_IS_ANY_' || SUBSTR(TerrainType, 9), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_IS_ANY_' || SUBSTR(TerrainType, 9), 'RequirementSetId', 'DB_REQSET_IS_ANY_' || SUBSTR(TerrainType, 9) FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;

-- Plot is any mountain of a certain type (DB_REQ_IS_ANY_MOUNTAIN, DB_REQSET_IS_ANY_MOUNTAIN)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_IS_ANY_MOUNTAIN', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_ANY_MOUNTAIN', 'DB_REQ_IS_' || SUBSTR(TerrainType, 9) FROM Terrains WHERE TerrainType LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_IS_ANY_MOUNTAIN', 'REQUIREMENT_REQUIREMENTSET_IS_MET') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_IS_ANY_MOUNTAIN', 'RequirementSetId', 'DB_REQSET_IS_ANY_MOUNTAIN') ;

-- Plot is next to any terrain of a certain type (DB_REQ_IS_NEXT_TO_ANY_PLAINS, DB_REQSET_IS_NEXT_TO_ANY_PLAINS) [[NOT TESTED]]
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_IS_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9), 'REQUIREMENTSET_TEST_ANY' FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9), 'DB_REQ_IS_NEXT_TO_' || SUBSTR(TerrainType, 9) FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_IS_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_IS_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9), 'RequirementSetId', 'DB_REQSET_IS_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9) FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;

-- Plot is terrain of a certain type or next to terrain of that type (DB_REQ_IS_ANY_PLAINS_OR_NEXT_TO_ANY_PLAINS, DB_REQSET_IS_ANY_PLAINS_OR_NEXT_TO_ANY_PLAINS) [[NOT TESTED]]
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_IS_ANY_' || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9), 'REQUIREMENTSET_TEST_ANY' FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_ANY_' || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9), 'DB_REQ_IS_ANY_' || SUBSTR(TerrainType, 9) FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_IS_ANY_' || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9), 'DB_REQ_IS_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9) FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_IS_ANY_' || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_IS_ANY_' || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9), 'RequirementSetId', 'DB_REQSET_IS_ANY_' || SUBSTR(TerrainType, 9) || '_OR_NEXT_TO_ANY_' || SUBSTR(TerrainType, 9) FROM Terrains WHERE TerrainType NOT LIKE '%HILLS%' AND TerrainType NOT LIKE '%MOUNTAIN%' ;


-- Plot is terrain of a certain type X and is next to district Y (DB_REQ_IS_ANY_PLAINS_NEXT_TO_HOLY_SITE, DB_REQSET_IS_ANY_PLAINS_NEXT_TO_HOLY_SITE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_IS_ANY_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Terrains AS a LEFT JOIN Districts AS b WHERE a.TerrainType NOT LIKE '%HILLS%' AND a.TerrainType NOT LIKE '%MOUNTAIN%' AND b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_IS_ANY_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_IS_ANY_' || SUBSTR(a.TerrainType, 9) FROM Terrains AS a LEFT JOIN Districts AS b WHERE a.TerrainType NOT LIKE '%HILLS%' AND a.TerrainType NOT LIKE '%MOUNTAIN%' AND b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_IS_ANY_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Terrains AS a LEFT JOIN Districts AS b WHERE a.TerrainType NOT LIKE '%HILLS%' AND a.TerrainType NOT LIKE '%MOUNTAIN%' AND b.TraitType IS NULL ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_IS_ANY_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Terrains AS a LEFT JOIN Districts AS b WHERE a.TerrainType NOT LIKE '%HILLS%' AND a.TerrainType NOT LIKE '%MOUNTAIN%' AND b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_IS_ANY_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'RequirementSetId', 'DB_REQSET_IS_ANY_' || SUBSTR(a.TerrainType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Terrains AS a LEFT JOIN Districts AS b WHERE a.TerrainType NOT LIKE '%HILLS%' AND a.TerrainType NOT LIKE '%MOUNTAIN%' AND b.TraitType IS NULL ;

-- Plot is any water/arctic (DB_REQ_IS_ANY_WATER, DB_REQSET_IS_ANY_WATER)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
                                       ('DB_REQSET_IS_ANY_WATER', 'REQUIREMENTSET_TEST_ANY'), 
									   ('DB_REQSET_IS_ANY_ARCTIC', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
                                                  ('DB_REQSET_IS_ANY_WATER', 'DB_REQ_IS_ANY_COAST'),
												  ('DB_REQSET_IS_ANY_WATER', 'DB_REQ_IS_ANY_OCEAN'),
												  ('DB_REQSET_IS_ANY_ARCTIC', 'DB_REQ_IS_ANY_SNOW'),
												  ('DB_REQSET_IS_ANY_ARCTIC', 'DB_REQ_IS_ANY_TUNDRA') ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES
                                    ('DB_REQ_IS_ANY_WATER', 'REQUIREMENT_REQUIREMENTSET_IS_MET'),
									('DB_REQ_IS_ANY_ARCTIC', 'REQUIREMENT_REQUIREMENTSET_IS_MET') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
                                            ('DB_REQ_IS_ANY_WATER', 'RequirementSetId', 'DB_REQSET_IS_ANY_WATER'),
											('DB_REQ_IS_ANY_ARCTIC', 'RequirementSetId', 'DB_REQSET_IS_ANY_ARCTIC') ;


-- "Normal Desert": no oasis/floodplains (DB_REQ_IS_NORMAL_DESERT, DB_REQSET_IS_NORMAL_DESERT)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) VALUES
                         ('DB_REQ_IS_NOT_FLOODPLAINS', 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES', 1),
                         ('DB_REQ_IS_NOT_OASIS', 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES', 1),
                         ('DB_REQ_IS_NOT_FLOODPLAINS_OR_OASIS', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 0),
                         ('DB_REQ_IS_NORMAL_DESERT', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 0) ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
                                 ('DB_REQ_IS_NOT_FLOODPLAINS', 'FeatureType', 'FEATURE_FLOODPLAINS'),
                                 ('DB_REQ_IS_NOT_OASIS', 'FeatureType', 'FEATURE_OASIS'),
                                 ('DB_REQ_IS_NOT_FLOODPLAINS_OR_OASIS', 'RequirementSetId', 'DB_REQSET_IS_NOT_FLOODPLAINS_OR_OASIS'),
                                 ('DB_REQ_IS_NORMAL_DESERT', 'RequirementSetId', 'DB_REQSET_IS_NORMAL_DESERT') ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
                            ('DB_REQSET_IS_NOT_FLOODPLAINS_OR_OASIS', 'REQUIREMENTSET_TEST_ALL'),
                            ('DB_REQSET_IS_NORMAL_DESERT', 'REQUIREMENTSET_TEST_ALL') ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
                                       ('DB_REQSET_IS_NOT_FLOODPLAINS_OR_OASIS', 'DB_REQ_IS_NOT_FLOODPLAINS'),
                                       ('DB_REQSET_IS_NOT_FLOODPLAINS_OR_OASIS', 'DB_REQ_IS_NOT_OASIS'),
                                       ('DB_REQSET_IS_NORMAL_DESERT', 'DB_REQ_IS_ANY_DESERT'),
                                       ('DB_REQSET_IS_NORMAL_DESERT', 'DB_REQ_IS_NOT_FLOODPLAINS_OR_OASIS') ;



-- Plot has feature (DB_REQ_HAS_FOREST, DB_REQSET_HAS_FOREST)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_HAS_' || SUBSTR(FeatureType, 9), 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES' FROM Features ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_HAS_' || SUBSTR(FeatureType, 9), 'FeatureType', FeatureType FROM Features ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_HAS_' || SUBSTR(FeatureType, 9), 'REQUIREMENTSET_TEST_ALL' FROM Features ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_HAS_' || SUBSTR(FeatureType, 9), 'DB_REQ_HAS_' || SUBSTR(FeatureType, 9) FROM Features ;


-- Plot has feature X and is next to district Y (DB_REQ_HAS_FOREST_NEXT_TO_HOLY_SITE, DB_REQSET_HAS_FOREST_NEXT_TO_HOLY_SITE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_HAS_' || SUBSTR(a.FeatureType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Features AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_HAS_' || SUBSTR(a.FeatureType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_HAS_' || SUBSTR(a.FeatureType, 9) FROM Features AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_HAS_' || SUBSTR(a.FeatureType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Features AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_HAS_' || SUBSTR(a.FeatureType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Features AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_HAS_' || SUBSTR(a.FeatureType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'RequirementSetId', 'DB_REQSET_HAS_' || SUBSTR(a.FeatureType, 9) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Features AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;


-- Plot has trees (DB_REQ_HAS_TREES, DB_REQSET_HAS_TREES)
INSERT OR IGNORE INTO RequirementSets ('RequirementSetId', 'RequirementSetType') VALUES ('DB_REQSET_HAS_TREES', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements ('RequirementSetId', 'RequirementId') VALUES 
('DB_REQSET_HAS_TREES', 'DB_REQ_HAS_FOREST'),
('DB_REQSET_HAS_TREES', 'DB_REQ_HAS_JUNGLE') ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_HAS_TREES', 'REQUIREMENT_REQUIREMENTSET_IS_MET') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_HAS_TREES', 'RequirementSetId', 'DB_REQSET_HAS_TREES') ;

-- Plot doesn't have trees (DB_REQ_DOESNT_HAVE_TREES, DB_REQSET_DOESNT_HAVE_TREES)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) VALUES ('DB_REQ_DOESNT_HAVE_TREES', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 1) ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_DOESNT_HAVE_TREES', 'RequirementSetId', 'DB_REQSET_HAS_TREES') ;
INSERT OR IGNORE INTO RequirementSets ('RequirementSetId', 'RequirementSetType') VALUES ('DB_REQSET_DOESNT_HAVE_TREES', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements ('RequirementSetId', 'RequirementId') VALUES 
('DB_REQSET_DOESNT_HAVE_TREES', 'DB_REQ_DOESNT_HAVE_TREES') ;


-- Plot has resource (DB_REQ_HAS_STONE, DB_REQSET_HAS_STONE)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_HAS_' || SUBSTR(ResourceType, 10), 'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES' FROM Resources ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_HAS_' || SUBSTR(ResourceType, 10), 'ResourceType', ResourceType FROM Resources ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_HAS_' || SUBSTR(ResourceType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Resources ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_HAS_' || SUBSTR(ResourceType, 10), 'DB_REQ_HAS_' || SUBSTR(ResourceType, 10) FROM Resources ;


-- Plot has resource X and is next to district Y (DB_REQ_HAS_STONE_NEXT_TO_HOLY_SITE, DB_REQSET_HAS_STONE_NEXT_TO_HOLY_SITE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_HAS_' || SUBSTR(a.ResourceType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Resources AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_HAS_' || SUBSTR(a.ResourceType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_HAS_' || SUBSTR(a.ResourceType, 10) FROM Resources AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_HAS_' || SUBSTR(a.ResourceType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Resources AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_HAS_' || SUBSTR(a.ResourceType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Resources AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_HAS_' || SUBSTR(a.ResourceType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'RequirementSetId', 'DB_REQSET_HAS_' || SUBSTR(a.ResourceType, 10) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Resources AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;


-- Plot has improvement (DB_REQ_HAS_AIRSTRIP, DB_REQSET_HAS_AIRSTRIP)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  SELECT 'DB_REQ_HAS_' || SUBSTR(ImprovementType, 13), 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES' FROM Improvements ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  SELECT 'DB_REQ_HAS_' || SUBSTR(ImprovementType, 13), 'ImprovementType', ImprovementType FROM Improvements ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_HAS_' || SUBSTR(ImprovementType, 13), 'REQUIREMENTSET_TEST_ALL' FROM Improvements ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_HAS_' || SUBSTR(ImprovementType, 13), 'DB_REQ_HAS_' || SUBSTR(ImprovementType, 13) FROM Improvements ;


-- Plot has a standard resource improvement or industry/corporation (DB_REQSET_HAS_STANDARD_RESOURCE_IMPROVEMENT_OR_INDUSTRY_OR_CORPORATION, DB_REQ_HAS_STANDARD_RESOURCE_IMPROVEMENT_OR_INDUSTRY_OR_CORPORATION)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_HAS_STANDARD_RESOURCE_IMPROVEMENT_OR_INDUSTRY_OR_CORPORATION', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT DISTINCT 'DB_REQSET_HAS_STANDARD_RESOURCE_IMPROVEMENT_OR_INDUSTRY_OR_CORPORATION', 'DB_REQ_HAS_' || SUBSTR(ImprovementType, 13) FROM Improvement_ValidResources WHERE ImprovementType NOT IN (SELECT ImprovementType FROM Improvements WHERE DefenseModifier > 0 OR AirSlots > 0 OR WeaponSlots > 0) ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_HAS_STANDARD_RESOURCE_IMPROVEMENT_OR_INDUSTRY_OR_CORPORATION', 'REQUIREMENT_REQUIREMENTSET_IS_MET') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_HAS_STANDARD_RESOURCE_IMPROVEMENT_OR_INDUSTRY_OR_CORPORATION', 'RequirementSetId', 'DB_REQSET_HAS_STANDARD_RESOURCE_IMPROVEMENT_OR_INDUSTRY_OR_CORPORATION') ;


-- Plot has improvement X and is next to district Y (DB_REQ_HAS_MINE_NEXT_TO_HOLY_SITE, DB_REQSET_HAS_MINE_NEXT_TO_HOLY_SITE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  SELECT 'DB_REQSET_HAS_' || SUBSTR(a.ImprovementType, 13) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Improvements AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_HAS_' || SUBSTR(a.ImprovementType, 13) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_HAS_' || SUBSTR(a.ImprovementType, 13) FROM Improvements AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  SELECT 'DB_REQSET_HAS_' || SUBSTR(a.ImprovementType, 13) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'DB_REQ_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Improvements AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_HAS_' || SUBSTR(a.ImprovementType, 13) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Improvements AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_HAS_' || SUBSTR(a.ImprovementType, 13) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10), 'RequirementSetId', 'DB_REQSET_HAS_' || SUBSTR(a.ImprovementType, 13) || '_NEXT_TO_' || SUBSTR(b.DistrictType, 10) FROM Improvements AS a LEFT JOIN Districts AS b WHERE b.TraitType IS NULL ;

-- Specific Mines (DB_REQ_HAS_STRATEGIC_MINE, DB_REQSET_HAS_STRATEGIC_MINE)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES
						 ('DB_REQ_HAS_BONUS_MINE', 'REQUIREMENT_REQUIREMENTSET_IS_MET'),
						 ('DB_REQ_HAS_LUXURY_MINE', 'REQUIREMENT_REQUIREMENTSET_IS_MET'),
						 ('DB_REQ_HAS_STRATEGIC_MINE', 'REQUIREMENT_REQUIREMENTSET_IS_MET') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
                                 ('DB_REQ_HAS_BONUS_MINE', 'RequirementSetId', 'PLOT_HAS_BONUS_MINE_REQUIREMENTS'),
                                 ('DB_REQ_HAS_LUXURY_MINE', 'RequirementSetId', 'PLOT_HAS_LUXURY_MINE_REQUIREMENTS'),
                                 ('DB_REQ_HAS_STRATEGIC_MINE', 'RequirementSetId', 'PLOT_HAS_STRATEGIC_MINE_REQUIREMENTS');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
                            ('DB_REQSET_HAS_BONUS_MINE', 'REQUIREMENTSET_TEST_ALL'),
							('DB_REQSET_HAS_LUXURY_MINE', 'REQUIREMENTSET_TEST_ALL'),
							('DB_REQSET_HAS_STRATEGIC_MINE', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
                                       ('DB_REQSET_HAS_BONUS_MINE', 'DB_REQ_HAS_BONUS_MINE'),
                                       ('DB_REQSET_HAS_LUXURY_MINE', 'DB_REQ_HAS_LUXURY_MINE'),
                                       ('DB_REQSET_HAS_STRATEGIC_MINE', 'DB_REQ_HAS_STRATEGIC_MINE') ;

-- Strategic Mine next to district (DB_REQ_STRATEGIC_MINE_NEXT_TO_HOLY_SITE, DB_REQSET_STRATEGIC_MINE_NEXT_TO_HOLY_SITE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_STRATEGIC_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_STRATEGIC_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'DB_REQ_HAS_STRATEGIC_MINE' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_STRATEGIC_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'DB_REQ_NEXT_TO_' || SUBSTR(DistrictType, 10) FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_STRATEGIC_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_STRATEGIC_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'RequirementSetId', 'DB_REQSET_STRATEGIC_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10) FROM Districts WHERE TraitType IS NULL ;

-- Bonus Mine OR Luxury Mine (DB_REQ_HAS_BONUS_OR_LUXURY_MINE, DB_REQSET_HAS_BONUS_OR_LUXURY_MINE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_HAS_BONUS_OR_LUXURY_MINE', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
                                       ('DB_REQSET_HAS_BONUS_OR_LUXURY_MINE', 'DB_REQ_HAS_LUXURY_MINE'),
									   ('DB_REQSET_HAS_BONUS_OR_LUXURY_MINE', 'DB_REQ_HAS_BONUS_MINE') ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_HAS_BONUS_OR_LUXURY_MINE', 'REQUIREMENT_REQUIREMENTSET_IS_MET');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_HAS_BONUS_OR_LUXURY_MINE', 'RequirementSetId', 'DB_REQSET_HAS_BONUS_OR_LUXURY_MINE');

-- Bonus or Luxury mine next to district (DB_REQ_BONUS_OR_LUXURY_MINE_NEXT_TO_HOLY_SITE, DB_REQSET_BONUS_OR_LUXURY_MINE_NEXT_TO_HOLY_SITE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  SELECT 'DB_REQSET_BONUS_OR_LUXURY_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'REQUIREMENTSET_TEST_ALL' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_BONUS_OR_LUXURY_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'DB_REQ_HAS_BONUS_OR_LUXURY_MINE' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  SELECT 'DB_REQSET_BONUS_OR_LUXURY_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'DB_REQ_NEXT_TO_' || SUBSTR(DistrictType, 10) FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
  SELECT 'DB_REQ_BONUS_OR_LUXURY_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Districts WHERE TraitType IS NULL ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
  SELECT 'DB_REQ_BONUS_OR_LUXURY_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10), 'RequirementSetId', 'DB_REQSET_BONUS_OR_LUXURY_MINE_NEXT_TO_' || SUBSTR(DistrictType, 10) FROM Districts WHERE TraitType IS NULL ;


-- Plot is Breathtaking (DB_REQ_BREATHTAKING_APPEAL, DB_REQSET_BREATHTAKING_APPEAL)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_BREATHTAKING_APPEAL', 'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_BREATHTAKING_APPEAL', 'MinimumAppeal', 4) ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_BREATHTAKING_APPEAL', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_BREATHTAKING_APPEAL', 'DB_REQ_BREATHTAKING_APPEAL') ;


-- Units being near friendly and enemy cities that follow our religion (DB_REQ_UNIT_NEAR_FRIENDLY_RELIGIOUS_CITY, DB_REQSET_UNIT_NEAR_FRIENDLY_RELIGIOUS_CITY)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
                                       ('DB_REQSET_UNIT_NEAR_FRIENDLY_RELIGIOUS_CITY', 'REQUIREMENTSET_TEST_ALL'),
									   ('DB_REQSET_UNIT_NEAR_ENEMY_RELIGIOUS_CITY', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
                                                  ('DB_REQSET_UNIT_NEAR_FRIENDLY_RELIGIOUS_CITY', 'REQUIRES_UNIT_NEAR_FRIENDLY_RELIGIOUS_CITY'),
												  ('DB_REQSET_UNIT_NEAR_ENEMY_RELIGIOUS_CITY', 'REQUIRES_UNIT_NEAR_ENEMY_RELIGIOUS_CITY') ;


-- Plot within X tiles of where the modifier is attached (DB_REQ_WITHIN_9_TILES, DB_REQSET_WITHIN_9_TILES)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  WITH counter as (SELECT 0 x UNION SELECT x + 1 FROM counter WHERE x < 20) 
  SELECT 'DB_REQ_WITHIN_' || x || '_TILES', 'REQUIREMENT_PLOT_ADJACENT_TO_OWNER' FROM counter ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 0 x UNION SELECT x + 1 FROM counter WHERE x < 20) 
  SELECT 'DB_REQ_WITHIN_' || x || '_TILES', 'MinDistance', 0 FROM counter ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 0 x UNION SELECT x + 1 FROM counter WHERE x < 20) 
  SELECT 'DB_REQ_WITHIN_' || x || '_TILES', 'MaxDistance', x FROM counter ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
  WITH counter as (SELECT 0 x UNION SELECT x + 1 FROM counter WHERE x < 20) 
  SELECT 'DB_REQSET_WITHIN_' || x || '_TILES', 'REQUIREMENTSET_TEST_ALL' FROM counter ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
  WITH counter as (SELECT 0 x UNION SELECT x + 1 FROM counter WHERE x < 20) 
  SELECT 'DB_REQSET_WITHIN_' || x || '_TILES', 'DB_REQ_WITHIN_' || x || '_TILES' FROM counter ;


-- Reqset for being within 2 tiles of owner (e.g. great generals)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_AOE_OWNER_ADJACENCY', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_AOE_OWNER_ADJACENCY', 'AOE_REQUIRES_OWNER_ADJACENCY') ;


-- Attacking and Defending
INSERT OR IGNORE INTO Requirements
(RequirementId,			RequirementType,					Inverse) 
VALUES
('DB_REQ_ATTACKING',	'REQUIREMENT_PLAYER_IS_ATTACKING',	0),
('DB_REQ_DEFENDING',	'REQUIREMENT_PLAYER_IS_ATTACKING',	1)
;

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,		RequirementSetType)
VALUES
('DB_REQSET_ATTACKING',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING',	'REQUIREMENTSET_TEST_ALL')
;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,		RequirementId)
VALUES
('DB_REQSET_ATTACKING',	'DB_REQ_ATTACKING'),
('DB_REQSET_DEFENDING',	'DB_REQ_DEFENDING')
;

-- Home and Away
INSERT OR IGNORE INTO Requirements
(RequirementId,									RequirementType,						Inverse) 
VALUES
('DB_REQ_INSIDE_HOME_TERRITORY',				'REQUIREMENT_UNIT_IN_OWNER_TERRITORY',	0),
('DB_REQ_INSIDE_FOREIGN_TERRITORY',				'REQUIREMENT_UNIT_IN_ENEMY_TERRITORY',	0),
('DB_REQ_OUTSIDE_HOME_TERRITORY',				'REQUIREMENT_UNIT_IN_OWNER_TERRITORY',	1),
('DB_REQ_OUTSIDE_FOREIGN_TERRITORY',			'REQUIREMENT_UNIT_IN_ENEMY_TERRITORY',	1),
('DB_REQ_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF',	'REQUIREMENT_NEAR_RELIGIOUS_CITY',		0),
('DB_REQ_INSIDE_HOME_TERRITORY_WITH_BELIEF',	'REQUIREMENT_NEAR_RELIGIOUS_CITY',		0)
;

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,									Name,				Value) 
VALUES
('DB_REQ_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF',	'FriendlyCity',		0),
('DB_REQ_INSIDE_HOME_TERRITORY_WITH_BELIEF',	'FriendlyCity',		1)
;

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,									RequirementSetType)
VALUES
('DB_REQSET_INSIDE_HOME_TERRITORY',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_INSIDE_FOREIGN_TERRITORY',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OUTSIDE_HOME_TERRITORY',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OUTSIDE_FOREIGN_TERRITORY',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_OUTSIDE_HOME_TERRITORY',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_OUTSIDE_FOREIGN_TERRITORY',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_OUTSIDE_HOME_TERRITORY',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_OUTSIDE_FOREIGN_TERRITORY',	'REQUIREMENTSET_TEST_ALL'),

('DB_REQSET_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OUTSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OUTSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_OUTSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_OUTSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_OUTSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_OUTSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),

('DB_REQSET_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL')
;

-- Opponent unit is Land, Sea, Air, City, damaged, etc.
INSERT OR IGNORE INTO Requirements
(RequirementId,									RequirementType,							Inverse) 
VALUES
('DB_REQ_OPPONENT_IS_LAND_UNIT',				'REQUIREMENT_OPPONENT_UNIT_DOMAIN_MATCHES',	0),
('DB_REQ_OPPONENT_IS_SEA_UNIT',					'REQUIREMENT_OPPONENT_UNIT_DOMAIN_MATCHES',	0),
('DB_REQ_OPPONENT_IS_AIR_UNIT',					'REQUIREMENT_OPPONENT_UNIT_DOMAIN_MATCHES',	0),
('DB_REQ_OPPONENT_IS_CITY_OR_ENCAMPMENT',		'REQUIREMENT_OPPONENT_IS_DISTRICT',			0),
('DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENT_OPPONENT_IS_DISTRICT',			1),
('DB_REQ_OPPONENT_IS_NOT_LAND_UNIT',			'REQUIREMENT_OPPONENT_UNIT_DOMAIN_MATCHES',	1),
('DB_REQ_OPPONENT_IS_NOT_SEA_UNIT',				'REQUIREMENT_OPPONENT_UNIT_DOMAIN_MATCHES',	1),
('DB_REQ_OPPONENT_IS_NOT_AIR_UNIT',				'REQUIREMENT_OPPONENT_UNIT_DOMAIN_MATCHES',	1),
('DB_REQ_OPPONENT_IS_DAMAGED',					'REQUIREMENT_UNIT_DAMAGE_MINIMUM',			0),
('DB_REQ_OPPONENT_HAS_21_DAMAGE',				'REQUIREMENT_UNIT_DAMAGE_MINIMUM',			0),
('DB_REQ_OPPONENT_IS_WOUNDED',					'REQUIREMENT_OPPONENT_IS_WOUNDED',			0),
('DB_REQ_OPPONENT_IS_FORTIFIED',				'REQUIREMENT_OPPONENT_IS_FORTIFIED',		0),
('DB_REQ_OPPONENT_IS_OTHER_RELIGION',			'REQUIREMENT_OPPONENT_IS_OTHER_RELIGION',	0),
('DB_REQ_OPPONENT_IS_LAND_COMBAT',				'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES',	0),
('DB_REQ_OPPONENT_IS_NAVAL_COMBAT',				'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES',	0),
('DB_REQ_OPPONENT_IS_AIR_COMBAT',				'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES',	0),
('DB_REQ_OPPONENT_IS_LAND_MELEE_ATTACKER',		'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES',	0),
('DB_REQ_OPPONENT_IS_LAND_RANGED_ATTACKER',		'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES',	0),
('DB_REQ_OPPONENT_IS_LAND_BOMBARD_ATTACKER',	'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES',	0),
('DB_REQ_OPPONENT_IS_NAVAL_MELEE_ATTACKER',		'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES',	0),
('DB_REQ_OPPONENT_IS_NAVAL_RANGED_ATTACKER',	'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES',	0),
('DB_REQ_OPPONENT_IS_NAVAL_BOMBARD_ATTACKER',	'REQUIREMENT_OPPONENT_UNIT_TAG_MATCHES',	0)
;

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,									Name,				Value)
VALUES
('DB_REQ_OPPONENT_IS_LAND_UNIT',				'UnitDomain',		'DOMAIN_LAND'),
('DB_REQ_OPPONENT_IS_SEA_UNIT',					'UnitDomain',		'DOMAIN_SEA'),
('DB_REQ_OPPONENT_IS_AIR_UNIT',					'UnitDomain',		'DOMAIN_AIR'),
('DB_REQ_OPPONENT_IS_NOT_LAND_UNIT',			'UnitDomain',		'DOMAIN_LAND'),
('DB_REQ_OPPONENT_IS_NOT_SEA_UNIT',				'UnitDomain',		'DOMAIN_SEA'),
('DB_REQ_OPPONENT_IS_NOT_AIR_UNIT',				'UnitDomain',		'DOMAIN_AIR'),
('DB_REQ_OPPONENT_IS_DAMAGED',					'MinimumAmount',	1),
('DB_REQ_OPPONENT_HAS_21_DAMAGE',				'MinimumAmount',	21),
('DB_REQ_OPPONENT_IS_LAND_COMBAT',				'Tag',				'DB_CLASS_LAND_COMBAT'),
('DB_REQ_OPPONENT_IS_NAVAL_COMBAT',				'Tag',				'DB_CLASS_NAVAL_COMBAT'),
('DB_REQ_OPPONENT_IS_AIR_COMBAT',				'Tag',				'DB_CLASS_AIR_COMBAT'),
('DB_REQ_OPPONENT_IS_LAND_MELEE_ATTACKER',		'Tag',				'DB_CLASS_LAND_MELEE_ATTACKER'),
('DB_REQ_OPPONENT_IS_LAND_RANGED_ATTACKER',		'Tag',				'DB_CLASS_LAND_RANGED_ATTACKER'),
('DB_REQ_OPPONENT_IS_LAND_BOMBARD_ATTACKER',	'Tag',				'DB_CLASS_LAND_BOMBARD_ATTACKER'),
('DB_REQ_OPPONENT_IS_NAVAL_MELEE_ATTACKER',		'Tag',				'DB_CLASS_NAVAL_MELEE_ATTACKER'),
('DB_REQ_OPPONENT_IS_NAVAL_RANGED_ATTACKER',	'Tag',				'DB_CLASS_NAVAL_RANGED_ATTACKER'),
('DB_REQ_OPPONENT_IS_NAVAL_BOMBARD_ATTACKER',	'Tag',				'DB_CLASS_NAVAL_BOMBARD_ATTACKER')
;


INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,									RequirementSetType)
VALUES
('DB_REQSET_OPPONENT_IS_LAND_UNIT',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_SEA_UNIT',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_AIR_UNIT',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_CITY_OR_ENCAMPMENT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_NOT_LAND_UNIT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_NOT_SEA_UNIT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_NOT_AIR_UNIT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_DAMAGED',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_HAS_21_DAMAGE',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_WOUNDED',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_FORTIFIED',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_OTHER_RELIGION',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_LAND_COMBAT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_NAVAL_COMBAT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_AIR_COMBAT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_LAND_MELEE_ATTACKER',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_LAND_RANGED_ATTACKER',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_LAND_BOMBARD_ATTACKER',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_NAVAL_MELEE_ATTACKER',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_NAVAL_RANGED_ATTACKER',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_OPPONENT_IS_NAVAL_BOMBARD_ATTACKER',	'REQUIREMENTSET_TEST_ALL')
;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,									RequirementId)
VALUES
('DB_REQSET_OPPONENT_IS_LAND_UNIT',					'DB_REQ_OPPONENT_IS_LAND_UNIT'),
('DB_REQSET_OPPONENT_IS_SEA_UNIT',					'DB_REQ_OPPONENT_IS_SEA_UNIT'),
('DB_REQSET_OPPONENT_IS_AIR_UNIT',					'DB_REQ_OPPONENT_IS_AIR_UNIT'),
('DB_REQSET_OPPONENT_IS_CITY_OR_ENCAMPMENT',		'DB_REQ_OPPONENT_IS_CITY_OR_ENCAMPMENT'),
('DB_REQSET_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),
('DB_REQSET_OPPONENT_IS_NOT_LAND_UNIT',				'DB_REQ_OPPONENT_IS_NOT_LAND_UNIT'),
('DB_REQSET_OPPONENT_IS_NOT_SEA_UNIT',				'DB_REQ_OPPONENT_IS_NOT_SEA_UNIT'),
('DB_REQSET_OPPONENT_IS_NOT_AIR_UNIT',				'DB_REQ_OPPONENT_IS_NOT_AIR_UNIT'),
('DB_REQSET_OPPONENT_IS_DAMAGED',					'DB_REQ_OPPONENT_IS_DAMAGED'),
('DB_REQSET_OPPONENT_HAS_21_DAMAGE',				'DB_REQ_OPPONENT_HAS_21_DAMAGE'),
('DB_REQSET_OPPONENT_IS_WOUNDED',					'DB_REQ_OPPONENT_IS_WOUNDED'),
('DB_REQSET_OPPONENT_IS_FORTIFIED',					'DB_REQ_OPPONENT_IS_FORTIFIED'),
('DB_REQSET_OPPONENT_IS_OTHER_RELIGION',			'DB_REQ_OPPONENT_IS_OTHER_RELIGION'),
('DB_REQSET_OPPONENT_IS_LAND_COMBAT',				'DB_REQ_OPPONENT_IS_LAND_COMBAT'),
('DB_REQSET_OPPONENT_IS_NAVAL_COMBAT',				'DB_REQ_OPPONENT_IS_NAVAL_COMBAT'),
('DB_REQSET_OPPONENT_IS_AIR_COMBAT',				'DB_REQ_OPPONENT_IS_AIR_COMBAT'),
('DB_REQSET_OPPONENT_IS_LAND_MELEE_ATTACKER',		'DB_REQ_OPPONENT_IS_LAND_MELEE_ATTACKER'),
('DB_REQSET_OPPONENT_IS_LAND_RANGED_ATTACKER',		'DB_REQ_OPPONENT_IS_LAND_RANGED_ATTACKER'),
('DB_REQSET_OPPONENT_IS_LAND_BOMBARD_ATTACKER',		'DB_REQ_OPPONENT_IS_LAND_BOMBARD_ATTACKER'),
('DB_REQSET_OPPONENT_IS_NAVAL_MELEE_ATTACKER',		'DB_REQ_OPPONENT_IS_NAVAL_MELEE_ATTACKER'),
('DB_REQSET_OPPONENT_IS_NAVAL_RANGED_ATTACKER',		'DB_REQ_OPPONENT_IS_NAVAL_RANGED_ATTACKER'),
('DB_REQSET_OPPONENT_IS_NAVAL_BOMBARD_ATTACKER',	'DB_REQ_OPPONENT_IS_NAVAL_BOMBARD_ATTACKER')
;


INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,									RequirementId)
VALUES
('DB_REQSET_INSIDE_HOME_TERRITORY',					'DB_REQ_INSIDE_HOME_TERRITORY'),
('DB_REQSET_INSIDE_FOREIGN_TERRITORY',				'DB_REQ_INSIDE_FOREIGN_TERRITORY'),
('DB_REQSET_OUTSIDE_HOME_TERRITORY',				'DB_REQ_OUTSIDE_HOME_TERRITORY'),
('DB_REQSET_OUTSIDE_FOREIGN_TERRITORY',				'DB_REQ_OUTSIDE_FOREIGN_TERRITORY'),

('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY',		'DB_REQ_INSIDE_HOME_TERRITORY'),
('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY',		'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY',	'DB_REQ_INSIDE_FOREIGN_TERRITORY'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY',	'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_OUTSIDE_HOME_TERRITORY',		'DB_REQ_OUTSIDE_HOME_TERRITORY'),
('DB_REQSET_ATTACKING_OUTSIDE_HOME_TERRITORY',		'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_OUTSIDE_FOREIGN_TERRITORY',	'DB_REQ_OUTSIDE_FOREIGN_TERRITORY'),
('DB_REQSET_ATTACKING_OUTSIDE_FOREIGN_TERRITORY',	'DB_REQ_ATTACKING'),

('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY',		'DB_REQ_INSIDE_HOME_TERRITORY'),
('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY',		'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY',	'DB_REQ_INSIDE_FOREIGN_TERRITORY'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY',	'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_OUTSIDE_HOME_TERRITORY',		'DB_REQ_OUTSIDE_HOME_TERRITORY'),
('DB_REQSET_DEFENDING_OUTSIDE_HOME_TERRITORY',		'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_OUTSIDE_FOREIGN_TERRITORY',	'DB_REQ_OUTSIDE_FOREIGN_TERRITORY'),
('DB_REQSET_DEFENDING_OUTSIDE_FOREIGN_TERRITORY',	'DB_REQ_DEFENDING'),

('DB_REQSET_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',					'DB_REQ_INSIDE_HOME_TERRITORY'),
('DB_REQSET_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',					'REQUIRES_OPPONENT_IS_OTHER_RELIGION'),
('DB_REQSET_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',					'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),

('DB_REQSET_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',				'DB_REQ_INSIDE_FOREIGN_TERRITORY'),
('DB_REQSET_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',				'REQUIRES_OPPONENT_IS_OTHER_RELIGION'),
('DB_REQSET_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',				'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),

('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'DB_REQ_INSIDE_HOME_TERRITORY'),
('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'REQUIRES_OPPONENT_IS_OTHER_RELIGION'),
('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),

('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_INSIDE_FOREIGN_TERRITORY'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'REQUIRES_OPPONENT_IS_OTHER_RELIGION'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),

('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'DB_REQ_INSIDE_HOME_TERRITORY'),
('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'REQUIRES_OPPONENT_IS_OTHER_RELIGION'),
('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',		'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),

('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_INSIDE_FOREIGN_TERRITORY'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'REQUIRES_OPPONENT_IS_OTHER_RELIGION'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),

('DB_REQSET_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',			'DB_REQ_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF'),
('DB_REQSET_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',			'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),

('DB_REQSET_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',				'DB_REQ_INSIDE_HOME_TERRITORY_WITH_BELIEF'),
('DB_REQSET_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',				'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),

('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),
('DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_ATTACKING'),

('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_INSIDE_HOME_TERRITORY_WITH_BELIEF'),
('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),
('DB_REQSET_ATTACKING_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_ATTACKING'),

('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),
('DB_REQSET_DEFENDING_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_DEFENDING'),

('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_INSIDE_HOME_TERRITORY_WITH_BELIEF'),
('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),
('DB_REQSET_DEFENDING_INSIDE_HOME_TERRITORY_WITH_BELIEF_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_DEFENDING')
;

-- Unit is Religious (all)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_UNIT_IS_RELIGIOUS_ALL', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_UNIT_IS_RELIGIOUS_ALL', 'REQUIRES_UNIT_IS_RELIGIOUS_ALL') ;

-- Unit is... (DB_REQ_UNIT_IS_GURU, DB_REQSET_UNIT_IS_GURU)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT 'DB_REQ_UNIT_IS_' || SUBSTR(UnitType, 6), 'REQUIREMENT_UNIT_TYPE_MATCHES' FROM Units ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_UNIT_IS_' || SUBSTR(UnitType, 6), 'UnitType', UnitType FROM Units ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_UNIT_IS_' || SUBSTR(UnitType, 6), 'REQUIREMENTSET_TEST_ALL' FROM Units ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_UNIT_IS_' || SUBSTR(UnitType, 6), 'DB_REQ_UNIT_IS_' || SUBSTR(UnitType, 6) FROM Units ;


-- Unit next to... (DB_REQ_NEXTTO_GURU, DB_REQSET_NEXTTO_GURU)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT 'DB_REQ_NEXTTO_' || SUBSTR(UnitType, 6), 'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TYPE_MATCHES' FROM Units ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_NEXTTO_' || SUBSTR(UnitType, 6), 'UnitType', UnitType FROM Units ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_NEXTTO_' || SUBSTR(UnitType, 6), 'IncludeCenter', 1 FROM Units ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_NEXTTO_' || SUBSTR(UnitType, 6), 'REQUIREMENTSET_TEST_ALL' FROM Units ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_NEXTTO_' || SUBSTR(UnitType, 6), 'DB_REQ_NEXTTO_' || SUBSTR(UnitType, 6) FROM Units ;

-- REQs based on Promotion Class
INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType) 
	SELECT 'DB_REQ_IS_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_IS_' || SUBSTR(PromotionClassType, 17), 'UnitPromotionClass', PromotionClassType FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17), 'DB_REQ_IS_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;


-- Anything but a [Promotion Class]
INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType, Inverse) 
	SELECT 'DB_REQ_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES', 1 FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17), 'UnitPromotionClass', PromotionClassType FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17), 'DB_REQ_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;


-- Opponent is Promotion Class
INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType) 
	SELECT 'DB_REQ_OPPONENT_IS_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENT_OPPONENT_UNIT_PROMOTION_CLASS_MATCHES' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_OPPONENT_IS_' || SUBSTR(PromotionClassType, 17), 'UnitPromotionClass', PromotionClassType FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_OPPONENT_IS_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_OPPONENT_IS_' || SUBSTR(PromotionClassType, 17), 'DB_REQ_OPPONENT_IS_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;


-- Attacking promotion classes
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_ATTACKING_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_ATTACKING_' || SUBSTR(PromotionClassType, 17), 'DB_REQ_OPPONENT_IS_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_ATTACKING_' || SUBSTR(PromotionClassType, 17), 'DB_REQ_ATTACKING' FROM UnitPromotionClasses ;


-- Defending promotion classes
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_DEFENDING_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_DEFENDING_' || SUBSTR(PromotionClassType, 17), 'DB_REQ_OPPONENT_IS_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_DEFENDING_' || SUBSTR(PromotionClassType, 17), 'DB_REQ_DEFENDING' FROM UnitPromotionClasses ;



-- Next to friendly units of type...
INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType) 
	SELECT 'DB_REQ_NT_FRIENDLY_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_NT_FRIENDLY_' || SUBSTR(PromotionClassType, 17), 'Tag', 'DB_CLASS_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_NT_FRIENDLY_' || SUBSTR(PromotionClassType, 17), 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_NT_FRIENDLY_' || SUBSTR(PromotionClassType, 17), 'DB_REQ_OPPONENT_IS_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;


	
-- Modifier applies when same tile/adjacent to owner (e.g. promoted unit)
INSERT OR IGNORE INTO Requirements
(RequirementId,									RequirementType,						Inverse) 
VALUES
('DB_REQ_SAME_TILE_AS_OWNER',					'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',	0),
('DB_REQ_ADJACENT_TO_OWNER',					'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',	0),
('DB_REQ_ADJACENT_TO_OR_SAME_TILE_AS_OWNER',	'REQUIREMENT_PLOT_ADJACENT_TO_OWNER',	0)
;

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,									Name,			Value)
VALUES
('DB_REQ_SAME_TILE_AS_OWNER',					'MaxDistance',	0),
('DB_REQ_SAME_TILE_AS_OWNER',					'MinDistance',	0),
('DB_REQ_ADJACENT_TO_OWNER',					'MaxDistance',	1),
('DB_REQ_ADJACENT_TO_OWNER',					'MinDistance',	1),
('DB_REQ_ADJACENT_TO_OR_SAME_TILE_AS_OWNER',	'MaxDistance',	1),
('DB_REQ_ADJACENT_TO_OR_SAME_TILE_AS_OWNER',	'MinDistance',	0)
;

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,								RequirementSetType)
VALUES
('DB_REQSET_SAME_TILE_AS_OWNER',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_TO_OWNER',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_TO_OR_SAME_TILE_AS_OWNER',	'REQUIREMENTSET_TEST_ALL')
;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,								RequirementId)
VALUES
('DB_REQSET_SAME_TILE_AS_OWNER',				'DB_REQ_SAME_TILE_AS_OWNER'),
('DB_REQSET_ADJACENT_TO_OWNER',					'DB_REQ_ADJACENT_TO_OWNER'),
('DB_REQSET_ADJACENT_TO_OR_SAME_TILE_AS_OWNER',	'DB_REQ_ADJACENT_TO_OR_SAME_TILE_AS_OWNER')
;


-- Is a ___ AND same-tile as owner...
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17) || '_AND_SAME_TILE_AS_OWNER', 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17) || '_AND_SAME_TILE_AS_OWNER', 'DB_REQ_IS_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17) || '_AND_SAME_TILE_AS_OWNER', 'DB_REQ_SAME_TILE_AS_OWNER' FROM UnitPromotionClasses ;

-- Is a ___ AND adjacent-to owner...
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OWNER', 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OWNER', 'DB_REQ_IS_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OWNER', 'DB_REQ_ADJACENT_TO_OWNER' FROM UnitPromotionClasses ;

-- Is a ___ AND (same-tile OR adjacent-to) owner...
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OR_SAME_TILE_AS_OWNER', 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OR_SAME_TILE_AS_OWNER', 'DB_REQ_IS_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_IS_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OR_SAME_TILE_AS_OWNER', 'DB_REQ_ADJACENT_TO_OR_SAME_TILE_AS_OWNER' FROM UnitPromotionClasses ;


-- Anything but a ___ AND same-tile as owner...
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) || '_AND_SAME_TILE_AS_OWNER', 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) || '_AND_SAME_TILE_AS_OWNER', 'DB_REQ_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) || '_AND_SAME_TILE_AS_OWNER', 'DB_REQ_SAME_TILE_AS_OWNER' FROM UnitPromotionClasses ;

-- Anything but a ___ AND adjacent-to owner...
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OWNER', 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;

INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OWNER', 'DB_REQ_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OWNER', 'DB_REQ_ADJACENT_TO_OWNER' FROM UnitPromotionClasses ;

-- Anything but a ___ AND (same-tile OR adjacent-to) owner...
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OR_SAME_TILE_AS_OWNER', 'REQUIREMENTSET_TEST_ALL' FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OR_SAME_TILE_AS_OWNER', 'DB_REQ_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) FROM UnitPromotionClasses ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_ANYTHING_BUT_A_' || SUBSTR(PromotionClassType, 17) || '_AND_ADJACENT_TO_OR_SAME_TILE_AS_OWNER', 'DB_REQ_ADJACENT_TO_OR_SAME_TILE_AS_OWNER' FROM UnitPromotionClasses ;


-- Unit next to Great Prophet
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('DB_REQ_NEXTTO_GREAT_PROPHET_2_TILES', 'REQUIREMENT_PLOT_NEARBY_UNIT_TAG_MATCHES') ;
INSERT OR IGNORE INTO RequirementArguments 
(RequirementId,					Name,			Value) 
VALUES 
('DB_REQ_NEXTTO_GREAT_PROPHET_2_TILES',	'MaxDistance',	2),
('DB_REQ_NEXTTO_GREAT_PROPHET_2_TILES',	'MinDistance',	0),
('DB_REQ_NEXTTO_GREAT_PROPHET_2_TILES',	'Tag',			'DB_CLASS_GREAT_PROPHET') ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_NEXTTO_GREAT_PROPHET_2_TILES', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('DB_REQSET_NEXTTO_GREAT_PROPHET_2_TILES', 'DB_REQ_NEXTTO_GREAT_PROPHET_2_TILES') ;

/*
-- Non-religious unit belongs to civ that founded the religion that has this belief
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
                                       ('DB_REQSET_FOUNDERS_COMBAT_UNIT', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
                                                  ('DB_REQSET_FOUNDERS_COMBAT_UNIT', 'REQUIRES_NON_RELIGIOUS_UNIT'),
									              ('DB_REQSET_FOUNDERS_COMBAT_UNIT', 'REQUIRES_PLAYER_FOUNDED_RELIGION') ;


-- Inquisitor unit belongs to civ that founded the religion that has this belief
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_FOUNDERS_INQUISITOR', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
                                       ('DB_REQSET_FOUNDERS_INQUISITOR', 'REQUIRES_UNIT_IS_INQUISITOR'),
									   ('DB_REQSET_FOUNDERS_INQUISITOR', 'REQUIRES_PLAYER_FOUNDED_RELIGION') ;
*/

-- Governor with X titles (DB_REQSET_CITY_HAS_PANTHEON_AND_2_GOV_TITLE_ESTABLISHED)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 6) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_TITLE_GOVERNOR_ESTABLISHED', 'REQUIREMENT_CITY_HAS_GOVERNOR_WITH_X_TITLES' FROM counter ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 6) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_TITLE_GOVERNOR_ESTABLISHED', 'Amount', x FROM counter ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 6) 
  SELECT 'DB_REQ_CITY_HAS_' || x || '_TITLE_GOVERNOR_ESTABLISHED', 'Established', 1 FROM counter ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 6) 
  SELECT 'DB_REQSET_CITY_HAS_PANTHEON_AND_' || x || '_GOV_TITLE_ESTABLISHED', 'REQUIREMENTSET_TEST_ALL' FROM counter ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 6) 
  SELECT 'DB_REQSET_CITY_HAS_PANTHEON_AND_' || x || '_GOV_TITLE_ESTABLISHED', 'DB_REQ_CITY_HAS_' || x || '_TITLE_GOVERNOR_ESTABLISHED' FROM counter ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 6) 
  SELECT 'DB_REQSET_CITY_HAS_PANTHEON_AND_' || x || '_GOV_TITLE_ESTABLISHED', 'REQUIRES_CITY_FOLLOWS_PANTHEON' FROM counter ;

-- Embarked and not-Embarked (does this require XP2?)
INSERT OR IGNORE INTO Requirements
(RequirementId,			RequirementType,					Inverse) 
VALUES
('DB_REQ_EMBARKED',	'REQUIREMENT_UNIT_EMBARKED',	0),
('DB_REQ_NOT_EMBARKED',	'REQUIREMENT_UNIT_EMBARKED',	1)
;

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,		RequirementSetType)
VALUES
('DB_REQSET_EMBARKED',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_NOT_EMBARKED',	'REQUIREMENTSET_TEST_ALL')
;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,		RequirementId)
VALUES
('DB_REQSET_EMBARKED',	'DB_REQ_EMBARKED'),
('DB_REQSET_NOT_EMBARKED',	'DB_REQ_NOT_EMBARKED')
;

-- Unit is in this era (DB_REQ_UNIT_IS_MODERN, DB_REQSET_UNIT_IS_MODERN)
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
	SELECT 'DB_REQ_UNIT_IS_' || SUBSTR(EraType, 5), 'REQUIREMENT_UNIT_ERA_TYPE_MATCHES' FROM Eras ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_UNIT_IS_' || SUBSTR(EraType, 5), 'EraType', EraType FROM Eras ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_UNIT_IS_' || SUBSTR(EraType, 5), 'REQUIREMENTSET_TEST_ALL' FROM Eras ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_UNIT_IS_' || SUBSTR(EraType, 5), 'DB_REQ_UNIT_IS_' || SUBSTR(EraType, 5) FROM Eras ;


-- Unit is in this era or earlier (DB_REQ_UNIT_IS_MODERN_OR_EARLIER, DB_REQSET_UNIT_IS_MODERN_OR_EARLIER)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT 'DB_REQSET_UNIT_IS_' || SUBSTR(EraType, 5) || '_OR_EARLIER', 'REQUIREMENTSET_TEST_ANY' FROM Eras ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_UNIT_IS_' || SUBSTR(a.EraType, 5) || '_OR_EARLIER', 'DB_REQ_UNIT_IS_' || SUBSTR(b.EraType, 5) FROM Eras AS a JOIN Eras AS b WHERE a.ChronologyIndex >= b.ChronologyIndex ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
	SELECT 'DB_REQ_UNIT_IS_' || SUBSTR(EraType, 5) || '_OR_EARLIER', 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM Eras ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_UNIT_IS_' || SUBSTR(EraType, 5) || '_OR_EARLIER', 'RequirementSetId', 'DB_REQSET_UNIT_IS_' || SUBSTR(EraType, 5) || '_OR_EARLIER' FROM Eras ;




-- Combat Type is ranged, melee
INSERT OR IGNORE INTO Requirements
(RequirementId,			RequirementType,					Inverse) 
VALUES
('DB_REQ_MELEE_COMBAT',		'REQUIREMENT_COMBAT_TYPE_MATCHES',	0),
('DB_REQ_RANGED_COMBAT',	'REQUIREMENT_COMBAT_TYPE_MATCHES',	0)
;

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,				Name,				Value)
VALUES
('DB_REQ_MELEE_COMBAT',		'CombatType',		'COMBAT_MELEE'),
('DB_REQ_RANGED_COMBAT',	'CombatType',		'COMBAT_RANGED')
;

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,				RequirementSetType)
VALUES
('DB_REQSET_MELEE_COMBAT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_RANGED_COMBAT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_MELEE',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_MELEE',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_RANGED',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_RANGED',	'REQUIREMENTSET_TEST_ALL')
;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,		RequirementId)
VALUES
('DB_REQSET_MELEE_COMBAT',		'DB_REQ_MELEE_COMBAT'),
('DB_REQSET_ATTACKING_MELEE',	'DB_REQ_MELEE_COMBAT'),
('DB_REQSET_ATTACKING_MELEE',	'DB_REQ_ATTACKING'),
('DB_REQSET_DEFENDING_MELEE',	'DB_REQ_MELEE_COMBAT'),
('DB_REQSET_DEFENDING_MELEE',	'DB_REQ_DEFENDING'),

('DB_REQSET_RANGED_COMBAT',		'DB_REQ_RANGED_COMBAT'),
('DB_REQSET_ATTACKING_RANGED',	'DB_REQ_RANGED_COMBAT'),
('DB_REQSET_ATTACKING_RANGED',	'DB_REQ_ATTACKING'),
('DB_REQSET_DEFENDING_RANGED',	'DB_REQ_RANGED_COMBAT'),
('DB_REQSET_DEFENDING_RANGED',	'DB_REQ_DEFENDING')
;




-- Attacking/defending the different opponent types
INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,								RequirementSetType)
VALUES
('DB_REQSET_ATTACKING_LAND_UNIT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_SEA_UNIT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_AIR_UNIT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_CITY_OR_ENCAMPMENT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_IS_NOT_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_NOT_LAND_UNIT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_NOT_SEA_UNIT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_NOT_AIR_UNIT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_DAMAGED',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_VS_21_DAMAGE',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_WOUNDED',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_FORTIFIED',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_OTHER_RELIGION',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_LAND_COMBAT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_NAVAL_COMBAT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_AIR_COMBAT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_LAND_MELEE_ATTACKER',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_LAND_RANGED_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_LAND_BOMBARD_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_NAVAL_MELEE_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_NAVAL_RANGED_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ATTACKING_NAVAL_BOMBARD_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_MELEE_ATTACKING_LAND',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_MELEE_ATTACKING_NAVAL',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_RANGED_ATTACKING_LAND',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_RANGED_ATTACKING_NAVAL',			'REQUIREMENTSET_TEST_ALL'),

('DB_REQSET_DEFENDING_LAND_UNIT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_SEA_UNIT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_AIR_UNIT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_CITY_OR_ENCAMPMENT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_IS_NOT_CITY_OR_ENCAMPMENT',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_NOT_LAND_UNIT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_NOT_SEA_UNIT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_NOT_AIR_UNIT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_DAMAGED',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_VS_21_DAMAGE',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_WOUNDED',					'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_FORTIFIED',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_OTHER_RELIGION',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_LAND_COMBAT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_NAVAL_COMBAT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_AIR_COMBAT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_LAND_MELEE_ATTACKER',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_LAND_RANGED_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_LAND_BOMBARD_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_NAVAL_MELEE_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_NAVAL_RANGED_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_DEFENDING_NAVAL_BOMBARD_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_MELEE_DEFENDING_LAND',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_MELEE_DEFENDING_NAVAL',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_RANGED_DEFENDING_LAND',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_RANGED_DEFENDING_NAVAL',			'REQUIREMENTSET_TEST_ALL')
;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,								RequirementId)
VALUES
('DB_REQSET_ATTACKING_LAND_UNIT',				'DB_REQ_OPPONENT_IS_LAND_UNIT'),
('DB_REQSET_ATTACKING_SEA_UNIT',				'DB_REQ_OPPONENT_IS_SEA_UNIT'),
('DB_REQSET_ATTACKING_AIR_UNIT',				'DB_REQ_OPPONENT_IS_AIR_UNIT'),
('DB_REQSET_ATTACKING_CITY_OR_ENCAMPMENT',		'DB_REQ_OPPONENT_IS_CITY_OR_ENCAMPMENT'),
('DB_REQSET_ATTACKING_IS_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),
('DB_REQSET_ATTACKING_NOT_LAND_UNIT',			'DB_REQ_OPPONENT_IS_NOT_LAND_UNIT'),
('DB_REQSET_ATTACKING_NOT_SEA_UNIT',			'DB_REQ_OPPONENT_IS_NOT_SEA_UNIT'),
('DB_REQSET_ATTACKING_NOT_AIR_UNIT',			'DB_REQ_OPPONENT_IS_NOT_AIR_UNIT'),
('DB_REQSET_ATTACKING_DAMAGED',					'DB_REQ_OPPONENT_IS_DAMAGED'),
('DB_REQSET_ATTACKING_VS_21_DAMAGE',			'DB_REQ_OPPONENT_HAS_21_DAMAGE'),
('DB_REQSET_ATTACKING_WOUNDED',					'DB_REQ_OPPONENT_IS_WOUNDED'),
('DB_REQSET_ATTACKING_FORTIFIED',				'DB_REQ_OPPONENT_IS_FORTIFIED'),
('DB_REQSET_ATTACKING_OTHER_RELIGION',			'DB_REQ_OPPONENT_IS_OTHER_RELIGION'),
('DB_REQSET_ATTACKING_LAND_COMBAT',				'DB_REQ_OPPONENT_IS_LAND_COMBAT'),
('DB_REQSET_ATTACKING_NAVAL_COMBAT',			'DB_REQ_OPPONENT_IS_NAVAL_COMBAT'),
('DB_REQSET_ATTACKING_AIR_COMBAT',				'DB_REQ_OPPONENT_IS_AIR_COMBAT'),
('DB_REQSET_ATTACKING_LAND_MELEE_ATTACKER',		'DB_REQ_OPPONENT_IS_LAND_MELEE_ATTACKER'),
('DB_REQSET_ATTACKING_LAND_RANGED_ATTACKER',	'DB_REQ_OPPONENT_IS_LAND_RANGED_ATTACKER'),
('DB_REQSET_ATTACKING_LAND_BOMBARD_ATTACKER',	'DB_REQ_OPPONENT_IS_LAND_BOMBARD_ATTACKER'),
('DB_REQSET_ATTACKING_NAVAL_MELEE_ATTACKER',	'DB_REQ_OPPONENT_IS_NAVAL_MELEE_ATTACKER'),
('DB_REQSET_ATTACKING_NAVAL_RANGED_ATTACKER',	'DB_REQ_OPPONENT_IS_NAVAL_RANGED_ATTACKER'),
('DB_REQSET_ATTACKING_NAVAL_BOMBARD_ATTACKER',	'DB_REQ_OPPONENT_IS_NAVAL_BOMBARD_ATTACKER'),
('DB_REQSET_MELEE_ATTACKING_LAND',				'DB_REQ_MELEE_COMBAT'),
('DB_REQSET_MELEE_ATTACKING_NAVAL',				'DB_REQ_MELEE_COMBAT'),
('DB_REQSET_RANGED_ATTACKING_LAND',				'DB_REQ_RANGED_COMBAT'),
('DB_REQSET_RANGED_ATTACKING_NAVAL',			'DB_REQ_RANGED_COMBAT'),


('DB_REQSET_ATTACKING_LAND_UNIT',				'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_SEA_UNIT',				'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_AIR_UNIT',				'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_CITY_OR_ENCAMPMENT',		'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_IS_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_NOT_LAND_UNIT',			'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_NOT_SEA_UNIT',			'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_NOT_AIR_UNIT',			'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_DAMAGED',					'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_VS_21_DAMAGE',			'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_WOUNDED',					'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_FORTIFIED',				'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_OTHER_RELIGION',			'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_LAND_COMBAT',				'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_NAVAL_COMBAT',			'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_AIR_COMBAT',				'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_LAND_MELEE_ATTACKER',		'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_LAND_RANGED_ATTACKER',	'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_LAND_BOMBARD_ATTACKER',	'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_NAVAL_MELEE_ATTACKER',	'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_NAVAL_RANGED_ATTACKER',	'DB_REQ_ATTACKING'),
('DB_REQSET_ATTACKING_NAVAL_BOMBARD_ATTACKER',	'DB_REQ_ATTACKING'),
('DB_REQSET_MELEE_ATTACKING_LAND',				'DB_REQ_ATTACKING'),
('DB_REQSET_MELEE_ATTACKING_NAVAL',				'DB_REQ_ATTACKING'),
('DB_REQSET_RANGED_ATTACKING_LAND',				'DB_REQ_ATTACKING'),
('DB_REQSET_RANGED_ATTACKING_NAVAL',			'DB_REQ_ATTACKING'),


('DB_REQSET_DEFENDING_LAND_UNIT',				'DB_REQ_OPPONENT_IS_LAND_UNIT'),
('DB_REQSET_DEFENDING_SEA_UNIT',				'DB_REQ_OPPONENT_IS_SEA_UNIT'),
('DB_REQSET_DEFENDING_AIR_UNIT',				'DB_REQ_OPPONENT_IS_AIR_UNIT'),
('DB_REQSET_DEFENDING_CITY_OR_ENCAMPMENT',		'DB_REQ_OPPONENT_IS_CITY_OR_ENCAMPMENT'),
('DB_REQSET_DEFENDING_IS_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT'),
('DB_REQSET_DEFENDING_NOT_LAND_UNIT',			'DB_REQ_OPPONENT_IS_NOT_LAND_UNIT'),
('DB_REQSET_DEFENDING_NOT_SEA_UNIT',			'DB_REQ_OPPONENT_IS_NOT_SEA_UNIT'),
('DB_REQSET_DEFENDING_NOT_AIR_UNIT',			'DB_REQ_OPPONENT_IS_NOT_AIR_UNIT'),
('DB_REQSET_DEFENDING_DAMAGED',					'DB_REQ_OPPONENT_IS_DAMAGED'),
('DB_REQSET_DEFENDING_VS_21_DAMAGE',			'DB_REQ_OPPONENT_HAS_21_DAMAGE'),
('DB_REQSET_DEFENDING_WOUNDED',					'DB_REQ_OPPONENT_IS_WOUNDED'),
('DB_REQSET_DEFENDING_FORTIFIED',				'DB_REQ_OPPONENT_IS_FORTIFIED'),
('DB_REQSET_DEFENDING_OTHER_RELIGION',			'DB_REQ_OPPONENT_IS_OTHER_RELIGION'),
('DB_REQSET_DEFENDING_LAND_COMBAT',				'DB_REQ_OPPONENT_IS_LAND_COMBAT'),
('DB_REQSET_DEFENDING_NAVAL_COMBAT',			'DB_REQ_OPPONENT_IS_NAVAL_COMBAT'),
('DB_REQSET_DEFENDING_AIR_COMBAT',				'DB_REQ_OPPONENT_IS_AIR_COMBAT'),
('DB_REQSET_DEFENDING_LAND_MELEE_ATTACKER',		'DB_REQ_OPPONENT_IS_LAND_MELEE_ATTACKER'),
('DB_REQSET_DEFENDING_LAND_RANGED_ATTACKER',	'DB_REQ_OPPONENT_IS_LAND_RANGED_ATTACKER'),
('DB_REQSET_DEFENDING_LAND_BOMBARD_ATTACKER',	'DB_REQ_OPPONENT_IS_LAND_BOMBARD_ATTACKER'),
('DB_REQSET_DEFENDING_NAVAL_MELEE_ATTACKER',	'DB_REQ_OPPONENT_IS_NAVAL_MELEE_ATTACKER'),
('DB_REQSET_DEFENDING_NAVAL_RANGED_ATTACKER',	'DB_REQ_OPPONENT_IS_NAVAL_RANGED_ATTACKER'),
('DB_REQSET_DEFENDING_NAVAL_BOMBARD_ATTACKER',	'DB_REQ_OPPONENT_IS_NAVAL_BOMBARD_ATTACKER'),
('DB_REQSET_MELEE_DEFENDING_LAND',				'DB_REQ_MELEE_COMBAT'),
('DB_REQSET_MELEE_DEFENDING_NAVAL',				'DB_REQ_MELEE_COMBAT'),
('DB_REQSET_RANGED_DEFENDING_LAND',				'DB_REQ_RANGED_COMBAT'),
('DB_REQSET_RANGED_DEFENDING_NAVAL',			'DB_REQ_RANGED_COMBAT'),


('DB_REQSET_DEFENDING_LAND_UNIT',				'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_SEA_UNIT',				'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_AIR_UNIT',				'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_CITY_OR_ENCAMPMENT',		'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_IS_NOT_CITY_OR_ENCAMPMENT',	'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_NOT_LAND_UNIT',			'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_NOT_SEA_UNIT',			'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_NOT_AIR_UNIT',			'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_DAMAGED',					'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_VS_21_DAMAGE',			'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_WOUNDED',					'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_FORTIFIED',				'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_OTHER_RELIGION',			'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_LAND_COMBAT',				'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_NAVAL_COMBAT',			'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_AIR_COMBAT',				'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_LAND_MELEE_ATTACKER',		'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_LAND_RANGED_ATTACKER',	'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_LAND_BOMBARD_ATTACKER',	'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_NAVAL_MELEE_ATTACKER',	'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_NAVAL_RANGED_ATTACKER',	'DB_REQ_DEFENDING'),
('DB_REQSET_DEFENDING_NAVAL_BOMBARD_ATTACKER',	'DB_REQ_DEFENDING'),
('DB_REQSET_MELEE_DEFENDING_LAND',				'DB_REQ_DEFENDING'),
('DB_REQSET_MELEE_DEFENDING_NAVAL',				'DB_REQ_DEFENDING'),
('DB_REQSET_RANGED_DEFENDING_LAND',				'DB_REQ_DEFENDING'),
('DB_REQSET_RANGED_DEFENDING_NAVAL',			'DB_REQ_DEFENDING')
;

-- Unit next to city or encampment (sappers)
INSERT OR REPLACE INTO Requirements 
(RequirementId,										RequirementType) VALUES
('DB_REQ_NEXT_TO_CITY_CENTER',						'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES'),
('DB_REQ_NEXT_TO_ENCAMPMENT',						'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES')
;

INSERT OR REPLACE INTO RequirementArguments 
(RequirementId,										Name,				Value)
VALUES
('DB_REQ_NEXT_TO_CITY_CENTER',						'DistrictType',		'DISTRICT_CITY_CENTER'),
('DB_REQ_NEXT_TO_CITY_CENTER',						'MaxRange',			1),
('DB_REQ_NEXT_TO_CITY_CENTER',						'MinRange',			0),
('DB_REQ_NEXT_TO_ENCAMPMENT',						'DistrictType',		'DISTRICT_ENCAMPMENT'),
('DB_REQ_NEXT_TO_ENCAMPMENT',						'MaxRange',			1),
('DB_REQ_NEXT_TO_ENCAMPMENT',						'MinRange',			0)
;

INSERT OR REPLACE INTO RequirementSets 
(RequirementSetId,							RequirementSetType)
VALUES
('DB_REQSET_NEXT_TO_CITY_OR_ENCAMPMENT',	'REQUIREMENTSET_TEST_ANY')
;

INSERT OR REPLACE INTO RequirementSetRequirements 
(RequirementSetId,							RequirementId)
VALUES
('DB_REQSET_NEXT_TO_CITY_OR_ENCAMPMENT',	'DB_REQ_NEXT_TO_CITY_CENTER'),
('DB_REQSET_NEXT_TO_CITY_OR_ENCAMPMENT',	'DB_REQ_NEXT_TO_ENCAMPMENT')
;

-- Unit in military-type tiles
INSERT OR REPLACE INTO Requirements 
(RequirementId,									RequirementType) VALUES
('DB_REQ_IN_CITY_CENTER',						'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES'),
('DB_REQ_IN_ENCAMPMENT',						'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES')
;

INSERT OR REPLACE INTO RequirementArguments 
(RequirementId,									Name,				Value)
VALUES
('DB_REQ_IN_CITY_CENTER',						'DistrictType',		'DISTRICT_CITY_CENTER'),
('DB_REQ_IN_CITY_CENTER',						'MaxRange',			0),
('DB_REQ_IN_CITY_CENTER',						'MinRange',			0),
('DB_REQ_IN_ENCAMPMENT',						'DistrictType',		'DISTRICT_ENCAMPMENT'),
('DB_REQ_IN_ENCAMPMENT',						'MaxRange',			0),
('DB_REQ_IN_ENCAMPMENT',						'MinRange',			0)
;

INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType)
	SELECT 'DB_REQ_IN_' || SUBSTR(ImprovementType, 13), 'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES' FROM Improvements WHERE ImprovementType IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_ROMAN_FORT', 'IMPROVEMENT_MAORI_PA', 'IMPROVEMENT_ALCAZAR') ;


INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_IN_' || SUBSTR(ImprovementType, 13), 'ImprovementType', ImprovementType FROM Improvements WHERE ImprovementType IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_ROMAN_FORT', 'IMPROVEMENT_MAORI_PA', 'IMPROVEMENT_ALCAZAR') ;

INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_IN_' || SUBSTR(ImprovementType, 13), 'MaxRange', 0 FROM Improvements WHERE ImprovementType IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_ROMAN_FORT', 'IMPROVEMENT_MAORI_PA', 'IMPROVEMENT_ALCAZAR') ;

INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'DB_REQ_IN_' || SUBSTR(ImprovementType, 13), 'MinRange', 0 FROM Improvements WHERE ImprovementType IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_ROMAN_FORT', 'IMPROVEMENT_MAORI_PA', 'IMPROVEMENT_ALCAZAR') ;


INSERT OR REPLACE INTO RequirementSets 
(RequirementSetId,							RequirementSetType)
VALUES
('DB_REQSET_IN_CITY',						'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_IN_CITY_ENCAMPMENT_OR_FORT',	'REQUIREMENTSET_TEST_ANY')
;

INSERT OR REPLACE INTO RequirementSetRequirements 
(RequirementSetId,							RequirementId)
VALUES
('DB_REQSET_IN_CITY',						'DB_REQ_IN_CITY_CENTER'),
('DB_REQSET_IN_CITY_ENCAMPMENT_OR_FORT',	'DB_REQ_IN_CITY_CENTER'),
('DB_REQSET_IN_CITY_ENCAMPMENT_OR_FORT',	'DB_REQ_IN_ENCAMPMENT') ;

INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT 'DB_REQSET_IN_CITY_ENCAMPMENT_OR_FORT', 'DB_REQ_IN_' || SUBSTR(ImprovementType, 13) FROM Improvements WHERE ImprovementType IN ('IMPROVEMENT_FORT', 'IMPROVEMENT_ROMAN_FORT', 'IMPROVEMENT_MAORI_PA', 'IMPROVEMENT_ALCAZAR') ;


-- Adjacent unit is at war (e.g. for putting modifiers on the enemy, like Varu decrementing the enemy CS)
INSERT OR IGNORE INTO Requirements
(RequirementId,					RequirementType,								Inverse) 
VALUES
('DB_REQ_ADJACENT_UNIT_AT_WAR',	'REQUIREMENT_PLOT_ADJACENT_TO_OWNER_AT_WAR',	0)
;

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,					Name,				Value)
VALUES
('DB_REQ_ADJACENT_UNIT_AT_WAR',	'MinDistance',		0),
('DB_REQ_ADJACENT_UNIT_AT_WAR',	'MaxDistance',		1)
;

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,					RequirementSetType)
VALUES
('DB_REQSET_ADJACENT_UNIT_AT_WAR',	'REQUIREMENTSET_TEST_ALL')
;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,					RequirementId)
VALUES
('DB_REQSET_ADJACENT_UNIT_AT_WAR',	'DB_REQ_ADJACENT_UNIT_AT_WAR')
;


-- Modifier applies to me when adjacent friendly unit matches tag (e.g. increasing range with obs balloon)
INSERT OR IGNORE INTO Requirements
(RequirementId,									RequirementType,										Inverse) 
VALUES
('DB_REQ_ADJACENT_UNIT_LAND_COMBAT',			'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0),
('DB_REQ_ADJACENT_UNIT_NAVAL_COMBAT',			'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0),
('DB_REQ_ADJACENT_UNIT_AIR_COMBAT',				'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0),
('DB_REQ_ADJACENT_UNIT_LAND_MELEE_ATTACKER',	'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0),
('DB_REQ_ADJACENT_UNIT_LAND_RANGED_ATTACKER',	'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0),
('DB_REQ_ADJACENT_UNIT_LAND_BOMBARD_ATTACKER',	'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0),
('DB_REQ_ADJACENT_UNIT_NAVAL_MELEE_ATTACKER',	'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0),
('DB_REQ_ADJACENT_UNIT_NAVAL_RANGED_ATTACKER',	'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0),
('DB_REQ_ADJACENT_UNIT_NAVAL_BOMBARD_ATTACKER',	'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',	0)
;

INSERT OR IGNORE INTO RequirementArguments
(RequirementId,									Name,	Value)
VALUES
('DB_REQ_ADJACENT_UNIT_LAND_COMBAT',			'Tag',	'DB_CLASS_LAND_COMBAT'),
('DB_REQ_ADJACENT_UNIT_NAVAL_COMBAT',			'Tag',	'DB_CLASS_NAVAL_COMBAT'),
('DB_REQ_ADJACENT_UNIT_AIR_COMBAT',				'Tag',	'DB_CLASS_AIR_COMBAT'),
('DB_REQ_ADJACENT_UNIT_LAND_MELEE_ATTACKER',	'Tag',	'DB_CLASS_LAND_MELEE_ATTACKER'),
('DB_REQ_ADJACENT_UNIT_LAND_RANGED_ATTACKER',	'Tag',	'DB_CLASS_LAND_RANGED_ATTACKER'),
('DB_REQ_ADJACENT_UNIT_LAND_BOMBARD_ATTACKER',	'Tag',	'DB_CLASS_LAND_BOMBARD_ATTACKER'),
('DB_REQ_ADJACENT_UNIT_NAVAL_MELEE_ATTACKER',	'Tag',	'DB_CLASS_NAVAL_MELEE_ATTACKER'),
('DB_REQ_ADJACENT_UNIT_NAVAL_RANGED_ATTACKER',	'Tag',	'DB_CLASS_NAVAL_RANGED_ATTACKER'),
('DB_REQ_ADJACENT_UNIT_NAVAL_BOMBARD_ATTACKER',	'Tag',	'DB_CLASS_NAVAL_BOMBARD_ATTACKER')
;

INSERT OR IGNORE INTO RequirementSets
(RequirementSetId,									RequirementSetType)
VALUES
('DB_REQSET_ADJACENT_UNIT_LAND_COMBAT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_UNIT_NAVAL_COMBAT',			'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_UNIT_AIR_COMBAT',				'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_UNIT_LAND_MELEE_ATTACKER',		'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_UNIT_LAND_RANGED_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_UNIT_LAND_BOMBARD_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_UNIT_NAVAL_MELEE_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_UNIT_NAVAL_RANGED_ATTACKER',	'REQUIREMENTSET_TEST_ALL'),
('DB_REQSET_ADJACENT_UNIT_NAVAL_BOMBARD_ATTACKER',	'REQUIREMENTSET_TEST_ALL')
;

INSERT OR IGNORE INTO RequirementSetRequirements
(RequirementSetId,									RequirementId)
VALUES
('DB_REQSET_ADJACENT_UNIT_LAND_COMBAT',				'DB_REQ_ADJACENT_UNIT_LAND_COMBAT'),
('DB_REQSET_ADJACENT_UNIT_NAVAL_COMBAT',			'DB_REQ_ADJACENT_UNIT_NAVAL_COMBAT'),
('DB_REQSET_ADJACENT_UNIT_AIR_COMBAT',				'DB_REQ_ADJACENT_UNIT_AIR_COMBAT'),
('DB_REQSET_ADJACENT_UNIT_LAND_MELEE_ATTACKER',		'DB_REQ_ADJACENT_UNIT_LAND_MELEE_ATTACKER'),
('DB_REQSET_ADJACENT_UNIT_LAND_RANGED_ATTACKER',	'DB_REQ_ADJACENT_UNIT_LAND_RANGED_ATTACKER'),
('DB_REQSET_ADJACENT_UNIT_LAND_BOMBARD_ATTACKER',	'DB_REQ_ADJACENT_UNIT_LAND_BOMBARD_ATTACKER'),
('DB_REQSET_ADJACENT_UNIT_NAVAL_MELEE_ATTACKER',	'DB_REQ_ADJACENT_UNIT_NAVAL_MELEE_ATTACKER'),
('DB_REQSET_ADJACENT_UNIT_NAVAL_RANGED_ATTACKER',	'DB_REQ_ADJACENT_UNIT_NAVAL_RANGED_ATTACKER'),
('DB_REQSET_ADJACENT_UNIT_NAVAL_BOMBARD_ATTACKER',	'DB_REQ_ADJACENT_UNIT_NAVAL_BOMBARD_ATTACKER')
;












-----------------------------------------------
-----------------------------------------------
-- Dynamic Modifiers
-----------------------------------------------
-----------------------------------------------
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_DO_NOTHING', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_DO_NOTHING', 'COLLECTION_OWNER', 'EFFECT_DO_NOTHING') ;

-- Yield in cities (that follow this religion)
--    CITIES (Amount, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_YIELD', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_YIELD', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_YIELD_CHANGE') ;

-- Yield in cities (that follow this religion)
--    CITIES (Amount, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_CITIES_ADJUST_YIELD', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_CITIES_ADJUST_YIELD', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_CITY_YIELD_CHANGE') ;

-- Yield in cities (that follow this religion) by x%
--   CITIES (Amount, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_YIELD_PERCENT', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_YIELD_PERCENT', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_YIELD_MODIFIER') ;

-- Follower yield in cities (that follow this religion) by x%
--   CITIES (Amount, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_FOLLOWER_YIELD_PERCENT', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_FOLLOWER_YIELD_PERCENT', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_FOLLOWER_YIELD_MODIFIER') ;

-- Production in city for districts
--    CITIES (Amount) (Amount = number of gears it gets -- most of the other production modifiers use amount as a %, e.g., +50% production toward melee units)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_ADJUST_DISTRICT_PRODUCTION', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_ADJUST_DISTRICT_PRODUCTION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_PRODUCTION_DISTRICT') ;

-- Production in city for buildings
--    CITIES (Amount) (Amount = number of gears it gets -- most of the other production modifiers use amount as a %, e.g., +50% production toward melee units)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_ADJUST_BUILDING_PRODUCTION', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_ADJUST_BUILDING_PRODUCTION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_PRODUCTION_BUILDING') ;

-- Production in city for units
--    CITIES (Amount) (Amount = number of gears it gets -- most of the other production modifiers use amount as a %, e.g., +50% production toward melee units)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_ADJUST_UNIT_PRODUCTION', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_ADJUST_UNIT_PRODUCTION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_PRODUCTION_UNIT') ;

-- Can purchase unit with faith (when a city follows the religion)
--    CITIES (Tag)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_CAN_PURCHASE_UNIT_W_FAITH', 'COLLECTION_ALL_CITIES', 'EFFECT_ENABLE_UNIT_FAITH_PURCHASE') ;

-- Can purchase buildings for district with faith
--    CITIES (DistrictType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_CAN_PURCHASE_DISTRICT_BUILDINGS_W_FAITH', 'COLLECTION_ALL_CITIES', 'EFFECT_ENABLE_BUILDING_FAITH_PURCHASE') ;

-- Can purchase specific buildings with faith
--    CITIES (BuildingType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_CAN_PURCHASE_BUILDING_W_FAITH', 'COLLECTION_ALL_CITIES', 'EFFECT_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE') ;

-- Changing unit purchase costs (when a city follows the religion)
--   CITIES (Amount, UnitType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_UNIT_COST', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_UNIT_COST', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_UNIT_PURCHASE_COST') ;

-- Changing building purchase costs (when a city follows the religion)
--   CITIES (Amount, BuildingType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_BUILDING_COST', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_BUILDING_COST', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_BUILDING_PURCHASE_COST') ;

-- Great Work Yield
--    CITIES (GreatWorkObjectType, ScalingFactor, YieldChange, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_GREATWORK_YIELD', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_GREATWORK_YIELD', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_GREATWORK_YIELD') ;

-- Wonder Yield
--    CITIES (Amount, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_WONDER_YIELD', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_WONDER_YIELD', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_WONDER_YIELD_CHANGE') ;

-- Tourism
--    CITIES (BoostsWonders, GreatWorkObjectType, ImprovementType, Religious, ScalingFactor)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_TOURISM', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_TOURISM', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_TOURISM') ;

-- Amenities from religion
--    CITIES (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_AMENITIES_FROM_RELIGION') ;

-- Housing from Great People
--    CITIES (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_HOUSING_FROM_GREAT_PEOPLE', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_HOUSING_FROM_GREAT_PEOPLE', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_HOUSING_FROM_GREAT_PEOPLE') ;

-- District yield based on appeal
--    CITIES (Description, DistrictType, RequiredAppeal, YieldChange, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_DISTRICTS_YIELD_BASED_ON_APPEAL', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_DISTRICTS_YIELD_BASED_ON_APPEAL', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_DISTRICT_YIELD_BASED_ON_APPEAL') ;

-- Wall combat strength
--   CITIES (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_WALL_STRENGTH', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_WALL_STRENGTH', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_OUTER_DEFENSE') ;

-- City ranged attack strength
--   CITIES (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_ATTACK_STRENGTH', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_ATTACK_STRENGTH', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_RANGED_STRIKE') ;

-- City ranged attack strength
--   CITIES (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_ADJUST_ATTACK_STRENGTH', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_ADJUST_ATTACK_STRENGTH', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_RANGED_STRIKE') ;

-- Unit damage decrement
--	 UNITS (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_REDUCE_DAMAGE_DECREMENT_BY_PERCENT', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_REDUCE_DAMAGE_DECREMENT_BY_PERCENT', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_STRENGTH_REDUCTION_FOR_DAMAGE_MODIFIER') ;

-- All units damage decrement
--	 UNITS (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_REDUCE_DAMAGE_DECREMENT_BY_PERCENT_ALL_UNITS',	'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_REDUCE_DAMAGE_DECREMENT_BY_PERCENT_ALL_UNITS',	'COLLECTION_ALL_UNITS',	'EFFECT_ADJUST_UNIT_STRENGTH_REDUCTION_FOR_DAMAGE_MODIFIER') ;

-- Grant single unit ability
--	 UNITS (AbilityType, ModifierId)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_GRANT_ABILITY', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_GRANT_ABILITY', 'COLLECTION_OWNER', 'EFFECT_GRANT_ABILITY') ;

-- Grant all units ability
--	 UNITS (AbilityType, ModifierId)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_GRANT_ABILITY_ALL_UNITS', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_GRANT_ABILITY_ALL_UNITS', 'COLLECTION_ALL_UNITS', 'EFFECT_GRANT_ABILITY') ;

-- Grant player units ability
--	 UNITS (AbilityType, ModifierId)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_GRANT_ABILITY_PLAYER_UNITS', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_GRANT_ABILITY_PLAYER_UNITS', 'COLLECTION_PLAYER_UNITS', 'EFFECT_GRANT_ABILITY') ;

-- Unit converts city to my religion on capture
--	 UNITS (Enable [bool])
--   Note: I need to have my religion in > half my cities before this takes effect
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_TO_MY_RELIGION_ON_CAPTURE', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_TO_MY_RELIGION_ON_CAPTURE', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_RELIGION_ON_CAPTURE') ;

-- Killing units creates religious pressure
--	 UNITS (LandVictorySpread [bool])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_VICTORY_SPREADS_RELIGION', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_VICTORY_SPREADS_RELIGION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_LAND_VICTORY_SPREAD') ;

-- Combat Experience modifier
--	 UNITS (Amount [percentage; eg 25 = 25%])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ADJUST_COMBAT_EXPERIENCE', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ADJUST_COMBAT_EXPERIENCE', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_EXPERIENCE_MODIFIER') ;


-----------------------------------------------
-- First attach these to the city
-----------------------------------------------

-- DISTRICTS


-- District yields (when a city follows the religion)
--    DISTRICTS (Amount, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ADJUST_DISTRICT_YIELD', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ADJUST_DISTRICT_YIELD', 'COLLECTION_CITY_DISTRICTS', 'EFFECT_ADJUST_DISTRICT_YIELD_CHANGE') ;

-- District great people points (when a city follows the religion)
--    DISTRICTS (Amount, GreatPersonClassType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ADJUST_DISTRICT_GREATPERSON', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ADJUST_DISTRICT_GREATPERSON', 'COLLECTION_CITY_DISTRICTS', 'EFFECT_ADJUST_DISTRICT_GREAT_PERSON_POINTS') ;

-- District amenities (when a city follows the religion)
--    DISTRICTS (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ADJUST_DISTRICT_AMENITIES', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ADJUST_DISTRICT_AMENITIES', 'COLLECTION_CITY_DISTRICTS', 'EFFECT_ADJUST_DISTRICT_AMENITY') ;

-- District housing (when a city follows the religion)
--    DISTRICTS (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ADJUST_DISTRICT_HOUSING', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ADJUST_DISTRICT_HOUSING', 'COLLECTION_CITY_DISTRICTS', 'EFFECT_ADJUST_DISTRICT_HOUSING') ;

-- Attach modifier to city's districts
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_DISTRICTS_ATTACH_MODIFIER', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_DISTRICTS_ATTACH_MODIFIER', 'COLLECTION_CITY_DISTRICTS', 'EFFECT_ATTACH_MODIFIER') ;


-----------------------------------------------
-- Units
-----------------------------------------------

-- Grant ability to units trained in this city (that follows this religion)
--    UNITS (PromotionType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_GRANT_ABILITY_TO_TRAINED_UNITS', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_GRANT_PROMOTION_TO_TRAINED_UNITS', 'COLLECTION_CITY_TRAINED_UNITS', 'EFFECT_GRANT_ABILITY') ;

-- Grant promotion to units trained in this city (that follows this religion)
--    UNITS (PromotionType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_GRANT_PROMOTION_TO_TRAINED_UNITS', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_GRANT_PROMOTION_TO_TRAINED_UNITS', 'COLLECTION_CITY_TRAINED_UNITS', 'EFFECT_GRANT_PROMOTION') ;

-- Adjust damage to unit
--    UNITS (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_DAMAGE_TO_UNIT', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_DAMAGE_TO_UNIT', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_DAMAGE') ;

-- Can bypass walls (this actually gives the unit a siege-tower-ish ability... when it's adjacent to a city ALL your melee units (inc cavalry) bypass walls, not just the unit with the ability)
--    UNITS (Enable (bool))
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CAN_BYPASS_WALLS', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CAN_BYPASS_WALLS', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_BYPASS_WALLS') ;

-- Can wall attack (this actually gives the unit a battering-ram-ish ability... when it's adjacent to a city ALL your melee units (inc cavalry) attack the wall, not just the unit with the ability)
--    UNITS (Enable (bool))
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CAN_WALL_ATTACK', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CAN_WALL_ATTACK', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_ENABLE_WALL_ATTACK') ;

-- Is Hidden (like a Privateer)
--    UNITS (Hidden [bool])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_IS_HIDDEN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_IS_HIDDEN', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_HIDDEN_VISIBILITY') ;

-- Can see hidden units
--    UNITS (SeeHidden [bool])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CAN_SEE_HIDDEN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CAN_SEE_HIDDEN', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_SEE_HIDDEN') ;

-- Damage penalty reduction
--    UNITS (Amount [percentage; 100 = no damage reduction])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_STRENGTH_REDUCTION_FOR_DAMAGE', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_STRENGTH_REDUCTION_FOR_DAMAGE', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_STRENGTH_REDUCTION_FOR_DAMAGE_MODIFIER') ;

-- Post Combat Heal
--    UNITS (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_POST_COMBAT_HEAL', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_POST_COMBAT_HEAL', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_POST_COMBAT_HEAL') ;


-----------------------------------------------
-- Player
-----------------------------------------------

-- Grant unit in capital 
--    CITIES (Amount, UnitType, AllowUniqueOverride [bool - whether or not to override with unique units])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_GRANT_UNIT_IN_CAPITAL', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_GRANT_UNIT_IN_CAPITAL', 'COLLECTION_PLAYER_CAPITAL_CITY', 'EFFECT_GRANT_UNIT_IN_CITY') ;

-- Grant great person in capital (e.g. Saladin's free prophet at the beginning of the Classical era)
--    CITIES (Amount, GreatPersonClassType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_GRANT_GREAT_PERSON_IN_CAPITAL', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_GRANT_GREAT_PERSON_IN_CAPITAL', 'COLLECTION_PLAYER_CAPITAL_CITY', 'EFFECT_GRANT_GREAT_PERSON_CLASS_IN_CITY') ;

-- Grant building in all player's cities (e.g. Print Shop when discovers Printing)
--    CITIES (BuildingType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_GRANT_BUILDING_IN_PLAYER_CITIES_IGNORE', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_GRANT_BUILDING_IN_PLAYER_CITIES_IGNORE', 'COLLECTION_PLAYER_CITIES', 'EFFECT_GRANT_BUILDING_IN_CITY_IGNORE') ;

-- Grant building in all cities (e.g. when it follows a pantheon)
--    CITIES (BuildingType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_GRANT_BUILDING_IN_CITIES_IGNORE', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_GRANT_BUILDING_IN_CITIES_IGNORE', 'COLLECTION_ALL_CITIES', 'EFFECT_GRANT_BUILDING_IN_CITY_IGNORE') ;

--   PLAYERS (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ADJUST_OWNED_BONUS_AMENITY', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ADJUST_OWNED_BONUS_AMENITY', 'COLLECTION_OWNER', 'EFFECT_ADJUST_OWNED_BONUS_RESOURCE_EXTRA_AMENITIES') ;

--   PLAYERS (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ADJUST_OWNED_LUXURY_AMENITY', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ADJUST_OWNED_LUXURY_AMENITY', 'COLLECTION_OWNER', 'EFFECT_ADJUST_OWNED_LUXURY_EXTRA_AMENITIES') ;

-- Grant random science boost
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_GRANT_RANDOM_TECH_BOOST', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_GRANT_RANDOM_TECH_BOOST', 'COLLECTION_OWNER', 'EFFECT_ADJUST_PLAYER_RANDOM_TECHNOLOGY_BOOST_GOODY_HUT') ;

-- Grant random civic boost
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_GRANT_RANDOM_CIVIC_BOOST', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_GRANT_RANDOM_CIVIC_BOOST', 'COLLECTION_OWNER', 'EFFECT_ADJUST_PLAYER_RANDOM_CIVIC_BOOST_GOODY_HUT') ;

-- Grant specific technology
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_GRANT_TECH', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_GRANT_TECH', 'COLLECTION_OWNER_PLAYER', 'EFFECT_GRANT_PLAYER_SPECIFIC_TECHNOLOGY') ;


-----------------------------------------------
-- Plots
-----------------------------------------------

--	PLOTS (ModifierId)
--	Created so that I could make combat modifiers for being near resources (when following certain pantheons)... something that Firaxis never did
--	Actually only applies to matching plots within a city borders (can't find a way to apply to plot in neutral territory)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ALL_PLOTS_ATTACH_MODIFIER', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ALL_PLOTS_ATTACH_MODIFIER', 'COLLECTION_ALL_PLOT_YIELDS', 'EFFECT_ATTACH_MODIFIER') ;


-- Attach modifier to plots within a city
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_PLOTS_ATTACH_MODIFIER', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_PLOTS_ATTACH_MODIFIER', 'COLLECTION_CITY_PLOT_YIELDS', 'EFFECT_ATTACH_MODIFIER') ;


-----------------------------------------------
-- Owners
-----------------------------------------------
-- Attach modifier to owner city
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_OWNER_CITY_ATTACHES_MODIFIER', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_OWNER_CITY_ATTACHES_MODIFIER', 'COLLECTION_OWNER_CITY', 'EFFECT_ATTACH_MODIFIER') ;

-- Attach modifier to owner player
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_OWNER_PLAYER_ATTACHES_MODIFIER', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_OWNER_PLAYER_ATTACHES_MODIFIER', 'COLLECTION_OWNER_PLAYER', 'EFFECT_ATTACH_MODIFIER') ;



-----------------------------------------------
-----------------------------------------------
-- Modifiers
-----------------------------------------------
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers
(ModifierId,													  ModifierType,											                      SubjectRequirementSetId)
VALUES	
('DB_MOD_DO_NOTHING',									  'DB_DM_DO_NOTHING',										                  null),
('DB_MOD_MELEE_ATTACKS_FROM_CITIES',	  'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',					          'DB_REQSET_IN_CITY'),
('DB_MOD_MELEE_ATTACKS_FROM_CITIES2',	  'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',					        'DB_REQSET_ATTACKING_MELEE'),

('DB_MOD_MOVE_AFTER_ATTACK',            'MODIFIER_PLAYER_UNIT_ADJUST_ATTACK_AND_MOVE',			    null),
('DB_MOD_+1_MOVEMENT',								  'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',					        null),
('DB_MOD_+2_MOVEMENT',									'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',					        null),
('DB_MOD_+1_SIGHT',											'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT',					          null),
('DB_MOD_+1_RANGE',											'MODIFIER_UNIT_ADJUST_ATTACK_RANGE',					          null),
('DB_MOD_IRON_NERVES',									'DB_DM_STRENGTH_REDUCTION_FOR_DAMAGE',					        null),	-- National Identity
('DB_MOD_EXTRA_ATTACK',									'MODIFIER_UNIT_ADJUST_NUM_ATTACKS',						          null),
('DB_MOD_SEE_THROUGH_TERRAIN',					'MODIFIER_PLAYER_UNIT_ADJUST_SEE_THROUGH_FEATURES',     null),
('DB_MOD_STEALTH',											'MODIFIER_PLAYER_UNIT_ADJUST_HIDDEN_VISIBILITY',	    	null),
('DB_MOD_REVEAL_STEALTH',								'MODIFIER_PLAYER_UNIT_ADJUST_SEE_HIDDEN',				        null),
('DB_MOD_MOVEMENT_IGNORE_TERRAIN',			'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST',    	null),
('DB_MOD_MOVEMENT_IGNORE_RIVER',				'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_RIVERS',			      null),
('DB_MOD_MOVEMENT_IGNORE_SHORES',				'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_SHORES',			      null),
('DB_MOD_MOVEMENT_IGNORE_CLIFF_WALLS',  'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_CLIFF_WALLS',	    	null),
('DB_MOD_EXERT_ZOC',										'MODIFIER_PLAYER_UNIT_ADJUST_EXERT_ZOC',				        null),
('DB_MOD_IGNORE_ZOC',										'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_ZOC',				        null),
('DB_MOD_ENTER_FOREIGN',								'MODIFIER_PLAYER_UNIT_ADJUST_ENTER_FOREIGN_LANDS',    	null),
('DB_MOD_1_MOVE_TO_PILLAGE',						'MODIFIER_PLAYER_UNIT_ADJUST_ADVANCED_PILLAGING',	    	null),

('DB_MOD_PUSHBACK',											'MODIFIER_UNIT_ADJUST_FORCE_RETREAT',					          null),
('DB_MOD_PRIORITY_TARGET',							'MODIFIER_PLAYER_UNIT_ADJUST_BYPASS_COMBAT_UNIT',		    null),
('DB_MOD_HEAL_AFTER_ACTION',						'MODIFIER_PLAYER_UNIT_GRANT_HEAL_AFTER_ACTION',			    null),

('DB_MOD_DOUBLE_FLANKING',							'MODIFIER_PLAYER_UNIT_ADJUST_FLANKING_BONUS_MODIFIER',	null),
('DB_MOD_DOUBLE_SUPPORT',								'MODIFIER_PLAYER_UNIT_ADJUST_SUPPORT_BONUS_MODIFIER',	  null),
('DB_MOD_HEAL_20_ON_KILL',							'DB_DM_POST_COMBAT_HEAL',								                null),
('DB_MOD_DOESNT_HEAL',									'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN',			      null)
;

INSERT OR REPLACE INTO Modifiers
(ModifierId,						ModifierType,						RunOnce,	Permanent)
VALUES	
('DB_MOD_1_RANDOM_TECH_BOOST',		'DB_DM_GRANT_RANDOM_TECH_BOOST',	1,			1),
('DB_MOD_2_RANDOM_TECH_BOOSTS',		'DB_DM_GRANT_RANDOM_TECH_BOOST',	1,			1),
('DB_MOD_3_RANDOM_TECH_BOOSTS',		'DB_DM_GRANT_RANDOM_TECH_BOOST',	1,			1),
('DB_MOD_4_RANDOM_TECH_BOOSTS',		'DB_DM_GRANT_RANDOM_TECH_BOOST',	1,			1),
('DB_MOD_1_RANDOM_CIVIC_BOOST',		'DB_DM_GRANT_RANDOM_CIVIC_BOOST',	1,			1),
('DB_MOD_2_RANDOM_CIVIC_BOOSTS',	'DB_DM_GRANT_RANDOM_CIVIC_BOOST',	1,			1),
('DB_MOD_3_RANDOM_CIVIC_BOOSTS',	'DB_DM_GRANT_RANDOM_CIVIC_BOOST',	1,			1),
('DB_MOD_4_RANDOM_CIVIC_BOOSTS',	'DB_DM_GRANT_RANDOM_CIVIC_BOOST',	1,			1)
;





INSERT OR REPLACE INTO ModifierArguments
(ModifierId,													Name,					Value) VALUES
('DB_MOD_MELEE_ATTACKS_FROM_CITIES',							'ModifierId',			'DB_MOD_MELEE_ATTACKS_FROM_CITIES2'),
('DB_MOD_MELEE_ATTACKS_FROM_CITIES2',							'Amount',				-20),

('DB_MOD_MOVE_AFTER_ATTACK',									'CanMove',				1),
('DB_MOD_+1_MOVEMENT',											'Amount',				1),
('DB_MOD_+2_MOVEMENT',											'Amount',				2),
('DB_MOD_+1_SIGHT',												'Amount',				1),
('DB_MOD_+1_RANGE',												'Amount',				1),
('DB_MOD_IRON_NERVES',											'Amount',				100),
('DB_MOD_EXTRA_ATTACK',											'Amount',				1),
('DB_MOD_SEE_THROUGH_TERRAIN',									'CanSee',				1),
('DB_MOD_STEALTH',												'Hidden',				1),
('DB_MOD_REVEAL_STEALTH',										'SeeHidden',			1),
('DB_MOD_MOVEMENT_IGNORE_TERRAIN',								'Ignore',				1),	
('DB_MOD_MOVEMENT_IGNORE_TERRAIN',								'Type',					'ALL'),	
('DB_MOD_MOVEMENT_IGNORE_RIVER',								'Ignore',				1),	
('DB_MOD_EXERT_ZOC',											'Exert',				1),
('DB_MOD_IGNORE_ZOC',											'Ignore',				1),

('DB_MOD_PUSHBACK',												'ForceRetreat',			1),
('DB_MOD_ENTER_FOREIGN',										'Enter',				1),
('DB_MOD_1_MOVE_TO_PILLAGE',									'UseAdvancedPillaging',	1),

('DB_MOD_DOUBLE_FLANKING',										'Percent',				100),
('DB_MOD_DOUBLE_SUPPORT',										'Percent',				100),
('DB_MOD_HEAL_20_ON_KILL',										'Amount',				20),
('DB_MOD_DOESNT_HEAL',											'Type',					'ALL'),
('DB_MOD_DOESNT_HEAL',											'Amount',				-100),
('DB_MOD_1_RANDOM_TECH_BOOST',									'Amount',				1),
('DB_MOD_2_RANDOM_TECH_BOOSTS',									'Amount',				2),
('DB_MOD_3_RANDOM_TECH_BOOSTS',									'Amount',				3),
('DB_MOD_4_RANDOM_TECH_BOOSTS',									'Amount',				4),
('DB_MOD_1_RANDOM_CIVIC_BOOST',									'Amount',				1),
('DB_MOD_2_RANDOM_CIVIC_BOOSTS',								'Amount',				2),
('DB_MOD_3_RANDOM_CIVIC_BOOSTS',								'Amount',				3),
('DB_MOD_4_RANDOM_CIVIC_BOOSTS',								'Amount',				4)
;

INSERT OR REPLACE INTO ModifierStrings
(ModifierId,							Context,	Text)
VALUES	
('DB_MOD_MELEE_ATTACKS_FROM_CITIES2',	'Preview',	'LOC_DB_MOD_MELEE_ATTACKS_FROM_CITIES_PREVIEW'),
('DB_MOD_1_RANDOM_CIVIC_BOOST',			'Summary',	'LOC_DB_MOD_1_RANDOM_CIVIC_BOOST'),
('DB_MOD_2_RANDOM_CIVIC_BOOSTS',		'Summary',	'LOC_DB_MOD_2_RANDOM_CIVIC_BOOSTS'),
('DB_MOD_3_RANDOM_CIVIC_BOOSTS',		'Summary',	'LOC_DB_MOD_3_RANDOM_CIVIC_BOOSTS'),
('DB_MOD_4_RANDOM_CIVIC_BOOSTS',		'Summary',	'LOC_DB_MOD_4_RANDOM_CIVIC_BOOSTS'),
('DB_MOD_1_RANDOM_TECH_BOOST',			'Summary',	'LOC_DB_MOD_1_RANDOM_TECH_BOOST'),
('DB_MOD_2_RANDOM_TECH_BOOSTS',			'Summary',	'LOC_DB_MOD_2_RANDOM_TECH_BOOSTS'),
('DB_MOD_3_RANDOM_TECH_BOOSTS',			'Summary',	'LOC_DB_MOD_3_RANDOM_TECH_BOOSTS'),
('DB_MOD_4_RANDOM_TECH_BOOSTS',			'Summary',	'LOC_DB_MOD_4_RANDOM_TECH_BOOSTS')
;

INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType)
SELECT 'DB_MOD_GRANT_' || TechnologyType, 'DB_DM_GRANT_TECH' FROM Technologies ;

INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'DB_MOD_GRANT_' || TechnologyType, 'TechType', TechnologyType FROM Technologies ;

INSERT OR REPLACE INTO ModifierStrings (ModifierId,	Context, Text)
SELECT 'DB_MOD_GRANT_' || TechnologyType, 'Summary', 'Grants {LOC_' || TechnologyType || '_NAME} (although it doesn''t show up until the next turn)' FROM Technologies ;
