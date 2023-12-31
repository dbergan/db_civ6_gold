UPDATE Buildings SET Description = 'LOC_DB_BUILDING_MONUMENT_DESC' WHERE BuildingType= 'BUILDING_MONUMENT' AND Description IS NULL ;

DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MONUMENT' ;

DELETE FROM BuildingModifiers WHERE ModifierId = 'MONUMENT_CULTURE_AT_FULL_LOYALTY' ;
DELETE FROM Modifiers WHERE ModifierId = 'MONUMENT_CULTURE_AT_FULL_LOYALTY' ;
DELETE FROM ModifierArguments WHERE ModifierId = 'MONUMENT_CULTURE_AT_FULL_LOYALTY' ;

UPDATE ModifierArguments SET Value = 2 WHERE ModifierId = 'MONUMENT_LOYALTY' AND Name = 'Amount' ;

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_MONUMENT', 'DB_MOD_MONUMENT_BORDER_EXPANSION') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('DB_MOD_MONUMENT_BORDER_EXPANSION', 'MODIFIER_SINGLE_CITY_CULTURE_BORDER_EXPANSION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('DB_MOD_MONUMENT_BORDER_EXPANSION', 'Amount', 100) ;

UPDATE Civics SET Cost = 40, EraType = 'ERA_ANCIENT', UITreeRow = 0 WHERE CivicType = 'CIVIC_DRAMA_POETRY' ;
DELETE FROM CivicPrereqs WHERE PrereqCivic = 'CIVIC_DRAMA_POETRY' ;
UPDATE CivicPrereqs SET PrereqCivic = 'CIVIC_CODE_OF_LAWS' WHERE Civic = 'CIVIC_DRAMA_POETRY';

DELETE FROM CivicRandomCosts WHERE CivicType = 'CIVIC_DRAMA_POETRY' ;
INSERT INTO CivicRandomCosts (CivicType, Cost) VALUES 
('CIVIC_DRAMA_POETRY', 50),
('CIVIC_DRAMA_POETRY', 70)
;
