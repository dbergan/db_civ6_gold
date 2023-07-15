-- ------------------------------------
-- ------------------------------------
--  MELPOMENE
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_MELPOMENE', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MUSES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_MELPOMENE', 'LOC_SDG_MELPOMENE', 'LOC_SDG_MELPOMENE_DESC', 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_MELPOMENE', 'SDG_MELPOMENE_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MELPOMENE_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MELPOMENE_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_MELPOMENE_GPP') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MELPOMENE_GPP', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_MELPOMENE_GPP', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_GENERAL'),
							  ('SDG_MELPOMENE_GPP', 'Amount', 2) ;
							  
							  
-- ------------------------------------
-- ------------------------------------
--  CLIO
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CLIO', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MUSES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_CLIO', 'LOC_SDG_CLIO', 'LOC_SDG_CLIO_DESC', 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CLIO', 'SDG_CLIO_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CLIO_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CLIO_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_CLIO_GPP') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CLIO_GPP', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_CAMPUS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_CLIO_GPP', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_SCIENTIST'),
							  ('SDG_CLIO_GPP', 'Amount', 2) ;


-- ------------------------------------
-- ------------------------------------
--  CALLIOPE_TERPSICHORE_EUTERPE
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MUSES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_CALLIOPE_TERPSICHORE_EUTERPE', 'LOC_SDG_CALLIOPE_TERPSICHORE_EUTERPE', 'LOC_SDG_CALLIOPE_TERPSICHORE_EUTERPE_DESC', 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE', 'SDG_CALLIOPE_TERPSICHORE_EUTERPE_CITIES_ATTACH_WRITER_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_CITIES_ATTACH_WRITER_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_CITIES_ATTACH_WRITER_MODIFIER', 'ModifierId', 'SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATWRITER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATWRITER', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_THEATER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATWRITER', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_WRITER'),
							  ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATWRITER', 'Amount', 2) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE', 'SDG_CALLIOPE_TERPSICHORE_EUTERPE_CITIES_ATTACH_ARTIST_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_CITIES_ATTACH_ARTIST_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_CITIES_ATTACH_ARTIST_MODIFIER', 'ModifierId', 'SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATARTIST') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATARTIST', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_THEATER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATARTIST', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_ARTIST'),
							  ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATARTIST', 'Amount', 2) ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE', 'SDG_CALLIOPE_TERPSICHORE_EUTERPE_CITIES_ATTACH_MUSICIAN_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_CITIES_ATTACH_MUSICIAN_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_CITIES_ATTACH_MUSICIAN_MODIFIER', 'ModifierId', 'SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATMUSICIAN') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATMUSICIAN', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_THEATER') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATMUSICIAN', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_MUSICIAN'),
							  ('SDG_CALLIOPE_TERPSICHORE_EUTERPE_GREATMUSICIAN', 'Amount', 2) ;


-- ------------------------------------
-- ------------------------------------
--  THALIA
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_THALIA', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MUSES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_THALIA', 'LOC_SDG_THALIA', 'LOC_SDG_THALIA_DESC', 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_THALIA', 'SDG_THALIA_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_THALIA_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_THALIA_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_THALIA_GPP') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_THALIA_GPP', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_COMMERCIAL_HUB') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_THALIA_GPP', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_MERCHANT'),
							  ('SDG_THALIA_GPP', 'Amount', 2) ;

-- ------------------------------------
-- ------------------------------------
--  ERATO
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ERATO', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MUSES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ERATO', 'LOC_SDG_ERATO', 'LOC_SDG_ERATO_DESC', 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ERATO', 'SDG_ERATO_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ERATO_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ERATO_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ERATO_GPP') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ERATO_GPP', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_INDUSTRIAL_ZONE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_ERATO_GPP', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_ENGINEER'),
							  ('SDG_ERATO_GPP', 'Amount', 2) ;


-- ------------------------------------
-- ------------------------------------
--  URANIA
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_URANIA', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MUSES_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_URANIA', 'LOC_SDG_URANIA', 'LOC_SDG_URANIA_DESC', 'SDG_BELIEF_CLASS_MUSES_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_URANIA', 'SDG_URANIA_CITIES_ATTACH_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_URANIA_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_URANIA_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_URANIA_GPP') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_URANIA_GPP', 'DB_DM_ADJUST_DISTRICT_GREATPERSON', 'DB_REQSET_IS_HARBOR') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
							  ('SDG_URANIA_GPP', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_ADMIRAL'),
							  ('SDG_URANIA_GPP', 'Amount', 2) ;

