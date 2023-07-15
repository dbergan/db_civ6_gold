UPDATE Units SET BaseMoves = 2 WHERE EXISTS (SELECT Type FROM TypeTags WHERE TypeTags.Type = Units.UnitType AND Tag = 'CLASS_RELIGIOUS_ALL') ;
