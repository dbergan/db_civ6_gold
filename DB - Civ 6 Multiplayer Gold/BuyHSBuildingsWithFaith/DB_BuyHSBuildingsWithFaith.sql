-- All HS buildings can be purchased with Gold
UPDATE Buildings SET PurchaseYield = 'YIELD_GOLD' WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND PurchaseYield = 'YIELD_FAITH' ;

-- Game Modifier to allow all HS building to be purchased with Faith
INSERT INTO GameModifiers (ModifierId) VALUES ('DB_HSBUILDINGS_FAITH_PURCHASE') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('DB_HSBUILDINGS_FAITH_PURCHASE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'DB_REQSET_CITY_HAS_HOLY_SITE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('DB_HSBUILDINGS_FAITH_PURCHASE', 'ModifierId', 'DB_HSBUILDINGS_FAITH_PURCHASE_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('DB_HSBUILDINGS_FAITH_PURCHASE_MODIFIER', 'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('DB_HSBUILDINGS_FAITH_PURCHASE_MODIFIER', 'DistrictType', 'DISTRICT_HOLY_SITE') ;
