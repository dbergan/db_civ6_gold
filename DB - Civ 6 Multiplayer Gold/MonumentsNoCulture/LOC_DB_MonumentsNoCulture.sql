UPDATE LocalizedText SET Text = REPLACE(Text, 'Provides +1 Loyalty per turn in this city. If the city already has maximum Loyalty, also provides an additional +1 [ICON_Culture] Culture.', 'Provides +2 Loyalty per turn in this city and 100% faster border growth.{LOC_GOLD_LABEL}') WHERE Tag = 'LOC_BUILDING_MONUMENT_EXPANSION1_DESCRIPTION' AND Language = 'en_US' ;

INSERT OR IGNORE INTO LocalizedText (Tag, Text, Language) VALUES ('LOC_DB_BUILDING_MONUMENT_DESC', '', 'en_US') ;
UPDATE LocalizedText SET Text = Text || 'Provides 100% faster border growth.{LOC_GOLD_LABEL}' WHERE Tag = 'LOC_DB_BUILDING_MONUMENT_DESC' AND Language = 'en_US' ;

