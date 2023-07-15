UPDATE LocalizedText SET Text = REPLACE(Text, 'Missionaries', 'Missionaries and Inquisitors') || '{LOC_GOLD_LABEL}' WHERE Tag = 'LOC_BUILDING_SHRINE_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, ', Inquisitors', '') || '{LOC_GOLD_LABEL}' WHERE Tag = 'LOC_BUILDING_TEMPLE_DESCRIPTION' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, ' and Inquisitors', ', Gurus, and with the proper belief, Warrior Monks') || '{LOC_GOLD_LABEL}' WHERE Tag = 'LOC_BUILDING_STAVE_CHURCH_DESCRIPTION' AND Language = 'en_US' ;
