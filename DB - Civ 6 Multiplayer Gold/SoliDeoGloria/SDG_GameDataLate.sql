INSERT OR REPLACE INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType, ModifierId)
SELECT GreatPersonIndividualType, 'SDG_MOD_GREAT_PROPHET_STRENGTH_AOE' FROM GreatPersonIndividuals WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET' ;

INSERT OR REPLACE INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType, ModifierId)
SELECT GreatPersonIndividualType, 'SDG_MOD_GREAT_PROPHET_MOVEMENT_AOE' FROM GreatPersonIndividuals WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET' ;

-- AOE halo
UPDATE GreatPersonIndividuals SET AreaHighlightRadius = 2 WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET' ;