--		Create Pantheon building that gives the player the faith they need to found their pantheon
INSERT INTO Types (Type, Kind) VALUES ('BUILDING_DB_PANTHEON', 'KIND_BUILDING') ;
INSERT INTO Buildings (BuildingType, Name, Description, PrereqDistrict, Cost, MaxPlayerInstances) VALUES ('BUILDING_DB_PANTHEON', 'LOC_BUILDING_DB_PANTHEON', 'LOC_BUILDING_DB_PANTHEON_DESC', 'DISTRICT_CITY_CENTER', 180, 1) ;
INSERT INTO BuildingPrereqs (Building, PrereqBuilding) VALUES ('BUILDING_DB_PANTHEON', 'BUILDING_PALACE') ;

-- Require 400 faith for pantheon
UPDATE GlobalParameters SET Value = 400 WHERE Name = 'RELIGION_PANTHEON_MIN_FAITH' ;

-- Remove Faith tribal villages
DELETE FROM GoodyHuts WHERE GoodyHutType = 'GOODYHUT_FAITH' ;
DELETE FROM GoodyHutSubTypes WHERE SubTypeGoodyHut IN ('GOODYHUT_LARGE_FAITH', 'GOODYHUT_MEDIUM_FAITH', 'GOODYHUT_SMALL_FAITH') ;
CREATE TABLE IF NOT EXISTS GoodyHutSubTypes_XP2 ('SubTypeGoodyHut' TEXT, 'CityState' BOOLEAN, 'StrategicResources' BOOLEAN) ;
DELETE FROM GoodyHutSubTypes_XP2 WHERE SubTypeGoodyHut IN ('GOODYHUT_LARGE_FAITH', 'GOODYHUT_MEDIUM_FAITH', 'GOODYHUT_SMALL_FAITH') ;

-- Replace God King policy. Now +20% Production toward Pantheon Obelisk
DELETE FROM PolicyModifiers WHERE PolicyType = 'POLICY_GOD_KING' ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('DB_GOD_KING_POLICY_FOR_PANTHEON_OBELISK', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('DB_GOD_KING_POLICY_FOR_PANTHEON_OBELISK', 'BuildingType', 'BUILDING_DB_PANTHEON'),
('DB_GOD_KING_POLICY_FOR_PANTHEON_OBELISK', 'Amount', 20) ;
INSERT INTO PolicyModifiers (PolicyType, ModifierId) VALUES ('POLICY_GOD_KING', 'DB_GOD_KING_POLICY_FOR_PANTHEON_OBELISK') ;

