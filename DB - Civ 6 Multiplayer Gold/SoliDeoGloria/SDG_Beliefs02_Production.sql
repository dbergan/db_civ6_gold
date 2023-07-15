-- PRODUCTION

-- ------------------------------------
-- ------------------------------------
--  CHILD_LABOR
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CHILD_LABOR', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_PRODUCTION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_CHILD_LABOR', 'LOC_SDG_CHILD_LABOR', 'LOC_SDG_CHILD_LABOR_DESC', 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CHILD_LABOR', 'SDG_CHILD_LABOR_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_CHILD_LABOR_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_CHILD_LABOR_BASE_YIELD', 'YieldType', 'YIELD_PRODUCTION'),
                              ('SDG_CHILD_LABOR_BASE_YIELD', 'Amount', 1) ;


-- ------------------------------------
-- ------------------------------------
--  CONSIDER_THE_ANT
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CONSIDER_THE_ANT', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_PRODUCTION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_CONSIDER_THE_ANT', 'LOC_SDG_CONSIDER_THE_ANT', 'LOC_SDG_CONSIDER_THE_ANT_DESC', 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

/*
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CONSIDER_THE_ANT', 'SDG_CONSIDER_THE_ANT_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_CONSIDER_THE_ANT_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_CONSIDER_THE_ANT_BASE_YIELD', 'YieldType', 'YIELD_PRODUCTION'),
                              ('SDG_CONSIDER_THE_ANT_BASE_YIELD', 'Amount', 1) ;
*/

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CONSIDER_THE_ANT', 'SDG_CONSIDER_THE_ANT_POP_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CONSIDER_THE_ANT_POP_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CONSIDER_THE_ANT_POP_YIELD_' || x, 'YieldType', 'YIELD_PRODUCTION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CONSIDER_THE_ANT_POP_YIELD_' || x, 'Amount', 1 FROM counter ;


-- ------------------------------------
-- ------------------------------------
--  NULLA_DIES_SINE_LINEA
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_NULLA_DIES_SINE_LINEA', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_PRODUCTION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_NULLA_DIES_SINE_LINEA', 'LOC_SDG_NULLA_DIES_SINE_LINEA', 'LOC_SDG_NULLA_DIES_SINE_LINEA_DESC', 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

/*
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NULLA_DIES_SINE_LINEA', 'SDG_NULLA_DIES_SINE_LINEA_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_NULLA_DIES_SINE_LINEA_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_NULLA_DIES_SINE_LINEA_BASE_YIELD', 'YieldType', 'YIELD_PRODUCTION'),
                              ('SDG_NULLA_DIES_SINE_LINEA_BASE_YIELD', 'Amount', 1) ;
*/

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_NULLA_DIES_SINE_LINEA', 'SDG_NULLA_DIES_SINE_LINEA_DISTRICT_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_NULLA_DIES_SINE_LINEA_DISTRICT_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_NULLA_DIES_SINE_LINEA_DISTRICT_YIELD_' || x, 'YieldType', 'YIELD_PRODUCTION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_NULLA_DIES_SINE_LINEA_DISTRICT_YIELD_' || x, 'Amount', 1 FROM counter ;



-- ------------------------------------
-- ------------------------------------
--  DESERET
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_DESERET', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_PRODUCTION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_DESERET', 'LOC_SDG_DESERET', 'LOC_SDG_DESERET_DESC', 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_DESERET', 'SDG_DESERET_CITY_YIELD_PERCENT') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_DESERET_CITY_YIELD_PERCENT', 'DB_DM_CITIES_ADJUST_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_DESERET_CITY_YIELD_PERCENT', 'Amount', 10),
							  ('SDG_DESERET_CITY_YIELD_PERCENT', 'YieldType', 'YIELD_PRODUCTION') ;


-- ------------------------------------
-- ------------------------------------
--  PROTESTANT_WORK_ETHIC
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PROTESTANT_WORK_ETHIC', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_PRODUCTION_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_PROTESTANT_WORK_ETHIC', 'LOC_SDG_PROTESTANT_WORK_ETHIC', 'LOC_SDG_PROTESTANT_WORK_ETHIC_DESC', 'SDG_BELIEF_CLASS_PRODUCTION_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PROTESTANT_WORK_ETHIC', 'SDG_PROTESTANT_WORK_ETHIC_PERCENT_FOR_FOLLOWERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PROTESTANT_WORK_ETHIC_PERCENT_FOR_FOLLOWERS', 'DB_DM_CITIES_ADJUST_FOLLOWER_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_PROTESTANT_WORK_ETHIC_PERCENT_FOR_FOLLOWERS', 'Amount', 1),
							  ('SDG_PROTESTANT_WORK_ETHIC_PERCENT_FOR_FOLLOWERS', 'YieldType', 'YIELD_PRODUCTION') ;



