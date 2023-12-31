-- Remove all vanilla difficulty-based traits that affect humans
DELETE FROM TraitModifiers WHERE 
ModifierId = 'BARBARIAN_CAMP_GOLD_SCALING' OR 
ModifierId = 'LOW_DIFFICULTY_COMBAT_SCALING' OR 
ModifierId = 'LOW_DIFFICULTY_UNIT_XP_SCALING' ;

/* Here are the difficulty-based traits that affect the AI
ModifierId = 'HIGH_DIFFICULTY_SCIENCE_SCALING' OR 
ModifierId = 'HIGH_DIFFICULTY_CULTURE_SCALING' OR 
ModifierId = 'HIGH_DIFFICULTY_PRODUCTION_SCALING' OR 
ModifierId = 'HIGH_DIFFICULTY_GOLD_SCALING' OR 
ModifierId = 'HIGH_DIFFICULTY_FAITH_SCALING' OR 
ModifierId = 'HIGH_DIFFICULTY_COMBAT_SCALING' OR 
ModifierId = 'HIGH_DIFFICULTY_UNIT_XP_SCALING' OR 
ModifierId = 'HIGH_DIFFICULTY_FREE_TECH_BOOSTS' OR 
ModifierId = 'HIGH_DIFFICULTY_FREE_CIVIC_BOOSTS' ;
*/

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) VALUES ('DB_REQ_BELOW_DEITY', 'REQUIREMENT_PLAYER_HANDICAP_AT_OR_ABOVE', 1) ;
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('DB_REQ_BELOW_DEITY', 'Handicap', 'DIFFICULTY_DEITY') ;
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('DB_REQSET_PLAYER_IS_HUMAN_BELOW_DEITY', 'REQUIREMENTSET_TEST_ALL') ;
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('DB_REQSET_PLAYER_IS_HUMAN_BELOW_DEITY', 'REQUIRES_PLAYER_IS_HUMAN'),
('DB_REQSET_PLAYER_IS_HUMAN_BELOW_DEITY', 'DB_REQ_BELOW_DEITY') ;

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_LEADER_MAJOR_CIV', 'DB_DIFFICULTY_COMBAT_STRENGTH_SCALING_FOR_HUMANS') ;

INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES 
('DB_DIFFICULTY_COMBAT_STRENGTH_SCALING_FOR_HUMANS', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_DIFFICULTY', 'DB_REQSET_PLAYER_IS_HUMAN_BELOW_DEITY') ;

INSERT INTO ModifierArguments (ModifierId, Name, Type, Value, Extra, SecondExtra) VALUES 
('DB_DIFFICULTY_COMBAT_STRENGTH_SCALING_FOR_HUMANS', 'Amount', 'LinearScaleFromDefaultHandicap', 0, -2, 'DIFFICULTY_DEITY') ;

INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES
('DB_DIFFICULTY_COMBAT_STRENGTH_SCALING_FOR_HUMANS', 'Preview', 'LOC_DB_DIFFICULTY_COMBAT_STRENGTH_SCALING_FOR_HUMANS_PREVIEW') ;
