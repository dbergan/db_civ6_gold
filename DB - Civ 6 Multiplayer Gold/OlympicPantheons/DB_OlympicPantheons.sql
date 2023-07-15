-- DELETE FROM Types WHERE Type IN('UNITOPERATION_HARVEST_RESOURCE', 'UNITOPERATION_REMOVE_FEATURE') ;

-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--  Pantheon Tables
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
DROP TABLE IF EXISTS OP_Pantheons ;
CREATE TABLE OP_Pantheons (God VARCHAR) ;

INSERT INTO OP_Pantheons (God) VALUES 
('APHRODITE'),
('APOLLO'),
('ARES'),
('ARTEMIS'),
('ATHENA'),
('ATLAS'),
('DEMETER'),
('DIONYSUS'),
('HADES'),
('HELIOS'),
('HEPHAESTUS'),
('HERA'),
('HERMES'),
('PAN'),
('PERSEPHONE'),
('POSEIDON'),
('ZEUS') 
;

DROP TABLE IF EXISTS OP_Wonders ;
CREATE TABLE OP_Wonders (God VARCHAR, Wonder VARCHAR, Faith INT) ;

INSERT INTO OP_Wonders 
(God,			Wonder,				Faith) VALUES 
('APOLLO',		'ORACLE',			5),
('ARTEMIS',		'TEMPLE_ARTEMIS',	5),
('HELIOS',		'COLOSSUS',			5),
('ZEUS',		'STATUE_OF_ZEUS',	5) ;


DROP TABLE IF EXISTS OP_Resources ;
CREATE TABLE OP_Resources (God VARCHAR, Resource VARCHAR) ;

INSERT INTO OP_Resources 
(God,			Resource) VALUES 
('ATHENA',		'OLIVES'),
('ATHENA',		'COTTON'),

('APOLLO',		'SHEEP'),

('DIONYSUS',	'TOBACCO'),
('DIONYSUS',	'WINE'),

('HERA',		'CATTLE'),

('ARTEMIS',		'DEER'),
('ARTEMIS',		'FURS'),
('ARTEMIS',		'IVORY'),

('HADES',		'DIAMONDS'),
('HADES',		'SILVER'),
('HADES',		'JADE'),
('HADES',		'AMBER'),
('HADES',		'PEARLS'),

('ATLAS',		'STONE'),

('DEMETER',		'WHEAT'),

('POSEIDON',	'HORSES'),

('HERMES',		'OIL'),
('HERMES',		'MERCURY'),

('ARES',		'IRON'),
('ARES',		'NITER'),
('ARES',		'URANIUM'),

('HEPHAESTUS',	'COPPER'),
('HEPHAESTUS',	'IRON'),
('HEPHAESTUS',	'COAL'),
('HEPHAESTUS',	'ALUMINUM') ;

-- Remove pantheon resources that aren't in this game
DELETE FROM OP_Resources WHERE Resource NOT IN (SELECT SUBSTR(ResourceType, 10) FROM Resources) ;



DROP TABLE IF EXISTS OP_Resource_Yields ;
CREATE TABLE OP_Resource_Yields (God VARCHAR, Food INT, Production INT, Science INT, Culture INT, Faith INT, Gold INT, GreatGeneralPoints INT, HolySite INT, Combat INT, CombatRange INT) ;

INSERT INTO OP_Resource_Yields 
(God,			Food,	Production,		Science,	Culture,	Faith,	Gold,	GreatGeneralPoints, HolySite,	Combat,	CombatRange) VALUES 
('ATHENA',		0, 		0, 				5, 			0, 			0, 		0, 		0,					5, 			5,		2),			-- 2, 2
('DIONYSUS',	0, 		0, 				0, 			0, 			0, 		0, 		0,					5, 			3,		2),			-- 2, 2
('APOLLO',		0,		0,				0,			4,			0,		0,		0,					5,			4,		2),			-- 4
('HERA',		1, 		1, 				1, 			1, 			1, 		1, 		0,					5, 			4,		2),			-- 6
('ARTEMIS',		2, 		1, 				0, 			0, 			0, 		3, 		0,					5, 			4,		2),			-- 4, 2, 2
('HADES',		0, 		1, 				0, 			0, 			0, 		7, 		0,					5, 			4,		2),			-- 2, 2, 2, 2, 0
('ATLAS',		0,		2, 				0, 			0, 			0, 		0, 		0,					3, 			3,		2),			-- 10
('DEMETER',		3,		0, 				0, 			0, 			0, 		0, 		0,					3, 			3,		2),			-- 10
('POSEIDON',	0, 		2, 				0, 			0, 			0, 		0, 		0,					3, 			5,		2),			-- 11
('HERMES',		0, 		2, 				2, 			2, 			2, 		2, 		0,					5, 			3,		2),			-- 2, 10
('ARES',		0, 		2, 				0, 			0, 			0, 		2, 		1,					5, 			6,		2),			-- 10, 10, 5
('HEPHAESTUS',	0, 		4, 				0, 			0, 			0, 		0, 		0,					5, 			3,		2) ;		-- 4, 10, 10, 7


DROP TABLE IF EXISTS OP_Terrains ;
CREATE TABLE OP_Terrains (God VARCHAR, Terrain VARCHAR, Food INT, Production INT, Science INT, Culture INT, Faith INT, Gold INT, HolySite INT, Combat INT, CombatRange INT) ;

INSERT INTO OP_Terrains 
(God,			Terrain,			Food,	Production,		Science,	Culture,	Faith,	Gold,	HolySite,	Combat,	CombatRange) VALUES 
('HELIOS',		'DESERT',			2,		1,				0,			0,			0,		0,		1,			3,		0),
('HELIOS',		'DESERT_HILLS',		2,		1,				0,			0,			0,		0,		1,			3,		0),
('PERSEPHONE',	'SNOW',				2, 		0, 				0, 			1, 			1, 		0, 		1, 			3,		0),
('PERSEPHONE',	'SNOW_HILLS',		2, 		0, 				0, 			1, 			1, 		0, 		1, 			3,		0),
('PERSEPHONE',	'TUNDRA',			1, 		1, 				0, 			0, 			0, 		0, 		1, 			3,		0),
('PERSEPHONE',	'TUNDRA_HILLS',		1, 		1, 				0, 			0, 			0, 		0, 		1, 			3,		0),
('POSEIDON',	'OCEAN',			0, 		5, 				0, 			0, 			0, 		0, 		1, 			5,		0),
('POSEIDON',	'COAST',			0, 		0, 				0, 			0, 			0, 		0, 		1, 			0,		0),
('ZEUS',		'GRASS_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1),
('ZEUS',		'PLAINS_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1),
('ZEUS',		'DESERT_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1),
('ZEUS',		'TUNDRA_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1),
('ZEUS',		'SNOW_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1) ;


DROP TABLE IF EXISTS OP_Features ;
CREATE TABLE OP_Features (God VARCHAR, Feature VARCHAR, Food INT, Production INT, Science INT, Culture INT, Faith INT, Gold INT, HolySite INT, Combat INT, CombatRange INT) ;

INSERT INTO OP_Features 
(God,			Feature,					Food,	Production,		Science,	Culture,	Faith,	Gold,	HolySite,	Combat,	CombatRange) VALUES 
('HEPHAESTUS',	'VOLCANIC_SOIL',			0, 		4, 				0, 			0, 			0, 		0, 		5, 			3,		0),
('HEPHAESTUS',	'VOLCANO',					0, 		4, 				0, 			0, 			0, 		0, 		5, 			3,		0),
('PAN',			'MARSH',					1, 		0, 				0, 			1, 			0, 		0, 		3, 			4,		0) ;

-- Remove pantheon features that aren't in this game (e.g. Volcanic Soil without Gathering Storm)
DELETE FROM OP_Features WHERE Feature NOT IN (SELECT SUBSTR(FeatureType, 9) FROM Features) ;


DROP TABLE IF EXISTS OP_Appeal ;
CREATE TABLE OP_Appeal (God VARCHAR, AppealMin INT, Food INT, Production INT, Science INT, Culture INT, Faith INT, Gold INT, Combat INT, CombatRange INT) ;

INSERT INTO OP_Appeal 
(God,			AppealMin,	Food,	Production,		Science,	Culture,	Faith,	Gold,	Combat,	CombatRange) VALUES 
('APHRODITE',	4,			0, 		0, 				0, 			1, 			0, 		0, 		3,		0) ;


DELETE FROM OP_Wonders WHERE God NOT IN (SELECT God FROM OP_Pantheons) ;
DELETE FROM OP_Resources WHERE God NOT IN (SELECT God FROM OP_Pantheons) ;
DELETE FROM OP_Resource_Yields WHERE God NOT IN (SELECT God FROM OP_Pantheons) ;
DELETE FROM OP_Terrains WHERE God NOT IN (SELECT God FROM OP_Pantheons) ;
DELETE FROM OP_Features WHERE God NOT IN (SELECT God FROM OP_Pantheons) ;
DELETE FROM OP_Appeal WHERE God NOT IN (SELECT God FROM OP_Pantheons) ;


-- ------------------------------------
-- ------------------------------------
-- Delete/insert all the pantheon beliefs
-- ------------------------------------
-- ------------------------------------
DELETE FROM Types WHERE Type IN (
    SELECT Type FROM Types INNER JOIN Beliefs ON Beliefs.BeliefType = Types.Type AND Beliefs.BeliefClassType = 'BELIEF_CLASS_PANTHEON'
) ;
DELETE FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_PANTHEON' ;

-- The order they're inserted determines the order they are listed in the Choose Pantheon screen
INSERT OR IGNORE INTO Types (Type, Kind)
	SELECT 'OP_' || God, 'KIND_BELIEF' FROM OP_Pantheons ORDER BY God ;

INSERT OR IGNORE INTO Beliefs (BeliefType, Name, Description, BeliefClassType)
	SELECT 'OP_' || God, 'LOC_OP_' || God, 'LOC_OP_' || God || '_DESC', 'BELIEF_CLASS_PANTHEON' FROM OP_Pantheons ORDER BY God ;


-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--  Wonders
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_CITY_ATTACHES_' || Wonder || '_MODIFIER' FROM OP_Wonders WHERE Faith > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_CITY_ATTACHES_' || Wonder || '_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Wonders WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_CITY_ATTACHES_' || Wonder || '_MODIFIER', 'ModifierId', 'OP_' || God || '_FAITH_ON_' || Wonder FROM OP_Wonders WHERE Faith > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Wonder, 'MODIFIER_BUILDING_YIELD_CHANGE' FROM OP_Wonders WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Wonder, 'BuildingType', 'BUILDING_' || Wonder FROM OP_Wonders WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Wonder, 'YieldType', 'YIELD_FAITH' FROM OP_Wonders WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Wonder, 'Amount', Faith FROM OP_Wonders WHERE Faith > 0 ;



-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--  Resources
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- Create resource tags for each pantheon
INSERT OR IGNORE INTO Tags (Tag, Vocabulary)
	SELECT DISTINCT 'OP_CLASS_' || God || '_RESOURCES', 'RESOURCE_CLASS' FROM OP_Resources ;

INSERT OR IGNORE INTO TypeTags (Type, Tag)
	SELECT ResourceType, 'OP_CLASS_' || God || '_RESOURCES' FROM OP_Resources INNER JOIN Resources ON 'RESOURCE_' || OP_Resources.Resource = Resources.ResourceType ;

-- Plot test RequirementSet
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT DISTINCT 'OP_REQ_PLOT_HAS_' || God || '_RESOURCE', 'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
	SELECT DISTINCT 'OP_REQ_PLOT_HAS_' || God || '_RESOURCE', 'Tag', 'OP_CLASS_' || God || '_RESOURCES' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_RESOURCE', 'REQUIREMENTSET_TEST_ALL' FROM OP_Resources ;
	
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_RESOURCE', 'OP_REQ_PLOT_HAS_' || God || '_RESOURCE' FROM OP_Resources ;
	

-- Plot test RequirementSet with visibility
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE', 'REQUIREMENTSET_TEST_ALL' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE', 'OP_REQ_PLOT_HAS_' || God || '_RESOURCE' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE', 'REQUIRES_PLOT_HAS_VISIBLE_RESOURCE' FROM OP_Resources ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT DISTINCT 'OP_REQ_PLOT_HAS_VISIBLE_' || God || '_RESOURCE', 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT DISTINCT 'OP_REQ_PLOT_HAS_VISIBLE_' || God || '_RESOURCE', 'RequirementSetId', 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE' FROM OP_Resources ;


-- Plot test RequirementSet with improved resource
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_IMPROVED_' || God || '_RESOURCE', 'REQUIREMENTSET_TEST_ALL' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_IMPROVED_' || God || '_RESOURCE', 'DB_REQ_HAS_STANDARD_RESOURCE_IMPROVEMENT_OR_INDUSTRY_OR_CORPORATION' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_IMPROVED_' || God || '_RESOURCE', 'OP_REQ_PLOT_HAS_' || God || '_RESOURCE' FROM OP_Resources ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
	SELECT DISTINCT 'OP_REQ_PLOT_HAS_IMPROVED_' || God || '_RESOURCE', 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) 
	SELECT DISTINCT 'OP_REQ_PLOT_HAS_IMPROVED_' || God || '_RESOURCE', 'RequirementSetId', 'OP_REQSET_PLOT_HAS_IMPROVED_' || God || '_RESOURCE' FROM OP_Resources ;

-- City has improved resource RequirementSet
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT 'OP_REQ_CITY_HAS_' || Resource, 'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'OP_REQ_CITY_HAS_' || Resource, 'ResourceType', 'RESOURCE_' || Resource FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
	SELECT DISTINCT 'OP_REQSET_CITY_HAS_IMPROVED_' || God || '_RESOURCE', 'REQUIREMENTSET_TEST_ANY' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
	SELECT 'OP_REQSET_CITY_HAS_IMPROVED_' || God || '_RESOURCE', 'OP_REQ_CITY_HAS_' || Resource FROM OP_Resources ;

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT 'OP_REQ_CITY_HAS_IMPROVED_' || God || '_RESOURCE', 'REQUIREMENT_REQUIREMENTSET_IS_MET' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT 'OP_REQ_CITY_HAS_IMPROVED_' || God || '_RESOURCE', 'RequirementSetId', 'OP_REQSET_CITY_HAS_IMPROVED_' || God || '_RESOURCE' FROM OP_Resources ;


INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) 
	SELECT DISTINCT 'OP_REQSET_CITY_FOLLOWS_' || God || '_AND_HAS_IMPROVED_' || God || '_RESOURCE', 'REQUIREMENTSET_TEST_ALL' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
	SELECT DISTINCT 'OP_REQSET_CITY_FOLLOWS_' || God || '_AND_HAS_IMPROVED_' || God || '_RESOURCE', 'OP_REQ_CITY_HAS_IMPROVED_' || God || '_RESOURCE' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) 
	SELECT DISTINCT 'OP_REQSET_CITY_FOLLOWS_' || God || '_AND_HAS_IMPROVED_' || God || '_RESOURCE', 'REQUIRES_CITY_FOLLOWS_PANTHEON' FROM OP_Resources ;

-- Adjacency RequirementSet
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE_NEXT_TO_HOLY_SITE', 'REQUIREMENTSET_TEST_ALL' FROM OP_Resources ;
	
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE_NEXT_TO_HOLY_SITE', 'OP_REQ_PLOT_HAS_VISIBLE_' || God || '_RESOURCE' FROM OP_Resources ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE_NEXT_TO_HOLY_SITE', 'DB_REQ_NEXT_TO_HOLY_SITE' FROM OP_Resources ;


-- Food modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_FOOD_MODIFIER' FROM OP_Resource_Yields WHERE Food > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CITY_ADDS_FOOD_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Resource_Yields WHERE Food > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CITY_ADDS_FOOD_MODIFIER', 'ModifierId', 'OP_' || God || '_FOOD_ON_RESOURCES' FROM OP_Resource_Yields WHERE Food > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_FOOD_ON_RESOURCES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE' FROM OP_Resource_Yields WHERE Food > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FOOD_ON_RESOURCES', 'YieldType', 'YIELD_FOOD' FROM OP_Resource_Yields WHERE Food > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FOOD_ON_RESOURCES', 'Amount', Food FROM OP_Resource_Yields WHERE Food > 0 ; 


-- Production modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_PRODUCTION_MODIFIER' FROM OP_Resource_Yields WHERE Production > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CITY_ADDS_PRODUCTION_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Resource_Yields WHERE Production > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CITY_ADDS_PRODUCTION_MODIFIER', 'ModifierId', 'OP_' || God || '_PRODUCTION_ON_RESOURCES' FROM OP_Resource_Yields WHERE Production > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_PRODUCTION_ON_RESOURCES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE' FROM OP_Resource_Yields WHERE Production > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PRODUCTION_ON_RESOURCES', 'YieldType', 'YIELD_PRODUCTION' FROM OP_Resource_Yields WHERE Production > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PRODUCTION_ON_RESOURCES', 'Amount', Production FROM OP_Resource_Yields WHERE Production > 0 ; 


-- Science modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_SCIENCE_MODIFIER' FROM OP_Resource_Yields WHERE Science > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CITY_ADDS_SCIENCE_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Resource_Yields WHERE Science > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CITY_ADDS_SCIENCE_MODIFIER', 'ModifierId', 'OP_' || God || '_SCIENCE_ON_RESOURCES' FROM OP_Resource_Yields WHERE Science > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_SCIENCE_ON_RESOURCES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE' FROM OP_Resource_Yields WHERE Science > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_SCIENCE_ON_RESOURCES', 'YieldType', 'YIELD_SCIENCE' FROM OP_Resource_Yields WHERE Science > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_SCIENCE_ON_RESOURCES', 'Amount', Science FROM OP_Resource_Yields WHERE Science > 0 ; 


-- Culture modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_CULTURE_MODIFIER' FROM OP_Resource_Yields WHERE Culture > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CITY_ADDS_CULTURE_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Resource_Yields WHERE Culture > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CITY_ADDS_CULTURE_MODIFIER', 'ModifierId', 'OP_' || God || '_CULTURE_ON_RESOURCES' FROM OP_Resource_Yields WHERE Culture > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CULTURE_ON_RESOURCES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE' FROM OP_Resource_Yields WHERE Culture > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CULTURE_ON_RESOURCES', 'YieldType', 'YIELD_CULTURE' FROM OP_Resource_Yields WHERE Culture > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CULTURE_ON_RESOURCES', 'Amount', Culture FROM OP_Resource_Yields WHERE Culture > 0 ; 



-- Faith modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_FAITH_MODIFIER' FROM OP_Resource_Yields WHERE Faith > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CITY_ADDS_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Resource_Yields WHERE Faith > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CITY_ADDS_FAITH_MODIFIER', 'ModifierId', 'OP_' || God || '_FAITH_ON_RESOURCES' FROM OP_Resource_Yields WHERE Faith > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_FAITH_ON_RESOURCES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE' FROM OP_Resource_Yields WHERE Faith > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FAITH_ON_RESOURCES', 'YieldType', 'YIELD_FAITH' FROM OP_Resource_Yields WHERE Faith > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FAITH_ON_RESOURCES', 'Amount', Faith FROM OP_Resource_Yields WHERE Faith > 0 ; 



-- Gold modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_GOLD_MODIFIER' FROM OP_Resource_Yields WHERE Gold > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CITY_ADDS_GOLD_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Resource_Yields WHERE Gold > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CITY_ADDS_GOLD_MODIFIER', 'ModifierId', 'OP_' || God || '_GOLD_ON_RESOURCES' FROM OP_Resource_Yields WHERE Gold > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_GOLD_ON_RESOURCES', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE' FROM OP_Resource_Yields WHERE Gold > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_GOLD_ON_RESOURCES', 'YieldType', 'YIELD_GOLD' FROM OP_Resource_Yields WHERE Gold > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_GOLD_ON_RESOURCES', 'Amount', Gold FROM OP_Resource_Yields WHERE Gold > 0 ; 



-- Great General modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_GENERALPOINTS_MODIFIER' FROM OP_Resource_Yields WHERE GreatGeneralPoints > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CITY_ADDS_GENERALPOINTS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'OP_REQSET_CITY_FOLLOWS_' || God || '_AND_HAS_IMPROVED_' || God || '_RESOURCE' FROM OP_Resource_Yields WHERE GreatGeneralPoints > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CITY_ADDS_GENERALPOINTS_MODIFIER', 'ModifierId', 'OP_' || God || '_PLAYER_ADDS_GENERALPOINTS_MODIFIER' FROM OP_Resource_Yields WHERE GreatGeneralPoints > 0 ; 


INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType)
	SELECT 'OP_' || God || '_PLAYER_ADDS_GENERALPOINTS_MODIFIER', 'DB_DM_OWNER_PLAYER_ATTACHES_MODIFIER' FROM OP_Resource_Yields WHERE GreatGeneralPoints > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PLAYER_ADDS_GENERALPOINTS_MODIFIER', 'ModifierId', 'OP_' || God || '_PLAYER_ADDS_GENERALPOINTS' FROM OP_Resource_Yields WHERE GreatGeneralPoints > 0 ; 


INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType)
	SELECT 'OP_' || God || '_PLAYER_ADDS_GENERALPOINTS', 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS' FROM OP_Resource_Yields WHERE GreatGeneralPoints > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PLAYER_ADDS_GENERALPOINTS', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_GENERAL' FROM OP_Resource_Yields WHERE GreatGeneralPoints > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PLAYER_ADDS_GENERALPOINTS', 'Amount', GreatGeneralPoints FROM OP_Resource_Yields WHERE GreatGeneralPoints > 0 ;


-- Reverse Holy Site Adjacency // Faith on resources adjacent to Holy Site
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_REVERSE_ADJACENCY_FAITH_MODIFIER' FROM OP_Resource_Yields WHERE HolySite > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CITY_ADDS_REVERSE_ADJACENCY_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Resource_Yields WHERE HolySite > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CITY_ADDS_REVERSE_ADJACENCY_FAITH_MODIFIER', 'ModifierId', 'OP_' || God || '_FAITH_ON_VISIBLE_RESOURCES_NEXT_TO_HOLY_SITE' FROM OP_Resource_Yields WHERE HolySite > 0 ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_FAITH_ON_VISIBLE_RESOURCES_NEXT_TO_HOLY_SITE', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_VISIBLE_' || God || '_RESOURCE_NEXT_TO_HOLY_SITE' FROM OP_Resource_Yields WHERE HolySite > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FAITH_ON_VISIBLE_RESOURCES_NEXT_TO_HOLY_SITE', 'YieldType', 'YIELD_FAITH' FROM OP_Resource_Yields WHERE HolySite > 0 ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FAITH_ON_VISIBLE_RESOURCES_NEXT_TO_HOLY_SITE', 'Amount', HolySite FROM OP_Resource_Yields WHERE HolySite > 0 ; 


-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--  Terrains
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------

-- Food modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_FOOD_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER' FROM OP_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_FOOD_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FOOD_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_FOOD_ON_' || Terrain FROM OP_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_FOOD_ON_' || Terrain, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_IS_' || Terrain  || '_AND_NOT_CITY_CENTER' FROM OP_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FOOD_ON_' || Terrain, 'YieldType', 'YIELD_FOOD' FROM OP_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FOOD_ON_' || Terrain, 'Amount', Food FROM OP_Terrains WHERE Food > 0 ;


-- Production modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_PRODUCTION_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER' FROM OP_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_PRODUCTION_ON_' || Terrain FROM OP_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Terrain, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_IS_' || Terrain  || '_AND_NOT_CITY_CENTER' FROM OP_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Terrain, 'YieldType', 'YIELD_PRODUCTION' FROM OP_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Terrain, 'Amount', Production FROM OP_Terrains WHERE Production > 0 ;


-- Science modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_SCIENCE_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER' FROM OP_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_SCIENCE_ON_' || Terrain FROM OP_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Terrain, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_IS_' || Terrain FROM OP_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Terrain, 'YieldType', 'YIELD_SCIENCE' FROM OP_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Terrain, 'Amount', Science FROM OP_Terrains WHERE Science > 0 ;


-- Culture modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_CULTURE_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER' FROM OP_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CULTURE_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_CULTURE_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_CULTURE_ON_' || Terrain FROM OP_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_CULTURE_ON_' || Terrain, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_IS_' || Terrain FROM OP_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_CULTURE_ON_' || Terrain, 'YieldType', 'YIELD_CULTURE' FROM OP_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_CULTURE_ON_' || Terrain, 'Amount', Culture FROM OP_Terrains WHERE Culture > 0 ;


-- Faith modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_FAITH_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER' FROM OP_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_FAITH_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_FAITH_ON_' || Terrain FROM OP_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Terrain, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_IS_' || Terrain FROM OP_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Terrain, 'YieldType', 'YIELD_FAITH' FROM OP_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Terrain, 'Amount', Faith FROM OP_Terrains WHERE Faith > 0 ;


-- Gold modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_GOLD_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER' FROM OP_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_GOLD_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_GOLD_ON_' || Terrain || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_GOLD_ON_' || Terrain FROM OP_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_GOLD_ON_' || Terrain, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_IS_' || Terrain FROM OP_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_GOLD_ON_' || Terrain, 'YieldType', 'YIELD_GOLD' FROM OP_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_GOLD_ON_' || Terrain, 'Amount', Gold FROM OP_Terrains WHERE Gold > 0 ;


-- Holy Site Adjacency
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_' || Terrain || '_HOLY_SITE_ADJACENCY' FROM OP_Terrains WHERE HolySite > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_' || Terrain || '_HOLY_SITE_ADJACENCY', 'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Terrains WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Terrain || '_HOLY_SITE_ADJACENCY', 'DistrictType', 'DISTRICT_HOLY_SITE' FROM OP_Terrains WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Terrain || '_HOLY_SITE_ADJACENCY', 'Description', 'LOC_OP_' || God || '_DISTRICT_FAITH' FROM OP_Terrains WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Terrain || '_HOLY_SITE_ADJACENCY', 'TerrainType', 'TERRAIN_' || Terrain FROM OP_Terrains WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Terrain || '_HOLY_SITE_ADJACENCY', 'YieldType', 'YIELD_FAITH' FROM OP_Terrains WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Terrain || '_HOLY_SITE_ADJACENCY', 'Amount', HolySite FROM OP_Terrains WHERE HolySite > 0 ;


-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--  Features
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------

-- Food modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_FOOD_ON_' || Feature || '_CITIES_ATTACH_MODIFIER' FROM OP_Features WHERE Food > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_FOOD_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Features WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FOOD_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_FOOD_ON_' || Feature FROM OP_Features WHERE Food > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_FOOD_ON_' || Feature, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_' || Feature FROM OP_Features WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FOOD_ON_' || Feature, 'YieldType', 'YIELD_FOOD' FROM OP_Features WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FOOD_ON_' || Feature, 'Amount', Food FROM OP_Features WHERE Food > 0 ;


-- Production modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_PRODUCTION_ON_' || Feature || '_CITIES_ATTACH_MODIFIER' FROM OP_Features WHERE Production > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Features WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_PRODUCTION_ON_' || Feature FROM OP_Features WHERE Production > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Feature, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_' || Feature FROM OP_Features WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Feature, 'YieldType', 'YIELD_PRODUCTION' FROM OP_Features WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_PRODUCTION_ON_' || Feature, 'Amount', Production FROM OP_Features WHERE Production > 0 ;


-- Science modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_SCIENCE_ON_' || Feature || '_CITIES_ATTACH_MODIFIER' FROM OP_Features WHERE Science > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Features WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_SCIENCE_ON_' || Feature FROM OP_Features WHERE Science > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Feature, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_' || Feature FROM OP_Features WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Feature, 'YieldType', 'YIELD_SCIENCE' FROM OP_Features WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_SCIENCE_ON_' || Feature, 'Amount', Science FROM OP_Features WHERE Science > 0 ;


-- Culture modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_CULTURE_ON_' || Feature || '_CITIES_ATTACH_MODIFIER' FROM OP_Features WHERE Culture > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_CULTURE_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Features WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_CULTURE_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_CULTURE_ON_' || Feature FROM OP_Features WHERE Culture > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_CULTURE_ON_' || Feature, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_' || Feature FROM OP_Features WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_CULTURE_ON_' || Feature, 'YieldType', 'YIELD_CULTURE' FROM OP_Features WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_CULTURE_ON_' || Feature, 'Amount', Culture FROM OP_Features WHERE Culture > 0 ;


-- Faith modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_FAITH_ON_' || Feature || '_CITIES_ATTACH_MODIFIER' FROM OP_Features WHERE Faith > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_FAITH_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Features WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_FAITH_ON_' || Feature FROM OP_Features WHERE Faith > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Feature, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_' || Feature FROM OP_Features WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Feature, 'YieldType', 'YIELD_FAITH' FROM OP_Features WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_FAITH_ON_' || Feature, 'Amount', Faith FROM OP_Features WHERE Faith > 0 ;


-- Gold modifiers
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_GOLD_ON_' || Feature || '_CITIES_ATTACH_MODIFIER' FROM OP_Features WHERE Gold > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_GOLD_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Features WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_GOLD_ON_' || Feature || '_CITIES_ATTACH_MODIFIER', 'ModifierId', 'OP_' || God || '_GOLD_ON_' || Feature FROM OP_Features WHERE Gold > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_GOLD_ON_' || Feature, 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'DB_REQSET_HAS_' || Feature FROM OP_Features WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_GOLD_ON_' || Feature, 'YieldType', 'YIELD_GOLD' FROM OP_Features WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_GOLD_ON_' || Feature, 'Amount', Gold FROM OP_Features WHERE Gold > 0 ;


-- Holy Site Adjacency
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_' || Feature || '_HOLY_SITE_ADJACENCY' FROM OP_Features WHERE HolySite > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_' || Feature || '_HOLY_SITE_ADJACENCY', 'MODIFIER_ALL_CITIES_FEATURE_ADJACENCY', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Features WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Feature || '_HOLY_SITE_ADJACENCY', 'DistrictType', 'DISTRICT_HOLY_SITE' FROM OP_Features WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Feature || '_HOLY_SITE_ADJACENCY', 'Description', 'LOC_OP_' || God || '_DISTRICT_FAITH' FROM OP_Features WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Feature || '_HOLY_SITE_ADJACENCY', 'FeatureType', 'FEATURE_' || Feature FROM OP_Features WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Feature || '_HOLY_SITE_ADJACENCY', 'YieldType', 'YIELD_FAITH' FROM OP_Features WHERE HolySite > 0 ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) 
	SELECT 'OP_' || God || '_' || Feature || '_HOLY_SITE_ADJACENCY', 'Amount', HolySite FROM OP_Features WHERE HolySite > 0 ;


-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--  Appeal
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------

-- Appeal based yields
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) 
	SELECT DISTINCT 'OP_REQ_PLOT_HAS_' || God || '_APPEAL', 'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN' FROM OP_Appeal ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT DISTINCT 'OP_REQ_PLOT_HAS_' || God || '_APPEAL', 'MinimumAppeal', AppealMin FROM OP_Appeal ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_APPEAL', 'REQUIREMENTSET_TEST_ALL' FROM OP_Appeal ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_APPEAL', 'OP_REQ_PLOT_HAS_' || God || '_APPEAL' FROM OP_Appeal ;

-- FOOD
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT DISTINCT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_FOOD_MODIFIER' FROM OP_Appeal WHERE Food > 0 ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_FOOD_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Appeal WHERE Food > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_FOOD_MODIFIER', 'ModifierId', 'OP_' || God || '_FOOD_ON_APPEAL' FROM OP_Appeal WHERE Food > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_FOOD_ON_APPEAL', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_' || God || '_APPEAL' FROM OP_Appeal WHERE Food > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_FOOD_ON_APPEAL', 'YieldType', 'YIELD_FOOD' FROM OP_Appeal WHERE Food > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_FOOD_ON_APPEAL', 'Amount', Food FROM OP_Appeal WHERE Food > 0 ;

-- PRODUCTION
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT DISTINCT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_PRODUCTION_MODIFIER' FROM OP_Appeal WHERE Production > 0 ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_PRODUCTION_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Appeal WHERE Production > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_PRODUCTION_MODIFIER', 'ModifierId', 'OP_' || God || '_PRODUCTION_ON_APPEAL' FROM OP_Appeal WHERE Production > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_PRODUCTION_ON_APPEAL', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_' || God || '_APPEAL' FROM OP_Appeal WHERE Production > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_PRODUCTION_ON_APPEAL', 'YieldType', 'YIELD_PRODUCTION' FROM OP_Appeal WHERE Production > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_PRODUCTION_ON_APPEAL', 'Amount', Production FROM OP_Appeal WHERE Production > 0 ;


-- SCIENCE
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT DISTINCT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_SCIENCE_MODIFIER' FROM OP_Appeal WHERE Science > 0 ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_SCIENCE_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Appeal WHERE Science > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_SCIENCE_MODIFIER', 'ModifierId', 'OP_' || God || '_SCIENCE_ON_APPEAL' FROM OP_Appeal WHERE Science > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_SCIENCE_ON_APPEAL', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_' || God || '_APPEAL' FROM OP_Appeal WHERE Science > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_SCIENCE_ON_APPEAL', 'YieldType', 'YIELD_SCIENCE' FROM OP_Appeal WHERE Science > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_SCIENCE_ON_APPEAL', 'Amount', Science FROM OP_Appeal WHERE Science > 0 ;


-- CULTURE
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT DISTINCT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_CULTURE_MODIFIER' FROM OP_Appeal WHERE Culture > 0 ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_CULTURE_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Appeal WHERE Culture > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_CULTURE_MODIFIER', 'ModifierId', 'OP_' || God || '_CULTURE_ON_APPEAL' FROM OP_Appeal WHERE Culture > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_CULTURE_ON_APPEAL', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_' || God || '_APPEAL' FROM OP_Appeal WHERE Culture > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_CULTURE_ON_APPEAL', 'YieldType', 'YIELD_CULTURE' FROM OP_Appeal WHERE Culture > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_CULTURE_ON_APPEAL', 'Amount', Culture FROM OP_Appeal WHERE Culture > 0 ;


-- FAITH
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT DISTINCT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_FAITH_MODIFIER' FROM OP_Appeal WHERE Faith > 0 ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Appeal WHERE Faith > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_FAITH_MODIFIER', 'ModifierId', 'OP_' || God || '_FAITH_ON_APPEAL' FROM OP_Appeal WHERE Faith > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_FAITH_ON_APPEAL', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_' || God || '_APPEAL' FROM OP_Appeal WHERE Faith > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_FAITH_ON_APPEAL', 'YieldType', 'YIELD_FAITH' FROM OP_Appeal WHERE Faith > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_FAITH_ON_APPEAL', 'Amount', Faith FROM OP_Appeal WHERE Faith > 0 ;


-- GOLD
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT DISTINCT 'OP_' || God, 'OP_' || God || '_CITY_ADDS_GOLD_MODIFIER' FROM OP_Appeal WHERE Gold > 0 ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_GOLD_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Appeal WHERE Gold > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_CITY_ADDS_GOLD_MODIFIER', 'ModifierId', 'OP_' || God || '_GOLD_ON_APPEAL' FROM OP_Appeal WHERE Gold > 0 ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_GOLD_ON_APPEAL', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'OP_REQSET_PLOT_HAS_' || God || '_APPEAL' FROM OP_Appeal WHERE Gold > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_GOLD_ON_APPEAL', 'YieldType', 'YIELD_GOLD' FROM OP_Appeal WHERE Gold > 0 ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_GOLD_ON_APPEAL', 'Amount', Gold FROM OP_Appeal WHERE Gold > 0 ;


-- Districts
-- FOOD
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_FOOD_ON_APPEAL_' || SUBSTR(DistrictType, 10) FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Food > 0 ;
INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_FOOD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DB_DM_CITIES_ADJUST_DISTRICTS_YIELD_BASED_ON_APPEAL', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Food > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FOOD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'Description', 'LOC_OP_' || God || '_DISTRICT_FOOD' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Food > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FOOD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Food > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FOOD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'RequiredAppeal', AppealMin FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Food > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FOOD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldType', 'YIELD_FOOD' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Food > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FOOD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldChange', Food FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Food > 0 ;


-- PRODUCTION
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_PRODUCTION_ON_APPEAL_' || SUBSTR(DistrictType, 10) FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Production > 0 ;
INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_PRODUCTION_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DB_DM_CITIES_ADJUST_DISTRICTS_YIELD_BASED_ON_APPEAL', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Production > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PRODUCTION_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'Description', 'LOC_OP_' || God || '_DISTRICT_PRODUCTION' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Production > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PRODUCTION_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Production > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PRODUCTION_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'RequiredAppeal', AppealMin FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Production > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PRODUCTION_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldType', 'YIELD_PRODUCTION' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Production > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PRODUCTION_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldChange', Production FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Production > 0 ;


-- SCIENCE
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_SCIENCE_ON_APPEAL_' || SUBSTR(DistrictType, 10) FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Science > 0 ;
INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_SCIENCE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DB_DM_CITIES_ADJUST_DISTRICTS_YIELD_BASED_ON_APPEAL', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Science > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_SCIENCE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'Description', 'LOC_OP_' || God || '_DISTRICT_SCIENCE' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Science > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_SCIENCE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Science > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_SCIENCE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'RequiredAppeal', AppealMin FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Science > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_SCIENCE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldType', 'YIELD_SCIENCE' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Science > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_SCIENCE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldChange', Science FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Science > 0 ;


-- CULTURE
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_CULTURE_ON_APPEAL_' || SUBSTR(DistrictType, 10) FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Culture > 0 ;
INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_CULTURE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DB_DM_CITIES_ADJUST_DISTRICTS_YIELD_BASED_ON_APPEAL', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Culture > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CULTURE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'Description', 'LOC_OP_' || God || '_DISTRICT_CULTURE' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Culture > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CULTURE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Culture > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CULTURE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'RequiredAppeal', AppealMin FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Culture > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CULTURE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldType', 'YIELD_CULTURE' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Culture > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_CULTURE_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldChange', Culture FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Culture > 0 ;


-- FAITH
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_FAITH_ON_APPEAL_' || SUBSTR(DistrictType, 10) FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Faith > 0 ;
INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_FAITH_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DB_DM_CITIES_ADJUST_DISTRICTS_YIELD_BASED_ON_APPEAL', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Faith > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FAITH_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'Description', 'LOC_OP_' || God || '_DISTRICT_FAITH' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Faith > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FAITH_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Faith > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FAITH_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'RequiredAppeal', AppealMin FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Faith > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FAITH_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldType', 'YIELD_FAITH' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Faith > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_FAITH_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldChange', Faith FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Faith > 0 ;


-- GOLD
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'OP_' || God, 'OP_' || God || '_GOLD_ON_APPEAL_' || SUBSTR(DistrictType, 10) FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Gold > 0 ;
INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'OP_' || God || '_GOLD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DB_DM_CITIES_ADJUST_DISTRICTS_YIELD_BASED_ON_APPEAL', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Gold > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_GOLD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'Description', 'LOC_OP_' || God || '_DISTRICT_GOLD' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Gold > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_GOLD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'DistrictType', DistrictType FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Gold > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_GOLD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'RequiredAppeal', AppealMin FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Gold > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_GOLD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldType', 'YIELD_GOLD' FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Gold > 0 ;
INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
	SELECT 'OP_' || God || '_GOLD_ON_APPEAL_' || SUBSTR(DistrictType, 10), 'YieldChange', Gold FROM Districts JOIN OP_Appeal WHERE TraitType IS NULL AND DistrictType NOT LIKE '%CITY_CENTER%' AND Gold > 0 ;

