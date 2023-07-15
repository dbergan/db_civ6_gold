UPDATE LocalizedText SET Text = Text || '[NEWLINE][NEWLINE]Builders trained in this city receive +1 build charge. {LOC_GOLD_LABEL}' WHERE Tag = 'LOC_BUILDING_MONUMENT_EXPANSION1_DESCRIPTION' AND Language = 'en_US' ;

UPDATE LocalizedText SET Text = Text || '[NEWLINE][NEWLINE]Builders trained in this city receive +1 build charge. {LOC_GOLD_LABEL}' WHERE Tag = 'LOC_DB_BUILDING_MONUMENT_DESC' AND Language = 'en_US' ;
INSERT OR IGNORE INTO LocalizedText (Tag, Text, Language) VALUES ('LOC_DB_BUILDING_MONUMENT_DESC', 'Builders trained in this city receive +1 build charge. {LOC_GOLD_LABEL}', 'en_US') ;


