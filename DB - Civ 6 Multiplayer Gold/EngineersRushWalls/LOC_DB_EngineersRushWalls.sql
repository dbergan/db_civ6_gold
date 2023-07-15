-- MC_WallRush_Text
-- Author: JNR
--------------------------------------------------------------

-- LocalizedText
--------------------------------------------------------------
UPDATE LocalizedText SET Text = Text || '[NEWLINE][NEWLINE]Can use one of their build charges to complete 50% of Ancient Walls, 20% of Medieval Walls, and 15% of Renaissance Walls.{LOC_GOLD_LABEL}'	WHERE Language='en_US' AND Tag='LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION';
UPDATE LocalizedText SET Text = Text || '[NEWLINE][NEWLINE]Can use one of their build charges to complete 50% of an Ancient Walls building.{LOC_GOLD_LABEL}'											WHERE Language='en_US' AND Tag='LOC_UNIT_ROMAN_LEGION_DESCRIPTION';
--------------------------------------------------------------
