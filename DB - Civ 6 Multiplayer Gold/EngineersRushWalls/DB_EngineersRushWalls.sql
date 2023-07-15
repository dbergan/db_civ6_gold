-- MC_WallRush_Gameplay
-- Author: JNR
--------------------------------------------------------------

-- Building_BuildChargeProductions
--------------------------------------------------------------
INSERT OR IGNORE INTO Building_BuildChargeProductions
		(BuildingType,			UnitType,					PercentProductionPerCharge)
VALUES	('BUILDING_WALLS',		'UNIT_MILITARY_ENGINEER',	50),
		('BUILDING_CASTLE',		'UNIT_MILITARY_ENGINEER',	20),
		('BUILDING_STAR_FORT',	'UNIT_MILITARY_ENGINEER',	15),
		('BUILDING_WALLS',		'UNIT_ROMAN_LEGION',		50);
		
INSERT OR IGNORE INTO Building_BuildChargeProductions
		(BuildingType,			UnitType,					PercentProductionPerCharge)
SELECT	'BUILDING_TSIKHE',		'UNIT_MILITARY_ENGINEER',	15
FROM	Buildings
WHERE	BuildingType='BUILDING_TSIKHE';
--------------------------------------------------------------