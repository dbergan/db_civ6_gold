-- UPDATE ModifierArguments SET Value = 40 WHERE ModifierId = 'FRIENDLY_TERRITORY_COMBAT' AND Name = 'Amount' ; -- default 35

UPDATE Units SET SpreadCharges = 1 WHERE UnitType = 'UNIT_INQUISITOR' ;


--   This stops Mosque from giving Inquisitors a bonus spread
DELETE FROM TypeTags WHERE Type = 'UNIT_INQUISITOR' AND Tag = 'CLASS_RELIGIOUS_SPREAD' ;

--   This stops Exodus of the Evangelicals from giving Inquisitors bonus spreads (Golden Age commemoration)
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
                            ('DB_REQSET_UNIT_IS_APOSTLE_OR_MISSIONARY', 'REQUIREMENTSET_TEST_ANY') ;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
                                       ('DB_REQSET_UNIT_IS_APOSTLE_OR_MISSIONARY', 'DB_REQ_UNIT_IS_APOSTLE'),
                                       ('DB_REQSET_UNIT_IS_APOSTLE_OR_MISSIONARY', 'DB_REQ_UNIT_IS_MISSIONARY') ;
INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType, ProgressWeight) VALUES 
                         ('DB_REQ_UNIT_IS_APOSTLE_OR_MISSIONARY', 'REQUIREMENT_REQUIREMENTSET_IS_MET', 1) ;
INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value) VALUES
                                 ('DB_REQ_UNIT_IS_APOSTLE_OR_MISSIONARY', 'RequirementSetId', 'DB_REQSET_UNIT_IS_APOSTLE_OR_MISSIONARY') ;
UPDATE Modifiers SET SubjectRequirementSetId = 'DB_REQSET_UNIT_IS_APOSTLE_OR_MISSIONARY' WHERE ModifierId = 'COMMEMORATION_RELIGIOUS_GA_CHARGES_MODIFIER' ;


--	This stops Exodus of the Evangelicals from giving Inquisitors bonus spreads (Dramatic Ages policy)
UPDATE Modifiers SET SubjectRequirementSetId = 'DB_REQSET_UNIT_IS_APOSTLE_OR_MISSIONARY' WHERE ModifierId = 'POLICY_EXODUS_OF_THE_EVANGELISTS_GA_CHARGES' ;
