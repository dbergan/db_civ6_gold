INSERT INTO Modifiers (ModifierId, ModifierType) VALUES 
                      ('SDG_APOSTLE_MARTYR_COMBAT_STRENGTH_DECREASE', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_APOSTLE_MARTYR_COMBAT_STRENGTH_DECREASE', 'Amount', -100) ;
INSERT INTO UnitPromotionModifiers (UnitPromotionType, ModifierId) VALUES
								   ('PROMOTION_MARTYR', 'SDG_APOSTLE_MARTYR_COMBAT_STRENGTH_DECREASE') ;
/*
-- ------------------------------------
-- ------------------------------------
-- Apostles with martyr promotion gain the ability to radiate pressure (like a city would)
-- Doesn't work, can't figure it out... maybe it needs lua?
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES 
                  ('MODIFIER_UNIT_EXERT_RELIGIOUS_PRESSURE', 'KIND_MODIFIER') ;
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES 
                             ('MODIFIER_UNIT_EXERT_RELIGIOUS_PRESSURE', 'COLLECTION_UNIT_COMBAT', 'EFFECT_GRANT_RELIGIOUS_PRESSURE_BURST') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
                      ('MARTYR_EXERTS_RELIGIOUS_PRESSURE', 'MODIFIER_UNIT_EXERT_RELIGIOUS_PRESSURE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
                              ('MARTYR_EXERTS_RELIGIOUS_PRESSURE', 'Amount', '50'),
                              ('MARTYR_EXERTS_RELIGIOUS_PRESSURE', 'Range', '5') ;
*/

/*
-- ------------------------------------
-- ------------------------------------
-- Apostles with martyr promotion lose 70 attack strength and gain 990 spread charges (since we can't radiate pressure like a city)
-- If I remember right, they still spread at full strength, even though they are weaker
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('MODIFIER_UNIT_ADJUST_RELIGIOUS_SPREAD_STRENGTH', 'KIND_MODIFIER') ;
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES
                             ('MODIFIER_UNIT_ADJUST_RELIGIOUS_SPREAD_STRENGTH', 'COLLECTION_OWNER', 'EFFECT_ADJUST_RELIGIOUS_SPREAD_STRENGTH') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES 
                      ('APOSTLE_MARTYR_RELIGIOUS_STRENGTH_DECREASE', 'MODIFIER_UNIT_ADJUST_RELIGIOUS_SPREAD_STRENGTH'),
                      ('APOSTLE_MARTYR_COMBAT_STRENGTH_DECREASE', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH'),
                      ('APOSTLE_MARTYR_SPREAD_CHARGES_INCREASE', 'MODIFIER_PLAYER_UNIT_ADJUST_SPREAD_CHARGES') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('APOSTLE_MARTYR_RELIGIOUS_STRENGTH_DECREASE', 'Amount', '-70'),
                              ('APOSTLE_MARTYR_COMBAT_STRENGTH_DECREASE', 'Amount', '-70'),
                              ('APOSTLE_MARTYR_SPREAD_CHARGES_INCREASE', 'Amount', '990') ;
INSERT INTO UnitPromotionModifiers (UnitPromotionType, ModifierId) VALUES 
                                   ('PROMOTION_MARTYR', 'APOSTLE_MARTYR_RELIGIOUS_STRENGTH_DECREASE'),
								   ('PROMOTION_MARTYR', 'APOSTLE_MARTYR_COMBAT_STRENGTH_DECREASE'),
								   ('PROMOTION_MARTYR', 'APOSTLE_MARTYR_SPREAD_CHARGES_INCREASE') ;
*/