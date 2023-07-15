-- GENERAL CITY

-- ------------------------------------
-- ------------------------------------
--  OKTOBERFEST
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_OKTOBERFEST', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_CITY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_CITY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_OKTOBERFEST', 'LOC_SDG_OKTOBERFEST', 'LOC_SDG_OKTOBERFEST_DESC', 'SDG_BELIEF_CLASS_CITY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_OKTOBERFEST', 'SDG_OKTOBERFEST_HARVEST_BONUS') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_OKTOBERFEST_HARVEST_BONUS', 'DB_DM_CITIES_ADJUST_RESOURCE_HARVEST_BONUS', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_OKTOBERFEST_HARVEST_BONUS', 'Amount', 35) ;