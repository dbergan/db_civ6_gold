-- AMENITIES

-- ------------------------------------
-- ------------------------------------
--  Nearer My God, To Thee
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_NEARER_MY_GOD', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_AMENITIES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_AMENITIES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_NEARER_MY_GOD', 'LOC_SDG_NEARER_MY_GOD', 'LOC_SDG_NEARER_MY_GOD_DESC', 'SDG_BELIEF_CLASS_AMENITIES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_NEARER_MY_GOD', 'SDG_NEARER_MY_GOD_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_NEARER_MY_GOD_YIELD', 'DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_NEARER_MY_GOD_YIELD', 'Amount', 1) ;

-- ------------------------------------
-- ------------------------------------
--  BE_STILL_MY_SOUL
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_BE_STILL_MY_SOUL', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_AMENITIES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_AMENITIES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_BE_STILL_MY_SOUL', 'LOC_SDG_BE_STILL_MY_SOUL', 'LOC_SDG_BE_STILL_MY_SOUL_DESC', 'SDG_BELIEF_CLASS_AMENITIES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_BE_STILL_MY_SOUL', 'SDG_BE_STILL_MY_SOUL_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_BE_STILL_MY_SOUL_YIELD_' || x, 'DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 7 x UNION SELECT x + 7 FROM counter WHERE x < 90) 
  SELECT 'SDG_BE_STILL_MY_SOUL_YIELD_' || x, 'Amount', 1 FROM counter ;
  

-- ------------------------------------
-- ------------------------------------
--  ODE_TO_JOY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ODE_TO_JOY', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_AMENITIES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_AMENITIES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ODE_TO_JOY', 'LOC_SDG_ODE_TO_JOY', 'LOC_SDG_ODE_TO_JOY_DESC', 'SDG_BELIEF_CLASS_AMENITIES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ODE_TO_JOY', 'SDG_ODE_TO_JOY_YIELD_' || x FROM counter ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ODE_TO_JOY_YIELD_' || x, 'DB_DM_CITIES_ADJUST_AMENITIES_FROM_RELIGION', 'DB_REQSET_CITY_HAS_' || x || '_DISTRICTS_AND_FOLLOWS_RELIGION' FROM counter ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 2 x UNION SELECT x + 2 FROM counter WHERE x < 18) 
  SELECT 'SDG_ODE_TO_JOY_YIELD_' || x, 'Amount', 1 FROM counter ;

-- ------------------------------------
-- ------------------------------------
--  HALLELUJAH_CHORUS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HALLELUJAH_CHORUS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_AMENITIES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_AMENITIES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_HALLELUJAH_CHORUS', 'LOC_SDG_HALLELUJAH_CHORUS', 'LOC_SDG_HALLELUJAH_CHORUS_DESC', 'SDG_BELIEF_CLASS_AMENITIES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) 
	SELECT 'SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_' || SUBSTR(DistrictType, 10) || '_FAITH_MODIFIER' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;
	
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_' || SUBSTR(DistrictType, 10) || '_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_' || SUBSTR(DistrictType, 10) || '_FAITH_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_' || SUBSTR(DistrictType, 10) || '_FAITH' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'SDG_HALLELUJAH_CHORUS_' || SUBSTR(DistrictType, 10) || '_FAITH', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_' || SUBSTR(DistrictType, 10) FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_HALLELUJAH_CHORUS_' || SUBSTR(DistrictType, 10) || '_FAITH', 'YieldType', 'YIELD_FAITH' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_HALLELUJAH_CHORUS_' || SUBSTR(DistrictType, 10) || '_FAITH', 'Amount', 1 FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;


INSERT INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_' || SUBSTR(DistrictType, 10) || '_FAITH_ADJACENCY_MODIFIER' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_' || SUBSTR(DistrictType, 10) || '_FAITH_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_' || SUBSTR(DistrictType, 10) || '_FAITH_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_' || SUBSTR(DistrictType, 10) || '_FAITH_ADJACENCY' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'SDG_HALLELUJAH_CHORUS_' || SUBSTR(DistrictType, 10) || '_FAITH_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_' || SUBSTR(DistrictType, 10) || '_NEXT_TO_HOLY_SITE' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_HALLELUJAH_CHORUS_' || SUBSTR(DistrictType, 10) || '_FAITH_ADJACENCY', 'Amount', 1 FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_HALLELUJAH_CHORUS_' || SUBSTR(DistrictType, 10) || '_FAITH_ADJACENCY', 'YieldType', 'YIELD_FAITH' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;



INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY', 'DB_DM_ADJUST_DISTRICT_AMENITIES', 'DB_REQSET_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_' || SUBSTR(DistrictType, 10) || '_ADJACENCY_MODIFIER' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_' || SUBSTR(DistrictType, 10) || '_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_HALLELUJAH_CHORUS_CITIES_ATTACH_HOLY_SITE_AMENITY_' || SUBSTR(DistrictType, 10) || '_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY_' || SUBSTR(DistrictType, 10) || '_ADJACENCY' FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY_' || SUBSTR(DistrictType, 10) || '_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_AMENITIES', 'DB_REQSET_IS_HOLY_SITE_NEXT_TO_' || SUBSTR(DistrictType, 10) FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'SDG_HALLELUJAH_CHORUS_HOLY_SITE_AMENITY_' || SUBSTR(DistrictType, 10) || '_ADJACENCY', 'Amount', 1 FROM Districts WHERE DistrictType IN ('DISTRICT_ENTERTAINMENT_COMPLEX', 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX') ;