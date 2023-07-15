/*
SELECT COUNT(BeliefType) AS Pantheons FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_PANTHEON' ;
SELECT COUNT(BeliefType) AS Quotes FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_FOLLOWER' ;
SELECT COUNT(GreatPersonIndividualType) AS Prophets FROM GreatPersonIndividuals WHERE GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET' ;
*/


-- Insert blank pantheons (because there needs to be a pantheon for each great prophet)
INSERT INTO Types (Type, Kind)
  WITH counter as (SELECT 11 x UNION SELECT x + 1 FROM counter WHERE x < 33) 
  SELECT 'SDG_BLANK_PANTHEON' || x , 'KIND_BELIEF' FROM counter ;
 
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES 
                    ('SDG_BLANK_PANTHEON11', 'LOC_SDG_BLANK_PANTHEON', 'LOC_SDG_BLANK_PANTHEON_DESC', 'BELIEF_CLASS_PANTHEON') ;

INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType)
  WITH counter as (SELECT 12 x UNION SELECT x + 1 FROM counter WHERE x < 33) 
  SELECT 'SDG_BLANK_PANTHEON' || x , 'LOC_SDG_BLANK_PANTHEON2', 'LOC_SDG_BLANK_PANTHEON2_DESC', 'BELIEF_CLASS_PANTHEON' FROM counter ;


INSERT INTO Types (Type, Kind) VALUES
-- Ancient (7)
				  ('SDG_GREAT_PERSON_INDIVIDUAL_MOSES', 'KIND_GREAT_PERSON_INDIVIDUAL'),                -- 
				  ('SDG_GREAT_PERSON_INDIVIDUAL_ELIJAH', 'KIND_GREAT_PERSON_INDIVIDUAL'),               -- 
				  ('SDG_GREAT_PERSON_INDIVIDUAL_PARSHVANATHA', 'KIND_GREAT_PERSON_INDIVIDUAL'),         --
--					GREAT_PERSON_INDIVIDUAL_ZOROASTER
--					GREAT_PERSON_INDIVIDUAL_LAOZI
--					GREAT_PERSON_INDIVIDUAL_CONFUCIUS
--					GREAT_PERSON_INDIVIDUAL_SIDDHARTHA_GAUTAMA

-- Classical (9)
--					GREAT_PERSON_INDIVIDUAL_JOHN_THE_BAPTIST												??-28
--					GREAT_PERSON_INDIVIDUAL_SIMON_PETER														1-68
				  ('SDG_GREAT_PERSON_INDIVIDUAL_PAUL', 'KIND_GREAT_PERSON_INDIVIDUAL'),					--	5-67
				  ('SDG_GREAT_PERSON_INDIVIDUAL_MARCION', 'KIND_GREAT_PERSON_INDIVIDUAL'),              --	85-160
--					GREAT_PERSON_INDIVIDUAL_IRENAEUS														130-202
				  ('SDG_GREAT_PERSON_INDIVIDUAL_ORIGEN', 'KIND_GREAT_PERSON_INDIVIDUAL'),               --	184-253
				  ('SDG_GREAT_PERSON_INDIVIDUAL_ARIUS', 'KIND_GREAT_PERSON_INDIVIDUAL'),                --	250-336
				  ('SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CHRYSOSTOM', 'KIND_GREAT_PERSON_INDIVIDUAL'),      --	349-407
				  ('SDG_GREAT_PERSON_INDIVIDUAL_AUGUSTINE', 'KIND_GREAT_PERSON_INDIVIDUAL'),            --	354-430

-- Medieval (8)
--					GREAT_PERSON_INDIVIDUAL_BODHIDHARMA														400s-500s
				  ('SDG_GREAT_PERSON_INDIVIDUAL_GREGORY_THE_GREAT', 'KIND_GREAT_PERSON_INDIVIDUAL'),    --	540-604
				  ('SDG_GREAT_PERSON_INDIVIDUAL_ALI', 'KIND_GREAT_PERSON_INDIVIDUAL'),					--	601-661
--					GREAT_PERSON_INDIVIDUAL_SONGTSAN_GAMPO													618-650
--					GREAT_PERSON_INDIVIDUAL_O_NO_YASUMARO													??-723
--					GREAT_PERSON_INDIVIDUAL_ADI_SHANKARA													700-750
--					GREAT_PERSON_INDIVIDUAL_HAJI_HUUD														1025-1142
--					GREAT_PERSON_INDIVIDUAL_FRANCIS_OF_ASSISI												1181-1226

-- Renaissance (6)
--					GREAT_PERSON_INDIVIDUAL_THOMAS_AQUINAS													1225-1274
--					GREAT_PERSON_INDIVIDUAL_MADHVA_ACHARYA													1238-1317
--					GREAT_PERSON_INDIVIDUAL_MARTIN_LUTHER													1483-1546
				  ('SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CALVIN', 'KIND_GREAT_PERSON_INDIVIDUAL'),			--	1509-1564
				  ('SDG_GREAT_PERSON_INDIVIDUAL_ROGER_WILLIAMS', 'KIND_GREAT_PERSON_INDIVIDUAL'),		--	1603-1683
				  ('SDG_GREAT_PERSON_INDIVIDUAL_JOHN_WESLEY', 'KIND_GREAT_PERSON_INDIVIDUAL'),			--	1703-1791

-- Industrial (4)
				  ('SDG_GREAT_PERSON_INDIVIDUAL_JOSEPH_SMITH', 'KIND_GREAT_PERSON_INDIVIDUAL'),			--	1805-1844
				  ('SDG_GREAT_PERSON_INDIVIDUAL_BAHAULLAH', 'KIND_GREAT_PERSON_INDIVIDUAL'),			--	1817-1892
				  ('SDG_GREAT_PERSON_INDIVIDUAL_GEORGE_MACDONALD', 'KIND_GREAT_PERSON_INDIVIDUAL'),		--	1824-1905
				  ('SDG_GREAT_PERSON_INDIVIDUAL_WILLIAM_J_SEYMOUR', 'KIND_GREAT_PERSON_INDIVIDUAL'),	--	1870-1922

-- Modern (3)
				  ('SDG_GREAT_PERSON_INDIVIDUAL_ALBERT_SCHWEITZER', 'KIND_GREAT_PERSON_INDIVIDUAL'),	--	1875-1965
				  ('SDG_GREAT_PERSON_INDIVIDUAL_CS_LEWIS', 'KIND_GREAT_PERSON_INDIVIDUAL'),				--	1898-1963
				  ('SDG_GREAT_PERSON_INDIVIDUAL_MLK', 'KIND_GREAT_PERSON_INDIVIDUAL'),					--	1929-1968

-- Atomic (2)	  
				  ('SDG_GREAT_PERSON_INDIVIDUAL_SUN_MYUNG_MOON', 'KIND_GREAT_PERSON_INDIVIDUAL'),		--	1920-2012
				  ('SDG_GREAT_PERSON_INDIVIDUAL_JOHN_PAUL_II', 'KIND_GREAT_PERSON_INDIVIDUAL'),			--	1920-2005

-- Information (1)	  
				  ('SDG_GREAT_PERSON_INDIVIDUAL_GARY_RANDALL', 'KIND_GREAT_PERSON_INDIVIDUAL') ;		--	1949-2018

INSERT INTO GreatPersonIndividuals 
  (GreatPersonIndividualType, Name, GreatPersonClassType, EraType, Gender, ActionCharges, ActionRequiresOwnedTile, ActionEffectTileHighlighting) VALUES

  ('SDG_GREAT_PERSON_INDIVIDUAL_PARSHVANATHA', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_PARSHVANATHA', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_ANCIENT', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_MOSES', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_MOSES', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_ANCIENT', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_ELIJAH', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_ELIJAH', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_ANCIENT', 'M', 0, 1, 1),

  ('SDG_GREAT_PERSON_INDIVIDUAL_PAUL', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_PAUL', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_CLASSICAL', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_MARCION', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_MARCION', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_CLASSICAL', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_ORIGEN', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_ORIGEN', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_CLASSICAL', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_ARIUS', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_ARIUS', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_CLASSICAL', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CHRYSOSTOM', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CHRYSOSTOM', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_CLASSICAL', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_AUGUSTINE', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_AUGUSTINE', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_CLASSICAL', 'M', 0, 1, 1),

  ('SDG_GREAT_PERSON_INDIVIDUAL_GREGORY_THE_GREAT', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_GREGORY_THE_GREAT', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_MEDIEVAL', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_ALI', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_ALI', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_MEDIEVAL', 'M', 0, 1, 1),

  ('SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CALVIN', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CALVIN', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_RENAISSANCE', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_ROGER_WILLIAMS', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_ROGER_WILLIAMS', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_RENAISSANCE', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_JOHN_WESLEY', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_WESLEY', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_RENAISSANCE', 'M', 0, 1, 1),

  ('SDG_GREAT_PERSON_INDIVIDUAL_JOSEPH_SMITH', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOSEPH_SMITH', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_INDUSTRIAL', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_BAHAULLAH', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_BAHAULLAH', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_INDUSTRIAL', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_GEORGE_MACDONALD', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_GEORGE_MACDONALD', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_INDUSTRIAL', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_WILLIAM_J_SEYMOUR', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_WILLIAM_J_SEYMOUR', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_INDUSTRIAL', 'M', 0, 1, 1),

  ('SDG_GREAT_PERSON_INDIVIDUAL_ALBERT_SCHWEITZER', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_ALBERT_SCHWEITZER', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_MODERN', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_CS_LEWIS', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_CS_LEWIS', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_MODERN', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_MLK', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_MLK', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_MODERN', 'M', 0, 1, 1),

  ('SDG_GREAT_PERSON_INDIVIDUAL_SUN_MYUNG_MOON', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_SUN_MYUNG_MOON', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_ATOMIC', 'M', 0, 1, 1),
  ('SDG_GREAT_PERSON_INDIVIDUAL_JOHN_PAUL_II', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_PAUL_II', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_ATOMIC', 'M', 0, 1, 1),

  ('SDG_GREAT_PERSON_INDIVIDUAL_GARY_RANDALL', 'LOC_SDG_GREAT_PERSON_INDIVIDUAL_GARY_RANDALL', 'GREAT_PERSON_CLASS_PROPHET', 'ERA_INFORMATION', 'M', 0, 1, 1) ;


UPDATE GreatPersonIndividuals SET EraType = 'ERA_ANCIENT' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_ZOROASTER',
'GREAT_PERSON_INDIVIDUAL_LAOZI',
'GREAT_PERSON_INDIVIDUAL_SIDDHARTHA_GAUTAMA',
'GREAT_PERSON_INDIVIDUAL_CONFUCIUS') ;

UPDATE GreatPersonIndividuals SET EraType = 'ERA_CLASSICAL' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_JOHN_THE_BAPTIST',
'GREAT_PERSON_INDIVIDUAL_SIMON_PETER',
'GREAT_PERSON_INDIVIDUAL_IRENAEUS') ;

UPDATE GreatPersonIndividuals SET EraType = 'ERA_MEDIEVAL' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_BODHIDHARMA',
'GREAT_PERSON_INDIVIDUAL_SONGTSAN_GAMPO',
'GREAT_PERSON_INDIVIDUAL_O_NO_YASUMARO',
'GREAT_PERSON_INDIVIDUAL_ADI_SHANKARA',
'GREAT_PERSON_INDIVIDUAL_HAJI_HUUD',
'GREAT_PERSON_INDIVIDUAL_FRANCIS_OF_ASSISI') ;

UPDATE GreatPersonIndividuals SET EraType = 'ERA_RENAISSANCE' WHERE GreatPersonIndividualType IN (
'GREAT_PERSON_INDIVIDUAL_THOMAS_AQUINAS',
'GREAT_PERSON_INDIVIDUAL_MADHVA_ACHARYA',
'GREAT_PERSON_INDIVIDUAL_MARTIN_LUTHER') ;