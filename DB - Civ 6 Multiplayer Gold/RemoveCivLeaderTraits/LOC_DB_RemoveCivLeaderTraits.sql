-- ('', '', 'en_US'),


INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES
('LOC_LOADING_FEATURES_ABILITIES',  '',  'en_US') ;

UPDATE LocalizedText SET Text = REPLACE(Text, 'A building unique to Sweden. This building p', 'P') WHERE Tag = 'LOC_BUILDING_QUEENS_BIBLIOTHEQUE_DESCRIPTION' AND Language = 'en_US' ;