-- Allow Airstrips on resources (nothing in Civilopedia says that you can't build an airstrip on wheat, yet you cannot)
-- Allow Missile Silos on resources
-- Allow Forts on resources
-- Allow IMPROVEMENT_ROMAN_FORT on resources
-- Allow IMPROVEMENT_MAORI_PA on resources
-- Allow IMPROVEMENT_ALCAZAR on resources


INSERT OR REPLACE INTO Improvement_ValidResources (ImprovementType, ResourceType, MustRemoveFeature)
	SELECT ImprovementType, ResourceType, 0 FROM Resources JOIN Improvements WHERE ImprovementType IN 
	('IMPROVEMENT_AIRSTRIP',
	'IMPROVEMENT_MISSILE_SILO',
	'IMPROVEMENT_FORT',
	'IMPROVEMENT_ROMAN_FORT',
	'IMPROVEMENT_MAORI_PA',
	'IMPROVEMENT_ALCAZAR')
	;