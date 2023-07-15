-- HOUSING

-- ------------------------------------
-- ------------------------------------
--  Kosher Food
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_KOSHER_FOOD', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_HOUSING_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_HOUSING_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_KOSHER_FOOD', 'LOC_SDG_KOSHER_FOOD', 'LOC_SDG_KOSHER_FOOD_DESC', 'SDG_BELIEF_CLASS_HOUSING_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_KOSHER_FOOD', 'SDG_KOSHER_FOOD_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_KOSHER_FOOD_YIELD', 'DB_DM_CITIES_ADJUST_HOUSING_FROM_GREAT_PEOPLE', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_KOSHER_FOOD_YIELD', 'Amount', 2) ;

-- ------------------------------------
-- ------------------------------------
--  CONVENTS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CONVENTS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_HOUSING_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_HOUSING_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_CONVENTS', 'LOC_SDG_CONVENTS', 'LOC_SDG_CONVENTS_DESC', 'SDG_BELIEF_CLASS_HOUSING_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CONVENTS', 'SDG_MOD_CONVENTS_YIELD_BASE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MOD_CONVENTS_YIELD_BASE', 'DB_DM_CITIES_ADJUST_HOUSING_FROM_GREAT_PEOPLE', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_CONVENTS_YIELD_BASE', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CONVENTS', 'SDG_CONVENTS_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CONVENTS_YIELD_' || x, 'DB_DM_CITIES_ADJUST_HOUSING_FROM_GREAT_PEOPLE', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_CONVENTS_YIELD_' || x, 'Amount', 1 FROM counter ;


-- ------------------------------------
-- ------------------------------------
--  MONASTERIES
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_MONASTERIES', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_HOUSING_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_HOUSING_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_MONASTERIES', 'LOC_SDG_MONASTERIES', 'LOC_SDG_MONASTERIES_DESC', 'SDG_BELIEF_CLASS_HOUSING_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_MONASTERIES', 'SDG_MOD_MONASTERIES_YIELD_BASE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MOD_MONASTERIES_YIELD_BASE', 'DB_DM_CITIES_ADJUST_HOUSING_FROM_GREAT_PEOPLE', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_MONASTERIES_YIELD_BASE', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_MONASTERIES', 'SDG_MONASTERIES_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_MONASTERIES_YIELD_' || x, 'DB_DM_CITIES_ADJUST_HOUSING_FROM_GREAT_PEOPLE', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_MONASTERIES_YIELD_' || x, 'Amount', 1 FROM counter ;


-- ------------------------------------
-- ------------------------------------
--  ABBEYS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABBEYS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_HOUSING_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_HOUSING_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ABBEYS', 'LOC_SDG_ABBEYS', 'LOC_SDG_ABBEYS_DESC', 'SDG_BELIEF_CLASS_HOUSING_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ABBEYS', 'SDG_ABBEYS_CITIES_ATTACH_NEIGHBORHOOD_FAITH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABBEYS_CITIES_ATTACH_NEIGHBORHOOD_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABBEYS_CITIES_ATTACH_NEIGHBORHOOD_FAITH_MODIFIER', 'ModifierId', 'SDG_ABBEYS_NEIGHBORHOOD_FAITH') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABBEYS_NEIGHBORHOOD_FAITH', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_NEIGHBORHOOD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ABBEYS_NEIGHBORHOOD_FAITH', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_ABBEYS_NEIGHBORHOOD_FAITH', 'Amount', 2) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ABBEYS', 'SDG_ABBEYS_CITIES_ATTACH_NEIGHBORHOOD_FAITH_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABBEYS_CITIES_ATTACH_NEIGHBORHOOD_FAITH_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABBEYS_CITIES_ATTACH_NEIGHBORHOOD_FAITH_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_ABBEYS_NEIGHBORHOOD_FAITH_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABBEYS_NEIGHBORHOOD_FAITH_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_NEIGHBORHOOD_NEXT_TO_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ABBEYS_NEIGHBORHOOD_FAITH_ADJACENCY', 'Amount', 2),
							  ('SDG_ABBEYS_NEIGHBORHOOD_FAITH_ADJACENCY', 'YieldType', 'YIELD_FAITH') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ABBEYS', 'SDG_ABBEYS_CITIES_ATTACH_HOLY_SITE_HOUSING_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABBEYS_CITIES_ATTACH_HOLY_SITE_HOUSING_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABBEYS_CITIES_ATTACH_HOLY_SITE_HOUSING_MODIFIER', 'ModifierId', 'SDG_ABBEYS_HOLY_SITE_HOUSING') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABBEYS_HOLY_SITE_HOUSING', 'DB_DM_ADJUST_DISTRICT_HOUSING', 'DB_REQSET_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_ABBEYS_HOLY_SITE_HOUSING', 'Amount', 2) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ABBEYS', 'SDG_ABBEYS_CITIES_ATTACH_HOLY_SITE_HOUSING_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABBEYS_CITIES_ATTACH_HOLY_SITE_HOUSING_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABBEYS_CITIES_ATTACH_HOLY_SITE_HOUSING_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_ABBEYS_HOLY_SITE_HOUSING_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABBEYS_HOLY_SITE_HOUSING_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_HOUSING', 'DB_REQSET_IS_HOLY_SITE_NEXT_TO_NEIGHBORHOOD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ABBEYS_HOLY_SITE_HOUSING_ADJACENCY', 'Amount', 2) ;
