-- Update movement cost on roads for each era
UPDATE Routes SET MovementCost = 0.666666 WHERE RouteType = 'ROUTE_ANCIENT_ROAD';    --  A 2-movement unit can go 3 tiles.  Vanilla = 1    //  Plots = 0.5
UPDATE Routes SET MovementCost = 0.500000 WHERE RouteType = 'ROUTE_MEDIEVAL_ROAD';   --  A 2-movement unit can go 4 tiles.  Vanilla = 1    //  Plots = 0.5
UPDATE Routes SET MovementCost = 0.333333 WHERE RouteType = 'ROUTE_INDUSTRIAL_ROAD'; --  A 2-movement unit can go 6 tiles.  Vanilla = 0.75 //  Plots = 0.25
UPDATE Routes SET MovementCost = 0.250000 WHERE RouteType = 'ROUTE_MODERN_ROAD';     --  A 2-movement unit can go 8 tiles.  Vanilla = 0.5  //  Plots = 0.125
UPDATE Routes SET MovementCost = 0.125000 WHERE RouteType = 'ROUTE_RAILROAD';        --  A 2-movement unit can go 16 tiles. Vanilla = 0.25 //  Plots = N.A.

-- Set which eras have bridges (vanilla = Medieval onward // Plots = Ancient onward)
UPDATE Routes SET SupportsBridges = 1 WHERE RouteType = 'ROUTE_ANCIENT_ROAD' OR RouteType = 'ROUTE_MEDIEVAL_ROAD' OR RouteType = 'ROUTE_INDUSTRIAL_ROAD' OR RouteType = 'ROUTE_MODERN_ROAD' OR RouteType = 'ROUTE_RAILROAD' ;

