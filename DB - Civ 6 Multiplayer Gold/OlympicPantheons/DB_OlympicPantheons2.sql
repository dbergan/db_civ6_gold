-- ------------------------------------
--  Dionysus
-- ------------------------------------
--		Add amenities for cities that have improved a Dionysus resource

INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('OP_DM_CITY_ADJUST_RELIGION_AMENITY', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('OP_DM_CITY_ADJUST_RELIGION_AMENITY', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_AMENITIES_FROM_RELIGION') ;

INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('OP_DM_CITY_ADJUST_GREAT_PEOPLE_HOUSING', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('OP_DM_CITY_ADJUST_GREAT_PEOPLE_HOUSING', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_HOUSING_FROM_GREAT_PEOPLE') ;		-- EFFECT_ADJUST_POLICY_HOUSING


INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('OP_DIONYSUS', 'OP_DIONYSUS_CITIES_ADDS_AMENITIES') ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('OP_DIONYSUS_CITIES_ADDS_AMENITIES', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'OP_REQSET_CITY_FOLLOWS_DIONYSUS_AND_HAS_IMPROVED_DIONYSUS_RESOURCE') ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('OP_DIONYSUS_CITIES_ADDS_AMENITIES', 'ModifierId', 'OP_DIONYSUS_AMENITIES') ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES ('OP_DIONYSUS_AMENITIES', 'OP_DM_CITY_ADJUST_RELIGION_AMENITY') ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('OP_DIONYSUS_AMENITIES', 'Amount', 100) ;

INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('OP_DIONYSUS', 'OP_DIONYSUS_CITIES_ADDS_HOUSING') ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('OP_DIONYSUS_CITIES_ADDS_HOUSING', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'OP_REQSET_CITY_FOLLOWS_DIONYSUS_AND_HAS_IMPROVED_DIONYSUS_RESOURCE') ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('OP_DIONYSUS_CITIES_ADDS_HOUSING', 'ModifierId', 'OP_DIONYSUS_HOUSING') ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES ('OP_DIONYSUS_HOUSING', 'OP_DM_CITY_ADJUST_GREAT_PEOPLE_HOUSING') ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('OP_DIONYSUS_HOUSING', 'Amount', 100) ;

/*
--		Create Peace and Love "building" that, when pillaged (due to war weariness), takes away the amenity bonus
INSERT INTO Types (Type, Kind) VALUES ('BUILDING_OP_PEACE_AND_LOVE', 'KIND_BUILDING') ;
INSERT INTO Buildings (BuildingType, Name, Description, PrereqDistrict, Cost, MustPurchase, PurchaseYield) VALUES ('BUILDING_OP_PEACE_AND_LOVE', 'LOC_BUILDING_OP_PEACE_AND_LOVE', 'LOC_BUILDING_OP_PEACE_AND_LOVE_DESC', 'DISTRICT_CITY_CENTER', 99999, 1, 'YIELD_FOOD') ;
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('OP_REQ_CITY_HAS_PEACE_AND_LOVE', 'REQUIREMENT_CITY_HAS_BUILDING') ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)  VALUES 
('OP_REQ_CITY_HAS_PEACE_AND_LOVE', 'BuildingType', 'BUILDING_OP_PEACE_AND_LOVE'),
('OP_REQ_CITY_HAS_PEACE_AND_LOVE', 'MustBeFunctioning', 1) ;


--		City has improved resource and "Peace and Love" (OP_REQSET_CITY_HAS_PEACE_AND_IMPROVED_DIONYSUS_RESOURCE)
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('OP_REQSET_CITY_HAS_PEACE_AND_IMPROVED_DIONYSUS_RESOURCE', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('OP_REQSET_CITY_HAS_PEACE_AND_IMPROVED_DIONYSUS_RESOURCE', 'OP_REQ_CITY_HAS_IMPROVED_DIONYSUS_RESOURCE'),
('OP_REQSET_CITY_HAS_PEACE_AND_IMPROVED_DIONYSUS_RESOURCE', 'OP_REQ_CITY_HAS_PEACE_AND_LOVE') ;


--		Add amenities for cities that have improved a Dionysus resource and the Peace and Love "building" isn't "pillaged" (the lua script pillages/unpillages the building based on war weariness)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('OP_DM_CITY_ADJUST_RELIGION_AMENITY', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('OP_DM_CITY_ADJUST_RELIGION_AMENITY', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_AMENITIES_FROM_RELIGION') ;

INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('OP_DIONYSUS', 'OP_DIONYSUS_CITY_ADDS_AMEN_MODIFIER') ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('OP_DIONYSUS_CITY_ADDS_AMEN_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS') ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('OP_DIONYSUS_CITY_ADDS_AMEN_MODIFIER', 'ModifierId', 'OP_DIONYSUS_AMENITIES') ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('OP_DIONYSUS_AMENITIES', 'OP_DM_CITY_ADJUST_RELIGION_AMENITY', 'OP_REQSET_CITY_HAS_PEACE_AND_IMPROVED_DIONYSUS_RESOURCE') ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('OP_DIONYSUS_AMENITIES', 'Amount', 100) ;
*/



-- ------------------------------------
--  Zeus
-- ------------------------------------
DROP TABLE IF EXISTS OP_Mountain_Terrains ;
CREATE TABLE OP_Mountain_Terrains (Terrain VARCHAR) ;

INSERT INTO OP_Mountain_Terrains 
(Terrain) VALUES 
('GRASS_MOUNTAIN'),
('PLAINS_MOUNTAIN'),
('DESERT_MOUNTAIN'),
('TUNDRA_MOUNTAIN'),
('SNOW_MOUNTAIN') ;

DROP TABLE IF EXISTS OP_Mountain_District_Adjacencies ;
CREATE TABLE OP_Mountain_District_Adjacencies (District VARCHAR, Food INT, Production INT, Science INT, Culture INT, Faith INT, Gold INT, Amenity INT, Housing INT) ;

INSERT INTO OP_Mountain_District_Adjacencies 
(District,						Food,	Production,	Science,	Culture,	Faith,	Gold,	Amenity,	Housing) VALUES 
('HOLY_SITE',					0,		0,			0,			0,			2,		0,		0,			0),
('CAMPUS',						0,		0,			1,			0,			0,		0,		0,			0),

('ENCAMPMENT',					0,		1,			0,			0,			0,		0,		0,			0),
('PRESERVE',					0,		0,			0,			0,			2,		0,		0,			0),

('HARBOR',						1,		0,			0,			0,			0,		1,		0,			0),
('COMMERCIAL_HUB',				0,		0,			0,			0,			0,		4,		0,			0),
('THEATER',						0,		0,			0,			1,			0,		0,		0,			0),
('ENTERTAINMENT_COMPLEX',		0,		0,			0,			0,			0,		4,		0,			0),

('AQUEDUCT',					1,		0,			0,			0,			0,		0,		0,			0),

('INDUSTRIAL_ZONE',				0,		1,			0,			0,			0,		0,		0,			0),
('DAM',							0,		1,			0,			0,			0,		0,		0,			0),

('CANAL',						0,		1,			0,			0,			0,		0,		0,			0),
('NEIGHBORHOOD',				1,		0,			0,			0,			0,		0,		0,			0),
('WATER_ENTERTAINMENT_COMPLEX',	0,		0,			0,			0,			0,		4,		0,			0),

('AERODROME',					0,		1,			0,			0,			0,		0,		0,			0) ;

-- Remove districts that aren't in this game (e.g. WATER_ENTERTAINMENT_COMPLEX without Gathering Storm)
DELETE FROM OP_Mountain_District_Adjacencies WHERE District NOT IN (SELECT SUBSTR(DistrictType, 10) FROM Districts) ;

-- Mountain adjacencies for FOOD
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
SELECT 'OP_ZEUS', 'OP_ZEUS_' || Terrain || '_' || District || '_FOOD_ADJACENCY' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FOOD_ADJACENCY', 'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FOOD_ADJACENCY', 'DistrictType', 'DISTRICT_' || District FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FOOD_ADJACENCY', 'Description', 'LOC_OP_ZEUS_DISTRICT_FOOD' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FOOD_ADJACENCY', 'TerrainType', 'TERRAIN_' || Terrain FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FOOD_ADJACENCY', 'YieldType', 'YIELD_FOOD' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FOOD_ADJACENCY', 'Amount', Food FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Food > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FOOD_ADJACENCY', 'TilesRequired', 1 FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Food > 0 ;

-- Mountain adjacencies for PRODUCTION
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
SELECT 'OP_ZEUS', 'OP_ZEUS_' || Terrain || '_' || District || '_PRODUCTION_ADJACENCY' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_PRODUCTION_ADJACENCY', 'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_PRODUCTION_ADJACENCY', 'DistrictType', 'DISTRICT_' || District FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_PRODUCTION_ADJACENCY', 'Description', 'LOC_OP_ZEUS_DISTRICT_PRODUCTION' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_PRODUCTION_ADJACENCY', 'TerrainType', 'TERRAIN_' || Terrain FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_PRODUCTION_ADJACENCY', 'YieldType', 'YIELD_PRODUCTION' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_PRODUCTION_ADJACENCY', 'Amount', Production FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Production > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_PRODUCTION_ADJACENCY', 'TilesRequired', 1 FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Production > 0 ;

-- Mountain adjacencies for SCIENCE
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
SELECT 'OP_ZEUS', 'OP_ZEUS_' || Terrain || '_' || District || '_SCIENCE_ADJACENCY' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_SCIENCE_ADJACENCY', 'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_SCIENCE_ADJACENCY', 'DistrictType', 'DISTRICT_' || District FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_SCIENCE_ADJACENCY', 'Description', 'LOC_OP_ZEUS_DISTRICT_SCIENCE' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_SCIENCE_ADJACENCY', 'TerrainType', 'TERRAIN_' || Terrain FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_SCIENCE_ADJACENCY', 'YieldType', 'YIELD_SCIENCE' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_SCIENCE_ADJACENCY', 'Amount', Science FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Science > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_SCIENCE_ADJACENCY', 'TilesRequired', 1 FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Science > 0 ;

-- Mountain adjacencies for CULTURE
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
SELECT 'OP_ZEUS', 'OP_ZEUS_' || Terrain || '_' || District || '_CULTURE_ADJACENCY' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_CULTURE_ADJACENCY', 'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_CULTURE_ADJACENCY', 'DistrictType', 'DISTRICT_' || District FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_CULTURE_ADJACENCY', 'Description', 'LOC_OP_ZEUS_DISTRICT_CULTURE' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_CULTURE_ADJACENCY', 'TerrainType', 'TERRAIN_' || Terrain FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_CULTURE_ADJACENCY', 'YieldType', 'YIELD_CULTURE' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_CULTURE_ADJACENCY', 'Amount', Culture FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Culture > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_CULTURE_ADJACENCY', 'TilesRequired', 1 FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Culture > 0 ;

-- Mountain adjacencies for FAITH
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
SELECT 'OP_ZEUS', 'OP_ZEUS_' || Terrain || '_' || District || '_FAITH_ADJACENCY' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FAITH_ADJACENCY', 'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FAITH_ADJACENCY', 'DistrictType', 'DISTRICT_' || District FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FAITH_ADJACENCY', 'Description', 'LOC_OP_ZEUS_DISTRICT_FAITH' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FAITH_ADJACENCY', 'TerrainType', 'TERRAIN_' || Terrain FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FAITH_ADJACENCY', 'YieldType', 'YIELD_FAITH' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FAITH_ADJACENCY', 'Amount', Faith FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Faith > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_FAITH_ADJACENCY', 'TilesRequired', 1 FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Faith > 0 ;

-- Mountain adjacencies for GOLD
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) 
SELECT 'OP_ZEUS', 'OP_ZEUS_' || Terrain || '_' || District || '_GOLD_ADJACENCY' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_GOLD_ADJACENCY', 'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_GOLD_ADJACENCY', 'DistrictType', 'DISTRICT_' || District FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_GOLD_ADJACENCY', 'Description', 'LOC_OP_ZEUS_DISTRICT_GOLD' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_GOLD_ADJACENCY', 'TerrainType', 'TERRAIN_' || Terrain FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_GOLD_ADJACENCY', 'YieldType', 'YIELD_GOLD' FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_GOLD_ADJACENCY', 'Amount', Gold FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Gold > 0 ;

INSERT OR IGNORE INTO ModifierArguments(ModifierId, Name, Value)
SELECT 'OP_ZEUS_' || Terrain || '_' || District || '_GOLD_ADJACENCY', 'TilesRequired', 1 FROM OP_Mountain_District_Adjacencies JOIN OP_Mountain_Terrains WHERE Gold > 0 ;

-- TODO: Mountain adjacencies for Amenities

-- TODO: Mountain adjacencies for Housing

