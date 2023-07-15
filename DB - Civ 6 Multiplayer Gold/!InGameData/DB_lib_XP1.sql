-- Yield in city for each population
--    CITIES (Amount, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_ADJUST_YIELD_PER_POPULATION', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_ADJUST_YIELD_PER_POPULATION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION') ;

-- Can purchase districts with gold
--    CITIES (CanPurchase [boolean, set to 1])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_CAN_PURCHASE_DISTRICTS_W_GOLD', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_CAN_PURCHASE_DISTRICTS_W_GOLD', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_CAN_PURCHASE_DISTRICTS') ;

-- Harvest bonus in cities (that follow this religion) by x%
--   CITIES (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_RESOURCE_HARVEST_BONUS', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_RESOURCE_HARVEST_BONUS', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_RESOURCE_HARVEST_BONUS') ;

-- City pressure
--   CITIES (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_RELIGION_PRESSURE', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_RELIGION_PRESSURE', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_RELIGION_PRESSURE') ;


-- River adjacency
--   CITIES (Amount, Description, DistrictType, YieldType)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_RIVER_ADJACENCY', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_RIVER_ADJACENCY', 'COLLECTION_ALL_CITIES', 'EFFECT_RIVER_ADJACENCY') ;

-- Always loyal (e.g. Hera)
--    CITIES (AlwaysLoyal [bool])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ALWAYS_LOYAL', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ALWAYS_LOYAL', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_ALWAYS_LOYAL') ;


-- City ranged attacks per turn
--   CITIES (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_ATTACKS_PER_TURN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_ATTACKS_PER_TURN', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_ATTACKS_PER_TURN') ;

-- Single city ranged attacks per turn
--   CITY (Amount)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_ADJUST_ATTACKS_PER_TURN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_ADJUST_ATTACKS_PER_TURN', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_ATTACKS_PER_TURN') ;



-- Adjust loyalty to all other cities
--	 CITIES (Amount)
--   Can attach with BuildingModifiers or DistrictModifiers and use DB_REQSET_WITHIN_9_TILES to filter cities within a range of, say, 9 tiles
--   When I wanted a building to affect my cities positively, and foriegn cities negatively, my method was to apply a -1 negative loyalty to all cities in the range, and then apply +2 with the player_cities version (below)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ALL_CITIES_ADJUST_IDENTITY_PER_TURN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ALL_CITIES_ADJUST_IDENTITY_PER_TURN', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_IDENTITY_PER_TURN') ;

-- Adjust loyalty to all domestic cities 
--	 CITIES (Amount)
--   Attach with BuildingModifiers or DistrictModifiers and use requirements of type REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES or REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES to filter cities with a range of the Building/District
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_CITY_IDENTITY_PER_TURN') ;


-- Combat bonus to units on city's tiles
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_ALL_CITIES_ADJUST_UNIT_COMBAT_ON_CITY_TILES', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_ALL_CITIES_ADJUST_UNIT_COMBAT_ON_CITY_TILES', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_COMBAT_BONUS') ;

INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_CITIES_ADJUST_UNIT_COMBAT_ON_CITY_TILES', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_CITIES_ADJUST_UNIT_COMBAT_ON_CITY_TILES', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_CITY_COMBAT_BONUS') ;

INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_OWNER_CITY_ADJUST_UNIT_COMBAT_ON_CITY_TILES', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_OWNER_CITY_ADJUST_UNIT_COMBAT_ON_CITY_TILES', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_COMBAT_BONUS') ;
