-- MILITARY

-- ------------------------------------
-- ------------------------------------
--  Sword of Gideon
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_SWORD_OF_GIDEON', 'KIND_ABILITY') ;
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_SWORD_OF_GIDEON', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_SWORD_OF_GIDEON', 'LOC_SDG_ABILITY_SWORD_OF_GIDEON_NAME', 'LOC_SDG_ABILITY_SWORD_OF_GIDEON_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_SWORD_OF_GIDEON', 'SDG_SWORD_OF_GIDEON_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_SWORD_OF_GIDEON_COMBAT', 'DB_DM_ADJUST_COMBAT_EXPERIENCE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SWORD_OF_GIDEON_COMBAT', 'Amount', 25) ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_SWORD_OF_GIDEON', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SWORD_OF_GIDEON', 'LOC_SDG_SWORD_OF_GIDEON', 'LOC_SDG_SWORD_OF_GIDEON_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SWORD_OF_GIDEON', 'SDG_SWORD_OF_GIDEON_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SWORD_OF_GIDEON_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SWORD_OF_GIDEON_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_SWORD_OF_GIDEON_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_SWORD_OF_GIDEON_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_SWORD_OF_GIDEON_COMBAT', 'AbilityType', 'SDG_ABILITY_SWORD_OF_GIDEON') ;


-- ------------------------------------
-- ------------------------------------
--  Shatter the Teeth
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_SHATTER_THE_TEETH', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_SHATTER_THE_TEETH', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_SHATTER_THE_TEETH', 'LOC_SDG_ABILITY_SHATTER_THE_TEETH_NAME', 'LOC_SDG_ABILITY_SHATTER_THE_TEETH_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_SHATTER_THE_TEETH', 'SDG_SHATTER_THE_TEETH_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHATTER_THE_TEETH_COMBAT', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_ATTACKING_IS_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHATTER_THE_TEETH_COMBAT', 'Amount', 3) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_SHATTER_THE_TEETH_COMBAT', 'Preview', 'LOC_SDG_SHATTER_THE_TEETH_COMBAT_DESC') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_SHATTER_THE_TEETH', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_SHATTER_THE_TEETH', 'LOC_SDG_SHATTER_THE_TEETH', 'LOC_SDG_SHATTER_THE_TEETH_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_SHATTER_THE_TEETH', 'SDG_SHATTER_THE_TEETH_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_SHATTER_THE_TEETH_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_SHATTER_THE_TEETH_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_SHATTER_THE_TEETH_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_SHATTER_THE_TEETH_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_SHATTER_THE_TEETH_COMBAT', 'AbilityType', 'SDG_ABILITY_SHATTER_THE_TEETH') ;


-- ------------------------------------
-- ------------------------------------
--  Veni Vidi Vici
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_VENI_VIDI_VICI', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_VENI_VIDI_VICI', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_VENI_VIDI_VICI', 'LOC_SDG_ABILITY_VENI_VIDI_VICI_NAME', 'LOC_SDG_ABILITY_VENI_VIDI_VICI_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_VENI_VIDI_VICI', 'SDG_MOD_VENI_VIDI_VICI_ATTACK') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MOD_VENI_VIDI_VICI_ATTACK', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_ATTACKING_IS_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_VENI_VIDI_VICI_ATTACK', 'Amount', 2) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_MOD_VENI_VIDI_VICI_ATTACK', 'Preview', 'LOC_SDG_VENI_VIDI_VICI_COMBAT_DESC') ;

INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_VENI_VIDI_VICI', 'SDG_MOD_VENI_VIDI_VICI_DEFEND') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MOD_VENI_VIDI_VICI_DEFEND', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_DEFENDING_IS_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_VENI_VIDI_VICI_DEFEND', 'Amount', 1) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_MOD_VENI_VIDI_VICI_DEFEND', 'Preview', 'LOC_SDG_VENI_VIDI_VICI_COMBAT_DESC') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_VENI_VIDI_VICI', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_VENI_VIDI_VICI', 'LOC_SDG_VENI_VIDI_VICI', 'LOC_SDG_VENI_VIDI_VICI_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_VENI_VIDI_VICI', 'SDG_VENI_VIDI_VICI_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_VENI_VIDI_VICI_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_VENI_VIDI_VICI_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_VENI_VIDI_VICI_ABILITY') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_VENI_VIDI_VICI_ABILITY', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_VENI_VIDI_VICI_ABILITY', 'AbilityType', 'SDG_ABILITY_VENI_VIDI_VICI') ;


-- ------------------------------------
-- ------------------------------------
--  Tzevaot
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_TZEVAOT', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_TZEVAOT', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_TZEVAOT', 'LOC_SDG_ABILITY_TZEVAOT_NAME', 'LOC_SDG_ABILITY_TZEVAOT_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_TZEVAOT', 'SDG_MOD_TZEVAOT_ATTACK') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MOD_TZEVAOT_ATTACK', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_ATTACKING_IS_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_TZEVAOT_ATTACK', 'Amount', 1) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_MOD_TZEVAOT_ATTACK', 'Preview', 'LOC_SDG_TZEVAOT_COMBAT_DESC') ;

INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_TZEVAOT', 'SDG_MOD_TZEVAOT_DEFEND') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_MOD_TZEVAOT_DEFEND', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_DEFENDING_IS_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_MOD_TZEVAOT_DEFEND', 'Amount', 2) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_MOD_TZEVAOT_DEFEND', 'Preview', 'LOC_SDG_TZEVAOT_COMBAT_DESC') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_TZEVAOT', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_TZEVAOT', 'LOC_SDG_TZEVAOT', 'LOC_SDG_TZEVAOT_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_TZEVAOT', 'SDG_TZEVAOT_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_TZEVAOT_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_TZEVAOT_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_TZEVAOT_ABILITY') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_TZEVAOT_ABILITY', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_TZEVAOT_ABILITY', 'AbilityType', 'SDG_ABILITY_TZEVAOT') ;


-- ------------------------------------
-- ------------------------------------
--  Armor of God
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_ARMOR_OF_GOD', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_ARMOR_OF_GOD', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_ARMOR_OF_GOD', 'LOC_SDG_ABILITY_ARMOR_OF_GOD_NAME', 'LOC_SDG_ABILITY_ARMOR_OF_GOD_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_ARMOR_OF_GOD', 'SDG_ARMOR_OF_GOD_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ARMOR_OF_GOD_COMBAT', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_DEFENDING_IS_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ARMOR_OF_GOD_COMBAT', 'Amount', 3) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_ARMOR_OF_GOD_COMBAT', 'Preview', 'LOC_SDG_ARMOR_OF_GOD_COMBAT_DESC') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_ARMOR_OF_GOD', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_ARMOR_OF_GOD', 'LOC_SDG_ARMOR_OF_GOD', 'LOC_SDG_ARMOR_OF_GOD_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_ARMOR_OF_GOD', 'SDG_ARMOR_OF_GOD_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_ARMOR_OF_GOD_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ARMOR_OF_GOD_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_ARMOR_OF_GOD_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_ARMOR_OF_GOD_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_ARMOR_OF_GOD_COMBAT', 'AbilityType', 'SDG_ABILITY_ARMOR_OF_GOD') ;


-- ------------------------------------
-- ------------------------------------
--  His Truth is Marching On
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_HIS_TRUTH', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_HIS_TRUTH', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_HIS_TRUTH', 'LOC_SDG_ABILITY_HIS_TRUTH_NAME', 'LOC_SDG_ABILITY_HIS_TRUTH_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_HIS_TRUTH', 'SDG_HIS_TRUTH_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HIS_TRUTH_COMBAT', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HIS_TRUTH_COMBAT', 'Amount', 3) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_HIS_TRUTH_COMBAT', 'Preview', 'LOC_SDG_HIS_TRUTH_COMBAT_DESC') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_HIS_TRUTH', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_HIS_TRUTH', 'LOC_SDG_HIS_TRUTH', 'LOC_SDG_HIS_TRUTH_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_HIS_TRUTH', 'SDG_HIS_TRUTH_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_HIS_TRUTH_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_HIS_TRUTH_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_HIS_TRUTH_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_HIS_TRUTH_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_HIS_TRUTH_COMBAT', 'AbilityType', 'SDG_ABILITY_HIS_TRUTH') ;


-- ------------------------------------
-- ------------------------------------
--  Carthago Delenda Est
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_CARTHAGO_DELENDA_EST', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_CARTHAGO_DELENDA_EST', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_CARTHAGO_DELENDA_EST', 'LOC_SDG_ABILITY_CARTHAGO_DELENDA_EST_NAME', 'LOC_SDG_ABILITY_CARTHAGO_DELENDA_EST_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_CARTHAGO_DELENDA_EST', 'SDG_CARTHAGO_DELENDA_EST_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CARTHAGO_DELENDA_EST_COMBAT', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_ATTACKING_INSIDE_FOREIGN_TERRITORY_ENEMY_OTHER_RELIGION_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CARTHAGO_DELENDA_EST_COMBAT', 'Amount', 6) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_CARTHAGO_DELENDA_EST_COMBAT', 'Preview', 'LOC_SDG_CARTHAGO_DELENDA_EST_COMBAT_DESC') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_CARTHAGO_DELENDA_EST', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_CARTHAGO_DELENDA_EST', 'LOC_SDG_CARTHAGO_DELENDA_EST', 'LOC_SDG_CARTHAGO_DELENDA_EST_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CARTHAGO_DELENDA_EST', 'SDG_CARTHAGO_DELENDA_EST_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CARTHAGO_DELENDA_EST_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CARTHAGO_DELENDA_EST_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_CARTHAGO_DELENDA_EST_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_CARTHAGO_DELENDA_EST_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_CARTHAGO_DELENDA_EST_COMBAT', 'AbilityType', 'SDG_ABILITY_CARTHAGO_DELENDA_EST') ;


-- ------------------------------------
-- ------------------------------------
--  Deus Vult
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_DEUS_VULT', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_DEUS_VULT', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_DEUS_VULT', 'LOC_SDG_ABILITY_DEUS_VULT_NAME', 'LOC_SDG_ABILITY_DEUS_VULT_DESC', 1) ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_DEUS_VULT', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_DEUS_VULT', 'LOC_SDG_DEUS_VULT', 'LOC_SDG_DEUS_VULT_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_DEUS_VULT', 'SDG_DEUS_VULT_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_DEUS_VULT_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_DEUS_VULT_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_DEUS_VULT_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_DEUS_VULT_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_DEUS_VULT_COMBAT', 'AbilityType', 'SDG_ABILITY_DEUS_VULT') ;

INSERT INTO Requirements (RequirementId, RequirementType, ProgressWeight) VALUES ('SDG_REQ_UNIT_HAS_DEUS_VULT', 'REQUIREMENT_UNIT_HAS_ABILITY', 1) ;
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('SDG_REQ_UNIT_HAS_DEUS_VULT', 'UnitAbilityType', 'SDG_ABILITY_DEUS_VULT') ;
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('SDG_REQSET_UNIT_HAS_DEUS_VULT', 'REQUIREMENTSET_TEST_ALL') ;
INSERT INTO RequirementSetRequirements	(RequirementSetId, RequirementId) VALUES
										('SDG_REQSET_UNIT_HAS_DEUS_VULT', 'SDG_REQ_UNIT_HAS_DEUS_VULT'),
										('SDG_REQSET_UNIT_HAS_DEUS_VULT', 'DB_REQ_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_DEUS_VULT', 'SDG_DEUS_VULT_UNIT_APPLIES_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_DEUS_VULT_UNIT_APPLIES_MODIFIER', 'MODIFIER_ALL_UNITS_ATTACH_MODIFIER', 'SDG_REQSET_UNIT_HAS_DEUS_VULT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_DEUS_VULT_UNIT_APPLIES_MODIFIER', 'ModifierId', 'SDG_DEUS_VULT_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_DEUS_VULT_COMBAT', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_OPPONENT_IS_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_DEUS_VULT_COMBAT', 'Amount', 4) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_DEUS_VULT_COMBAT', 'Preview', 'LOC_SDG_DEUS_VULT_COMBAT_DESC') ;


-- ------------------------------------
-- ------------------------------------
--  Crusade
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_CRUSADE', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_CRUSADE', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_CRUSADE', 'LOC_SDG_ABILITY_CRUSADE_NAME', 'LOC_SDG_ABILITY_CRUSADE_DESC', 1) ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_CRUSADE', 'KIND_BELIEF') ; 
INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_CRUSADE', 'LOC_SDG_CRUSADE', 'LOC_SDG_CRUSADE_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CRUSADE', 'SDG_CRUSADE_CITIES_ATTACH_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CRUSADE_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CRUSADE_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_CRUSADE_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_CRUSADE_COMBAT', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_CRUSADE_COMBAT', 'AbilityType', 'SDG_ABILITY_CRUSADE') ;

INSERT INTO Requirements (RequirementId, RequirementType, ProgressWeight) VALUES ('SDG_REQ_UNIT_HAS_CRUSADE', 'REQUIREMENT_UNIT_HAS_ABILITY', 1) ;
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES ('SDG_REQ_UNIT_HAS_CRUSADE', 'UnitAbilityType', 'SDG_ABILITY_CRUSADE') ;
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('SDG_REQSET_UNIT_HAS_CRUSADE', 'REQUIREMENTSET_TEST_ALL') ;
INSERT INTO RequirementSetRequirements	(RequirementSetId, RequirementId) VALUES
										('SDG_REQSET_UNIT_HAS_CRUSADE', 'SDG_REQ_UNIT_HAS_CRUSADE'),
										('SDG_REQSET_UNIT_HAS_CRUSADE', 'DB_REQ_INSIDE_FOREIGN_TERRITORY_WITH_BELIEF') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_CRUSADE', 'SDG_CRUSADE_UNIT_APPLIES_MODIFIER') ; 
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CRUSADE_UNIT_APPLIES_MODIFIER', 'MODIFIER_ALL_UNITS_ATTACH_MODIFIER', 'SDG_REQSET_UNIT_HAS_CRUSADE') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CRUSADE_UNIT_APPLIES_MODIFIER', 'ModifierId', 'SDG_CRUSADE_COMBAT') ;
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_CRUSADE_COMBAT', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'DB_REQSET_ATTACKING_IS_NOT_CITY_OR_ENCAMPMENT') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_CRUSADE_COMBAT', 'Amount', 8) ;
INSERT INTO ModifierStrings (ModifierId, Context, Text) VALUES ('SDG_CRUSADE_COMBAT', 'Preview', 'LOC_SDG_CRUSADE_COMBAT_DESC') ;


-- ------------------------------------
-- ------------------------------------
--  A Memory of Solferino (+10 healing/turn to land units everywhere)
-- ------------------------------------
-- ------------------------------------
INSERT INTO Types (Type, Kind) VALUES ('SDG_ABILITY_A_MEMORY_OF_SOLFERINO_HEAL', 'KIND_ABILITY') ; 
INSERT INTO TypeTags (Type, Tag) VALUES ('SDG_ABILITY_A_MEMORY_OF_SOLFERINO_HEAL', 'DB_CLASS_LAND_COMBAT') ; 
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive) VALUES ('SDG_ABILITY_A_MEMORY_OF_SOLFERINO_HEAL', 'LOC_SDG_ABILITY_A_MEMORY_OF_SOLFERINO_HEAL_NAME', 'LOC_SDG_ABILITY_A_MEMORY_OF_SOLFERINO_HEAL_DESC', 1) ;
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('SDG_ABILITY_A_MEMORY_OF_SOLFERINO_HEAL', 'SDG_ABILITY_SOLFERINO_MODIFIER') ;
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ABILITY_SOLFERINO_MODIFIER', 'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
                              ('SDG_ABILITY_SOLFERINO_MODIFIER', 'Amount', 10),
							  ('SDG_ABILITY_SOLFERINO_MODIFIER', 'Type', 'ALL') ;

INSERT INTO Types (Type, Kind) VALUES ('SDG_A_MEMORY_OF_SOLFERINO', 'KIND_BELIEF') ; 

INSERT INTO BeliefClasses (BeliefClassType, Name, MaxInReligion, AdoptionOrder)
	SELECT 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%'), 'LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 999, (SELECT COUNT(BeliefType) + 100 FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;
INSERT INTO Beliefs (BeliefType, Name, Description, BeliefClassType) 
	SELECT 'SDG_A_MEMORY_OF_SOLFERINO', 'LOC_SDG_A_MEMORY_OF_SOLFERINO', 'LOC_SDG_A_MEMORY_OF_SOLFERINO_DESC', 'SDG_BELIEF_CLASS_MILITARY_' || (SELECT cast(COUNT(BeliefType) + 100 as text) FROM Beliefs WHERE BeliefClassType LIKE 'SDG_BELIEF_CLASS_%') ;

INSERT INTO BeliefModifiers (BeliefType, ModifierID) VALUES ('SDG_A_MEMORY_OF_SOLFERINO', 'SDG_A_MEMORY_OF_SOLFERINO_CITIES_ATTACH_MODIFIER') ;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('SDG_A_MEMORY_OF_SOLFERINO_CITIES_ATTACH_MODIFIER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_A_MEMORY_OF_SOLFERINO_CITIES_ATTACH_MODIFIER', 'ModifierId', 'SDG_ACTIVATE_SOLFERINO_HEALING') ;

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('SDG_ACTIVATE_SOLFERINO_HEALING', 'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS') ;
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('SDG_ACTIVATE_SOLFERINO_HEALING', 'AbilityType', 'SDG_ABILITY_A_MEMORY_OF_SOLFERINO_HEAL') ;