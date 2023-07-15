-- Can promote without ending movement
--    UNITS (NoFinishMoves)
INSERT OR IGNORE INTO Types (Type, Kind) VALUES ('DB_DM_PROMOTE_NO_END_TURN', 'KIND_MODIFIER') ;
INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES ('DB_DM_PROMOTE_NO_END_TURN', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_PROMOTE_NO_FINISH_MOVES') ;

INSERT OR REPLACE INTO Modifiers
(ModifierId,								ModifierType,					SubjectRequirementSetId)
VALUES	
('DB_MOD_PROMOTE_NO_END_TURN',				'DB_DM_PROMOTE_NO_END_TURN',	null)
;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,								Name,				Value) VALUES
('DB_MOD_PROMOTE_NO_END_TURN',				'NoFinishMoves',	1)
;
