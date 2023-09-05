INSERT INTO LocalizedText (Tag, Language, Text) VALUES 
('DB_RECON_DESC', 'en_US', '[NEWLINE][NEWLINE]Recon units are always hidden and have powerful advanced promotions (if they can live long enough to earn them).{LOC_GOLD_LABEL}') ;
UPDATE LocalizedText SET Text = '+20 [ICON_Strength] attack strength' WHERE Tag = 'LOC_PROMOTION_AMBUSH_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = 'Classical Era recon unit.{LOC_GOLD_LABEL}' WHERE Tag = 'LOC_UNIT_SKIRMISHER_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = Text || '{DB_RECON_DESC}' WHERE Tag IN ('LOC_UNIT_SKIRMISHER_DESCRIPTION', 'LOC_UNIT_RANGER_DESCRIPTION', 'LOC_UNIT_SPEC_OPS_DESCRIPTION') AND Language = 'en_US' ;
