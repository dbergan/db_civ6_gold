DELETE FROM UnitCommands WHERE CommandType = 'UNITCOMMAND_CONDEMN_HERETIC' ;

INSERT INTO Requirements (RequirementId, RequirementType, Inverse, ProgressWeight) VALUES 
                         ('RCH_REQ_PLAYER_FOUNDED_RELIGION', 'REQUIREMENT_PLAYER_FOUNDED_NO_RELIGION', 1, 1) ;
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
                            ('RCH_REQSET_PLAYER_FOUNDED_RELIGION', 'REQUIREMENTSET_TEST_ALL') ;
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
                                       ('RCH_REQSET_PLAYER_FOUNDED_RELIGION', 'RCH_REQ_PLAYER_FOUNDED_RELIGION') ;


INSERT INTO GameModifiers (ModifierId) VALUES ('RCH_ATTACH_TO_PLAYERS') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
                      ('RCH_ATTACH_TO_PLAYERS', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'RCH_REQSET_PLAYER_FOUNDED_RELIGION') ;
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
                             ('RCH_ATTACH_TO_PLAYERS', 'ModifierId', 'RCH_CONDEMN_PROHIBITED') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                      ('RCH_CONDEMN_PROHIBITED', 'MODIFIER_RELIGION_ADJUST_CONDEMN_PROHIBITED') ;
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
                      ('RCH_CONDEMN_PROHIBITED', '', '') ;





/*
-- ------------------------------------
-- ------------------------------------
-- Make it so that the Condemn Heretic action always creates a relic for the victim (regardless of martyr promotion)
-- Doesn't work, can't figure it out... maybe it needs lua?
-- ------------------------------------
-- ------------------------------------
INSERT INTO GameModifiers (ModifierId) VALUES ("CONDEMN_HERETIC_ALWAYS_CREATES_A_RELIC") ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ("CONDEMN_HERETIC_ALWAYS_CREATES_A_RELIC", "???") ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ("???", "???", "???") ;
*/