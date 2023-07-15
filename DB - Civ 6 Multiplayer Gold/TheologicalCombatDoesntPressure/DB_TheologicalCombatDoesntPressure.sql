UPDATE GlobalParameters SET Value = 0 WHERE Name = 'RELIGION_SPREAD_UNIT_CAPTURE' 
                                         OR Name = 'RELIGION_SPREAD_RANGE_UNIT_CAPTURE' 
										 OR Name = 'RELIGION_SPREAD_COMBAT_VICTORY' 
										 OR Name = 'RELIGION_SPREAD_RANGE_COMBAT_VICTORY' ;

-- Remove Monastic Isolation belief
DELETE FROM Beliefs WHERE BeliefType = 'BELIEF_MONASTIC_ISOLATION' ;
DELETE FROM Types WHERE Type = 'BELIEF_MONASTIC_ISOLATION' ;


-- TODO
-- The Citadel of God governor promotion on Moksha was changed to...
