-- Warlord Throne actives for 10 turns (instead of 5)
UPDATE ModifierArguments SET Value = 10 WHERE ModifierId = 'GOV_PRODUCTION_BOOST_FROM_CAPTURE' AND Name = 'TurnsActive' ;

-- Foreign Ministry provides city states with +7 combat strength (instead of +4)
UPDATE ModifierArguments SET Value = 7 WHERE ModifierId = 'GOV_CITYSTATES_COMBAT_MODIFIER' AND Name = 'Amount' ;
-- Foreign Ministry can levy troops for free
-- UPDATE ModifierArguments SET Value = 100 WHERE ModifierId = 'BUILDING_GOV_LEVY_DISCOUNT' AND Name = 'Percent' ;


-- Grandmaster's Chapel: religious pressure from military attacks (was faith-purchase land military units)
DELETE FROM BuildingModifiers WHERE BuildingType = 'BUILDING_GOV_FAITH' AND ModifierId LIKE 'GOV_FAITH_PURCHASE%' ;

INSERT INTO Types (Type, Kind) VALUES ('DB_ABILITY_RELIGIOUS_PRESSURE_ON_KILL', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('DB_ABILITY_RELIGIOUS_PRESSURE_ON_KILL', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('DB_ABILITY_RELIGIOUS_PRESSURE_ON_KILL', 'LOC_NAME_DB_ABILITY_RELIGIOUS_PRESSURE_ON_KILL', 'LOC_DESC_DB_ABILITY_RELIGIOUS_PRESSURE_ON_KILL', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('DB_ABILITY_RELIGIOUS_PRESSURE_ON_KILL', 'DB_MOD_RELIGIOUS_PRESSURE_ON_KILL') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('DB_MOD_RELIGIOUS_PRESSURE_ON_KILL', 'MODIFIER_PLAYER_UNIT_ADJUST_LAND_VICTORY_SPREAD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('DB_MOD_RELIGIOUS_PRESSURE_ON_KILL', 'LandVictorySpread', 1) ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('DB_MOD_GRANT_ABILITY_RELIGIOUS_PRESSURE_ON_KILL', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('DB_MOD_GRANT_ABILITY_RELIGIOUS_PRESSURE_ON_KILL', 'AbilityType', 'DB_ABILITY_RELIGIOUS_PRESSURE_ON_KILL') ;

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_GOV_FAITH', 'DB_MOD_GRANT_ABILITY_RELIGIOUS_PRESSURE_ON_KILL') ;
