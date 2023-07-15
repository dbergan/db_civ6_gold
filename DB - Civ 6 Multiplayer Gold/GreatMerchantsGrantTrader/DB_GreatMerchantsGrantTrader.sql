INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent) VALUES 
                      ('DB_MOD_GREAT_MERCHANTS_GRANT_TRADE_ROUTE', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 1, 1) ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('DB_MOD_GREAT_MERCHANTS_GRANT_TRADE_ROUTE', 'Amount', 1) ;
INSERT OR IGNORE INTO ModifierStrings (ModifierId, Context, Text) VALUES ('DB_MOD_GREAT_MERCHANTS_GRANT_TRADE_ROUTE', 'Summary', 'LOC_DB_MOD_GREAT_MERCHANTS_GRANT_TRADE_ROUTE') ;
INSERT OR IGNORE INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType, ModifierId)
	SELECT GreatPersonIndividualType, 'DB_MOD_GREAT_MERCHANTS_GRANT_TRADE_ROUTE' FROM GreatPersonIndividuals WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_MERCHANT'  ;


/*  Free trader

-- Grant unit in capital 
--    CITIES (Amount, UnitType, AllowUniqueOverride [bool - whether or not to override with unique units])
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PLAYER_GRANT_UNIT_IN_CAPITAL', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PLAYER_GRANT_UNIT_IN_CAPITAL', 'COLLECTION_PLAYER_CAPITAL_CITY', 'EFFECT_GRANT_UNIT_IN_CITY') ;


INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent) VALUES 
                      ('DB_MOD_GREAT_MERCHANTS_GRANT_TRADER', 'DB_DM_PLAYER_GRANT_UNIT_IN_CAPITAL', 1, 1) ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('DB_MOD_GREAT_MERCHANTS_GRANT_TRADER', 'Amount', 1), 
							  ('DB_MOD_GREAT_MERCHANTS_GRANT_TRADER', 'UnitType', 'UNIT_TRADER') ;

INSERT OR IGNORE INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType, ModifierId)
	SELECT GreatPersonIndividualType, 'DB_MOD_GREAT_MERCHANTS_GRANT_TRADER' FROM GreatPersonIndividuals WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_MERCHANT'  ;

*/




