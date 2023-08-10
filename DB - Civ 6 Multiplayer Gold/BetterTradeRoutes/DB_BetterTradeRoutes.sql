-- Trade routes have no minimum distance
UPDATE GlobalParameters SET Value = 0 WHERE Name = 'TRADE_ROUTE_TURN_DURATION_BASE' ;

-- International route yields match domestic
UPDATE District_TradeRouteYields SET YieldChangeAsInternationalDestination = YieldChangeAsDomesticDestination WHERE YieldChangeAsDomesticDestination > YieldChangeAsInternationalDestination ;

-- City states only request "send a trade route" as their quest
DELETE FROM Quests WHERE QuestType != 'QUEST_SEND_TRADE_ROUTE' ;
