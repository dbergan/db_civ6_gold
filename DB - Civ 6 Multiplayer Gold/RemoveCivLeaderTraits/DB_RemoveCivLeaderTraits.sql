DELETE FROM CivilizationTraits WHERE CivilizationType != 'CIVILIZATION_BARBARIAN' ;
DELETE FROM LeaderTraits WHERE LeaderType != 'LEADER_BARBARIAN' AND LeaderType != 'LEADER_DEFAULT' AND LeaderType != 'LEADER_FREE_CITIES' AND LeaderType NOT LIKE 'LEADER\_MINOR\_CIV%' ESCAPE '\' ;

CREATE TABLE IF NOT EXISTS Leaders_XP2 ('LeaderType' TEXT, 'OceanStart' BOOLEAN, 'MinorCivBonusType' TEXT) ;
DELETE FROM Leaders_XP2 WHERE LeaderType = 'LEADER_KUPE' ;

DELETE FROM Modifiers WHERE ModifierId IN ('TRAIT_NO_SUPRISE_WAR_FOR_CANADA', 'TRAIT_NO_SUPRISE_WAR_ON_CANADA') ;
DELETE FROM ModifierArguments WHERE ModifierId IN ('TRAIT_NO_SUPRISE_WAR_FOR_CANADA', 'TRAIT_NO_SUPRISE_WAR_ON_CANADA') ;

DELETE FROM StartBiasFeatures ;
DELETE FROM StartBiasTerrains ;
DELETE FROM StartBiasResources ;

DELETE FROM StartBiasRivers ; 
INSERT INTO StartBiasRivers (CivilizationType, Tier) VALUES ('CIVILIZATION_MOHENJO_DARO', 1) ; -- 2021-06-29 for some reason if the table is completely empty it will throw a lua error on startup (that frustratingly doesn't leave any error record in the log). Thus, we insert a single minor civ as a work-around... and chose one whose gameplay and history reflect an actual river bias.

CREATE TABLE IF NOT EXISTS 'StartBiasNegatives' ('CivilizationType' TEXT NOT NULL, 'TerrainType' TEXT, 'FeatureType' TEXT, 'ResourceType' TEXT, 'Tier' INT NOT NULL, 'Extra' TEXT) ;
DELETE FROM StartBiasNegatives ;

CREATE TABLE IF NOT EXISTS 'StartBiasCustom' ('CivilizationType' TEXT NOT NULL, 'CustomPlacement' TEXT) ;
DELETE FROM StartBiasCustom ;

-- Make Queen's Bibliotheque available to all at the normal Tier 2 cost
UPDATE Buildings SET TraitType = NULL, Cost = 290 WHERE BuildingType = 'BUILDING_QUEENS_BIBLIOTHEQUE' ;