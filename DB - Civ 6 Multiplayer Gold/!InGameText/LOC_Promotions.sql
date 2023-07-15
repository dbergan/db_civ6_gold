-- ('', '', 'en_US'),

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES


-- PROMOTIONS

-- Recon

-- Melee
('LOC_PROMOTION_BATTLECRY_DESCRIPTION', '+7 [ICON_Strength] Combat Strength when attacking vs. Melee, Anti-Cavalry, and Ranged units.', 'en_US'),
('LOC_PROMOTION_TORTOISE_DESCRIPTION', '+10 [ICON_Strength] Combat Strength when defending vs. ranged and air attacks (but not siege units or bombers).', 'en_US'),
('LOC_PROMOTION_ZWEIHANDER_DESCRIPTION', '+7 [ICON_Strength] Combat Strength vs. Anti-Cavalry units.', 'en_US'),
('LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION', '+10 [ICON_Strength] Combat Strength when fighting in a district or attacking a city or encampment.', 'en_US'),
('LOC_PROMOTION_AMPHIBIOUS_DESCRIPTION', 'No [ICON_Strength] Combat Strength penalty when attacking from sea or river. Unaffected by river, embarking, or disembarking [ICON_Movement] Movement costs.', 'en_US'),

-- Ranged
('LOC_PROMOTION_VOLLEY_DESCRIPTION', '+5 [ICON_Ranged] Ranged Attack Strength vs. land units.', 'en_US'),
('LOC_PROMOTION_ARROW_STORM_DESCRIPTION', '+7 [ICON_Ranged] Ranged Attack Strength vs. land and naval units.', 'en_US'),
('LOC_PROMOTION_INCENDIARIES_DESCRIPTION', '+7 [ICON_Ranged] Ranged Attack Strength vs. cities and encampments.', 'en_US'),
('LOC_PROMOTION_EMPLACEMENT_DESCRIPTION', '+10 [ICON_Strength] Combat Strength when defending vs. city/encampment attacks.', 'en_US'),
('LOC_PROMOTION_EXPERT_MARKSMAN_DESCRIPTION', '+1 attack per turn (cannot move after attacking).', 'en_US'),

-- Anti-Cavalry
('LOC_PROMOTION_SQUARE_DESCRIPTION', '2x support bonus. (Other units provide a +4 [ICON_Strength] instead of a +2 [ICON_Strength] support bonus to this unit. This unit still provides the standard +2 [ICON_Strength] support bonus to other units.)', 'en_US'),
('LOC_PROMOTION_SCHILTRON_DESCRIPTION', '+10 [ICON_Strength] Combat Strength when defending vs. Melee units.', 'en_US'),

-- Light Cavalry
('LOC_PROMOTION_CAPARISON_DESCRIPTION', '+5 [ICON_Strength] Combat Strength vs. Anti-Cavalry units.', 'en_US'),
('LOC_PROMOTION_COURSERS_DESCRIPTION', '+5 [ICON_Strength] Combat Strength when attacking ranged and siege units.', 'en_US'),
('LOC_PROMOTION_DOUBLE_ENVELOPMENT_DESCRIPTION', '2x flanking bonus. (Other units provide a +4 [ICON_Strength] instead of a +2 [ICON_Strength] flanking bonus to this unit''s attacks. This unit still provides the standard +2 [ICON_Strength] flanking bonus to your other units'' melee attacks.)', 'en_US'),
('LOC_PROMOTION_SPIKING_THE_GUNS_DESCRIPTION', '+7 [ICON_Strength] Combat Strength when attacking siege units.', 'en_US'),
('LOC_PROMOTION_ESCORT_MOBILITY_DESCRIPTION', 'The other units in an Escort Formation all receive this unit''s [ICON_Movement] Movement speed.', 'en_US'),

-- Heavy Cavalry
('LOC_PROMOTION_CHARGE_DESCRIPTION', '+10 [ICON_Strength] Combat Strength vs. a fortified defender.', 'en_US'),
('LOC_PROMOTION_BARDING_DESCRIPTION', '+7 [ICON_Strength] Combat Strength when defending vs. ranged and air attacks (but not siege units or bombers).', 'en_US'),
('LOC_PROMOTION_MARAUDING_DESCRIPTION', '+7 [ICON_Strength] Combat Strength when fighting in a district or attacking a city or encampment.', 'en_US'),
('LOC_PROMOTION_ROUT_DESCRIPTION', '+5 [ICON_Strength] Combat Strength when attacking damaged units.', 'en_US'),
('LOC_PROMOTION_ARMOR_PIERCING_DESCRIPTION', '+7 [ICON_Strength] Combat Strength vs. Heavy Cavalry units.', 'en_US'),
('LOC_PROMOTION_REACTIVE_ARMOR_DESCRIPTION', '+7 [ICON_Strength] Combat Strength when defending vs Heavy Cavalry and Anti-Cavalry units.', 'en_US'),


-- Siege
('LOC_PROMOTION_GRAPE_SHOT_DESCRIPTION', '+7 [ICON_Bombard] Ranged Attack Strength vs. land units.', 'en_US'),
('LOC_PROMOTION_SHRAPNEL_DESCRIPTION', '+10 [ICON_Bombard] Ranged Attack Strength vs. land units.', 'en_US'),
('LOC_PROMOTION_ADVANCED_RANGEFINDING_DESCRIPTION', '+10 [ICON_Bombard] Ranged Attack Strength vs. naval units.', 'en_US'),
('LOC_PROMOTION_SHELLS_DESCRIPTION', '+10 [ICON_Bombard] Ranged Attack Strength vs. cities and encampments.', 'en_US'),

-- Warrior Monks
('LOC_PROMOTION_MONK_SHADOW_STRIKE_DESCRIPTION', '2x flanking bonus. (Other units provide a +4 [ICON_Strength] instead of a +2 [ICON_Strength] flanking bonus to this unit''s attacks. This unit still provides the standard +2 [ICON_Strength] flanking bonus to your other units'' melee attacks.)', 'en_US'),


-- Naval Melee
('LOC_PROMOTION_EMBOLON_DESCRIPTION', '+7 [ICON_Strength] Combat Strength vs. naval units.', 'en_US'),
('LOC_PROMOTION_REINFORCED_HULL_DESCRIPTION', '+10 [ICON_Strength] Combat Strength when defending vs. ranged and air attacks (but not siege units or bombers).', 'en_US'),
('LOC_PROMOTION_CONVOY_DESCRIPTION', '+10 [ICON_Strength] Combat Strength when in an Escort Formation.', 'en_US'),

-- Naval Ranged
('LOC_PROMOTION_ROLLING_BARRAGE_DESCRIPTION', '+10 [ICON_Ranged] Ranged Attack Strength vs. cities and encampments.', 'en_US'),
('LOC_PROMOTION_LINE_OF_BATTLE_DESCRIPTION', '+7 [ICON_Ranged] Ranged Attack Strength vs. naval units.', 'en_US'),
('LOC_PROMOTION_BOMBARDMENT_DESCRIPTION', '+7 [ICON_Ranged] Ranged Attack Strength vs. cities and encampments.', 'en_US'),
('LOC_PROMOTION_PREPARATORY_FIRE_DESCRIPTION', '+7 [ICON_Ranged] Ranged Attack Strength vs. land units.', 'en_US'),

-- Naval Carrier

-- Air Fighters
('LOC_PROMOTION_DOGFIGHTING_DESCRIPTION', '+7 [ICON_Strength] Combat Strength vs. Air Fighter units.', 'en_US'),
('LOC_PROMOTION_INTERCEPTOR_DESCRIPTION', '+7 [ICON_Strength] Combat Strength vs. Air Bomber units.', 'en_US'),
('LOC_PROMOTION_COCKPIT_ARMOR_DESCRIPTION', '+7 [ICON_Ranged] Air Attack Strength vs. Anti-Aircraft units.[NEWLINE]+7 [ICON_Strength] Combat Strength vs Anti-Aircraft damage when attacking tiles they cover.', 'en_US'),
('LOC_PROMOTION_STRAFE_DESCRIPTION', '+17 [ICON_Ranged] Air Attack Strength vs. cities, encampments, and all land and naval units that aren''t Cavalry.[NEWLINE]+17 [ICON_Strength] Combat Strength vs Anti-Aircraft damage when attacking tiles they cover.', 'en_US'),
('LOC_PROMOTION_GROUND_CREWS_DESCRIPTION', 'Heal while deployed.', 'en_US'),

-- Air Bombers
('LOC_PROMOTION_BOX_FORMATION_DESCRIPTION', '+7 [ICON_Strength] Combat Strength vs. Air Fighter units.', 'en_US'),
('LOC_PROMOTION_TANK_BUSTER_DESCRIPTION', '+17 [ICON_Ranged] Air Attack Strength vs. Cavalry units.', 'en_US'),
('LOC_PROMOTION_TORPEDO_BOMBER_DESCRIPTION', '+17 [ICON_Ranged] Air Attack Strength vs. naval units.', 'en_US'),
('LOC_PROMOTION_CLOSE_AIR_SUPPORT_DESCRIPTION', '+12 [ICON_Ranged] Air Attack Strength vs. land units.', 'en_US'),
('LOC_PROMOTION_EVASIVE_MANEUVERS_DESCRIPTION', '+7 [ICON_Ranged] Air Attack Strength vs. Anti-Aircraft units.[NEWLINE]+7 [ICON_Strength] Combat Strength vs Anti-Aircraft damage when attacking tiles they cover.', 'en_US')
;

UPDATE LocalizedText SET Text = Text || ' {DB_RANGE3_EXPLANATION}' WHERE Language = 'en_US' AND Tag IN 
('LOC_PROMOTION_COINCIDENCE_RANGEFINDING_DESCRIPTION',
'LOC_PROMOTION_FORWARD_OBSERVERS_DESCRIPTION') ;