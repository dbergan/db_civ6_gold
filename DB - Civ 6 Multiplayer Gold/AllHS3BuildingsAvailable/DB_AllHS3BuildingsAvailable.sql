-- Allow 2 Enhancer or Founder Beliefs (because we don't have Worship Beliefs)
UPDATE BeliefClasses SET MaxInReligion = 2 WHERE BeliefClassType = "BELIEF_CLASS_ENHANCER" OR BeliefClassType = "BELIEF_CLASS_FOUNDER" ;

-- Make Buildings generally available
UPDATE Buildings SET EnabledByReligion = 0, PrereqCivic = "CIVIC_DIVINE_RIGHT" WHERE EnabledByReligion != 0 ;

-- Make Buildings mutually exclusive in each city
INSERT INTO MutuallyExclusiveBuildings (Building, MutuallyExclusiveBuilding) 
	SELECT a.BuildingType, b.BuildingType FROM Buildings AS a LEFT JOIN Buildings AS b ON a.BuildingType != b.BuildingType WHERE 
		a.PrereqDistrict = "DISTRICT_HOLY_SITE" AND a.BuildingType != "BUILDING_SHRINE" AND a.BuildingType != "BUILDING_TEMPLE" AND a.BuildingType != "BUILDING_STAVE_CHURCH" AND a.BuildingType != "BUILDING_PRASAT" AND 
		b.PrereqDistrict = "DISTRICT_HOLY_SITE" AND b.BuildingType != "BUILDING_SHRINE" AND b.BuildingType != "BUILDING_TEMPLE" AND b.BuildingType != "BUILDING_STAVE_CHURCH" AND b.BuildingType != "BUILDING_PRASAT" ;

-- Remove "building" class of belief
DELETE FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_WORSHIP' ;