UPDATE Buildings SET Description = 'LOC_DB_BUILDING_MONUMENT_DESC' WHERE BuildingType= 'BUILDING_MONUMENT' AND Description IS NULL ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('DB_GOLD_TRAINED_BUILDERS_ADD_CHARGE_CITY_ATTACHES_MODIFIER', 'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('DB_GOLD_TRAINED_BUILDERS_ADD_CHARGE_CITY_ATTACHES_MODIFIER', 'ModifierId', 'DB_GOLD_TRAINED_BUILDERS_ADD_CHARGE') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, Permanent) VALUES ('DB_GOLD_TRAINED_BUILDERS_ADD_CHARGE', 'MODIFIER_SINGLE_CITY_BUILDER_CHARGES', 'UNIT_IS_BUILDER', 1) ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('DB_GOLD_TRAINED_BUILDERS_ADD_CHARGE', 'Amount', 1) ;

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_MONUMENT', 'DB_GOLD_TRAINED_BUILDERS_ADD_CHARGE_CITY_ATTACHES_MODIFIER') ;