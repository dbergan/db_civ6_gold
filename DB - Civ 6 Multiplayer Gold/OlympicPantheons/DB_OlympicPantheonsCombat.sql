-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--  Disallow harvesting pantheon resources (so the enemy can't get rid of their combat bonus liabilities)
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- UPDATE Resource_Harvests SET Amount = 0, YieldType = 'YIELD_GOLD', PrereqTech = NULL ;
DELETE FROM Resource_Harvests WHERE ResourceType IN (SELECT DISTINCT 'RESOURCE_' || Resource FROM OP_Resources) ;
-- DELETE FROM Resource_Harvests ;
-- UPDATE UnitOperations SET VisibleInUI = 0 WHERE OperationType = 'UNITOPERATION_HARVEST_RESOURCE' ;
UPDATE Technologies SET Description = NULL WHERE Description IN ('LOC_TECH_POTTERY_DESCRIPTION', 'LOC_TECH_ANIMAL_HUSBANDRY_DESCRIPTION', 'LOC_TECH_IRRIGATION_DESCRIPTION', 'LOC_TECH_MASONRY_DESCRIPTION') ;


-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--  Disallow removing pantheon features
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- DELETE FROM Feature_Removes WHERE FeatureType IN (SELECT DISTINCT 'FEATURE_' || Feature FROM OP_Features) ;
UPDATE Features SET Removable = 0 WHERE FeatureType IN (SELECT DISTINCT 'FEATURE_' || Feature FROM OP_Features) ;



-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--  Create OP_Combat table (derived from the other OP_ tables in DB_OlympicPantheons.sql)
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
DROP TABLE IF EXISTS OP_Combat ;
CREATE TABLE OP_Combat (God VARCHAR, Combat INT, CombatRange INT, Resource VARCHAR, Feature VARCHAR, Terrain VARCHAR, AppealMin INT, PrereqTech VARCHAR) ;

INSERT OR IGNORE INTO OP_Combat (God, Resource, Combat, CombatRange, PrereqTech)
	SELECT OP_Resources.God, OP_Resources.Resource, Combat, CombatRange, SUBSTR(PrereqTech, 6) FROM OP_Resource_Yields INNER JOIN OP_Resources ON OP_Resource_Yields.God = OP_Resources.God INNER JOIN Resources ON Resources.ResourceType = 'RESOURCE_' || OP_Resources.Resource WHERE Combat > 0 ;

INSERT OR IGNORE INTO OP_Combat (God, Terrain, Combat, CombatRange)
	SELECT God, Terrain, Combat, CombatRange FROM OP_Terrains WHERE Combat > 0 ;

INSERT OR IGNORE INTO OP_Combat (God, Feature, Combat, CombatRange)
	SELECT God, Feature, Combat, CombatRange FROM OP_Features WHERE Combat > 0 ;

INSERT OR IGNORE INTO OP_Combat (God, AppealMin, Combat, CombatRange)
	SELECT God, AppealMin, Combat, CombatRange FROM OP_Appeal WHERE Combat > 0 ;


-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--	Worships Ability: doesn't do anything inherently, but tells us whether or not a military unit belongs to a certain pantehon 
-- (applies to all, even those that don't deserve to have a combat bonus where they're at)
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------

INSERT OR IGNORE INTO Types (Type, Kind)
	SELECT 'OP_ABILITY_WORSHIPS_' || God, 'KIND_ABILITY' FROM OP_Combat ; 

INSERT OR IGNORE INTO TypeTags (Type, Tag)
	SELECT 'OP_ABILITY_WORSHIPS_' || God, 'DB_CLASS_ALL_COMBAT' FROM OP_Combat ; 

INSERT OR IGNORE INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive)
	SELECT 'OP_ABILITY_WORSHIPS_' || God, 'LOC_OP_ABILITY_WORSHIPS_' || God || '_NAME', 'LOC_OP_ABILITY_WORSHIPS_' || God || '_DESC', 1 FROM OP_Combat ; 


-- Attach unit worship ability to all the player's units
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_PLAYERS_ATTACH_WORSHIP_MODIFIER' FROM OP_Combat ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_PLAYERS_ATTACH_WORSHIP_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS' FROM OP_Combat ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PLAYERS_ATTACH_WORSHIP_MODIFIER', 'ModifierId', 'OP_' || God || '_GRANT_WORSHIP_ABILITY_TO_UNITS' FROM OP_Combat ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType)
	SELECT 'OP_' || God || '_GRANT_WORSHIP_ABILITY_TO_UNITS', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY' FROM OP_Combat ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_GRANT_WORSHIP_ABILITY_TO_UNITS', 'AbilityType', 'OP_ABILITY_WORSHIPS_' || God FROM OP_Combat ; 


-- RequirementSet to check whether or not a military unit has this pantheon's worship ability
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT DISTINCT 'OP_REQ_HAS_' || God || '_WORSHIP_ABILITY', 'REQUIREMENT_UNIT_HAS_ABILITY' FROM OP_Combat ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT DISTINCT 'OP_REQ_HAS_' || God || '_WORSHIP_ABILITY', 'UnitAbilityType', 'OP_ABILITY_WORSHIPS_' || God FROM OP_Combat ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God, 'REQUIREMENTSET_TEST_ALL' FROM OP_Combat ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God, 'OP_REQ_HAS_' || God || '_WORSHIP_ABILITY' FROM OP_Combat ;


-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--	"To" Ability: bonus when attacking-to or defending-on tile with the resource/terrain/feature/appeal
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------

-- -----------------------------------------------------------------------
--  OP_REQSET_PLOT_HAS_[ZEUS]_TILE
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE', 'REQUIREMENTSET_TEST_ANY' FROM OP_Combat ;

--  Resources (non-hidden)
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE', 'DB_REQ_HAS_' || Resource FROM OP_Combat WHERE Resource IS NOT NULL AND PrereqTech IS NULL ;

--  Terrains
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE', 'DB_REQ_IS_' || Terrain FROM OP_Combat WHERE Terrain IS NOT NULL ;

--  Features
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE', 'DB_REQ_HAS_' || Feature FROM OP_Combat WHERE Feature IS NOT NULL ;

--  Appeal
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE', 'OP_REQ_PLOT_HAS_' || God || '_APPEAL' FROM OP_Combat WHERE AppealMin IS NOT NULL ;
	
	
-- -----------------------------------------------------------------------
--  OP_ABILITY_[ZEUS]_COMBAT_TO
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO Types (Type, Kind)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_TO', 'KIND_ABILITY' FROM OP_Combat ;

INSERT OR IGNORE INTO TypeTags (Type, Tag)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_TO', 'DB_CLASS_ALL_COMBAT' FROM OP_Combat ;

INSERT OR IGNORE INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_TO', 'LOC_OP_ABILITY_' || God || '_COMBAT_TO_NAME', 'LOC_OP_ABILITY_' || God || '_COMBAT_TO_DESC', 1 FROM OP_Combat ;

INSERT OR IGNORE INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_TO', 'OP_MOD_' || God || '_COMBAT_TO' FROM OP_Combat ;


INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_MOD_' || God || '_COMBAT_TO', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'OP_REQSET_PLOT_HAS_' || God || '_TILE' FROM OP_Combat ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_MOD_' || God || '_COMBAT_TO', 'Amount', Combat FROM OP_Combat ;

INSERT OR IGNORE INTO ModifierStrings (ModifierId, Context, Text)
	SELECT DISTINCT 'OP_MOD_' || God || '_COMBAT_TO', 'Preview', 'LOC_OP_' || God || '_COMBAT_TO_PREVIEW' FROM OP_Combat ;
	
	
-- -----------------------------------------------------------------------
--  Attach "To" ability to player's units (when the unit doesn't have "On" ability)
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT DISTINCT 'OP_' || God, 'OP_' || God || '_PLAYERS_ATTACH_COMBAT_TO_MODIFIER' FROM OP_Combat ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_PLAYERS_ATTACH_COMBAT_TO_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS' FROM OP_Combat ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_PLAYERS_ATTACH_COMBAT_TO_MODIFIER', 'ModifierId', 'OP_' || God || '_GRANT_ABILITY_COMBAT_TO' FROM OP_Combat ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_GRANT_ABILITY_COMBAT_TO', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 'OP_REQSET_DOESNT_HAVE_' || God || '_COMBAT_ON_ABILITY' FROM OP_Combat ;		-- set SubjectRequirementSetId to NULL if we comment out the ON ability

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_GRANT_ABILITY_COMBAT_TO', 'AbilityType', 'OP_ABILITY_' || God || '_COMBAT_TO' FROM OP_Combat ; 
	
	
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--	"On" Ability: attack & defense bonus when on (or next-to or near) the resource/terrain/feature/appeal
--  (restricted to the tile being owned by a city)
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------

INSERT OR IGNORE INTO Types (Type, Kind)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_ON', 'KIND_ABILITY' FROM OP_Combat ; 

INSERT OR IGNORE INTO TypeTags (Type, Tag)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_ON', 'DB_CLASS_ALL_COMBAT' FROM OP_Combat ; 

INSERT OR IGNORE INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_ON', 'LOC_OP_ABILITY_' || God || '_COMBAT_ON_NAME', 'LOC_OP_ABILITY_' || God || '_COMBAT_ON_DESC', 1 FROM OP_Combat ; 

INSERT OR IGNORE INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_ON', 'OP_MOD_' || God || '_COMBAT_ON' FROM OP_Combat ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType)
	SELECT DISTINCT 'OP_MOD_' || God || '_COMBAT_ON', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH' FROM OP_Combat ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_MOD_' || God || '_COMBAT_ON', 'Amount', Combat FROM OP_Combat ; 

INSERT OR IGNORE INTO ModifierStrings (ModifierId, Context, Text)
	SELECT DISTINCT 'OP_MOD_' || God || '_COMBAT_ON', 'Preview', 'LOC_OP_' || God || '_COMBAT_ON_PREVIEW' FROM OP_Combat ;


-- -----------------------------------------------------------------------
--  OP_REQSET_PLOT_HAS_[ZEUS]_TILE_RANGE_[1]
--  this ReqSet applies to All Plots and filters out the ones for this God
--  the Range_X suffix is there so that the subsequent ReqSet matches correctly
--  (e.g. OP_REQSET_PLOT_HAS_POSEIDON_TILE_RANGE_0 for Ocean and OP_REQSET_PLOT_HAS_POSEIDON_TILE_RANGE_2 for Horses)
-- -----------------------------------------------------------------------

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE_RANGE_' || CombatRange, 'REQUIREMENTSET_TEST_ANY' FROM OP_Combat ;


--  Resources (not hidden)
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE_RANGE_' || CombatRange, 'DB_REQ_HAS_' || Resource FROM OP_Combat WHERE Resource IS NOT NULL AND PrereqTech IS NULL ;

--  Terrains
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE_RANGE_' || CombatRange, 'DB_REQ_IS_' || Terrain FROM OP_Combat WHERE Terrain IS NOT NULL ;

--  Features
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE_RANGE_' || CombatRange, 'DB_REQ_HAS_' || Feature FROM OP_Combat WHERE Feature IS NOT NULL ;

--  Appeal
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE_RANGE_' || CombatRange, 'OP_REQ_PLOT_HAS_' || God || '_APPEAL' FROM OP_Combat WHERE AppealMin IS NOT NULL ;
	

-- -----------------------------------------------------------------------
--  OP_REQSET_UNIT_WORSHIPS_[ZEUS]_AND_WITHIN_[1]
--  this ReqSet goes on the god's tile to find units within x tiles who worship him
-- -----------------------------------------------------------------------

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God || '_AND_WITHIN_' || CombatRange, 'REQUIREMENTSET_TEST_ALL' FROM OP_Combat ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God || '_AND_WITHIN_' || CombatRange, 'OP_REQ_HAS_' || God || '_WORSHIP_ABILITY' FROM OP_Combat ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God || '_AND_WITHIN_' || CombatRange, 'DB_REQ_WITHIN_' || CombatRange || '_TILES' FROM OP_Combat ;


-- -----------------------------------------------------------------------
--  1) Belief attaches modifier to chosen tiles
--  2) Tiles activate "On" ability for units with X tiles who believe 
-- -----------------------------------------------------------------------

INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierId)
	SELECT 'OP_' || God, 'OP_MOD_' || God || '_PLOTS_ATTACH_MODIFIER_RANGE_' || CombatRange FROM OP_Combat ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_MOD_' || God || '_PLOTS_ATTACH_MODIFIER_RANGE_' || CombatRange, 'DB_DM_ALL_PLOTS_ATTACH_MODIFIER', 'OP_REQSET_PLOT_HAS_' || God || '_TILE_RANGE_' || CombatRange FROM OP_Combat ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_MOD_' || God || '_PLOTS_ATTACH_MODIFIER_RANGE_' || CombatRange, 'ModifierId', 'OP_MOD_' || God || '_GRANT_ABILITY_COMBAT_ON' FROM OP_Combat ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_MOD_' || God || '_GRANT_ABILITY_COMBAT_ON', 'MODIFIER_ALL_UNITS_GRANT_ABILITY', 'OP_REQSET_UNIT_WORSHIPS_' || God || '_AND_WITHIN_' || CombatRange FROM OP_Combat ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_MOD_' || God || '_GRANT_ABILITY_COMBAT_ON', 'AbilityType', 'OP_ABILITY_' || God || '_COMBAT_ON' FROM OP_Combat ;
	

-- -----------------------------------------------------------------------
--	The "To" ability uses this ReqSet to test for when the unit's "On" ability is inactive
--  (so that both aren't in effect at the same time)
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse)
	SELECT DISTINCT 'OP_REQ_DOESNT_HAVE_' || God || '_COMBAT_ON_ABILITY', 'REQUIREMENT_UNIT_HAS_ABILITY', 1 FROM OP_Combat ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT DISTINCT 'OP_REQ_DOESNT_HAVE_' || God || '_COMBAT_ON_ABILITY', 'UnitAbilityType', 'OP_ABILITY_' || God || '_COMBAT_ON' FROM OP_Combat ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_DOESNT_HAVE_' || God || '_COMBAT_ON_ABILITY', 'REQUIREMENTSET_TEST_ALL' FROM OP_Combat ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_DOESNT_HAVE_' || God || '_COMBAT_ON_ABILITY', 'OP_REQ_DOESNT_HAVE_' || God || '_COMBAT_ON_ABILITY' FROM OP_Combat ;


-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
-- HIDDEN RESOURCES
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------


-- -----------------------------------------------------------------------
-- ReqSet for having pantheon AND knowing tech
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_HAS_PANTHEON_KNOWS_' || PrereqTech, 'REQUIREMENTSET_TEST_ALL' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_HAS_PANTHEON_KNOWS_' || PrereqTech, 'DB_REQ_PLAYER_HAS_' || PrereqTech FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_HAS_PANTHEON_KNOWS_' || PrereqTech, 'REQUIRES_PLAYER_HAS_PANTHEON' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;



-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------
--	"To" Ability: bonus when attacking-to or defending-on tile with the resource/terrain/feature/appeal
-- -----------------------------------------------------------------------
-- -----------------------------------------------------------------------

-- -----------------------------------------------------------------------
--  OP_REQSET_PLOT_HAS_[ARES]_TILE_[IRON]
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE_' || Resource, 'REQUIREMENTSET_TEST_ANY' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

--  Resources (non-hidden)
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_TILE_' || Resource, 'DB_REQ_HAS_' || Resource FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

	
	
-- -----------------------------------------------------------------------
--  OP_ABILITY_[ARES]_COMBAT_TO_[IRON]
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO Types (Type, Kind)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_TO_' || Resource, 'KIND_ABILITY' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO TypeTags (Type, Tag)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_TO_' || Resource, 'DB_CLASS_ALL_COMBAT' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_TO_' || Resource, 'LOC_OP_ABILITY_' || God || '_COMBAT_TO_' || Resource || '_NAME', 'LOC_OP_ABILITY_' || God || '_COMBAT_TO_' || Resource || '_DESC', 1 FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
	SELECT DISTINCT 'OP_ABILITY_' || God || '_COMBAT_TO_' || Resource, 'OP_MOD_' || God || '_COMBAT_TO_' || Resource FROM OP_Combat WHERE PrereqTech IS NOT NULL ;


INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_MOD_' || God || '_COMBAT_TO_' || Resource, 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'OP_REQSET_PLOT_HAS_' || God || '_TILE_' || Resource FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_MOD_' || God || '_COMBAT_TO_' || Resource, 'Amount', Combat FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO ModifierStrings (ModifierId, Context, Text)
	SELECT DISTINCT 'OP_MOD_' || God || '_COMBAT_TO_' || Resource, 'Preview', 'LOC_OP_' || God || '_COMBAT_TO_PREVIEW' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;
	
	
-- -----------------------------------------------------------------------
--  Attach "To" ability to player's units (when the unit doesn't have "On" ability)
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT DISTINCT 'OP_' || God, 'OP_' || God || '_PLAYERS_ATTACH_COMBAT_TO_' || Resource || '_MODIFIER' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_PLAYERS_ATTACH_COMBAT_TO_' || Resource || '_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'OP_REQSET_HAS_PANTHEON_KNOWS_' || PrereqTech FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_PLAYERS_ATTACH_COMBAT_TO_' || Resource || '_MODIFIER', 'ModifierId', 'OP_' || God || '_GRANT_ABILITY_COMBAT_TO_' || Resource FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT DISTINCT 'OP_' || God || '_GRANT_ABILITY_COMBAT_TO_' || Resource, 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 'OP_REQSET_DOESNT_HAVE_' || God || '_COMBAT_ON_ABILITY' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;		-- set SubjectRequirementSetId to NULL if we comment out the ON ability

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT DISTINCT 'OP_' || God || '_GRANT_ABILITY_COMBAT_TO_' || Resource, 'AbilityType', 'OP_ABILITY_' || God || '_COMBAT_TO_' || Resource FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 
	

-- -----------------------------------------------------------------------
--	Worships And Knows Ability: doesn't do anything inherently, but tells us whether or not a military unit belongs to a certain pantheon AND knows a certain tech (for revealing resources)
-- (applies to all, even those that don't deserve to have a combat bonus where they're at)
-- -----------------------------------------------------------------------

INSERT OR IGNORE INTO Types (Type, Kind)
	SELECT 'OP_ABILITY_WORSHIPS_' || God || '_AND_KNOWS_' || PrereqTech, 'KIND_ABILITY' FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 

INSERT OR IGNORE INTO TypeTags (Type, Tag)
	SELECT 'OP_ABILITY_WORSHIPS_' || God || '_AND_KNOWS_' || PrereqTech, 'DB_CLASS_ALL_COMBAT' FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 

INSERT OR IGNORE INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive)
	SELECT 'OP_ABILITY_WORSHIPS_' || God || '_AND_KNOWS_' || PrereqTech, 'LOC_OP_ABILITY_WORSHIPS_' || God || '_AND_KNOWS_' || PrereqTech || '_NAME', 'LOC_OP_ABILITY_WORSHIPS_' || God || '_AND_KNOWS_' || PrereqTech || '_DESC', 1 FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 


-- -----------------------------------------------------------------------
-- Attach unit worship+knows ability to all the player's units
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID)
	SELECT 'OP_' || God, 'OP_' || God || '_PLAYERS_ATTACH_WORSHIPS_AND_KNOWS_' || PrereqTech || '_MODIFIER' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_' || God || '_PLAYERS_ATTACH_WORSHIPS_AND_KNOWS_' || PrereqTech || '_MODIFIER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'OP_REQSET_HAS_PANTHEON_KNOWS_' || PrereqTech FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_PLAYERS_ATTACH_WORSHIPS_AND_KNOWS_' || PrereqTech || '_MODIFIER', 'ModifierId', 'OP_' || God || '_GRANT_WORSHIPS_AND_KNOWS_' || PrereqTech || '_ABILITY_TO_UNITS' FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType)
	SELECT 'OP_' || God || '_GRANT_WORSHIPS_AND_KNOWS_' || PrereqTech || '_ABILITY_TO_UNITS', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY' FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_' || God || '_GRANT_WORSHIPS_AND_KNOWS_' || PrereqTech || '_ABILITY_TO_UNITS', 'AbilityType', 'OP_ABILITY_WORSHIPS_' || God || '_AND_KNOWS_' || PrereqTech FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 


-- -----------------------------------------------------------------------
-- RequirementSet to check whether or not a military unit has this pantheon's worship+knows ability
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
	SELECT DISTINCT 'OP_REQ_HAS_' || God || '_WORSHIPS_AND_KNOWS_' || PrereqTech || '_ABILITY', 'REQUIREMENT_UNIT_HAS_ABILITY' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
	SELECT DISTINCT 'OP_REQ_HAS_' || God || '_WORSHIPS_AND_KNOWS_' || PrereqTech || '_ABILITY', 'UnitAbilityType', 'OP_ABILITY_WORSHIPS_' || God || '_AND_KNOWS_' || PrereqTech FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God || '_AND_KNOWS_' || PrereqTech, 'REQUIREMENTSET_TEST_ALL' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God || '_AND_KNOWS_' || PrereqTech, 'OP_REQ_HAS_' || God || '_WORSHIPS_AND_KNOWS_' || PrereqTech || '_ABILITY' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;


-- -----------------------------------------------------------------------
--  OP_REQSET_PLOT_HAS_[ARES]_KNOWS_[BRONZE_WORKING]_TILE_RANGE_[2]
--  this ReqSet applies to All Plots and filters out the ones for this God
-- -----------------------------------------------------------------------

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_KNOWS_' || PrereqTech || '_TILE_RANGE_' || CombatRange, 'REQUIREMENTSET_TEST_ANY' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

--  Resources (hidden)
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_PLOT_HAS_' || God || '_KNOWS_' || PrereqTech || '_TILE_RANGE_' || CombatRange, 'DB_REQ_HAS_' || Resource FROM OP_Combat WHERE PrereqTech IS NOT NULL ;


-- -----------------------------------------------------------------------
--  OP_REQSET_UNIT_WORSHIPS_[ARES]_KNOWS_[BRONZE_WORKING]_AND_WITHIN_[2]
-- -----------------------------------------------------------------------
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God || '_KNOWS_' || PrereqTech || '_AND_WITHIN_' || CombatRange, 'REQUIREMENTSET_TEST_ALL' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God || '_KNOWS_' || PrereqTech || '_AND_WITHIN_' || CombatRange, 'OP_REQ_HAS_' || God || '_WORSHIPS_AND_KNOWS_' || PrereqTech || '_ABILITY' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
	SELECT DISTINCT 'OP_REQSET_UNIT_WORSHIPS_' || God || '_KNOWS_' || PrereqTech || '_AND_WITHIN_' || CombatRange, 'DB_REQ_WITHIN_' || CombatRange || '_TILES' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;


-- -----------------------------------------------------------------------
--  1) Belief attaches modifier to chosen tiles
--  2) Tiles activate "On" ability for units with X tiles who believe 
-- -----------------------------------------------------------------------

INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierId)
	SELECT 'OP_' || God, 'OP_MOD_' || God || '_KNOWS_' || PrereqTech || '_PLOTS_ATTACH_MODIFIER_RANGE_' || CombatRange FROM OP_Combat WHERE PrereqTech IS NOT NULL ; 

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_MOD_' || God || '_KNOWS_' || PrereqTech || '_PLOTS_ATTACH_MODIFIER_RANGE_' || CombatRange, 'DB_DM_ALL_PLOTS_ATTACH_MODIFIER', 'OP_REQSET_PLOT_HAS_' || God || '_KNOWS_' || PrereqTech || '_TILE_RANGE_' || CombatRange FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_MOD_' || God || '_KNOWS_' || PrereqTech || '_PLOTS_ATTACH_MODIFIER_RANGE_' || CombatRange, 'ModifierId', 'OP_MOD_' || God || '_KNOWS_' || PrereqTech || '_GRANT_ABILITY_COMBAT_ON' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	SELECT 'OP_MOD_' || God || '_KNOWS_' || PrereqTech || '_GRANT_ABILITY_COMBAT_ON', 'MODIFIER_ALL_UNITS_GRANT_ABILITY', 'OP_REQSET_UNIT_WORSHIPS_' || God || '_KNOWS_' || PrereqTech || '_AND_WITHIN_' || CombatRange FROM OP_Combat WHERE PrereqTech IS NOT NULL ;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'OP_MOD_' || God || '_KNOWS_' || PrereqTech || '_GRANT_ABILITY_COMBAT_ON', 'AbilityType', 'OP_ABILITY_' || God || '_COMBAT_ON' FROM OP_Combat WHERE PrereqTech IS NOT NULL ;
