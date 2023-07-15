-- Populate resources into harvest table
-- For strategic resources (niter, oil, etc) they become harvestable at the tech that reveals them
INSERT OR IGNORE INTO Resource_Harvests (ResourceType, YieldType, Amount, PrereqTech)
SELECT 
Resources.ResourceType, 
'YIELD_GOLD', 
0, 
PrereqTech
FROM Resources WHERE ResourceType NOT IN (SELECT ResourceType FROM Resource_Harvests) ;

-- For all resources that can be improved by mine, plantation, etc, they become harvestable at the tech that unlocks that improvement
UPDATE Resource_Harvests SET PrereqTech = 
	(SELECT PrereqTech FROM Improvement_ValidResources 
	INNER JOIN Improvements ON Improvement_ValidResources.ImprovementType = Improvements.ImprovementType 
	AND Improvements.TraitType IS NULL 
	WHERE ResourceType = Resource_Harvests.ResourceType AND Improvement_ValidResources.ImprovementType IN (SELECT ImprovementType FROM Improvement_YieldChanges WHERE ImprovementType != 'IMPROVEMENT_CORPORATION' AND ImprovementType != 'IMPROVEMENT_INDUSTRY'))
WHERE PrereqTech IS NULL ;

-- Amber and Oil (the resources that spawn on land and sea) need to be set manually (otherwise one could build a harbor on an oil sea-tile prior to plastics)
UPDATE Resource_Harvests SET PrereqTech = 'TECH_SAILING' WHERE ResourceType = 'RESOURCE_AMBER' ;
UPDATE Resource_Harvests SET PrereqTech = 'TECH_PLASTICS' WHERE ResourceType = 'RESOURCE_OIL' ;

-- All other "resources" are things granted from great people or city-states... take them out of the table
DELETE FROM Resource_Harvests WHERE PrereqTech IS NULL AND ResourceType NOT IN ('RESOURCE_ANTIQUITY_SITE', 'RESOURCE_SHIPWRECK') ;

