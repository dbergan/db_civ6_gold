-- GOLD

-- ------------------------------------
-- ------------------------------------
--  WIDOWS_MITE
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_WIDOWS_MITE', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_GOLD_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_WIDOWS_MITE', 'LOC_SDG_WIDOWS_MITE', 'LOC_SDG_WIDOWS_MITE_DESC', 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_WIDOWS_MITE', 'SDG_WIDOWS_MITE_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_WIDOWS_MITE_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_WIDOWS_MITE_BASE_YIELD', 'YieldType', 'YIELD_GOLD'),
                              ('SDG_WIDOWS_MITE_BASE_YIELD', 'Amount', 3) ;


-- ------------------------------------
-- ------------------------------------
--  RENDER_UNTO_CAESAR
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_RENDER_UNTO_CAESAR', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_GOLD_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_RENDER_UNTO_CAESAR', 'LOC_SDG_RENDER_UNTO_CAESAR', 'LOC_SDG_RENDER_UNTO_CAESAR_DESC', 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

/*
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_RENDER_UNTO_CAESAR', 'SDG_RENDER_UNTO_CAESAR_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_RENDER_UNTO_CAESAR_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_RENDER_UNTO_CAESAR_BASE_YIELD', 'YieldType', 'YIELD_GOLD'),
                              ('SDG_RENDER_UNTO_CAESAR_BASE_YIELD', 'Amount', 3) ;
*/

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_RENDER_UNTO_CAESAR', 'SDG_RENDER_UNTO_CAESAR_POP_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_RENDER_UNTO_CAESAR_POP_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_RENDER_UNTO_CAESAR_POP_YIELD_' || x, 'YieldType', 'YIELD_GOLD' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_RENDER_UNTO_CAESAR_POP_YIELD_' || x, 'Amount', 3 FROM counter ;


-- ------------------------------------
-- ------------------------------------
--  ACRES_OF_DIAMONDS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ACRES_OF_DIAMONDS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_GOLD_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ACRES_OF_DIAMONDS', 'LOC_SDG_ACRES_OF_DIAMONDS', 'LOC_SDG_ACRES_OF_DIAMONDS_DESC', 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

/*
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ACRES_OF_DIAMONDS', 'SDG_ACRES_OF_DIAMONDS_BASE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_ACRES_OF_DIAMONDS_BASE_YIELD', 'DB_DM_CITIES_ADJUST_YIELD', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_ACRES_OF_DIAMONDS_BASE_YIELD', 'YieldType', 'YIELD_GOLD'),
                              ('SDG_ACRES_OF_DIAMONDS_BASE_YIELD', 'Amount', 3) ;
*/

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ACRES_OF_DIAMONDS', 'SDG_ACRES_OF_DIAMONDS_DISTRICT_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ACRES_OF_DIAMONDS_DISTRICT_YIELD_' || x, 'DB_DM_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ACRES_OF_DIAMONDS_DISTRICT_YIELD_' || x, 'YieldType', 'YIELD_GOLD' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ACRES_OF_DIAMONDS_DISTRICT_YIELD_' || x, 'Amount', 3 FROM counter ;

-- ------------------------------------
-- ------------------------------------
--  GOSPEL_OF_WEALTH
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_GOSPEL_OF_WEALTH', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_GOLD_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_GOSPEL_OF_WEALTH', 'LOC_SDG_GOSPEL_OF_WEALTH', 'LOC_SDG_GOSPEL_OF_WEALTH_DESC', 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_GOSPEL_OF_WEALTH', 'SDG_GOSPEL_OF_WEALTH_CITY_YIELD_PERCENT') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_GOSPEL_OF_WEALTH_CITY_YIELD_PERCENT', 'DB_DM_CITIES_ADJUST_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_GOSPEL_OF_WEALTH_CITY_YIELD_PERCENT', 'Amount', 30),
							  ('SDG_GOSPEL_OF_WEALTH_CITY_YIELD_PERCENT', 'YieldType', 'YIELD_GOLD') ;

-- ------------------------------------
-- ------------------------------------
--  TREASURES_IN_HEAVEN
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_TREASURES_IN_HEAVEN', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_GOLD_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_TREASURES_IN_HEAVEN', 'LOC_SDG_TREASURES_IN_HEAVEN', 'LOC_SDG_TREASURES_IN_HEAVEN_DESC', 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_TREASURES_IN_HEAVEN', 'SDG_TREASURES_IN_HEAVEN_PERCENT_FOR_FOLLOWERS') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_TREASURES_IN_HEAVEN_PERCENT_FOR_FOLLOWERS', 'DB_DM_CITIES_ADJUST_FOLLOWER_YIELD_PERCENT', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_TREASURES_IN_HEAVEN_PERCENT_FOR_FOLLOWERS', 'Amount', 3),
							  ('SDG_TREASURES_IN_HEAVEN_PERCENT_FOR_FOLLOWERS', 'YieldType', 'YIELD_GOLD') ;


-- ------------------------------------
-- ------------------------------------
--  Tetzel
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_TETZEL', 'KIND_BELIEF') ;

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_GOLD_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_TETZEL', 'LOC_SDG_TETZEL', 'LOC_SDG_TETZEL_DESC', 'SDG_BELIEF_CLASS_GOLD_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_TETZEL', 'SDG_TETZEL_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_TETZEL_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_TETZEL_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_TETZEL_GRANT_INDULGENCE_VENDOR') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_TETZEL_GRANT_INDULGENCE_VENDOR', 'DB_DM_GRANT_PROMOTION_TO_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_TETZEL_GRANT_INDULGENCE_VENDOR', 'PromotionType', 'PROMOTION_INDULGENCE_VENDOR') ;