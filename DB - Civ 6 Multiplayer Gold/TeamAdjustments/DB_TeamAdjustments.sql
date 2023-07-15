-- Learn From Other Civs: Removes the bonus % from alliances, friendship, open borders, joint wars, and defense pacts (because in team games you get a boost from your teammates when they discover a tech/civic)
-- See DB_Includes_UI.lua  about line 907

-- Can form diplomatic alliances from turn 1
UPDATE DiplomaticActions SET InitiatorPrereqCivic = NULL, TargetPrereqCivic = NULL WHERE DiplomaticActionType = 'DIPLOACTION_RENEW_ALLIANCE' OR DiplomaticActionType LIKE 'DIPLOACTION_ALLIANCE%' ;

-- City States don't enforce their borders (anyone can walk on their tiles). This avoids the complication where my teammate is suzerain and yet I can't go on their tiles without declaring war on the CS.
UPDATE Modifiers SET SubjectRequirementSetId = 'DB_REQSET_PLAYER_IS_MAJOR' WHERE ModifierId = 'CIVIC_ENFORCE_BORDERS' ;
