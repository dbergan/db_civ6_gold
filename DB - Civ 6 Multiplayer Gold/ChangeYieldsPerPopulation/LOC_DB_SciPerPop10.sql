UPDATE LocalizedText SET Text = Text || CASE WHEN INSTR(Text, 'GOLD') = 0 THEN '{LOC_GOLD_LABEL}' ELSE '' END WHERE Tag = 'LOC_PEDIA_CONCEPTS_PAGEGROUP_SCIENCE_NAME' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = Text || CASE WHEN INSTR(Text, 'GOLD') = 0 THEN '{LOC_GOLD_LABEL}' ELSE '' END WHERE Tag = 'LOC_PEDIA_CONCEPTS_PAGE_SCIENCE_2_CHAPTER_CONTENT_TITLE' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Citizens (0.7 per [ICON_Citizen])', 'Citizens ([COLOR_RED]0.10[ENDCOLOR] per [ICON_Citizen]){LOC_GOLD_LABEL}[ENDCOLOR]') WHERE Tag = 'LOC_PEDIA_CONCEPTS_PAGE_SCIENCE_2_CHAPTER_CONTENT_PARA_1' AND Language = 'en_US' ;
UPDATE LocalizedText SET Text = REPLACE(Text, 'Citizens (0.5 per [ICON_Citizen])', 'Citizens ([COLOR_RED]0.10[ENDCOLOR] per [ICON_Citizen]){LOC_GOLD_LABEL}[ENDCOLOR]') WHERE Tag = 'LOC_PEDIA_CONCEPTS_PAGE_SCIENCE_2_CHAPTER_CONTENT_PARA_1' AND Language = 'en_US' ;
