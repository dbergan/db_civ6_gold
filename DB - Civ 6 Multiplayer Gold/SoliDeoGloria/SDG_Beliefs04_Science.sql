-- SCIENCE

-- ------------------------------------
-- ------------------------------------
--  THE_WATCHMAKER
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_THE_WATCHMAKER', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_SCIENCE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_THE_WATCHMAKER', 'LOC_SDG_THE_WATCHMAKER', 'LOC_SDG_THE_WATCHMAKER_DESC', 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_THE_WATCHMAKER', 'SDG_THE_WATCHMAKER_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_THE_WATCHMAKER_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_THE_WATCHMAKER_BASE_YIELD', 'YieldType', 'YIELD_SCIENCE'),
                              ('SDG_THE_WATCHMAKER_BASE_YIELD', 'Amount', 1) ;


-- ------------------------------------
-- ------------------------------------
--  A_FINE_TUNED_UNIVERSE
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_A_FINE_TUNED_UNIVERSE', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_SCIENCE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_A_FINE_TUNED_UNIVERSE', 'LOC_SDG_A_FINE_TUNED_UNIVERSE', 'LOC_SDG_A_FINE_TUNED_UNIVERSE_DESC', 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

/*
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_A_FINE_TUNED_UNIVERSE', 'SDG_A_FINE_TUNED_UNIVERSE_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_A_FINE_TUNED_UNIVERSE_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_A_FINE_TUNED_UNIVERSE_BASE_YIELD', 'YieldType', 'YIELD_SCIENCE'),
                              ('SDG_A_FINE_TUNED_UNIVERSE_BASE_YIELD', 'Amount', 1) ;
*/

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_A_FINE_TUNED_UNIVERSE', 'SDG_A_FINE_TUNED_UNIVERSE_POP_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_A_FINE_TUNED_UNIVERSE_POP_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_A_FINE_TUNED_UNIVERSE_POP_YIELD_' || x, 'YieldType', 'YIELD_SCIENCE' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_A_FINE_TUNED_UNIVERSE_POP_YIELD_' || x, 'Amount', 1 FROM counter ;

  -- ------------------------------------
-- ------------------------------------
--  IRREDUCIBLE_COMPLEXITY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_IRREDUCIBLE_COMPLEXITY', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_SCIENCE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_IRREDUCIBLE_COMPLEXITY', 'LOC_SDG_IRREDUCIBLE_COMPLEXITY', 'LOC_SDG_IRREDUCIBLE_COMPLEXITY_DESC', 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

/*
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_IRREDUCIBLE_COMPLEXITY', 'SDG_IRREDUCIBLE_COMPLEXITY_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_IRREDUCIBLE_COMPLEXITY_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_IRREDUCIBLE_COMPLEXITY_BASE_YIELD', 'YieldType', 'YIELD_SCIENCE'),
                              ('SDG_IRREDUCIBLE_COMPLEXITY_BASE_YIELD', 'Amount', 1) ;
*/

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_IRREDUCIBLE_COMPLEXITY', 'SDG_IRREDUCIBLE_COMPLEXITY_DISTRICT_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_IRREDUCIBLE_COMPLEXITY_DISTRICT_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_IRREDUCIBLE_COMPLEXITY_DISTRICT_YIELD_' || x, 'YieldType', 'YIELD_SCIENCE' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_IRREDUCIBLE_COMPLEXITY_DISTRICT_YIELD_' || x, 'Amount', 1 FROM counter ;

-- ------------------------------------
-- ------------------------------------
--  NON_OVERLAPPING_MAGISTERIA
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_NON_OVERLAPPING_MAGISTERIA', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_SCIENCE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_NON_OVERLAPPING_MAGISTERIA', 'LOC_SDG_NON_OVERLAPPING_MAGISTERIA', 'LOC_SDG_NON_OVERLAPPING_MAGISTERIA_DESC', 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NON_OVERLAPPING_MAGISTERIA', 'SDG_NON_OVERLAPPING_MAGISTERIA_CITY_YIELD_PERCENT') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_NON_OVERLAPPING_MAGISTERIA_CITY_YIELD_PERCENT', 'DB_DM_CITIES_ADJUST_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_NON_OVERLAPPING_MAGISTERIA_CITY_YIELD_PERCENT', 'Amount', 10),
							  ('SDG_NON_OVERLAPPING_MAGISTERIA_CITY_YIELD_PERCENT', 'YieldType', 'YIELD_SCIENCE') ;
							  
-- ------------------------------------
-- ------------------------------------
--  TRUTH_CANNOT_CONTRADICT_TRUTH
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_TRUTH_CANNOT_CONTRADICT_TRUTH', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_SCIENCE_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_TRUTH_CANNOT_CONTRADICT_TRUTH', 'LOC_SDG_TRUTH_CANNOT_CONTRADICT_TRUTH', 'LOC_SDG_TRUTH_CANNOT_CONTRADICT_TRUTH_DESC', 'SDG_BELIEF_CLASS_SCIENCE_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_TRUTH_CANNOT_CONTRADICT_TRUTH', 'SDG_TRUTH_CANNOT_CONTRADICT_TRUTH_PERCENT_FOR_FOLLOWERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_TRUTH_CANNOT_CONTRADICT_TRUTH_PERCENT_FOR_FOLLOWERS', 'DB_DM_CITIES_ADJUST_FOLLOWER_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_TRUTH_CANNOT_CONTRADICT_TRUTH_PERCENT_FOR_FOLLOWERS', 'Amount', 1),
							  ('SDG_TRUTH_CANNOT_CONTRADICT_TRUTH_PERCENT_FOR_FOLLOWERS', 'YieldType', 'YIELD_SCIENCE') ;
