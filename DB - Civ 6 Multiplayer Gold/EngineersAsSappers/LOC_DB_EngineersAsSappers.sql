INSERT OR REPLACE INTO LocalizedText (Tag, Text, Language) VALUES
('LOC_DB_TECH_SIEGE_TACTICS_DESC', 'Military Engineers gain the Sappers ability: "{LOC_DESC_DB_ABILITY_SAPPER}"{LOC_GOLD_LABEL}', 'en_US')
;

UPDATE LocalizedText SET Text = Text || '[NEWLINE][NEWLINE]After researching Siege Tactics, they gain the Sapper ability: "{LOC_DESC_DB_ABILITY_SAPPER}"{LOC_GOLD_LABEL}' WHERE Tag IN ('LOC_UNIT_MILITARY_ENGINEER_DESCRIPTION', 'LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION') ;

