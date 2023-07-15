-- WONDERS

-- ------------------------------------
-- ------------------------------------
--  Monument to the Gods
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_MONUMENT_TO_THE_GODS', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_WONDERS_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_MONUMENT_TO_THE_GODS', 'LOC_SDG_MONUMENT_TO_THE_GODS', 'LOC_SDG_MONUMENT_TO_THE_GODS_DESC', 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS', 'SDG_MONUMENT_TO_THE_GODS_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10) FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_ANCIENT' OR Civics.EraType = 'ERA_ANCIENT' OR Technologies.EraType = 'ERA_CLASSICAL' OR Civics.EraType = 'ERA_CLASSICAL') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'MODIFIER_ALL_CITIES_ADJUST_BUILDING_PRODUCTION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_ANCIENT' OR Civics.EraType = 'ERA_ANCIENT' OR Technologies.EraType = 'ERA_CLASSICAL' OR Civics.EraType = 'ERA_CLASSICAL') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'BuildingType', BuildingType FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_ANCIENT' OR Civics.EraType = 'ERA_ANCIENT' OR Technologies.EraType = 'ERA_CLASSICAL' OR Civics.EraType = 'ERA_CLASSICAL') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'Amount', 50 FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_ANCIENT' OR Civics.EraType = 'ERA_ANCIENT' OR Technologies.EraType = 'ERA_CLASSICAL' OR Civics.EraType = 'ERA_CLASSICAL') ;



INSERT INTO Types (Type, Kind) VALUES ('SDG_MONUMENT_TO_THE_GODS2', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_WONDERS_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_MONUMENT_TO_THE_GODS2', 'LOC_SDG_MONUMENT_TO_THE_GODS2', 'LOC_SDG_MONUMENT_TO_THE_GODS2_DESC', 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS2', 'SDG_MONUMENT_TO_THE_GODS2_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10) FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_CLASSICAL' OR Civics.EraType = 'ERA_CLASSICAL' OR Technologies.EraType = 'ERA_MEDIEVAL' OR Civics.EraType = 'ERA_MEDIEVAL') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS2_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'MODIFIER_ALL_CITIES_ADJUST_BUILDING_PRODUCTION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_CLASSICAL' OR Civics.EraType = 'ERA_CLASSICAL' OR Technologies.EraType = 'ERA_MEDIEVAL' OR Civics.EraType = 'ERA_MEDIEVAL') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS2_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'BuildingType', BuildingType FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_CLASSICAL' OR Civics.EraType = 'ERA_CLASSICAL' OR Technologies.EraType = 'ERA_MEDIEVAL' OR Civics.EraType = 'ERA_MEDIEVAL') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS2_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'Amount', 50 FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_CLASSICAL' OR Civics.EraType = 'ERA_CLASSICAL' OR Technologies.EraType = 'ERA_MEDIEVAL' OR Civics.EraType = 'ERA_MEDIEVAL') ;


INSERT INTO Types (Type, Kind) VALUES ('SDG_MONUMENT_TO_THE_GODS3', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_WONDERS_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_MONUMENT_TO_THE_GODS3', 'LOC_SDG_MONUMENT_TO_THE_GODS3', 'LOC_SDG_MONUMENT_TO_THE_GODS3_DESC', 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS3', 'SDG_MONUMENT_TO_THE_GODS3_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10) FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_MEDIEVAL' OR Civics.EraType = 'ERA_MEDIEVAL' OR Technologies.EraType = 'ERA_RENAISSANCE' OR Civics.EraType = 'ERA_RENAISSANCE') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS3_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'MODIFIER_ALL_CITIES_ADJUST_BUILDING_PRODUCTION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_MEDIEVAL' OR Civics.EraType = 'ERA_MEDIEVAL' OR Technologies.EraType = 'ERA_RENAISSANCE' OR Civics.EraType = 'ERA_RENAISSANCE') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS3_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'BuildingType', BuildingType FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_MEDIEVAL' OR Civics.EraType = 'ERA_MEDIEVAL' OR Technologies.EraType = 'ERA_RENAISSANCE' OR Civics.EraType = 'ERA_RENAISSANCE') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS3_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'Amount', 50 FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_MEDIEVAL' OR Civics.EraType = 'ERA_MEDIEVAL' OR Technologies.EraType = 'ERA_RENAISSANCE' OR Civics.EraType = 'ERA_RENAISSANCE') ;


INSERT INTO Types (Type, Kind) VALUES ('SDG_MONUMENT_TO_THE_GODS4', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_WONDERS_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_MONUMENT_TO_THE_GODS4', 'LOC_SDG_MONUMENT_TO_THE_GODS4', 'LOC_SDG_MONUMENT_TO_THE_GODS4_DESC', 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS4', 'SDG_MONUMENT_TO_THE_GODS4_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10) FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_RENAISSANCE' OR Civics.EraType = 'ERA_RENAISSANCE' OR Technologies.EraType = 'ERA_INDUSTRIAL' OR Civics.EraType = 'ERA_INDUSTRIAL') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS4_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'MODIFIER_ALL_CITIES_ADJUST_BUILDING_PRODUCTION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_RENAISSANCE' OR Civics.EraType = 'ERA_RENAISSANCE' OR Technologies.EraType = 'ERA_INDUSTRIAL' OR Civics.EraType = 'ERA_INDUSTRIAL') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS4_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'BuildingType', BuildingType FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_RENAISSANCE' OR Civics.EraType = 'ERA_RENAISSANCE' OR Technologies.EraType = 'ERA_INDUSTRIAL' OR Civics.EraType = 'ERA_INDUSTRIAL') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS4_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'Amount', 50 FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_RENAISSANCE' OR Civics.EraType = 'ERA_RENAISSANCE' OR Technologies.EraType = 'ERA_INDUSTRIAL' OR Civics.EraType = 'ERA_INDUSTRIAL') ;


INSERT INTO Types (Type, Kind) VALUES ('SDG_MONUMENT_TO_THE_GODS5', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_WONDERS_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_MONUMENT_TO_THE_GODS5', 'LOC_SDG_MONUMENT_TO_THE_GODS5', 'LOC_SDG_MONUMENT_TO_THE_GODS5_DESC', 'SDG_BELIEF_CLASS_WONDERS_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS5', 'SDG_MONUMENT_TO_THE_GODS5_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10) FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_INDUSTRIAL' OR Civics.EraType = 'ERA_INDUSTRIAL' OR Technologies.EraType = 'ERA_MODERN' OR Civics.EraType = 'ERA_MODERN' OR Technologies.EraType = 'ERA_ATOMIC' OR Civics.EraType = 'ERA_ATOMIC' OR Technologies.EraType = 'ERA_INFORMATION' OR Civics.EraType = 'ERA_INFORMATION' OR Technologies.EraType = 'ERA_FUTURE' OR Civics.EraType = 'ERA_FUTURE') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
  SELECT 'SDG_MONUMENT_TO_THE_GODS5_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'MODIFIER_ALL_CITIES_ADJUST_BUILDING_PRODUCTION', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS' FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_INDUSTRIAL' OR Civics.EraType = 'ERA_INDUSTRIAL' OR Technologies.EraType = 'ERA_MODERN' OR Civics.EraType = 'ERA_MODERN' OR Technologies.EraType = 'ERA_ATOMIC' OR Civics.EraType = 'ERA_ATOMIC' OR Technologies.EraType = 'ERA_INFORMATION' OR Civics.EraType = 'ERA_INFORMATION' OR Technologies.EraType = 'ERA_FUTURE' OR Civics.EraType = 'ERA_FUTURE') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS5_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'BuildingType', BuildingType FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_INDUSTRIAL' OR Civics.EraType = 'ERA_INDUSTRIAL' OR Technologies.EraType = 'ERA_MODERN' OR Civics.EraType = 'ERA_MODERN' OR Technologies.EraType = 'ERA_ATOMIC' OR Civics.EraType = 'ERA_ATOMIC' OR Technologies.EraType = 'ERA_INFORMATION' OR Civics.EraType = 'ERA_INFORMATION' OR Technologies.EraType = 'ERA_FUTURE' OR Civics.EraType = 'ERA_FUTURE') ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
  SELECT 'SDG_MONUMENT_TO_THE_GODS5_CITIES_ATTACH_MODIFIER_' || SUBSTR(BuildingType, 10), 'Amount', 50 FROM Buildings LEFT JOIN Technologies ON Buildings.PrereqTech = Technologies.TechnologyType LEFT JOIN Civics ON Buildings.PrereqCivic = Civics.CivicType 
  WHERE IsWonder = 1 AND (Technologies.EraType = 'ERA_INDUSTRIAL' OR Civics.EraType = 'ERA_INDUSTRIAL' OR Technologies.EraType = 'ERA_MODERN' OR Civics.EraType = 'ERA_MODERN' OR Technologies.EraType = 'ERA_ATOMIC' OR Civics.EraType = 'ERA_ATOMIC' OR Technologies.EraType = 'ERA_INFORMATION' OR Civics.EraType = 'ERA_INFORMATION' OR Technologies.EraType = 'ERA_FUTURE' OR Civics.EraType = 'ERA_FUTURE') ;
