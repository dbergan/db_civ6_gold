CREATE TABLE DB_Great_Scientists (Name VARCHAR, Era VARCHAR, Tech VARCHAR, MoveUnitsTo VARCHAR, PassiveScience INT) ;

INSERT INTO DB_Great_Scientists (Name, Era, Tech,               MoveUnitsTo,            PassiveScience) VALUES 
('HILDEGARD_OF_BINGEN', 'ANCIENT',      'SHIPBUILDING',         'CELESTIAL_NAVIGATION', 2),  -- Theano
('ARYABHATA',           'ANCIENT',      'CONSTRUCTION',         '',                     2),  -- Marcus Aurelius Ammianos
('IBN_KHALDUN',         'CLASSICAL',    'APPRENTICESHIP',       'MILITARY_TACTICS',     3),  -- Archimedes
('ZHANG_HENG',          'MEDIEVAL',     'CARTOGRAPHY',          'MASS_PRODUCTION',      6),  -- Ptolemy
('EUCLID',              'MEDIEVAL',     'PRINTING',             '',                     6),  -- Johannes Gutenberg
('OMAR_KHAYYAM',        'RENAISSANCE',  'INDUSTRIALIZATION',    '',                     9),  -- Richard Arkwright
('DMITRI_MENDELEEV',    'INDUSTRIAL',   'REPLACEABLE_PARTS',    'STEEL',                12), -- Eli Whitney
('ERWIN_SCHRODINGER',   'INDUSTRIAL',   'ELECTRICITY',          'COMBUSTION',           12), -- Nikola Tesla
('ABDUS_SALAM',         'INDUSTRIAL',   'RADIO',                '',                     12), -- Guglielmo Marconi
('EMILIE_DU_CHATELET',  'MODERN',       'NUCLEAR_FISSION',      '',                     16), -- Marie Curie

('JAMES_YOUNG',         'INDUSTRIAL',   'REFINING',             'STEEL',                12),
('ALAN_TURING',         'MODERN',       'COMPUTERS',            '',                     16)
;

DELETE FROM GreatPersonIndividualActionModifiers WHERE GreatPersonIndividualType IN (
    SELECT 'GREAT_PERSON_INDIVIDUAL_' || Name FROM DB_Great_Scientists
    ) ;

UPDATE GreatPersonIndividuals SET EraType = 'ERA_ANCIENT' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN',	-- Theano
'GREAT_PERSON_INDIVIDUAL_ARYABHATA',			-- Marcus Aurelius Ammianos
'GREAT_PERSON_INDIVIDUAL_HYPATIA'
) ;

UPDATE GreatPersonIndividuals SET EraType = 'ERA_CLASSICAL' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN'			-- Archimedes
) ;

UPDATE GreatPersonIndividuals SET EraType = 'ERA_MEDIEVAL' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_ZHANG_HENG',			-- Ptolemy
'GREAT_PERSON_INDIVIDUAL_EUCLID'				-- Johannes Gutenberg
) ;

UPDATE GreatPersonIndividuals SET EraType = 'ERA_RENAISSANCE' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_OMAR_KHAYYAM'			-- Richard Arkwright
) ;

UPDATE GreatPersonIndividuals SET EraType = 'ERA_INDUSTRIAL' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_DMITRI_MENDELEEV',		-- Eli Whitney
'GREAT_PERSON_INDIVIDUAL_ERWIN_SCHRODINGER',	-- Nikola Tesla
'GREAT_PERSON_INDIVIDUAL_ABDUS_SALAM',			-- Guglielmo Marconi
'GREAT_PERSON_INDIVIDUAL_JAMES_YOUNG'
) ;

UPDATE GreatPersonIndividuals SET EraType = 'ERA_MODERN' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_EMILIE_DU_CHATELET',	-- Marie Curie
'GREAT_PERSON_INDIVIDUAL_ALAN_TURING'
) ;

UPDATE GreatPersonIndividuals SET ActionRequiresCompletedDistrictType = 'DISTRICT_CAMPUS' WHERE GreatPersonIndividualType IN (
    SELECT 'GREAT_PERSON_INDIVIDUAL_' || Name FROM DB_Great_Scientists
    ) ;

UPDATE GreatPersonIndividuals SET ActionEffectTextOverride = NULL WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_EUCLID',
'GREAT_PERSON_INDIVIDUAL_OMAR_KHAYYAM',
'GREAT_PERSON_INDIVIDUAL_DMITRI_MENDELEEV',
'GREAT_PERSON_INDIVIDUAL_ALAN_TURING'
) ;


INSERT INTO GreatPersonIndividualActionModifiers (GreatPersonIndividualType, ModifierId, AttachmentTargetType) 
    SELECT 'GREAT_PERSON_INDIVIDUAL_' || Name, 'DB_MOD_GRANT_TECH_' || Tech, 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE' FROM DB_Great_Scientists ;

UPDATE Units SET PrereqTech = 'TECH_CELESTIAL_NAVIGATION' WHERE PrereqTech = 'TECH_SHIPBUILDING' AND Combat > 0 ;	-- QUADRIREME
UPDATE Units SET PrereqTech = 'TECH_MILITARY_TACTICS' WHERE PrereqTech = 'TECH_APPRENTICESHIP' AND Combat > 0 ;		-- MAN_AT_ARMS
UPDATE Units SET PrereqTech = 'TECH_MASS_PRODUCTION' WHERE PrereqTech = 'TECH_CARTOGRAPHY' AND Combat > 0 ;			-- CARAVEL
UPDATE Units SET PrereqTech = 'TECH_STEEL' WHERE PrereqTech = 'TECH_REPLACEABLE_PARTS' AND Combat > 0 ;				-- INFANTRY
UPDATE Units SET PrereqTech = 'TECH_STEEL' WHERE PrereqTech = 'TECH_REFINING' AND Combat > 0 ;						-- BATTLESHIP
UPDATE Units SET PrereqTech = 'TECH_COMBUSTION' WHERE PrereqTech = 'TECH_ELECTRICITY' AND Combat > 0 ;				-- SUBMARINE


-- Passive yields
INSERT INTO GreatPersonIndividualBirthModifiers (GreatPersonIndividualType, ModifierId) 
    SELECT 'GREAT_PERSON_INDIVIDUAL_' || Name, 'DB_MOD_PASSIVE_SCIENCE_' || Name FROM DB_Great_Scientists ;

INSERT INTO Modifiers (ModifierId, ModifierType)
    SELECT 'DB_MOD_PASSIVE_SCIENCE_' || Name, 'DB_DM_OWNER_PLAYER_ATTACHES_MODIFIER' FROM DB_Great_Scientists ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
    SELECT 'DB_MOD_PASSIVE_SCIENCE_' || Name, 'ModifierId', 'DB_MOD_PASSIVE_SCIENCE_' || Name || '_2' FROM DB_Great_Scientists ;

INSERT INTO ModifierStrings (ModifierId, Context, Text)
    SELECT 'DB_MOD_PASSIVE_SCIENCE_' || Name, 'Summary', 'Your palace generates +' || PassiveScience || '[ICON_SCIENCE] Science per turn until activated.' FROM DB_Great_Scientists ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) 
    SELECT 'DB_MOD_PASSIVE_SCIENCE_' || Name || '_2', 'DB_DM_PLAYER_CITIES_ADJUST_YIELD', 'DB_REQSET_CITY_HAS_PALACE' Name FROM DB_Great_Scientists ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
    SELECT 'DB_MOD_PASSIVE_SCIENCE_' || Name || '_2', 'YieldType', 'YIELD_SCIENCE' FROM DB_Great_Scientists ;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
    SELECT 'DB_MOD_PASSIVE_SCIENCE_' || Name || '_2', 'Amount', PassiveScience FROM DB_Great_Scientists ;
