-- ------------------------------------
-- ------------------------------------
--  Deacons
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_DEACONS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_DEACONS', 'LOC_SDG_DEACONS', 'LOC_SDG_DEACONS_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_DEACONS', 'SDG_DEACONS_CITY_ADDS_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_DEACONS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_DEACONS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_DEACONS_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_DEACONS_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_DEACONS_YIELD', 'BuildingType', 'BUILDING_SHRINE'),
							  ('SDG_DEACONS_YIELD', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_DEACONS_YIELD', 'Amount', 3) ;


-- ------------------------------------
-- ------------------------------------
--  Provosts
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PROVOSTS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_PROVOSTS', 'LOC_SDG_PROVOSTS', 'LOC_SDG_PROVOSTS_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PROVOSTS', 'SDG_PROVOSTS_CITY_ADDS_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_PROVOSTS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_PROVOSTS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_PROVOSTS_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_PROVOSTS_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_PROVOSTS_YIELD', 'BuildingType', 'BUILDING_TEMPLE'),
							  ('SDG_PROVOSTS_YIELD', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_PROVOSTS_YIELD', 'Amount', 4) ;


-- ------------------------------------
-- ------------------------------------
--  Diocesans
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_DIOCESANS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_DIOCESANS', 'LOC_SDG_DIOCESANS', 'LOC_SDG_DIOCESANS_DESC', 'SDG_BELIEF_CLASS_999') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  SELECT 'SDG_DIOCESANS', 'SDG_DIOCESANS_' || SUBSTR(BuildingType, 10) FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  SELECT 'SDG_DIOCESANS_' || SUBSTR(BuildingType, 10), 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_DIOCESANS_' || SUBSTR(BuildingType, 10), 'ModifierId', 'SDG_DIOCESANS_' || SUBSTR(BuildingType, 10) || '_YIELD' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO Modifiers (ModifierId, ModifierType)
  SELECT 'SDG_DIOCESANS_' || SUBSTR(BuildingType, 10) || '_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_DIOCESANS_' || SUBSTR(BuildingType, 10) || '_YIELD', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_DIOCESANS_' || SUBSTR(BuildingType, 10) || '_YIELD', 'YieldType', 'YIELD_FAITH' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_DIOCESANS_' || SUBSTR(BuildingType, 10) || '_YIELD', 'Amount', 5 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';







-- ------------------------------------
-- ------------------------------------
--  Amazing Grace
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_AMAZING_GRACE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_AMAZING_GRACE', 'LOC_SDG_AMAZING_GRACE', 'LOC_SDG_AMAZING_GRACE_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_AMAZING_GRACE', 'SDG_AMAZING_GRACE_CITY_ADDS_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_AMAZING_GRACE_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'SDG_REQSET_CITY_HAS_SHRINE_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_AMAZING_GRACE_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_AMAZING_GRACE_AMENITIES') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_AMAZING_GRACE_AMENITIES', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_AMENITIES_FROM_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_AMAZING_GRACE_AMENITIES', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_AMAZING_GRACE', 'SDG_AMAZING_GRACE_CITY_ADDS_CULTURE_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_AMAZING_GRACE_CITY_ADDS_CULTURE_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_AMAZING_GRACE_CITY_ADDS_CULTURE_MODIFIER', 'ModifierId', 'SDG_AMAZING_GRACE_CULTURE_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_AMAZING_GRACE_CULTURE_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_AMAZING_GRACE_CULTURE_YIELD', 'BuildingType', 'BUILDING_SHRINE'),
							  ('SDG_AMAZING_GRACE_CULTURE_YIELD', 'YieldType', 'YIELD_CULTURE'),
                              ('SDG_AMAZING_GRACE_CULTURE_YIELD', 'Amount', 1) ;


-- ------------------------------------
-- ------------------------------------
--  Ode to Joy
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ODE_TO_JOY', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ODE_TO_JOY', 'LOC_SDG_ODE_TO_JOY', 'LOC_SDG_ODE_TO_JOY_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ODE_TO_JOY', 'SDG_ODE_TO_JOY_CITY_ADDS_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ODE_TO_JOY_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'SDG_REQSET_CITY_HAS_TEMPLE_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ODE_TO_JOY_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_ODE_TO_JOY_AMENITIES') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ODE_TO_JOY_AMENITIES', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_AMENITIES_FROM_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ODE_TO_JOY_AMENITIES', 'Amount', 2) ;


-- ------------------------------------
-- ------------------------------------
--  Hallelujah Chorus
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HALLELUJAH_CHORUS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_HALLELUJAH_CHORUS', 'LOC_SDG_HALLELUJAH_CHORUS', 'LOC_SDG_HALLELUJAH_CHORUS_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HALLELUJAH_CHORUS', 'SDG_HALLELUJAH_CHORUS_CITY_ADDS_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HALLELUJAH_CHORUS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'SDG_REQSET_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_HALLELUJAH_CHORUS_AMENITIES') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_HALLELUJAH_CHORUS_AMENITIES', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_AMENITIES_FROM_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HALLELUJAH_CHORUS_AMENITIES', 'Amount', 3) ;



-- ------------------------------------
-- ------------------------------------
--  Convents
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CONVENTS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_CONVENTS', 'LOC_SDG_CONVENTS', 'LOC_SDG_CONVENTS_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CONVENTS', 'SDG_CONVENTS_CITY_ADDS_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CONVENTS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'SDG_REQSET_CITY_HAS_SHRINE_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CONVENTS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_CONVENTS_HOUSING') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_CONVENTS_HOUSING', 'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_HOUSING') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CONVENTS_HOUSING', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CONVENTS', 'SDG_CONVENTS_CITY_ADDS_PRODUCTION_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_CONVENTS_CITY_ADDS_PRODUCTION_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_CONVENTS_CITY_ADDS_PRODUCTION_MODIFIER', 'ModifierId', 'SDG_CONVENTS_PRODUCTION_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_CONVENTS_PRODUCTION_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_CONVENTS_PRODUCTION_YIELD', 'BuildingType', 'BUILDING_SHRINE'),
							  ('SDG_CONVENTS_PRODUCTION_YIELD', 'YieldType', 'YIELD_PRODUCTION'),
                              ('SDG_CONVENTS_PRODUCTION_YIELD', 'Amount', 1) ;


-- ------------------------------------
-- ------------------------------------
--  Monasteries
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_MONASTERIES', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_MONASTERIES', 'LOC_SDG_MONASTERIES', 'LOC_SDG_MONASTERIES_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_MONASTERIES', 'SDG_MONASTERIES_CITY_ADDS_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MONASTERIES_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'SDG_REQSET_CITY_HAS_TEMPLE_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MONASTERIES_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_MONASTERIES_HOUSING') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_MONASTERIES_HOUSING', 'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_HOUSING') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MONASTERIES_HOUSING', 'Amount', 2) ;


-- ------------------------------------
-- ------------------------------------
--  Abbeys
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABBEYS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ABBEYS', 'LOC_SDG_ABBEYS', 'LOC_SDG_ABBEYS_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ABBEYS', 'SDG_ABBEYS_CITY_ADDS_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABBEYS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'SDG_REQSET_CITY_HAS_LEVEL3_HSBUILDING_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABBEYS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_ABBEYS_HOUSING') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ABBEYS_HOUSING', 'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_HOUSING') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABBEYS_HOUSING', 'Amount', 3) ;



-- ------------------------------------
-- ------------------------------------
--  Food Bank
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FOOD_BANK', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_FOOD_BANK', 'LOC_SDG_FOOD_BANK', 'LOC_SDG_FOOD_BANK_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_FOOD_BANK', 'SDG_FOOD_BANK_CITY_ADDS_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_FOOD_BANK_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_FOOD_BANK_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_FOOD_BANK_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_FOOD_BANK_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_FOOD_BANK_YIELD', 'BuildingType', 'BUILDING_SHRINE'),
							  ('SDG_FOOD_BANK_YIELD', 'YieldType', 'YIELD_FOOD'),
                              ('SDG_FOOD_BANK_YIELD', 'Amount', 3) ;


-- ------------------------------------
-- ------------------------------------
--  Joseph
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JOSEPH', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_JOSEPH', 'LOC_SDG_JOSEPH', 'LOC_SDG_JOSEPH_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JOSEPH', 'SDG_JOSEPH_CITY_ADDS_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_JOSEPH_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_JOSEPH_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_JOSEPH_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_JOSEPH_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_JOSEPH_YIELD', 'BuildingType', 'BUILDING_TEMPLE'),
							  ('SDG_JOSEPH_YIELD', 'YieldType', 'YIELD_FOOD'),
                              ('SDG_JOSEPH_YIELD', 'Amount', 4) ;


-- ------------------------------------
-- ------------------------------------
--  Food for Peace
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_FOOD_FOR_PEACE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_FOOD_FOR_PEACE', 'LOC_SDG_FOOD_FOR_PEACE', 'LOC_SDG_FOOD_FOR_PEACE_DESC', 'SDG_BELIEF_CLASS_999') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  SELECT 'SDG_FOOD_FOR_PEACE', 'SDG_FOOD_FOR_PEACE_' || SUBSTR(BuildingType, 10) FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  SELECT 'SDG_FOOD_FOR_PEACE_' || SUBSTR(BuildingType, 10), 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_FOOD_FOR_PEACE_' || SUBSTR(BuildingType, 10), 'ModifierId', 'SDG_FOOD_FOR_PEACE_' || SUBSTR(BuildingType, 10) || '_YIELD' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO Modifiers (ModifierId, ModifierType)
  SELECT 'SDG_FOOD_FOR_PEACE_' || SUBSTR(BuildingType, 10) || '_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_FOOD_FOR_PEACE_' || SUBSTR(BuildingType, 10) || '_YIELD', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_FOOD_FOR_PEACE_' || SUBSTR(BuildingType, 10) || '_YIELD', 'YieldType', 'YIELD_FOOD' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_FOOD_FOR_PEACE_' || SUBSTR(BuildingType, 10) || '_YIELD', 'Amount', 5 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';






-- ------------------------------------
-- ------------------------------------
--  Oktoberfest (was Goddess of Harvest)
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_OKTOBERFEST', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_OKTOBERFEST', 'LOC_SDG_OKTOBERFEST', 'LOC_SDG_OKTOBERFEST_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES 
							('SDG_OKTOBERFEST', 'GODDESS_OF_THE_HARVEST_HARVEST'),
							('SDG_OKTOBERFEST', 'GODDESS_OF_THE_HARVEST_REMOVE_FEATURE') ; 
UPDATE Modifiers SET SubjectRequirementSetId = 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS' WHERE ModifierId = 'GODDESS_OF_THE_HARVEST_HARVEST' ;
UPDATE Modifiers SET SubjectRequirementSetId = 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS' WHERE ModifierId = 'GODDESS_OF_THE_HARVEST_REMOVE_FEATURE' ;


-- ------------------------------------
-- ------------------------------------
--  Crazy Horse
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CRAZY_HORSE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_CRAZY_HORSE', 'LOC_SDG_CRAZY_HORSE', 'LOC_SDG_CRAZY_HORSE_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CRAZY_HORSE', 'SDG_CRAZY_HORSE_PLAYERS_ATTACH_MODIFIER_HOLY_SITE') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CRAZY_HORSE_PLAYERS_ATTACH_MODIFIER_HOLY_SITE', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CRAZY_HORSE_PLAYERS_ATTACH_MODIFIER_HOLY_SITE', 'ModifierId', 'SDG_CRAZY_HORSE_CULTURE_BOMB_TRIGGER_HOLY_SITE') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_CRAZY_HORSE_CULTURE_BOMB_TRIGGER_HOLY_SITE', 'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CRAZY_HORSE_CULTURE_BOMB_TRIGGER_HOLY_SITE', 'DistrictType', 'DISTRICT_HOLY_SITE') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CRAZY_HORSE', 'SDG_CRAZY_HORSE_PLAYERS_ATTACH_MODIFIER_GREAT_SERMON') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CRAZY_HORSE_PLAYERS_ATTACH_MODIFIER_GREAT_SERMON', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CRAZY_HORSE_PLAYERS_ATTACH_MODIFIER_GREAT_SERMON', 'ModifierId', 'SDG_CRAZY_HORSE_CULTURE_BOMB_TRIGGER_GREAT_SERMON') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_CRAZY_HORSE_CULTURE_BOMB_TRIGGER_GREAT_SERMON', 'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CRAZY_HORSE_CULTURE_BOMB_TRIGGER_GREAT_SERMON', 'ImprovementType', 'SDG_IMPROVEMENT_GREAT_SERMON') ;


-- ------------------------------------
-- ------------------------------------
--  Abide With Me
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABIDE_WITH_ME', 'KIND_BELIEF') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ABIDE_WITH_ME', 'LOC_SDG_ABIDE_WITH_ME', 'LOC_SDG_ABIDE_WITH_ME_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ABIDE_WITH_ME', 'SDG_ABIDE_WITH_ME_PLAYERS_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABIDE_WITH_ME_PLAYERS_ATTACH_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABIDE_WITH_ME_PLAYERS_ATTACH_MODIFIER', 'ModifierId', 'SDG_ABIDE_WITH_ME_WILDCARD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABIDE_WITH_ME_WILDCARD', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER', 'PLAYER_HAS_DARK_AGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABIDE_WITH_ME_WILDCARD', 'GovernmentSlotType', 'SLOT_WILDCARD') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ABIDE_WITH_ME', 'SDG_ABIDE_WITH_ME_CONVERTED_PLAYERS_ATTACH_MODIFIER') ;

-- RunOnce & Permanent Are Set
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, RunOnce, Permanent) VALUES ('SDG_ABIDE_WITH_ME_CONVERTED_PLAYERS_ATTACH_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_CITY_CONVERTED', 1, 1) ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABIDE_WITH_ME_CONVERTED_PLAYERS_ATTACH_MODIFIER', 'ModifierId', 'SDG_ABIDE_WITH_ME_WILDCARD') ;
/*
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ABIDE_WITH_ME_WILDCARD', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER', 'PLAYER_HAS_DARK_AGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ABIDE_WITH_ME_WILDCARD', 'GovernmentSlotType', 'SLOT_WILDCARD') ;
*/


-- ------------------------------------
-- ------------------------------------
--  Lincoln's Second Inaugural
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_LINCOLNS_SECOND', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_LINCOLNS_SECOND', 'LOC_SDG_LINCOLNS_SECOND', 'LOC_SDG_LINCOLNS_SECOND_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_LINCOLNS_SECOND', 'SDG_LINCOLNS_SECOND_PLAYERS_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_LINCOLNS_SECOND_PLAYERS_ATTACH_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_LINCOLNS_SECOND_PLAYERS_ATTACH_MODIFIER', 'ModifierId', 'SDG_LINCOLNS_SECOND_WARWEARINESS') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_LINCOLNS_SECOND_WARWEARINESS', 'MODIFIER_PLAYER_ADJUST_WAR_WEARINESS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_LINCOLNS_SECOND_WARWEARINESS', 'Overall', 1),
                              ('SDG_LINCOLNS_SECOND_WARWEARINESS', 'Amount', -50) ;


-- ------------------------------------
-- ------------------------------------
--  Scripture
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SCRIPTURE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_SCRIPTURE', 'LOC_SDG_SCRIPTURE', 'LOC_SDG_SCRIPTURE_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SCRIPTURE', 'SDG_SCRIPTURE_SPREAD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SCRIPTURE_SPREAD', 'SDG_CITIES_ADJUST_RELIGION_PRESSURE', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SCRIPTURE_SPREAD', 'Amount', 25) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SCRIPTURE', 'SDG_SCRIPTURE_SPREAD_PRINTING') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SCRIPTURE_SPREAD_PRINTING', 'SDG_CITIES_ADJUST_RELIGION_PRESSURE', 'SDG_REQSET_CITY_HAS_PRINT_SHOP_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SCRIPTURE_SPREAD_PRINTING', 'Amount', 50) ;


-- ------------------------------------
-- ------------------------------------
--  Closed Canon
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CLOSED_CANON', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_CLOSED_CANON', 'LOC_SDG_CLOSED_CANON', 'LOC_SDG_CLOSED_CANON_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CLOSED_CANON', 'SDG_CLOSED_CANON_SPREAD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CLOSED_CANON_SPREAD', 'SDG_CITIES_ADJUST_RELIGION_PRESSURE', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CLOSED_CANON_SPREAD', 'Amount', 50) ;


-- ------------------------------------
-- ------------------------------------
--  95 Theses
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_95_THESES', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_95_THESES', 'LOC_SDG_95_THESES', 'LOC_SDG_95_THESES_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_95_THESES', 'SDG_95_THESES_SPREAD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_95_THESES_SPREAD', 'SDG_CITIES_ADJUST_RELIGION_PRESSURE', 'SDG_REQSET_CITY_HAS_PRINT_SHOP_AND_FOLLOWS_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_95_THESES_SPREAD', 'Amount', 100) ;




-- ------------------------------------
-- ------------------------------------
--  Euaggelion
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_EUAGGELION', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_EUAGGELION', 'LOC_SDG_EUAGGELION', 'LOC_SDG_EUAGGELION_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_EUAGGELION', 'SDG_EUAGGELION_SPREAD') ; 
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_EUAGGELION_SPREAD', 'MODIFIER_PLAYER_RELIGION_ADJUST_RELIGIOUS_SPREAD_DISTANCE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_EUAGGELION_SPREAD', 'DistanceChange', '3') ;


-- ------------------------------------
-- ------------------------------------
--  Plymouth Colony
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PLYMOUTH_COLONY', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_PLYMOUTH_COLONY', 'LOC_SDG_PLYMOUTH_COLONY', 'LOC_SDG_PLYMOUTH_COLONY_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PLYMOUTH_COLONY', 'RELIGIOUS_COLONIZATION_AUTO_SPREAD') ; 




-- ------------------------------------
-- ------------------------------------
--  Apostolic Nunciature
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_APOSTOLIC_NUNCIATURE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_APOSTOLIC_NUNCIATURE', 'LOC_SDG_APOSTOLIC_NUNCIATURE', 'LOC_SDG_APOSTOLIC_NUNCIATURE_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_APOSTOLIC_NUNCIATURE', 'RELIGIOUS_UNITY_ENVOY_ON_ADOPTION') ; 


-- ------------------------------------
-- ------------------------------------
--  Papal Primacy
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PAPAL_PRIMACY', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_PAPAL_PRIMACY', 'LOC_SDG_PAPAL_PRIMACY', 'LOC_SDG_PAPAL_PRIMACY_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PAPAL_PRIMACY', 'PAPAL_PRIMACY_PRESSURE_ON_ADOPTION') ; 







-- ------------------------------------
-- ------------------------------------
--  Pilgrimage
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PILGRIMAGE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_PILGRIMAGE', 'LOC_SDG_PILGRIMAGE', 'LOC_SDG_PILGRIMAGE_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PILGRIMAGE', 'SDG_PILGRIMAGE_FAITH_PLAYER_APPLIES_MODIFIER') ; 

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_PILGRIMAGE_FAITH_PLAYER_APPLIES_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_PILGRIMAGE_FAITH_PLAYER_APPLIES_MODIFIER', 'ModifierId', 'SDG_PILGRIMAGE_FAITH_PER_FOREIGN_FOLLOWER') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_PILGRIMAGE_FAITH_PER_FOREIGN_FOLLOWER', 'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BELIEF_YIELD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_PILGRIMAGE_FAITH_PER_FOREIGN_FOLLOWER', 'Amount', 1),
							  ('SDG_PILGRIMAGE_FAITH_PER_FOREIGN_FOLLOWER', 'BeliefYieldType', 'BELIEF_YIELD_PER_FOREIGN_FOLLOWER'),
							  ('SDG_PILGRIMAGE_FAITH_PER_FOREIGN_FOLLOWER', 'PerXItems', 3),
							  ('SDG_PILGRIMAGE_FAITH_PER_FOREIGN_FOLLOWER', 'YieldType', 'YIELD_FAITH') ;


-- ------------------------------------
-- ------------------------------------
--  Qibla
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_QIBLA', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_QIBLA', 'LOC_SDG_QIBLA', 'LOC_SDG_QIBLA_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_QIBLA', 'SDG_QIBLA_FAITH_PLAYER_APPLIES_MODIFIER') ; 

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_QIBLA_FAITH_PLAYER_APPLIES_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_QIBLA_FAITH_PLAYER_APPLIES_MODIFIER', 'ModifierId', 'SDG_QIBLA_FAITH_PER_FOREIGN_CITY') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_QIBLA_FAITH_PER_FOREIGN_CITY', 'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BELIEF_YIELD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_QIBLA_FAITH_PER_FOREIGN_CITY', 'Amount', 2),
							  ('SDG_QIBLA_FAITH_PER_FOREIGN_CITY', 'BeliefYieldType', 'BELIEF_YIELD_PER_FOREIGN_CITY'),
							  ('SDG_QIBLA_FAITH_PER_FOREIGN_CITY', 'PerXItems', 1),
							  ('SDG_QIBLA_FAITH_PER_FOREIGN_CITY', 'YieldType', 'YIELD_FAITH') ;


-- ------------------------------------
-- ------------------------------------
--  Cross Culture Dialogue
--  TODO: Name
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CROSS_CULTURE_DIALOGUE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_CROSS_CULTURE_DIALOGUE', 'LOC_SDG_CROSS_CULTURE_DIALOGUE', 'LOC_SDG_CROSS_CULTURE_DIALOGUE_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CROSS_CULTURE_DIALOGUE', 'SDG_CROSS_CULTURAL_DIALOGUE_SCIENCE_PLAYER_APPLIES_MODIFIER') ; 

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CROSS_CULTURAL_DIALOGUE_SCIENCE_PLAYER_APPLIES_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CROSS_CULTURAL_DIALOGUE_SCIENCE_PLAYER_APPLIES_MODIFIER', 'ModifierId', 'SDG_CROSS_CULTURAL_DIALOGUE_SCIENCE_PER_FOREIGN_FOLLOWER') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_CROSS_CULTURAL_DIALOGUE_SCIENCE_PER_FOREIGN_FOLLOWER', 'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BELIEF_YIELD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_CROSS_CULTURAL_DIALOGUE_SCIENCE_PER_FOREIGN_FOLLOWER', 'Amount', '1'),
							  ('SDG_CROSS_CULTURAL_DIALOGUE_SCIENCE_PER_FOREIGN_FOLLOWER', 'BeliefYieldType', 'BELIEF_YIELD_PER_FOREIGN_FOLLOWER'),
							  ('SDG_CROSS_CULTURAL_DIALOGUE_SCIENCE_PER_FOREIGN_FOLLOWER', 'PerXItems', '5'),
							  ('SDG_CROSS_CULTURAL_DIALOGUE_SCIENCE_PER_FOREIGN_FOLLOWER', 'YieldType', 'YIELD_SCIENCE') ;

-- ------------------------------------
-- ------------------------------------
--  World Church
--  TODO: Name
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_WORLD_CHURCH', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_WORLD_CHURCH', 'LOC_SDG_WORLD_CHURCH', 'LOC_SDG_WORLD_CHURCH_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_WORLD_CHURCH', 'SDG_WORLD_CHURCH_CULTURE_PLAYER_APPLIES_MODIFIER') ; 

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_WORLD_CHURCH_CULTURE_PLAYER_APPLIES_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_WORLD_CHURCH_CULTURE_PLAYER_APPLIES_MODIFIER', 'ModifierId', 'SDG_WORLD_CHURCH_CULTURE_PER_FOREIGN_FOLLOWER') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_WORLD_CHURCH_CULTURE_PER_FOREIGN_FOLLOWER', 'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BELIEF_YIELD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_WORLD_CHURCH_CULTURE_PER_FOREIGN_FOLLOWER', 'Amount', '1'),
							  ('SDG_WORLD_CHURCH_CULTURE_PER_FOREIGN_FOLLOWER', 'BeliefYieldType', 'BELIEF_YIELD_PER_FOREIGN_FOLLOWER'),
							  ('SDG_WORLD_CHURCH_CULTURE_PER_FOREIGN_FOLLOWER', 'PerXItems', '5'),
							  ('SDG_WORLD_CHURCH_CULTURE_PER_FOREIGN_FOLLOWER', 'YieldType', 'YIELD_CULTURE') ;

-- ------------------------------------
-- ------------------------------------
--  Tithe
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_TITHE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_TITHE', 'LOC_SDG_TITHE', 'LOC_SDG_TITHE_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_TITHE', 'SDG_TITHE_GOLD_PLAYER_APPLIES_MODIFIER') ; 

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_TITHE_GOLD_PLAYER_APPLIES_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_TITHE_GOLD_PLAYER_APPLIES_MODIFIER', 'ModifierId', 'SDG_TITHE_GOLD_PER_X_FOLLOWERS') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_TITHE_GOLD_PER_X_FOLLOWERS', 'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BELIEF_YIELD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_TITHE_GOLD_PER_X_FOLLOWERS', 'Amount', '1'),
							  ('SDG_TITHE_GOLD_PER_X_FOLLOWERS', 'BeliefYieldType', 'BELIEF_YIELD_PER_FOLLOWER'),
							  ('SDG_TITHE_GOLD_PER_X_FOLLOWERS', 'PerXItems', '4'),
							  ('SDG_TITHE_GOLD_PER_X_FOLLOWERS', 'YieldType', 'YIELD_GOLD') ;


-- ------------------------------------
-- ------------------------------------
--  Church Property
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CHURCH_PROPERTY', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_CHURCH_PROPERTY', 'LOC_SDG_CHURCH_PROPERTY', 'LOC_SDG_CHURCH_PROPERTY_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CHURCH_PROPERTY', 'SDG_CHURCH_PROPERTY_GOLD_PLAYER_APPLIES_MODIFIER') ; 

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CHURCH_PROPERTY_GOLD_PLAYER_APPLIES_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CHURCH_PROPERTY_GOLD_PLAYER_APPLIES_MODIFIER', 'ModifierId', 'SDG_CHURCH_PROPERTY_GOLD_PER_CITY') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BELIEF_YIELD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'Amount', '2'),
							  ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'BeliefYieldType', 'BELIEF_YIELD_PER_CITY'),
							  ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'PerXItems', '1'),
							  ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'YieldType', 'YIELD_GOLD') ;

-- Doesn't do anything
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CHURCH_PROPERTY', 'SDG_CHURCH_PROPERTY_CONVERTED_PLAYERS_ATTACH_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CHURCH_PROPERTY_CONVERTED_PLAYERS_ATTACH_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_CITY_CONVERTED') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CHURCH_PROPERTY_CONVERTED_PLAYERS_ATTACH_MODIFIER', 'ModifierId', 'SDG_CHURCH_PROPERTY_GOLD_PER_CITY') ;
/*
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_BELIEF_YIELD') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'Amount', '2'),
							  ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'BeliefYieldType', 'BELIEF_YIELD_PER_CITY'),
							  ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'PerXItems', '1'),
							  ('SDG_CHURCH_PROPERTY_GOLD_PER_CITY', 'YieldType', 'YIELD_GOLD') ;
*/


-- ------------------------------------
-- ------------------------------------
--  The Great Commission
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_THE_GREAT_COMMISSION', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_THE_GREAT_COMMISSION', 'LOC_SDG_THE_GREAT_COMMISSION', 'LOC_SDG_THE_GREAT_COMMISSION_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES 
							('SDG_THE_GREAT_COMMISSION', 'SDG_THE_GREAT_COMMISSION_APOSTLE') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
                      ('SDG_THE_GREAT_COMMISSION_APOSTLE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_THE_GREAT_COMMISSION_APOSTLE', 'ModifierId', 'SDG_THE_GREAT_COMMISSION_APOSTLE_DISCOUNT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES 
                      ('SDG_THE_GREAT_COMMISSION_APOSTLE_DISCOUNT', 'SDG_ADJUST_CITY_UNIT_COST') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_THE_GREAT_COMMISSION_APOSTLE_DISCOUNT', 'Amount', 30),
							  ('SDG_THE_GREAT_COMMISSION_APOSTLE_DISCOUNT', 'UnitType', 'UNIT_APOSTLE') ;


-- ------------------------------------
-- ------------------------------------
--  Shaker Celibacy
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_SHAKER_CELIBACY', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_SHAKER_CELIBACY', 'LOC_SDG_SHAKER_CELIBACY', 'LOC_SDG_SHAKER_CELIBACY_DESC', 'SDG_BELIEF_CLASS_999') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_PLAYERS_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHAKER_CELIBACY_PLAYERS_ATTACH_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_FOUNDED_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_PLAYERS_ATTACH_MODIFIER', 'ModifierId', 'SDG_SHAKER_CELIBACY_GROWTH') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_SHAKER_CELIBACY_GROWTH', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHAKER_CELIBACY_GROWTH', 'Amount', -150) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES 
							('SDG_SHAKER_CELIBACY', 'SDG_SHAKER_CELIBACY_MISSIONARY') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
					  ('SDG_SHAKER_CELIBACY_MISSIONARY', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_SHAKER_CELIBACY_MISSIONARY', 'ModifierId', 'SDG_SHAKER_CELIBACY_MISSIONARY_DISCOUNT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES 
					  ('SDG_SHAKER_CELIBACY_MISSIONARY_DISCOUNT', 'SDG_ADJUST_CITY_UNIT_COST') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_SHAKER_CELIBACY_MISSIONARY_DISCOUNT', 'Amount', 80),
							  ('SDG_SHAKER_CELIBACY_MISSIONARY_DISCOUNT', 'UnitType', 'UNIT_MISSIONARY') ;


-- ------------------------------------
-- ------------------------------------
--  Chariots of Fire
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CHARIOTS_OF_FIRE', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_CHARIOTS_OF_FIRE', 'LOC_SDG_CHARIOTS_OF_FIRE', 'LOC_SDG_CHARIOTS_OF_FIRE_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CHARIOTS_OF_FIRE', 'SDG_CHARIOTS_OF_FIRE_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CHARIOTS_OF_FIRE_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_CHARIOTS_OF_FIRE_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_CHARIOTS_OF_FIRE_GRANT_UNIT_ABILITY') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_CHARIOTS_OF_FIRE_GRANT_UNIT_ABILITY', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_CHARIOTS_OF_FIRE_GRANT_UNIT_ABILITY', 'AbilityType', 'ABILITY_RELIGIOUS_IGNORE_TERRAIN_COST') ;


-- ------------------------------------
-- ------------------------------------
--  Zen Meditation
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ZEN_MEDITATION', 'KIND_BELIEF') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ZEN_MEDITATION', 'LOC_SDG_ZEN_MEDITATION', 'LOC_SDG_ZEN_MEDITATION_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ZEN_MEDITATION', 'SDG_ZEN_MEDITATION_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ZEN_MEDITATION_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_WITH_2 DISTRICTS_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ZEN_MEDITATION_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ZEN_MEDITATION_AMENITY') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ZEN_MEDITATION_AMENITY', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_AMENITIES_FROM_RELIGION') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ZEN_MEDITATION_AMENITY', 'Amount', 2) ;


-- ------------------------------------
-- ------------------------------------
--  Kibbutzim
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_KIBBUTZIM', 'KIND_BELIEF') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_KIBBUTZIM', 'LOC_SDG_KIBBUTZIM', 'LOC_SDG_KIBBUTZIM_DESC', 'SDG_BELIEF_CLASS_999') ;

--    1 FOOD on FARM
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES 
                            ('SDG_KIBBUTZIM', 'SDG_KIBBUTZIM_FOOD_CITY_APPLIES_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
                      ('SDG_KIBBUTZIM_FOOD_CITY_APPLIES_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_KIBBUTZIM_FOOD_CITY_APPLIES_MODIFIER', 'ModifierId', 'SDG_KIBBUTZIM_FOOD_INCREASES_ON_FARM') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
                      ('SDG_KIBBUTZIM_FOOD_INCREASES_ON_FARM', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_FARM_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_KIBBUTZIM_FOOD_INCREASES_ON_FARM', 'YieldType', 'YIELD_FOOD'),
							  ('SDG_KIBBUTZIM_FOOD_INCREASES_ON_FARM', 'Amount', 1) ;
--    1 FOOD on TERRACE_FARM
INSERT INTO Requirements (RequirementId, RequirementType, ProgressWeight) VALUES
						 ('SDG_REQ_PLOT_HAS_TERRACE_FARM', 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES', 1);
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
                                 ('SDG_REQ_PLOT_HAS_TERRACE_FARM', 'ImprovementType', 'IMPROVEMENT_TERRACE_FARM');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
                            ('SDG_REQSET_PLOT_HAS_TERRACE_FARM', 'REQUIREMENTSET_TEST_ALL') ;
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
                            ('SDG_REQSET_PLOT_HAS_TERRACE_FARM', 'SDG_REQ_PLOT_HAS_TERRACE_FARM') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES 
                            ('SDG_KIBBUTZIM', 'SDG_KIBBUTZIM_FOOD_TERRACE_CITY_APPLIES_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
                      ('SDG_KIBBUTZIM_FOOD_TERRACE_CITY_APPLIES_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_KIBBUTZIM_FOOD_TERRACE_CITY_APPLIES_MODIFIER', 'ModifierId', 'SDG_KIBBUTZIM_FOOD_INCREASES_ON_TERRACE_FARM') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
                      ('SDG_KIBBUTZIM_FOOD_INCREASES_ON_TERRACE_FARM', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'SDG_REQSET_PLOT_HAS_TERRACE_FARM') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_KIBBUTZIM_FOOD_INCREASES_ON_TERRACE_FARM', 'YieldType', 'YIELD_FOOD'),
							  ('SDG_KIBBUTZIM_FOOD_INCREASES_ON_TERRACE_FARM', 'Amount', 1) ;
							    




-- ------------------------------------
-- ------------------------------------
--  Hymns
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HYMNS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_HYMNS', 'LOC_SDG_HYMNS', 'LOC_SDG_HYMNS_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HYMNS', 'SDG_HYMNS_CITY_ADDS_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_HYMNS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_HYMNS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_HYMNS_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_HYMNS_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_HYMNS_YIELD', 'BuildingType', 'BUILDING_SHRINE'),
							  ('SDG_HYMNS_YIELD', 'YieldType', 'YIELD_CULTURE'),
                              ('SDG_HYMNS_YIELD', 'Amount', 3) ;


-- ------------------------------------
-- ------------------------------------
--  Oratorios
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ORATORIOS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ORATORIOS', 'LOC_SDG_ORATORIOS', 'LOC_SDG_ORATORIOS_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ORATORIOS', 'SDG_ORATORIOS_CITY_ADDS_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_ORATORIOS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_ORATORIOS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_ORATORIOS_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_ORATORIOS_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_ORATORIOS_YIELD', 'BuildingType', 'BUILDING_TEMPLE'),
							  ('SDG_ORATORIOS_YIELD', 'YieldType', 'YIELD_CULTURE'),
                              ('SDG_ORATORIOS_YIELD', 'Amount', 4) ;


-- ------------------------------------
-- ------------------------------------
--  Requiem Masses
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_REQUIEM_MASSES', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_REQUIEM_MASSES', 'LOC_SDG_REQUIEM_MASSES', 'LOC_SDG_REQUIEM_MASSES_DESC', 'SDG_BELIEF_CLASS_999') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  SELECT 'SDG_REQUIEM_MASSES', 'SDG_REQUIEM_MASSES_' || SUBSTR(BuildingType, 10) FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  SELECT 'SDG_REQUIEM_MASSES_' || SUBSTR(BuildingType, 10), 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_REQUIEM_MASSES_' || SUBSTR(BuildingType, 10), 'ModifierId', 'SDG_REQUIEM_MASSES_' || SUBSTR(BuildingType, 10) || '_YIELD' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO Modifiers (ModifierId, ModifierType)
  SELECT 'SDG_REQUIEM_MASSES_' || SUBSTR(BuildingType, 10) || '_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_REQUIEM_MASSES_' || SUBSTR(BuildingType, 10) || '_YIELD', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_REQUIEM_MASSES_' || SUBSTR(BuildingType, 10) || '_YIELD', 'YieldType', 'YIELD_CULTURE' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_REQUIEM_MASSES_' || SUBSTR(BuildingType, 10) || '_YIELD', 'Amount', 5 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';


-- ------------------------------------
-- ------------------------------------
--  Zacchaeus
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ZACCHAEUS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ZACCHAEUS', 'LOC_SDG_ZACCHAEUS', 'LOC_SDG_ZACCHAEUS_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ZACCHAEUS', 'SDG_ZACCHAEUS_CITY_ADDS_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_ZACCHAEUS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_ZACCHAEUS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_ZACCHAEUS_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_ZACCHAEUS_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_ZACCHAEUS_YIELD', 'BuildingType', 'BUILDING_SHRINE'),
							  ('SDG_ZACCHAEUS_YIELD', 'YieldType', 'YIELD_GOLD'),
                              ('SDG_ZACCHAEUS_YIELD', 'Amount', 4) ;


-- ------------------------------------
-- ------------------------------------
--  Gospel of Wealth
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_GOSPEL_OF_WEALTH', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_GOSPEL_OF_WEALTH', 'LOC_SDG_GOSPEL_OF_WEALTH', 'LOC_SDG_GOSPEL_OF_WEALTH_DESC', 'SDG_BELIEF_CLASS_999') ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_GOSPEL_OF_WEALTH', 'SDG_GOSPEL_OF_WEALTH_CITY_ADDS_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_GOSPEL_OF_WEALTH_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_GOSPEL_OF_WEALTH_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_GOSPEL_OF_WEALTH_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                            ('SDG_GOSPEL_OF_WEALTH_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_GOSPEL_OF_WEALTH_YIELD', 'BuildingType', 'BUILDING_TEMPLE'),
							  ('SDG_GOSPEL_OF_WEALTH_YIELD', 'YieldType', 'YIELD_GOLD'),
                              ('SDG_GOSPEL_OF_WEALTH_YIELD', 'Amount', 5) ;


-- ------------------------------------
-- ------------------------------------
--  Treasures In Heaven
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_TREASURES_IN_HEAVEN', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_TREASURES_IN_HEAVEN', 'LOC_SDG_TREASURES_IN_HEAVEN', 'LOC_SDG_TREASURES_IN_HEAVEN_DESC', 'SDG_BELIEF_CLASS_999') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID)
  SELECT 'SDG_TREASURES_IN_HEAVEN', 'SDG_TREASURES_IN_HEAVEN_' || SUBSTR(BuildingType, 10) FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
  SELECT 'SDG_TREASURES_IN_HEAVEN_' || SUBSTR(BuildingType, 10), 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_TREASURES_IN_HEAVEN_' || SUBSTR(BuildingType, 10), 'ModifierId', 'SDG_TREASURES_IN_HEAVEN_' || SUBSTR(BuildingType, 10) || '_YIELD' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO Modifiers (ModifierId, ModifierType)
  SELECT 'SDG_TREASURES_IN_HEAVEN_' || SUBSTR(BuildingType, 10) || '_YIELD', 'MODIFIER_BUILDING_YIELD_CHANGE' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_TREASURES_IN_HEAVEN_' || SUBSTR(BuildingType, 10) || '_YIELD', 'BuildingType', BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_TREASURES_IN_HEAVEN_' || SUBSTR(BuildingType, 10) || '_YIELD', 'YieldType', 'YIELD_GOLD' FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';
INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_TREASURES_IN_HEAVEN_' || SUBSTR(BuildingType, 10) || '_YIELD', 'Amount', 6 FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND BuildingType != 'BUILDING_SHRINE' AND BuildingType != 'BUILDING_TEMPLE' AND BuildingType != 'BUILDING_STAVE_CHURCH' AND BuildingType != 'BUILDING_PRASAT';



-- ------------------------------------
-- ------------------------------------
--  Joseph
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_JOSEPH', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_JOSEPH', 'LOC_SDG_JOSEPH', 'LOC_SDG_JOSEPH_DESC', 'SDG_BELIEF_CLASS_299') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 99 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_299' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_JOSEPH', 'SDG_JOSEPH_CITY_ADDS_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOSEPH_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_JOSEPH_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_JOSEPH_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_JOSEPH_YIELD', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DISTRICT_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_JOSEPH_YIELD', 'YieldType', 'YIELD_FOOD'),
                              ('SDG_JOSEPH_YIELD', 'Amount', 4) ;



-- ------------------------------------
-- ------------------------------------
--  RELIGIOUS_INDUSTRY
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_RELIGIOUS_INDUSTRY', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_RELIGIOUS_INDUSTRY', 'LOC_SDG_RELIGIOUS_INDUSTRY', 'LOC_SDG_RELIGIOUS_INDUSTRY_DESC', 'SDG_BELIEF_CLASS_299') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 99 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_299' ;

-- District bonus
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_RELIGIOUS_INDUSTRY', 'SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_INDUSTRIAL_ZONE_FAITH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_INDUSTRIAL_ZONE_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_INDUSTRIAL_ZONE_FAITH_MODIFIER', 'ModifierId', 'SDG_RELIGIOUS_INDUSTRY_INDUSTRIAL_ZONE_FAITH') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_RELIGIOUS_INDUSTRY_INDUSTRIAL_ZONE_FAITH', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DISTRICT_IS_INDUSTRIAL_ZONE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_RELIGIOUS_INDUSTRY_INDUSTRIAL_ZONE_FAITH', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_RELIGIOUS_INDUSTRY_INDUSTRIAL_ZONE_FAITH', 'Amount', 1) ;
-- District adjacency
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_RELIGIOUS_INDUSTRY', 'SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_INDUSTRIAL_ZONE_FAITH_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_INDUSTRIAL_ZONE_FAITH_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_INDUSTRIAL_ZONE_FAITH_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_RELIGIOUS_INDUSTRY_INDUSTRIAL_ZONE_FAITH_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_RELIGIOUS_INDUSTRY_INDUSTRIAL_ZONE_FAITH_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_INDUSTRIAL_ZONE_NEXT_TO_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_RELIGIOUS_INDUSTRY_INDUSTRIAL_ZONE_FAITH_ADJACENCY', 'Amount', 1),
							  ('SDG_RELIGIOUS_INDUSTRY_INDUSTRIAL_ZONE_FAITH_ADJACENCY', 'YieldType', 'YIELD_FAITH') ;

-- District bonus
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_RELIGIOUS_INDUSTRY', 'SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_HOLY_SITE_PRODUCTION_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_HOLY_SITE_PRODUCTION_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_HOLY_SITE_PRODUCTION_MODIFIER', 'ModifierId', 'SDG_RELIGIOUS_INDUSTRY_HOLY_SITE_PRODUCTION') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_RELIGIOUS_INDUSTRY_HOLY_SITE_PRODUCTION', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DISTRICT_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_RELIGIOUS_INDUSTRY_HOLY_SITE_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
                              ('SDG_RELIGIOUS_INDUSTRY_HOLY_SITE_PRODUCTION', 'Amount', 2) ;
-- District adjacency
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_RELIGIOUS_INDUSTRY', 'SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_HOLY_SITE_PRODUCTION_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_HOLY_SITE_PRODUCTION_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_RELIGIOUS_INDUSTRY_CITIES_ATTACH_HOLY_SITE_PRODUCTION_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_RELIGIOUS_INDUSTRY_HOLY_SITE_PRODUCTION_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_RELIGIOUS_INDUSTRY_HOLY_SITE_PRODUCTION_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_HOLY_SITE_NEXT_TO_INDUSTRIAL_ZONE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_RELIGIOUS_INDUSTRY_HOLY_SITE_PRODUCTION_ADJACENCY', 'Amount', 2),
							  ('SDG_RELIGIOUS_INDUSTRY_HOLY_SITE_PRODUCTION_ADJACENCY', 'YieldType', 'YIELD_PRODUCTION') ;


-- ------------------------------------
-- ------------------------------------
--  Harmony of the Spheres
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_HARMONY_OF_THE_SPHERES', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_HARMONY_OF_THE_SPHERES', 'LOC_SDG_HARMONY_OF_THE_SPHERES', 'LOC_SDG_HARMONY_OF_THE_SPHERES_DESC', 'SDG_BELIEF_CLASS_299') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HARMONY_OF_THE_SPHERES', 'SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_CAMPUS_FAITH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_CAMPUS_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_CAMPUS_FAITH_MODIFIER', 'ModifierId', 'SDG_HARMONY_OF_THE_SPHERES_CAMPUS_FAITH') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CAMPUS_FAITH', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_CAMPUS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_HARMONY_OF_THE_SPHERES_CAMPUS_FAITH', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_HARMONY_OF_THE_SPHERES_CAMPUS_FAITH', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HARMONY_OF_THE_SPHERES', 'SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_CAMPUS_FAITH_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_CAMPUS_FAITH_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_CAMPUS_FAITH_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_HARMONY_OF_THE_SPHERES_CAMPUS_FAITH_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CAMPUS_FAITH_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_CAMPUS_NEXT_TO_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_HARMONY_OF_THE_SPHERES_CAMPUS_FAITH_ADJACENCY', 'Amount', 1),
							  ('SDG_HARMONY_OF_THE_SPHERES_CAMPUS_FAITH_ADJACENCY', 'YieldType', 'YIELD_FAITH') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HARMONY_OF_THE_SPHERES', 'SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_HOLY_SITE_SCIENCE_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_HOLY_SITE_SCIENCE_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_HOLY_SITE_SCIENCE_MODIFIER', 'ModifierId', 'SDG_HARMONY_OF_THE_SPHERES_HOLY_SITE_SCIENCE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HARMONY_OF_THE_SPHERES_HOLY_SITE_SCIENCE', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_HARMONY_OF_THE_SPHERES_HOLY_SITE_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
                              ('SDG_HARMONY_OF_THE_SPHERES_HOLY_SITE_SCIENCE', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HARMONY_OF_THE_SPHERES', 'SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_HOLY_SITE_SCIENCE_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_HOLY_SITE_SCIENCE_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HARMONY_OF_THE_SPHERES_CITIES_ATTACH_HOLY_SITE_SCIENCE_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_HARMONY_OF_THE_SPHERES_HOLY_SITE_SCIENCE_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HARMONY_OF_THE_SPHERES_HOLY_SITE_SCIENCE_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_HOLY_SITE_NEXT_TO_CAMPUS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_HARMONY_OF_THE_SPHERES_HOLY_SITE_SCIENCE_ADJACENCY', 'Amount', 1),
							  ('SDG_HARMONY_OF_THE_SPHERES_HOLY_SITE_SCIENCE_ADJACENCY', 'YieldType', 'YIELD_SCIENCE') ;



-- ------------------------------------
-- ------------------------------------
--  Morality Plays
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_MORALITY_PLAYS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_MORALITY_PLAYS', 'LOC_SDG_MORALITY_PLAYS', 'LOC_SDG_MORALITY_PLAYS_DESC', 'SDG_BELIEF_CLASS_299') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 99 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_299' ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_MORALITY_PLAYS', 'SDG_MORALITY_PLAYS_CITIES_ATTACH_THEATER_SQUARE_FAITH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MORALITY_PLAYS_CITIES_ATTACH_THEATER_SQUARE_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MORALITY_PLAYS_CITIES_ATTACH_THEATER_SQUARE_FAITH_MODIFIER', 'ModifierId', 'SDG_MORALITY_PLAYS_THEATER_SQUARE_FAITH') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MORALITY_PLAYS_THEATER_SQUARE_FAITH', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_THEATER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_MORALITY_PLAYS_THEATER_SQUARE_FAITH', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_MORALITY_PLAYS_THEATER_SQUARE_FAITH', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_MORALITY_PLAYS', 'SDG_MORALITY_PLAYS_CITIES_ATTACH_THEATER_SQUARE_FAITH_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MORALITY_PLAYS_CITIES_ATTACH_THEATER_SQUARE_FAITH_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MORALITY_PLAYS_CITIES_ATTACH_THEATER_SQUARE_FAITH_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_MORALITY_PLAYS_THEATER_SQUARE_FAITH_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MORALITY_PLAYS_THEATER_SQUARE_FAITH_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_THEATER_NEXT_TO_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_MORALITY_PLAYS_THEATER_SQUARE_FAITH_ADJACENCY', 'Amount', 1),
							  ('SDG_MORALITY_PLAYS_THEATER_SQUARE_FAITH_ADJACENCY', 'YieldType', 'YIELD_FAITH') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_MORALITY_PLAYS', 'SDG_MORALITY_PLAYS_CITIES_ATTACH_HOLY_SITE_CULTURE_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MORALITY_PLAYS_CITIES_ATTACH_HOLY_SITE_CULTURE_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MORALITY_PLAYS_CITIES_ATTACH_HOLY_SITE_CULTURE_MODIFIER', 'ModifierId', 'SDG_MORALITY_PLAYS_HOLY_SITE_CULTURE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MORALITY_PLAYS_HOLY_SITE_CULTURE', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_MORALITY_PLAYS_HOLY_SITE_CULTURE', 'YieldType', 'YIELD_CULTURE'),
                              ('SDG_MORALITY_PLAYS_HOLY_SITE_CULTURE', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_MORALITY_PLAYS', 'SDG_MORALITY_PLAYS_CITIES_ATTACH_HOLY_SITE_CULTURE_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MORALITY_PLAYS_CITIES_ATTACH_HOLY_SITE_CULTURE_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MORALITY_PLAYS_CITIES_ATTACH_HOLY_SITE_CULTURE_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_MORALITY_PLAYS_HOLY_SITE_CULTURE_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MORALITY_PLAYS_HOLY_SITE_CULTURE_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_HOLY_SITE_NEXT_TO_THEATER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_MORALITY_PLAYS_HOLY_SITE_CULTURE_ADJACENCY', 'Amount', 1),
							  ('SDG_MORALITY_PLAYS_HOLY_SITE_CULTURE_ADJACENCY', 'YieldType', 'YIELD_CULTURE') ;


-- ------------------------------------
-- ------------------------------------
--  Acres of Diamonds
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ACRES_OF_DIAMONDS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_ACRES_OF_DIAMONDS', 'LOC_SDG_ACRES_OF_DIAMONDS', 'LOC_SDG_ACRES_OF_DIAMONDS_DESC', 'SDG_BELIEF_CLASS_299') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 99 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_299' ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ACRES_OF_DIAMONDS', 'SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_COMMERCIAL_HUB_FAITH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_COMMERCIAL_HUB_FAITH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_COMMERCIAL_HUB_FAITH_MODIFIER', 'ModifierId', 'SDG_ACRES_OF_DIAMONDS_COMMERCIAL_HUB_FAITH') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ACRES_OF_DIAMONDS_COMMERCIAL_HUB_FAITH', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DISTRICT_IS_COMMERCIAL_HUB') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ACRES_OF_DIAMONDS_COMMERCIAL_HUB_FAITH', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_ACRES_OF_DIAMONDS_COMMERCIAL_HUB_FAITH', 'Amount', 1) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ACRES_OF_DIAMONDS', 'SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_COMMERCIAL_HUB_FAITH_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_COMMERCIAL_HUB_FAITH_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_COMMERCIAL_HUB_FAITH_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_ACRES_OF_DIAMONDS_COMMERCIAL_HUB_FAITH_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ACRES_OF_DIAMONDS_COMMERCIAL_HUB_FAITH_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_COMMERCIAL_HUB_NEXT_TO_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ACRES_OF_DIAMONDS_COMMERCIAL_HUB_FAITH_ADJACENCY', 'Amount', 1),
							  ('SDG_ACRES_OF_DIAMONDS_COMMERCIAL_HUB_FAITH_ADJACENCY', 'YieldType', 'YIELD_FAITH') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ACRES_OF_DIAMONDS', 'SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_HOLY_SITE_GOLD_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_HOLY_SITE_GOLD_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_HOLY_SITE_GOLD_MODIFIER', 'ModifierId', 'SDG_ACRES_OF_DIAMONDS_HOLY_SITE_GOLD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ACRES_OF_DIAMONDS_HOLY_SITE_GOLD', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DISTRICT_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ACRES_OF_DIAMONDS_HOLY_SITE_GOLD', 'YieldType', 'YIELD_GOLD'),
                              ('SDG_ACRES_OF_DIAMONDS_HOLY_SITE_GOLD', 'Amount', 3) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ACRES_OF_DIAMONDS', 'SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_HOLY_SITE_GOLD_ADJACENCY_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_HOLY_SITE_GOLD_ADJACENCY_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACRES_OF_DIAMONDS_CITIES_ATTACH_HOLY_SITE_GOLD_ADJACENCY_MODIFIER', 'ModifierId', 'SDG_ACRES_OF_DIAMONDS_HOLY_SITE_GOLD_ADJACENCY') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ACRES_OF_DIAMONDS_HOLY_SITE_GOLD_ADJACENCY', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DB_REQSET_IS_HOLY_SITE_NEXT_TO_COMMERCIAL_HUB') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ACRES_OF_DIAMONDS_HOLY_SITE_GOLD_ADJACENCY', 'Amount', 3),
							  ('SDG_ACRES_OF_DIAMONDS_HOLY_SITE_GOLD_ADJACENCY', 'YieldType', 'YIELD_GOLD') ;


-- ------------------------------------
-- ------------------------------------
--  PROVOSTS
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_PROVOSTS', 'KIND_BELIEF') ; 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES ('SDG_PROVOSTS', 'LOC_SDG_PROVOSTS', 'LOC_SDG_PROVOSTS_DESC', 'SDG_BELIEF_CLASS_299') ;
UPDATE Beliefs SET BeliefClassType = 'SDG_BELIEF_CLASS_' || (SELECT cast(COUNT(BeliefType) + 99 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') WHERE BeliefClassType = 'SDG_BELIEF_CLASS_299' ;
INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_PROVOSTS', 'SDG_PROVOSTS_CITY_ADDS_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_PROVOSTS_CITY_ADDS_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('SDG_PROVOSTS_CITY_ADDS_MODIFIER', 'ModifierId', 'SDG_PROVOSTS_YIELD') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                            ('SDG_PROVOSTS_YIELD', 'DB_DM_ADJUST_DISTRICT_YIELD', 'DISTRICT_IS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
							  ('SDG_PROVOSTS_YIELD', 'YieldType', 'YIELD_FAITH'),
                              ('SDG_PROVOSTS_YIELD', 'Amount', 2) ;
