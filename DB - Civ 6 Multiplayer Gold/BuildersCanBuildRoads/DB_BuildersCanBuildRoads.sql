-- Builders can build roads (takes a build)
INSERT OR REPLACE INTO Route_ValidBuildUnits (RouteType, UnitType) 
	SELECT RouteType, 'UNIT_BUILDER' FROM Routes WHERE RouteType != 'ROUTE_RAILROAD';

-- Military Engineers can build roads (takes a build)
INSERT OR REPLACE INTO Route_ValidBuildUnits (RouteType, UnitType) 
	SELECT RouteType, 'UNIT_MILITARY_ENGINEER' FROM Routes ;
