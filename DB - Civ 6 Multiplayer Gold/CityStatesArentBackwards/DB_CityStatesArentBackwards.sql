-- TODO: If the suzerain has a trade route to the city-state, they can levy its units for free

-- Remove Firaxis's 50% production penalty
DELETE FROM TraitModifiers WHERE ModifierId = 'MINOR_CIV_PRODUCTION_PENALTY' ;

-- City States can get any relevant district
UPDATE AiFavoredItems SET Favored = 1 WHERE ListType = 'MinorCivDistricts' AND Item NOT IN ('DISTRICT_SPACEPORT', 'DISTRICT_DIPLOMATIC_QUARTER', 'DISTRICT_GOVERNMENT') ;

-- Player's levy cost is 10% in gold of the production cost (Firaxis's value was 25%)
-- UPDATE GlobalParameters SET Value = 10 WHERE Name = 'LEVY_MILITARY_PERCENT_OF_UNIT_PURCHASE_COST' ;



DROP TABLE IF EXISTS DB_Citystate_Bonus_Flat ;
CREATE TABLE DB_Citystate_Bonus_Flat (Yield VARCHAR, Amount INT) ;

INSERT INTO DB_Citystate_Bonus_Flat (Yield, Amount) VALUES 
('FOOD', 0),
('PRODUCTION', 0),
('SCIENCE', 0),
('CULTURE', 0),
('GOLD', 0)
;

DROP TABLE IF EXISTS DB_Citystate_Bonus_Per_Pop ;
CREATE TABLE DB_Citystate_Bonus_Per_Pop (Yield VARCHAR, Amount INT) ;

INSERT INTO DB_Citystate_Bonus_Per_Pop (Yield, Amount) VALUES 
('FOOD', 1),
('PRODUCTION', 2),
('GOLD', 5)
;



DELETE FROM DB_Citystate_Bonus_Flat WHERE Amount <= 0 ;
DELETE FROM DB_Citystate_Bonus_Per_Pop WHERE Amount <= 0 ;

-- Flat Bonuses
INSERT OR IGNORE INTO GameModifiers (ModifierId)
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_FLAT' FROM DB_Citystate_Bonus_Flat ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_FLAT', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_IS_MINOR' FROM DB_Citystate_Bonus_Flat ; 
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_FLAT', 'ModifierId', 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_FLAT2' FROM DB_Citystate_Bonus_Flat ;
	
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) 
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_FLAT2', 'DB_DM_PLAYER_CITIES_ADJUST_YIELD' FROM DB_Citystate_Bonus_Flat ; 
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_FLAT2', 'YieldType', 'YIELD_' || Yield FROM DB_Citystate_Bonus_Flat ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_FLAT2', 'Amount', Amount FROM DB_Citystate_Bonus_Flat ;



-- Per-pop Bonuses
INSERT OR IGNORE INTO GameModifiers (ModifierId)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 90) 
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_PER_POP_' || x FROM DB_Citystate_Bonus_Per_Pop JOIN counter ;
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 90) 
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_PER_POP_' || x, 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_IS_MINOR' FROM DB_Citystate_Bonus_Per_Pop JOIN counter ; 
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 90) 
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_PER_POP_' || x, 'ModifierId', 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_PER_POP2_' || x FROM DB_Citystate_Bonus_Per_Pop JOIN counter ;
	
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 90) 
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_PER_POP2_' || x, 'DB_DM_PLAYER_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_' || x || '_POPULATION' FROM DB_Citystate_Bonus_Per_Pop JOIN counter ; 
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 90) 
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_PER_POP2_' || x, 'YieldType', 'YIELD_' || Yield FROM DB_Citystate_Bonus_Per_Pop JOIN counter ;
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
  WITH counter as (SELECT 1 x UNION SELECT x + 1 FROM counter WHERE x < 90) 
	SELECT 'DB_CITYSTATES_ARENT_BACKWARDS_' || Yield || '_PER_POP2_' || x, 'Amount', Amount FROM DB_Citystate_Bonus_Per_Pop JOIN counter ;
