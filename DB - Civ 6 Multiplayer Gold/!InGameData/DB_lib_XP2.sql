-- Can purchase districts with faith
--    CITIES (CanPurchase [boolean, set to 1])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_CAN_PURCHASE_DISTRICTS_W_FAITH', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_CAN_PURCHASE_DISTRICTS_W_FAITH', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CAN_FAITH_PURCHASE_DISTRICTS') ;


-- Prevent Battering Rams
--   CITIES (no arguments)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_PREVENT_RAM', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_PREVENT_RAM', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_PREVENT_MELEE_ATTACK_OUTER_DEFENSES') ;

-- Player Cities prevent ram
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_CITIES_PREVENT_RAM', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_CITIES_PREVENT_RAM', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_CITY_PREVENT_MELEE_ATTACK_OUTER_DEFENSES') ;


-- Prevent Siege Towers
--   CITIES (no arguments)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_PREVENT_TOWER', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_PREVENT_TOWER', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_PREVENT_BYPASS_OUTER_DEFENSES') ;

-- Player Cities prevent tower
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_CITIES_PREVENT_TOWER', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_CITIES_PREVENT_TOWER', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_CITY_PREVENT_BYPASS_OUTER_DEFENSES') ;


-- City ranged attacks range
--   DISTRICTS (Amount) 
--   Set SubjectRequirementSetId = DB_REQSET_IS_CITY_CENTER, otherwise it will apply multiple times and give you more range than you want
--   It does apply to the city's encampment when limited with DB_REQSET_IS_CITY_CENTER
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITIES_ADJUST_ATTACK_RANGE', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITIES_ADJUST_ATTACK_RANGE', 'COLLECTION_CITY_DISTRICTS', 'EFFECT_ADJUST_DISTRICT_ATTACK_RANGE') ;


-- Single city ranged attacks range
--   DISTRICTS (Amount) 
--   Set SubjectRequirementSetId = DB_REQSET_IS_CITY_CENTER, otherwise it will apply multiple times and give you more range than you want
--   It does apply to the city's encampment when limited with DB_REQSET_IS_CITY_CENTER
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CITY_ADJUST_ATTACK_RANGE', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CITY_ADJUST_ATTACK_RANGE', 'COLLECTION_OWNER', 'EFFECT_ADJUST_DISTRICT_ATTACK_RANGE') ;



-- Can bypass walls (this actually gives the unit a siege-tower-ish ability... when it's adjacent to a city ALL units of the chosen promotion class bypass walls, not just the unit with the ability)
--    UNITS (PromotionClass)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CAN_BYPASS_WALLS_PROMOTION_CLASS', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CAN_BYPASS_WALLS_PROMOTION_CLASS', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_BYPASS_WALLS_PROMOTION_CLASS') ;



-- Can wall attack (this actually gives the unit a battering-ram-ish ability... when it's adjacent to a city ALL units of the chosen promotion class attack the wall, not just the unit with the ability)
-- This ability does not work against Medieval or Renaissance walls
--    UNITS (PromotionClass)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CAN_WALL_ATTACK_PROMOTION_CLASS', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CAN_WALL_ATTACK_PROMOTION_CLASS', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_ENABLE_WALL_ATTACK_PROMOTION_CLASS') ;


-- Can wall attack (this actually gives the unit a battering-ram-ish ability... ALL units of the chosen promotion class (anywhere in the world) attack the wall, not just the unit with the ability)
-- This ability does work against Medieval and Renaissance walls
--    PLAYER_UNITS (PromotionClass) (always applies to all the player's units... even though it's COLLECTION_OWNER... and you can't filter with a ReqSet)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CAN_WALL_ATTACK_WHOLE_GAME_PROMOTION_CLASS', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CAN_WALL_ATTACK_WHOLE_GAME_PROMOTION_CLASS', 'COLLECTION_PLAYER_UNITS', 'EFFECT_ADJUST_UNIT_ENABLE_WALL_ATTACK_WHOLE_GAME_PROMOTION_CLASS') ;


-- 2022-03-11 Doesn't work? (never used by Firaxis)
-- Can wall attack
-- This ability does work against Medieval and Renaissance walls
--    UNITS (PromotionClass)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_CAN_WALL_ATTACK_WHOLE_GAME', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_CAN_WALL_ATTACK_WHOLE_GAME', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_ENABLE_WALL_ATTACK_WHOLE_GAME') ;