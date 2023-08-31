-- ('', '', 'en_US'),

INSERT OR REPLACE INTO LocalizedText 
(Tag, Text, Language) VALUES

('DB_GOLD_COLOR', '[COLOR_FLOAT_GOLD]', 'en_US'),
('DB_POS_COLOR', '[COLOR_MEDIUM_GREEN]', 'en_US'),
('DB_POS_COLOR_DARK_BG', '[COLOR_GREEN]', 'en_US'),
('DB_POS_AMOUNT', '{DB_POS_COLOR}+{1_Amount}[ENDCOLOR] ', 'en_US'),
('DB_POS_AMOUNT_DARK_BG', '{DB_POS_COLOR_DARK_BG}+{1_Amount}[ENDCOLOR] ', 'en_US'),
('DB_POS_VALUE', '{DB_POS_COLOR}+{1_Value}[ENDCOLOR] ', 'en_US'),
('DB_POS_VALUE_DARK_BG', '{DB_POS_COLOR_DARK_BG}+{1_Value}[ENDCOLOR] ', 'en_US'),
('DB_NEG_COLOR', '[COLOR_RED]', 'en_US'),
('DB_NEG_AMOUNT', '{DB_NEG_COLOR}{1_Amount}[ENDCOLOR] ', 'en_US'),
('DB_NEG_VALUE', '{DB_NEG_COLOR}{1_Value}[ENDCOLOR] ', 'en_US'),
('DB_NEG_AMOUNT_MINUS', '{DB_NEG_COLOR}-{1_Amount}[ENDCOLOR] ', 'en_US'),
('DB_NEG_VALUE_MINUS', '{DB_NEG_COLOR}-{1_Value}[ENDCOLOR] ', 'en_US'),

('LOC_EMPTY_LABEL', '', 'en_US'),
('LOC_GOLD_LABEL', ' {DB_GOLD_COLOR}[GOLD][ENDCOLOR]', 'en_US'),
('LOC_OT_HEADER', '[COLOR_Red]ORIGINAL TEXT[ENDCOLOR][NEWLINE][NEWLINE]', 'en_US'),
('LOC_GOLD_UNIT_PROMOTIONS_AND_ABILITIES_HEADER', '[NEWLINE][NEWLINE]------------------------Unit Promotions and Abilities{LOC_GOLD_LABEL}-----------------------', 'en_US'),

-- DB_lib
('LOC_DB_MOD_MELEE_ATTACKS_FROM_CITIES_PREVIEW', '{DB_NEG_AMOUNT_MINUS} Attacking From City', 'en_US'),
('LOC_DB_MOD_1_RANDOM_CIVIC_BOOST',	'1 civic [ICON_CivicBoosted] boost.', 'en_US'),
('LOC_DB_MOD_2_RANDOM_CIVIC_BOOSTS', '2 civic [ICON_CivicBoosted] boosts.', 'en_US'),
('LOC_DB_MOD_3_RANDOM_CIVIC_BOOSTS', '3 civic [ICON_CivicBoosted] boosts.', 'en_US'),
('LOC_DB_MOD_4_RANDOM_CIVIC_BOOSTS', '4 civic [ICON_CivicBoosted] boosts.', 'en_US'),
('LOC_DB_MOD_1_RANDOM_TECH_BOOST',	'1 technology [ICON_TechBoosted] boost.', 'en_US'),
('LOC_DB_MOD_2_RANDOM_TECH_BOOSTS', '2 technology [ICON_TechBoosted] boosts.', 'en_US'),
('LOC_DB_MOD_3_RANDOM_TECH_BOOSTS', '3 technology [ICON_TechBoosted] boosts.', 'en_US'),
('LOC_DB_MOD_4_RANDOM_TECH_BOOSTS', '4 technology [ICON_TechBoosted] boosts.', 'en_US'),


-- TopPanel: Tourism
('LOC_DB_TOURISM_TOOLTIP_HEADER', '[NEWLINE]---------------------------------------------------[NEWLINE]', 'en_US'),
('LOC_DB_MY_DOMESTIC_TOURISTS', 'Our Domestic Tourist Score: {1_Num}', 'en_US'),
('LOC_DB_MY_VISITING_TOURISTS', 'Our Visiting Tourist Score: {1_Num}', 'en_US'),
('LOC_DB_MY_TRAVELING_TOURISTS', 'Where Our Citizens Are Going', 'en_US'),
('LOC_DB_VISITING_TOURIST_LINE', '[ICON_Bullet]From {1_Civ}: {2_Total} (+{3_PerTurn}/Turn)', 'en_US'),
('LOC_DB_VISITING_TOURIST_LINE_WITH_GOLD', '[ICON_Bullet]From {1_Civ}: {2_Total} (+{3_PerTurn}/Turn, +{4_Gold}[ICON_Gold])', 'en_US'),
('LOC_DB_VISITING_TOURIST_LINE_DEAD', '[ICON_Bullet]From {1_Civ}: {2_Total} (dead)', 'en_US'),
('LOC_DB_TRAVELING_TOURIST_LINE', '[ICON_Bullet]To {1_Civ}: {2_Total} (+{3_PerTurn}/Turn)', 'en_US'),
('LOC_DB_TOTAL_LINE', 'Total: {1_Total}', 'en_US'),
('LOC_DB_CULTURE_VICTORY', 'Victory is achieved when a player''s[NEWLINE]Visiting Tourist Score is higher than[NEWLINE]any other civilization''s Domestic[NEWLINE]Tourist Score', 'en_US'),

/***** CITY/ENCAMPMENT BANNERS AND FLOATERS *****/
('LOC_CITY_BANNER_GARRISON_DEFENSE_STRENGTH', 'Defense Strength', 'en_US'),
('LOC_CITY_BANNER_OUTER_DEFENSE_HITPOINTS', '[COLOR_FLOAT_SCIENCE]Wall health:[ENDCOLOR] {1_Health}', 'en_US'),
('LOC_HUD_UNIT_PANEL_WALL_HEALTH_TOOLTIP', 'Wall health: {1_CurrentHealth}/{2_MaxHealth}', 'en_US'),
('LOC_CITY_BANNER_GARRISON_HITPOINTS', '[COLOR_MEDIUM_GREEN]City health:[ENDCOLOR] {1_Health}', 'en_US'),
('LOC_CITY_BANNER_DISTRICT_HITPOINTS', '[COLOR_MEDIUM_GREEN]Encampment health:[ENDCOLOR] {1_Health}', 'en_US'),
('LOC_WORLD_DISTRICT_DEFENSE_DAMAGE_DECREASE_FLOATER', '[COLOR_GREEN]+{1_Num}[ENDCOLOR] Walls', 'en_US'),
('LOC_WORLD_DISTRICT_DEFENSE_DAMAGE_INCREASE_FLOATER', '[COLOR_RED]{1_Num}[ENDCOLOR] Walls', 'en_US'),
('LOC_WORLD_DISTRICT_GARRISON_DAMAGE_DECREASE_FLOATER', '[COLOR_GREEN]+{1_Num}[ENDCOLOR] Health', 'en_US'),
('LOC_WORLD_DISTRICT_GARRISON_DAMAGE_INCREASE_FLOATER', '[COLOR_RED]{1_Num}[ENDCOLOR] Health', 'en_US'),
('LOC_CITY_BANNER_FORTIFICATION_TT', 'City has no walls', 'en_US'),
('LOC_CITY_BANNER_CAN_STRIKE', 'City can perform a ranged attack: {1_Num}[ICON_Ranged]', 'en_US'),

('LOC_PREVIEW_DB_MOD_EMBARKED_VULNERABLE_TO_SIEGE_COMBAT', '{DB_NEG_AMOUNT_MINUS} Embarked{LOC_GOLD_LABEL}', 'en_US'),

('LOC_DB_DIFFICULTY_COMBAT_STRENGTH_SCALING_FOR_HUMANS_PREVIEW', '{DB_POS_VALUE_DARK_BG} Difficulty{LOC_GOLD_LABEL}', 'en_US'),

('LOC_ERU_ABILITY_ABANDONED_NAME', 'Will Drown Without Boat{LOC_GOLD_LABEL}', 'en_US'),	
('LOC_ERU_ABILITY_ABANDONED_DESC', 'Will die at end of turn when embarked unless adjacent to a naval unit', 'en_US'),
('LOC_ERU_ABILITY_RELIGIOUS_CANT_EMBARK_NAME', 'Needs Boat To Embark{LOC_GOLD_LABEL}', 'en_US'),	
('LOC_ERU_ABILITY_RELIGIOUS_CANT_EMBARK_DESC', 'Cannot embark unless adjacent to a naval unit', 'en_US'),

('LOC_NAME_DB_ABILITY_SAPPER', 'Sapper{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DESC_DB_ABILITY_SAPPER', 'When adjacent to a city or encampment, your Melee and Anti-Cavalry units do full damage to the walls (all eras)', 'en_US'),
('LOC_NAME_DB_ABILITY_BATTERING_RAM_IMPOTENT_TO_CASTLE', 'Advanced Walls', 'en_US'),
('LOC_DESC_DB_ABILITY_BATTERING_RAM_IMPOTENT_TO_CASTLE', 'Has no effect when next to a City Center with Medieval/Renaissance Walls. Can assist attacks against an Encampment with Medieval/Renaissance Walls when there is no Battering Ram adjacent to the City Center.', 'en_US'),

('LOC_DB_ABILITY_GAIN_EXP_FROM_ADJACENT_BATTLES_NAME', 'Gain XP From Observation{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_ABILITY_GAIN_EXP_FROM_ADJACENT_BATTLES_DESC', '+1 XP when next to a defending unit or an enemy unit in a melee battle. +2 XP when next to both. (Isn''t affected by other XP modifiers like barracks/stables/lighthouse.)', 'en_US'),
('LOC_DB_ABILITY_GAIN_EXP_FROM_ADJACENT_BATTLES_SCOUTS_NAME', 'Scouts: more XP From Observation{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_ABILITY_GAIN_EXP_FROM_ADJACENT_BATTLES_SCOUTS_DESC', '+1/+2 XP increases to +2/+4 XP. (Isn''t affected by other other XP modifiers.)', 'en_US'),

('LOC_DB_UNIT_SCOUT_DESC', 'Scouts are support units that cannot attack, but instead excel at gathering information. By default they can see through terrain features (like woods and rainforests), reveal stealth units, and are stealth units themselves. They receive experience by acquiring tribal villages, discovering natural wonders, and being adjacent to battles.{LOC_DB_SCOUT_PROMOTIONS}', 'en_US'),
('LOC_DB_SCOUT_PROMOTIONS', '[NEWLINE][NEWLINE]Promotions include:[NEWLINE][ICON_Bullet]{LOC_DB_PROMOTION_DOUBLE_TIME_NAME} ({LOC_DB_PROMOTION_DOUBLE_TIME_DESC})[NEWLINE][ICON_Bullet]{LOC_DB_PROMOTION_SPYGLASS_NAME} ({LOC_DB_PROMOTION_SPYGLASS_DESC})[NEWLINE][ICON_Bullet]{LOC_DB_PROMOTION_SCOUT_PATHFINDER_NAME} ({LOC_DB_PROMOTION_SCOUT_PATHFINDER_DESC})[NEWLINE][ICON_Bullet]{LOC_DB_PROMOTION_SCOUT_DISGUISE_NAME} ({LOC_DB_PROMOTION_SCOUT_DISGUISE_DESC})[NEWLINE][ICON_Bullet]{LOC_DB_PROMOTION_ELUSIVE_NAME} ({LOC_DB_PROMOTION_ELUSIVE_DESC})[NEWLINE][ICON_Bullet]{LOC_DB_PROMOTION_SCOUT_TROOP_INTEL_NAME} ({LOC_DB_PROMOTION_SCOUT_TROOP_INTEL_DESC})', 'en_US'),
('LOC_DB_PROMOTION_CLASS_LATER_RECON_NAME', 'Recon', 'en_US'),

('LOC_DB_PROMOTION_PATHFINDER_NAME', 'Pathfinder', 'en_US'),
('LOC_DB_PROMOTION_PATHFINDER_DESC', 'Ignore terrain movement costs', 'en_US'),

('LOC_DB_PROMOTION_SENTRY_NAME', 'Sentry', 'en_US'),
('LOC_DB_PROMOTION_SENTRY_DESC', 'Can see through Woods and Jungle.', 'en_US'),

('LOC_DB_PROMOTION_SCOUT_TROOP_INTEL_NAME', 'Troop Intel', 'en_US'),
('LOC_DB_PROMOTION_SCOUT_TROOP_INTEL_DESC', 'The Damaged [ICON_Strength] penalty is doubled for adjacent enemies', 'en_US'),

('LOC_DB_PROMOTION_SCOUT_DISGUISE_NAME', 'Disguise', 'en_US'),
('LOC_DB_PROMOTION_SCOUT_DISGUISE_DESC', 'Enter foreign territory (e.g. ignore closed borders)', 'en_US'),

('LOC_DB_PROMOTION_DOUBLE_TIME_NAME', 'Double Time', 'en_US'),
('LOC_DB_PROMOTION_DOUBLE_TIME_DESC', '+1 [ICON_Movement] movement', 'en_US'),

('LOC_DB_PROMOTION_SPYGLASS_NAME', 'Spyglass', 'en_US'),
('LOC_DB_PROMOTION_SPYGLASS_DESC', '+1 sight range', 'en_US'),

('LOC_DB_PROMOTION_EXTRA_RANGE_NAME', 'Hawkeye', 'en_US'),
('LOC_DB_PROMOTION_EXTRA_RANGE_DESC', '+1 range', 'en_US'),

('LOC_DB_PROMOTION_STEALTH_NAME', 'Stealth', 'en_US'),
('LOC_DB_PROMOTION_STEALTH_DESC', 'Hidden from enemy units unless they are adjacent or have an ability to reveal stealth units', 'en_US'),

('LOC_DB_PROMOTION_ELUSIVE_NAME', 'Elusive', 'en_US'),
('LOC_DB_PROMOTION_ELUSIVE_DESC', 'Ignore zones of control', 'en_US'),

('LOC_DB_ABILITY_SEE_THROUGH_TERRAIN_NAME', 'Sentry', 'en_US'),
('LOC_DB_ABILITY_SEE_THROUGH_TERRAIN_DESC', 'Can see through terrain features (e.g. woods and rainforests)', 'en_US'),

('LOC_DB_ABILITY_SCOUT_TROOP_INTEL_DAMAGE_DECREMENT_NAME', '{LOC_DB_PROMOTION_SCOUT_TROOP_INTEL_NAME} Damage', 'en_US'),
('LOC_DB_ABILITY_SCOUT_TROOP_INTEL_DAMAGE_DECREMENT_DESC', 'Damaged Unit [ICON_Strength] penalty doubled due to {LOC_DB_PROMOTION_SCOUT_TROOP_INTEL_NAME} from enemy Scout {LOC_DB_PROMOTION_SCOUT_TROOP_INTEL_NAME} (1[ICON_Strength] is reduced for every 5 damage)', 'en_US'),
('LOC_DB_MOD_SCOUT_TROOP_INTEL_PREVIEW', '(Damaged Unit [ICON_Strength] penalty doubled due to {LOC_DB_PROMOTION_SCOUT_TROOP_INTEL_NAME} from enemy Scout)', 'en_US'),


('LOC_DB_PROMOTION_CLASS_AERIAL_OBSERVATION_NAME', 'Aerial Observation', 'en_US'),
('LOC_DB_PROMOTION_CLASS_AIR_ATTACK_NAME', 'Air Ground-Attack', 'en_US'),
('LOC_DB_PROMOTION_CLASS_AIR_BOMBER_NAME', 'Air Bomber', 'en_US'),
('LOC_DB_PROMOTION_CLASS_AIR_FIGHTER_NAME', 'Air Fighter', 'en_US'),
('LOC_DB_PROMOTION_CLASS_ANTIAIR_NAME', 'Anti-Air', 'en_US'),
('LOC_DB_PROMOTION_CLASS_ARCHER_NAME', 'Archer', 'en_US'),
('LOC_DB_PROMOTION_CLASS_DEFENSIVE_GUN_NAME', 'Defensive Gun', 'en_US'),
('LOC_DB_PROMOTION_CLASS_ELEPHANT_NAME', 'War Elephant', 'en_US'),
('LOC_DB_PROMOTION_CLASS_FIREARM_INFANTRY_NAME', 'Firearm Infantry', 'en_US'),
('LOC_DB_PROMOTION_CLASS_FIREARM_CAVALRY_NAME', 'Firearm Cavalry', 'en_US'),
('LOC_DB_PROMOTION_CLASS_FIELD_ARTILLERY_NAME', 'Field Artillery', 'en_US'),
('LOC_DB_PROMOTION_CLASS_GIANT_DEATH_ROBOT_NAME', 'Giant Death Robot', 'en_US'),
('LOC_DB_PROMOTION_CLASS_HEAVY_CAVALRY_NAME', 'Heavy Cavalry', 'en_US'),
('LOC_DB_PROMOTION_CLASS_HEAVY_INFANTRY_NAME', 'Heavy Infantry', 'en_US'),
('LOC_DB_PROMOTION_CLASS_HELICOPTER_NAME', 'Helicopter', 'en_US'),
('LOC_DB_PROMOTION_CLASS_LIGHT_CAVALRY_NAME', 'Light Cavalry', 'en_US'),
('LOC_DB_PROMOTION_CLASS_LIGHT_INFANTRY_NAME', 'Light Infantry', 'en_US'),
('LOC_DB_PROMOTION_CLASS_MARINE_NAME', 'Marine', 'en_US'),
('LOC_DB_PROMOTION_CLASS_MONK_NAME', 'Warrior Monk', 'en_US'),
('LOC_DB_PROMOTION_CLASS_NAVAL_BOMBARD_NAME', 'Naval Bombard', 'en_US'),
('LOC_DB_PROMOTION_CLASS_NAVAL_CARRIER_NAME', 'Carrier', 'en_US'),
('LOC_DB_PROMOTION_CLASS_NAVAL_MELEE_NAME', 'Naval Melee', 'en_US'),
('LOC_DB_PROMOTION_CLASS_NAVAL_RECONRAIDER_NAME', 'Naval Recon/Raider', 'en_US'),
('LOC_DB_PROMOTION_CLASS_NAVAL_RANGED_NAME', 'Naval Ranged', 'en_US'),
('LOC_DB_PROMOTION_CLASS_RECON_NAME', 'Recon', 'en_US'),
('LOC_DB_PROMOTION_CLASS_SIEGE_NAME', 'Siege', 'en_US'),
('LOC_DB_PROMOTION_CLASS_SIEGE_ARTILLERY_NAME', 'Siege Artillery', 'en_US'),
('LOC_DB_PROMOTION_CLASS_SUPPORT_NAME', 'Support', 'en_US'),
('LOC_DB_PROMOTION_CLASS_TANK_NAME', 'Tank', 'en_US'),



-- Promotions used on multiple units
('LOC_DB_PROMOTION_ZONE_OF_CONTROL_NAME', 'Zone of Control', 'en_US'),
('LOC_DB_PROMOTION_ZONE_OF_CONTROL_DESCRIPTION', 'Exert a zone of control on adjacent enemy units', 'en_US'),

('LOC_DB_PROMOTION_DOUBLE_STRIKE_NAME', 'Double Strike', 'en_US'),
('LOC_DB_PROMOTION_DOUBLE_STRIKE_DESCRIPTION', 'Can make 2 attacks in a turn', 'en_US'),

('LOC_DB_PROMOTION_IMPEL_NAME', 'Impel', 'en_US'),
('LOC_DB_PROMOTION_IMPEL_DESCRIPTION', 'Push back opponents when you attack and deal more damage to them than they do to you (and if they can''t retreat, they''ll take even more damage)', 'en_US'),

('LOC_DB_PROMOTION_HIT_AND_RUN_NAME', 'Hit and Run', 'en_US'),
('LOC_DB_PROMOTION_HIT_AND_RUN_DESCRIPTION', 'Move after attacking', 'en_US'),

('LOC_DB_PROMOTION_PRIORITY_TARGET_NAME', 'Priority Target', 'en_US'),
('LOC_DB_PROMOTION_PRIORITY_TARGET_DESCRIPTION', 'Acquire the ability to do a 65 damage attack to support (diamond icon) units, even when they share a tile with a front-line unit', 'en_US'),

('LOC_DB_PROMOTION_SURVIVALIST_NAME', 'Survivalist', 'en_US'),
('LOC_DB_PROMOTION_SURVIVALIST_DESCRIPTION', 'Heal after any action', 'en_US'),

('LOC_DB_PROMOTION_TERROR_AND_PANIC_NAME', 'Terror and Panic', 'en_US'),
('LOC_DB_PROMOTION_TERROR_AND_PANIC_DESCRIPTION', 'Pillaging only costs 1 [ICON_Movement] movement', 'en_US'),

('LOC_DB_PROMOTION_AMPHIBIOUS_DESCRIPTION', 'No [ICON_Movement] Movement penalty for shores or rivers.', 'en_US'),

('LOC_DB_PROMOTION_HEAVY_INFANTRY_PHALANX_NAME', 'Phalanx Formation', 'en_US'),
('LOC_DB_PROMOTION_HEAVY_INFANTRY_PHALANX_DESCRIPTION', '+10 [ICON_STRENGTH] Combat Strength on defense', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_HEAVY_INFANTRY_PHALANX_CHAPTER_HISTORY_PARA_1', 'The infantry phalanx was a Sumerian tactical formation as far back as the third millennium BC where the soldiers would line up in ranks in close order. The soldiers would lock their shields together, and the first few ranks would project their spears out over the first rank of shields. The phalanx therefore presented a shield wall and a mass of spear points to the enemy, making frontal assaults against it very difficult. It also allowed a higher proportion of the soldiers to be actively engaged in combat at a given time (rather than just those in the front rank).[NEWLINE][NEWLINE]The phalanx usually advanced at a walking pace, although it is possible that they picked up speed during the last several yards. One of the main reasons for this slow approach was to maintain formation. The formation would be rendered useless if the phalanx was lost as the unit approached the enemy and could even become detrimental to the advancing unit, resulting in a weaker formation that was easier for an enemy force to break through. Herodotus states of the Greeks at the Battle of Marathon, that "They were the first Greeks we know of to charge their enemy at a run". Historians believe that this innovation was to minimize their losses from Persian archery.', 'en_US'),

('LOC_DB_PROMOTION_HEAVY_INFANTRY_OBLIQUE_ORDER_NAME', 'Oblique Order', 'en_US'),
('LOC_DB_PROMOTION_HEAVY_INFANTRY_OBLIQUE_ORDER_DESCRIPTION', '+5 [ICON_Strength] Combat Strength when attacking or defending against Heavy Infantry', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_HEAVY_INFANTRY_OBLIQUE_ORDER_CHAPTER_HISTORY_PARA_1', 'The oblique order is a military tactic among heavy infantry battles where an attacking army deploys an asymmetical line formation in an attempt to overwhelm an enemy flank. The commander concentrates the majority of their strength (elite units and/or a greater quantity of troops) on one flank while the remainder fixes the enemy line. This technique allows a commander with weaker or equal total forces to achieve a quick local superiority in numbers on one side and then snowball that advantage down the rest of the line.[NEWLINE][NEWLINE]In the oblique order attack, the line is intentionally thinner on one side in order to concentrate troops on the other side. Then, when meeting the opposing heavy infantry, they would then create an angled (oblique) engagement with the enemy, refusing complete engagement on the weakened flank, but attacking in full on the stronger flank with a concentration of force. Once the strong flank had dominated its opposition, the commander would wheel the troops 90 degrees to roll up the enemy line.[NEWLINE][NEWLINE]The first recorded use of this sort of tactic was in 371 BCE at the Battle of Leuctra, in Greece, when the Thebans under Epaminondas defeated the Spartans by highly enforcing one flank to fifty rows deep, rather than spreading forces parsimoniously. Philip of Macedon learned Epaminondas'' technique while held prisoner at Thebes, and his descendants (including Alexander), used it in their campaigns. King Frederick II of Prussia also particularly favored this tactic.', 'en_US'),


('LOC_DB_PROMOTION_HEAVY_CAVALRY_SHOCK_TACTICS_NAME', 'Shock Tactics', 'en_US'),
('LOC_DB_PROMOTION_HEAVY_CAVALRY_SHOCK_TACTICS_DESCRIPTION', '+10 [ICON_Strength] Combat Strength when attacking units with more than 20 damage', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_HEAVY_CAVALRY_SHOCK_TACTICS_CHAPTER_HISTORY_PARA_1', 'Shock tactics or a shock attack is the name of an offensive maneuver which attempts to place the enemy under psychological pressure by a rapid and fully committed advance aimed to cause the enemy to retreat and be routed. Shock tactics typically involved a higher degree of risk in order to attain a decisive result. The most famous shock tactic is the medieval cavalry charge. This attack was conducted by heavily armoured cavalry armed with lances galloping at full speed against an enemy formation timed to exploit a gap or other weakness.', 'en_US'),

('LOC_DB_PROMOTION_HEAVY_CAVALRY_HAMMER_AND_ANVIL_NAME', 'Hammer and Anvil', 'en_US'),
('LOC_DB_PROMOTION_HEAVY_CAVALRY_HAMMER_AND_ANVIL_DESCRIPTION', 'Adjacent enemies that are also adjacent to our Heavy Infantry:[NEWLINE]-10 [ICON_Strength] defense vs Heavy Cavalry (including this one)', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_HEAVY_CAVALRY_HAMMER_AND_ANVIL_CHAPTER_HISTORY_PARA_1', 'The hammer and anvil is a relatively simple maneuver. It begins with two heavy infantry forces engaged in a frontal assault. While the infantry lines are fixed in the engagement, the cavalry force maneuvers around the enemy and attacks from behind, "hammering" the foes it into the allied infantry ("anvil"). It was especially favored by Alexander the Great and Eastern cataphracts.', 'en_US'),

('LOC_DB_PROMOTION_HEAVY_CAVALRY_MORALE_BOOST_NAME', 'Morale Boost', 'en_US'),
('LOC_DB_PROMOTION_HEAVY_CAVALRY_MORALE_BOOST_DESCRIPTION', 'Adjacent friendly units:[NEWLINE]+3 [ICON_Strength] Combat Strength on attack and defense', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_HEAVY_CAVALRY_MORALE_BOOST_CHAPTER_HISTORY_PARA_1', 'Heavy Cavalry troops were typically the wealthiest and best trained soldiers in the army because it took a lot of money to outfit a horse and rider with the best weapons and armor, which gives rise to the connection between nobility and knights/equites/cataphracts. Some heavy cavalry units, like the Winged Hussars of Poland, adopted distinctive costumes, ornate helmets, and gilded weapons to reinforce their prestige. Ordinary troops would often cheer as their nation''s best-trained nobles joined the battlefield.', 'en_US'),

('LOC_DB_PROMOTION_HEAVY_CAVALRY_FLYING_WEDGE_NAME', 'Flying Wedge', 'en_US'),
('LOC_DB_PROMOTION_HEAVY_CAVALRY_FLYING_WEDGE_DESCRIPTION', '+5 [ICON_Strength] Combat Strength when attacking Heavy Infantry units', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_HEAVY_CAVALRY_FLYING_WEDGE_CHAPTER_HISTORY_PARA_1', 'A flying wedge (also called flying V or wedge formation) occurs when troops move forward in a triangular formation. The men were deployed in a triangular or trapezoid formation with the tip leading the way. According to Arrian and Asclepiodotus, the wedge was first used by the Scythians, and then the Thracians. Philip II of Macedon (and his son Alexander) adopted it from them as the main formation of his Companion cavalry. The advantage of the wedge was that it offered a narrow point for piercing enemy formations and concentrated the leaders at the front. It was easier to turn than a square formation because everyone followed the leader at the apex, "like a flight of cranes."', 'en_US'),

('LOC_DB_PROMOTION_HEAVY_CAVALRY_FEINT_NAME', 'Feint', 'en_US'),
('LOC_DB_PROMOTION_HEAVY_CAVALRY_FEINT_DESCRIPTION', 'Adjacent enemies: -5 [ICON_Strength] defense vs land melee attacks.[NEWLINE]This unit: -5 [ICON_Strength] when attacking (because it''s not feinting).', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_HEAVY_CAVALRY_FEINT_CHAPTER_HISTORY_PARA_1', 'A feint is a "fake" attack designed to draw defensive action toward one point of the battlefield as a diversion. The cavalry rides in as if they were attacking, forcing the enemy to concentrate defensive manpower in that area which weakens their manpower in another area. The cavalry quickly calls off the attack just before engagement, avoiding casualties on both sides... but a simultaneous attack on the enemy from another angle will be less capable of defending.', 'en_US'),



('LOC_DB_PROMOTION_HEAVY_INFANTRY_TESTUDO_NAME', 'Testudo Formation', 'en_US'),
('LOC_DB_PROMOTION_HEAVY_INFANTRY_TESTUDO_DESCRIPTION', '+10 [ICON_Strength] Combat Strength when defending ranged attacks', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_HEAVY_INFANTRY_TESTUDO_CHAPTER_HISTORY_PARA_1', 'In Ancient Roman warfare, the testudo (tortoise) formation was a type of shield wall commonly used by the Roman Legions where the men would align their shields to protect the unit from all incoming projectiles. The first row of men would hold their shields from about the height of their shins to their eyes, so as to cover the formation''s front. The men in the back ranks would place their shields over their heads to protect the formation from above, balancing the shields on their helmets, overlapping them. If necessary, the legionaries on the sides and rear of the formation could stand sideways or backwards with shields held as the front rows, so as to protect the formation''s sides and rear. This reduced the speed and mobility of the formation, but offered excellent protection against arrows and other missile attacks.', 'en_US'),

('LOC_DB_PROMOTION_LIGHT_INFANTRY_SCREEN_NAME', 'Screen', 'en_US'),
('LOC_DB_PROMOTION_LIGHT_INFANTRY_SCREEN_DESCRIPTION', 'When next to a friendly land melee unit: adjacent enemies -7 [ICON_Strength] defense in land melee battles', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_LIGHT_INFANTRY_SCREEN_CHAPTER_HISTORY_PARA_1', 'Light infantry was deployed as a vanguard, flank guard, or rearguard to screen a tactical position or a larger body of friendly troops from enemy advances. They were usually deployed in a skirmish line, an irregular open formation much more spread out in depth and breadth than a traditional line formation. Their purpose was to harass the enemy, engaging them in only light or sporadic combat in order to delay their movement, disrupt their attack, or weaken their morale. The skirmishers'' open formations and smaller numbers can give them superior mobility over the regular forces, allowing them to fight on more favorable terms, taking advantage of better position or terrain and quickly withdrawing from any threat of superior enemy forces.[NEWLINE][NEWLINE]Though often critical in screening the main army from sudden enemy attacks, skirmish troops couldn''t take or defend ground from heavy infantry or heavy cavalry.', 'en_US'),

('LOC_DB_PROMOTION_LIGHT_INFANTRY_FLANK_GUARD_NAME', 'Flank Guard', 'en_US'),
('LOC_DB_PROMOTION_LIGHT_INFANTRY_FLANK_GUARD_DESCRIPTION', 'When next to a friendly land melee unit: adjacent enemies -7 [ICON_Strength] attack in land melee battles', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_LIGHT_INFANTRY_FLANK_GUARD_CHAPTER_HISTORY_PARA_1', '', 'en_US'),


('LOC_DB_PROMOTION_LIGHT_CAVALRY_ENVELOPE_NAME', 'Envelope', 'en_US'),
('LOC_DB_PROMOTION_LIGHT_CAVALRY_ENVELOPE_DESCRIPTION', 'Adjacent enemies:[NEWLINE]-5 [ICON_Strength] Combat Strength when defending land melee attacks', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_LIGHT_CAVALRY_ENVELOPE_CHAPTER_HISTORY_PARA_1', 'Envelopment is the military tactic of seizing objectives in the enemy''s rear with the goal of destroying specific enemy forces and denying them the ability to withdraw. Rather than attacking the enemy head-on, an envelopment seeks to exploit the enemy''s flanks, attacking them from multiple directions and inducing a psychological shock on the defender. An envelopment will consist of the enveloping forces, which attacks the enemy''s flank(s), and a fixing force, which attacks the enemy''s front and "fixes" them in place so that they cannot withdraw or shift their focus on the enveloping forces.', 'en_US'),

('LOC_DB_PROMOTION_LIGHT_CAVALRY_DUST_STORM_NAME', 'Dust Storm', 'en_US'),
('LOC_DB_PROMOTION_LIGHT_CAVALRY_DUST_STORM_DESCRIPTION', 'Adjacent enemies:[NEWLINE]-5 [ICON_Strength] Combat Strength when attacking', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_LIGHT_CAVALRY_DUST_STORM_CHAPTER_HISTORY_PARA_1', 'Another way the Mongols used deception and terror was by tying tree branches or leaves behind their horses. They dragged the foliage behind them in a systematic fashion to create dust storms.', 'en_US'),

('LOC_DB_PROMOTION_LIGHT_CAVALRY_PARTHIAN_SHOT_NAME', 'Parthian Shot', 'en_US'),
('LOC_DB_PROMOTION_LIGHT_CAVALRY_PARTHIAN_SHOT_DESCRIPTION', '+5 [ICON_STRENGTH] Combat Strength on defense', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_LIGHT_CAVALRY_PARTHIAN_SHOT_CHAPTER_HISTORY_PARA_1', 'The Parthian shot is a light cavalry military tactic made famous in the West by the Parthians, an ancient Iranian people. While retreating at full gallop, their horse archers would turn their bodies back to shoot at the pursuing enemy from over the horses'' tails. The maneuver required superb equestrian skills, since the rider''s hands were occupied with the bow. As the stirrup had not been invented at the time of the Parthians, the rider relied solely on pressure from his legs to guide his horse.[NEWLINE][NEWLINE]In addition to the Parthians, this tactic was used by most nomads of the Eurasian steppe, including the Scythians, Huns, Turks, Magyars, and Mongols. The technique was used to great effect in Parthia''s victory over the Rome in the Battle of Carrhae where 20,000 Romans were killed (and another 10,000 captured) compared to Parthia''s loss of only a few dozen horses. Marcus Licinius Crassus (of the First Triumvirate) and his son Publius led the Romans and both were killed by the Parthians.', 'en_US'),

('LOC_DB_PROMOTION_LIGHT_CAVALRY_STRING_OF_MARES_NAME', 'String of Mares', 'en_US'),
('LOC_DB_PROMOTION_LIGHT_CAVALRY_STRING_OF_MARES_DESCRIPTION', '+1 [ICON_Movement] movement and heal after any action', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_LIGHT_CAVALRY_STRING_OF_MARES_CHAPTER_HISTORY_PARA_1', 'Each Mongol soldier typically maintained 3 or 4 horses. Changing horses often allowed them to travel at high speed for days without stopping or wearing out the animals. When one horse tired, the rider would dismount and rotate to another. Though the used mount would still have to travel, it would do so without the weight of the rider. Their ability to live off the land, and in extreme situations off their animals (mare''s milk especially), made their armies far less dependent on the traditional logistical apparatus of agrarian armies. In some cases, as during the invasion of Hungary in early 1241, they covered up to 100 miles (160 km) per day, which was unheard of by other armies of the time. The horse was viewed much like a cow in Mongolia; milked and slaughtered for meat as such. Since most of the Mongols'' mounts were mares, they were able to live off their horses'' milk or milk products as they moved through enemy territory. In dire straits, the Mongol warrior could drink some of the blood from his string of remounts. They could survive a whole month only by drinking mare''s milk combined with mare''s blood.', 'en_US'),


('LOC_DB_PROMOTION_ARCHER_COVER_FIRE_NAME', 'Cover Fire', 'en_US'),
('LOC_DB_PROMOTION_ARCHER_COVER_FIRE_DESCRIPTION', '+4 [ICON_Strength] Combat Strength flanking[NEWLINE](e.g. provides 6 [ICON_Strength] flanking to nearby units instead of 2 [ICON_Strength])', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_ARCHER_COVER_FIRE_CHAPTER_HISTORY_PARA_1', '', 'en_US'),

('LOC_DB_PROMOTION_ARCHER_SUPPRESSIVE_FIRE_NAME', 'Suppressive Fire', 'en_US'),
('LOC_DB_PROMOTION_ARCHER_SUPPRESSIVE_FIRE_DESCRIPTION', '+4 [ICON_Strength] Combat Strength support[NEWLINE](e.g. provides 6 [ICON_Strength] support to nearby units instead of 2 [ICON_Strength])', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_ARCHER_SUPPRESSIVE_FIRE_CHAPTER_HISTORY_PARA_1', '', 'en_US'),

('LOC_DB_PROMOTION_ARCHER_BROADHEADS_NAME', 'Broadheads', 'en_US'),
('LOC_DB_PROMOTION_ARCHER_BROADHEADS_DESCRIPTION', '+10 [ICON_Strength] Combat Strength attacking Light Infantry, Light Cavalry, Archer, and Siege units', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_ARCHER_BROADHEADS_CHAPTER_HISTORY_PARA_1', '', 'en_US'),

('LOC_DB_PROMOTION_ARCHER_BARBED_TRILOBATES_NAME', 'Barbed Trilobates', 'en_US'),
('LOC_DB_PROMOTION_ARCHER_BARBED_TRILOBATES_DESCRIPTION', '+10 [ICON_Strength] Combat Strength attacking Heavy Infantry and Heavy Cavalry', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_ARCHER_BARBED_TRILOBATES_CHAPTER_HISTORY_PARA_1', 'In describing the Roman''s humiliating defeat at the Battle of Carrhae, Plutarch said:[NEWLINE][NEWLINE]"...being crowded into a narrow compass and falling one upon another, [the Romans] were shot, and died no easy nor even speedy death. For, in the agonies of convulsive pain, and writhing about the arrows, they would break them off in their wounds, and then in trying to pull out by force the barbed heads which had pierced their veins and sinews, they tore and disfigured themselves the more. Thus many died, and the survivors also were incapacitated for fighting. And when Publius urged them to charge the enemy''s mail clad horsemen, they showed him that their hands were riveted to their shields and their feet nailed through and through to the ground, so that they were helpless either for flight or for self defence."[NEWLINE][NEWLINE]The Parthian''s fierce "barbed heads" were likely descendants of the Scythian arrowhead, also known as a Scythian point, that carries a fascinating history.  With a trilobate shape, Scythian points were designed like a rocket or bullet with three blades extending from the body. Some of the arrowheads had protruding barbs, while others lacked this painful extra. The trilobate was usually made of bronze, while the shaft used to deliver the arrowhead was made of reed or wood and was roughly 30 inches long. The design and craftsmanship employed was brilliant, for its aerodynamic body made it extremely practical to use against the finest and toughest of armor.[NEWLINE][NEWLINE]The Scythian point originated around the 7th century BCE, suggesting that Scythians developed the weapon in order to pierce Assyrian armor, as Scythians and Cimmerians were indeed at war with Assyria on and off during that time period. Now, this was not the only arrowhead style or material used by the Scythians, for some arrowheads were made of bone, stone, iron, or bronze. As for shape, some looked like small spearheads, while others were leaf-shaped, which may have been used for hunting. The discussed trilobite shape, however, was most likely used for combat purposes.[NEWLINE][NEWLINE]Besides the lethal design of the Scythian trilobite point, another nasty feature was the poison. Not only were these ancient fighters experts at archery, but also in biological warfare. Fortunately, or unfortunately depending on how you see it, the Scythians had a wide variety of deadly poisons to choose from. The not so friendly reptiles inhabiting the area included the steppe viper, Caucasus viper, European adder, and the long-nose/sand viper.[NEWLINE][NEWLINE]Truly, the Scythians had a vast arsenal of snake venoms of all degrees at their disposal. The book titled, "On Marvelous Things Heard," by Pseudo-Aristotle, which was a work written by his followers, if not written in part by Aristotle himself, mentions the Scythian handling of snakes and how to extract their poison:[NEWLINE][NEWLINE]"They say that the Scythian poison, in which that people dips its arrows, is procured from the viper. The Scythians, it would appear, watch those that are just bringing forth young, and take them, and allow them to putrefy for some days."[NEWLINE][NEWLINE]After several days passed, the Scythian shaman would then take the venom and mix it with other ingredients. One of these concoctions required human blood:[NEWLINE][NEWLINE]"But when the whole mass appears to them to have become sufficiently rotten, they pour human blood into a little pot, and, after covering it with a lid, bury it in a dung-hill. And when this likewise has putrefied, they mix that which settles on the top, which is of a watery nature, with the corrupted blood of the viper, and thus make it a deadly poison."[NEWLINE][NEWLINE]The Roman author Aelian also mentions this process, saying, "The Scythians are even said to mix serum from the human body with the poison that they smear upon their arrows." Both accounts show that the Scythians were able to excite the blood in order to separate it from the yellow watery plasma. Once the mixture of blood and dung had putrefied, the shaman would take the serum and excrement and mix it in with the next ingredient, venom, along with the decomposed viper. Once the process was complete, the Scythians would place their arrowheads into this deadly mixture ready for use.[NEWLINE][NEWLINE]The historian Strabo mentions a second use of this deadly poison:[NEWLINE][NEWLINE]"The Soanes use poison of an extraordinary kind for the points of their weapons; even the odor of this poison is a cause of suffering to those who are wounded by arrows thus prepared."[NEWLINE][NEWLINE]So the arrowhead was poisonous, but why stop there? Sometimes they ensured that the barbs on the arrowhead were also coated with the deadly concoction. The Roman poet Ovid, who was exiled to the Black Sea, got a good look at these poisonous plus arrows and reported them as "native arrow-points have their steel barbs smeared with poison, carry a double hazard of death." He also described the poisonous ingredient as "yellow with vipers gall."[NEWLINE][NEWLINE]To get a better understanding of this "double death," Renate Rolle elaborates further on the barbed arrowheads: "These arrowheads, fitted with hooks and soaked in poison, were particularly feared, since they were very difficult to remove from the wound and caused the victim great pain during the process." A very grim picture, without question. Too be struck by an arrowhead with barbs or hooks, poisoned with putrefied remains, would indeed be horrific.[NEWLINE][NEWLINE]With all these different poisons used by the Scythians, they had to know how to tell what was what in their gorytus, or case for holding the bow and quiver of arrows. The length of the gorytas was relatively shorter than the bow itself, leaving the weapon partially exposed. It also had a metal covering for the arrows, most likely to protect the archer from scraping his skin across the poisonous arrowheads.[NEWLINE][NEWLINE]The Scythians would paint their arrow shafts in the color of red or black, while others had zigzag and diamond patters decorating them. Not so coincidently, these various patterns painted upon the arrow shafts were the same patterns found upon the various vipers used by the Scythians as their agents of death. Vipers with a zigzag or diamond pattern upon their backs were the most poisonous of all.[NEWLINE][NEWLINE]Clearly, the painted design was a way for the archer to tell which poison he was using. Additionally, the decorated arrow shafts, when fired at the enemy, likely had a psychological effect, for they must have looked like snakes flying through the air, while the barbs protruding from the point appeared like fangs to the enemy.[NEWLINE][NEWLINE]So now that the Scythians had their gorytus, stacked with a fierce weapon and deadly arrows, it was just a matter of choosing which chemical killer to use on the enemy.[NEWLINE][NEWLINE]"Pick Your Poison" by Cam Rea https://classicalwisdom.com/politics/enemies/pick-your-poison/', 'en_US'),

('LOC_DB_PROMOTION_ARCHER_LOOPHOLE_TRAINING_NAME', 'Loophole Training', 'en_US'),
('LOC_DB_PROMOTION_ARCHER_LOOPHOLE_TRAINING_DESCRIPTION', '+10 [ICON_Strength] attacking from cities and encampments[NEWLINE]+10 [ICON_Strength] attacking and defending from forts', 'en_US'),
('LOC_PEDIA_UNITPROMOTIONS_PAGE_DB_PROMOTION_ARCHER_LOOPHOLE_TRAINING_CHAPTER_HISTORY_PARA_1', '', 'en_US'),



('LOC_DB_MOD_GREAT_MERCHANTS_GRANT_TRADE_ROUTE', 'Increase [ICON_TradeRoute] Trade Route capacity by 1.{LOC_GOLD_LABEL}', 'en_US'),

-- ('LOC_DB_LEARN_FROM_OTHER_CIVS_LIST_OF_BONUSES', '[COLOR_Blue]LIST OF BONUSES[ENDCOLOR][NEWLINE][ICON_Bullet]Met Civilization +20%[NEWLINE][NEWLINE][ICON_Bullet]Diplomatic Visibility: Limited +15%[NEWLINE][ICON_Bullet]Diplomatic Visibility: Open +30%[NEWLINE][ICON_Bullet]Diplomatic Visibility: Secret +45%[NEWLINE][ICON_Bullet]Diplomatic Visibility: Top Secret +60%[NEWLINE][NEWLINE][ICON_Bullet]Alliance Level 1 +30% (alliances require Civ VI: Rise & Fall or Gathering Storm)[NEWLINE][ICON_Bullet]Alliance Level 2 +40%[NEWLINE][ICON_Bullet]Alliance Level 3 +50%[NEWLINE][NEWLINE][ICON_Bullet]Research Alliance Level 1 +60% for technologies, +30% for civics[NEWLINE][ICON_Bullet]Research Alliance Level 2 +80% for technologies, +40% for civics[NEWLINE][ICON_Bullet]Research Alliance Level 3 +100% for technologies, +50% for civics[NEWLINE][NEWLINE][ICON_Bullet]Cultural Alliance Level 1 +60% for civics, +30% for technologies[NEWLINE][ICON_Bullet]Cultural Alliance Level 2 +80% for civics, +40% for technologies[NEWLINE][ICON_Bullet]Cultural Alliance Level 3 +100% for civics, +50% for technologies[NEWLINE][NEWLINE][ICON_Bullet]Declared Friend +10% (when not in an alliance)[NEWLINE][ICON_Bullet]Open Borders in their territory +10% (when not in an alliance)[NEWLINE][ICON_Bullet]Defensive Pact +10% (when not in an alliance)[NEWLINE][ICON_Bullet]In a Joint War together +10% (when not in an alliance)' , 'en_US'),
('LOC_DB_LEARN_FROM_OTHER_CIVS_LIST_OF_BONUSES', '[COLOR_Blue]LIST OF BONUSES[ENDCOLOR][NEWLINE][ICON_Bullet]Diplomatic Visibility: Limited +25%[NEWLINE][ICON_Bullet]Diplomatic Visibility: Open +50%[NEWLINE][ICON_Bullet]Diplomatic Visibility: Secret +75%[NEWLINE][ICON_Bullet]Diplomatic Visibility: Top Secret +100%[NEWLINE][NEWLINE][ICON_Bullet]Alliance Level 1 +30% (alliances require Civ VI: Rise & Fall or Gathering Storm)[NEWLINE][ICON_Bullet]Alliance Level 2 +40%[NEWLINE][ICON_Bullet]Alliance Level 3 +50%[NEWLINE][NEWLINE][ICON_Bullet]Research Alliance Level 1 +60% for technologies, +30% for civics[NEWLINE][ICON_Bullet]Research Alliance Level 2 +80% for technologies, +40% for civics[NEWLINE][ICON_Bullet]Research Alliance Level 3 +100% for technologies, +50% for civics[NEWLINE][NEWLINE][ICON_Bullet]Cultural Alliance Level 1 +60% for civics, +30% for technologies[NEWLINE][ICON_Bullet]Cultural Alliance Level 2 +80% for civics, +40% for technologies[NEWLINE][ICON_Bullet]Cultural Alliance Level 3 +100% for civics, +50% for technologies[NEWLINE][NEWLINE][ICON_Bullet]Declared Friend +10% (when not in an alliance)[NEWLINE][ICON_Bullet]Open Borders in their territory +10% (when not in an alliance)[NEWLINE][ICON_Bullet]Defensive Pact +10% (when not in an alliance)[NEWLINE][ICON_Bullet]In a Joint War together +10% (when not in an alliance)' , 'en_US'),
-- ('LOC_DB_LEARN_FROM_OTHER_CIVS_EXPLANATION', '======================== [COLOR:SuzerainDark]Learn From Other Civs[ENDCOLOR]{LOC_GOLD_LABEL} ========================[NEWLINE][NEWLINE]Your civilization''s science/culture output gets a bonus when you are researching a tech/civic that you''ve seen in another civilization. Consider: the most helpful knowledge for researching something like, say, nuclear fission or democracy, would be knowing that it exists and seeing it in action somewhere in the world. Compare that to researching alchemy (trying to turn lead into gold), which was heavily studied in medieval times but all those experiments were in vain.[NEWLINE][NEWLINE]Here''s how it works... For each civ that has the tech/civic you are researching, you get a bonus based on how friendly you are with that nation. In other words, you would learn about gunpowder faster from a friend than you would from an enemy, and faster yet from a scientific research ally. The lowest bonus you could have from another civ is +20% (i.e. if you''ve only just met them, or you''re at war), and the highest is +180% (i.e. if you have a Level 3 Research Alliance and Top Secret diplomatic visibility).[NEWLINE][NEWLINE]The bonus you receive from other civilizations does not overflow into your next tech/civic. Thus, on your last turn of researching a tech/civic, the alloted bonus may be less than the calculated amount, or it may not be there at all (when your own empire''s science was sufficient to complete the tech/civic).[NEWLINE][NEWLINE]{LOC_DB_LEARN_FROM_OTHER_CIVS_LIST_OF_BONUSES}' , 'en_US'),
('LOC_DB_LEARN_FROM_OTHER_CIVS_EXPLANATION', '======================== [COLOR:SuzerainDark]Learn From Other Civs[ENDCOLOR]{LOC_GOLD_LABEL} ========================[NEWLINE][NEWLINE]Your civilization''s science/culture output gets a bonus when you are researching a tech/civic that you know about from another civilization. Consider: the most helpful knowledge for researching something like, say, nuclear fission or democracy, would be knowing that it exists and seeing it in action somewhere in the world. Compare that to researching alchemy (trying to turn lead into gold), which was heavily studied in medieval times but all those experiments were in vain.[NEWLINE][NEWLINE]Here''s how it works... For each civ that has the tech/civic you are researching, you get a bonus based on how much knowledge you have from that nation and how willingly they share it with you. In other words, you would learn about gunpowder faster from a friend than you would from an enemy, and faster yet from a scientific research ally. To get a bonus you need to develop some intel on their civilization with diplomatic visibility or a friendship. The highest possible bonus is +200% (i.e. if you have a Level 3 Research Alliance and Top Secret diplomatic visibility).[NEWLINE][NEWLINE]The bonus you receive from other civilizations does not overflow into your next tech/civic. Thus, on your last turn of researching a tech/civic, the alloted bonus may be less than the calculated amount, or it may not be there at all (when your own empire''s science was sufficient to complete the tech/civic).[NEWLINE][NEWLINE]{LOC_DB_LEARN_FROM_OTHER_CIVS_LIST_OF_BONUSES}' , 'en_US'),
-- [NEWLINE][NEWLINE]Now if you see a technology in multiple nations, you do get a bonus from each, but there are diminishing returns. You get your bonus in full from your closest friend, but for each civ after that, the bonus is halved. This is because it is assumed that about half of what you learn about gunpowder from your second best friend is redundant with what you already knew from your best friend. Then we move to the civ with the third highest bonus and it is halved again (i.e. +1% becomes +0.25%), and so on for every other civilization that we''ve met that has the thing we''re researching. Therefore, the biggest bonuses come from your one or two best friends, and the rest are just table scraps. Your scientists aren''t really learning anything new from North Korea''s implementation of rocketry; although if it was the world''s only successful implementation of rocketry, they''d learn quite a bit.
-- [NEWLINE][NEWLINE][ICON_Bullet]Redundant Information -X% (from multiple civilizations, as explained above)
('LOC_DB_LEARN_FROM_OTHER_CIVS_TOOLTIP_HEADER', '[NEWLINE]----------------------------------[NEWLINE][COLOR:SuzerainDark]Learn From Other Civs[ENDCOLOR]{LOC_GOLD_LABEL}[NEWLINE]' , 'en_US'),

('LOC_DB_TOURISM_TOOLTIP_HEADER', '[NEWLINE]---------------------------------------------------[NEWLINE]', 'en_US'),
('LOC_DB_MY_DOMESTIC_TOURISTS', 'Our Domestic Tourist Score: {1_Num}', 'en_US'),
('LOC_DB_MY_VISITING_TOURISTS', 'Our Visiting Tourist Score: {1_Num}', 'en_US'),
('LOC_DB_MY_TRAVELING_TOURISTS', 'Where Our Citizens Are Going', 'en_US'),
('LOC_DB_VISITING_TOURIST_LINE', '[ICON_Bullet]From {1_Civ}: {2_Total} (+{3_PerTurn}/Turn)', 'en_US'),
('LOC_DB_VISITING_TOURIST_LINE_WITH_GOLD', '[ICON_Bullet]From {1_Civ}: {2_Total} (+{3_PerTurn}/Turn, +{4_Gold}[ICON_Gold])', 'en_US'),
('LOC_DB_TRAVELING_TOURIST_LINE', '[ICON_Bullet]To {1_Civ}: {2_Total} (+{3_PerTurn}/Turn)', 'en_US'),
('LOC_DB_TOTAL_LINE', 'Total: {1_Total}', 'en_US'),
('LOC_DB_CULTURE_VICTORY', 'Victory is achieved when a player[NEWLINE]earns a Visiting Tourist Score[NEWLINE]that''s higher than every other[NEWLINE]civilization''s Domestic Tourist Score', 'en_US'),

('LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_SCRIPTURE_CHAPTER_HISTORY_PARA_1', '***Olympic Pantheons***[NEWLINE]This policy will be applied to the faith bonuses from:[NEWLINE]Alpheus[NEWLINE]Aphrodite (Holy Site only)[NEWLINE]Gaia[NEWLINE]Helios[NEWLINE]Hestia[NEWLINE]Pan[NEWLINE]Persephone[NEWLINE]Poseidon[NEWLINE]Zeus (Holy Site only)[NEWLINE][NEWLINE]This policy is not applied to the faith bonuses from:[NEWLINE]Apollo[NEWLINE]Ares[NEWLINE]Artemis[NEWLINE]Athena[NEWLINE]Atlas[NEWLINE]Demeter[NEWLINE]Dionysus[NEWLINE]Hades[NEWLINE]Hephaestus[NEWLINE]Hera', 'en_US'),
('LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_SCRIPTURE_CHAPTER_HISTORY_PARA_2', 'The oldest religious text found so far dates to ancient Sumer around 2600 BC. It was the first example of scripture, a text that is considered to be sacred or central to a religious tradition. The oldest of a still existing religion is likely the Rigveda of Hinduism, composed between 1700 and 1100 BC. The claim of God''s (whoever it may be) Word "made manifest" is an undeniable selling point to would-be converts; it is not surprising that the five largest existing religions all have a primary scripture: Buddhism (the Tripitaka), Hinduism (Vedas and Upanishads), Islam (Qur�an), Judaism (Tanakh), and Christianity (Bible).', 'en_US'),

('LOC_DB_GOODY_ANTI_CAV', '[COLOR_FLOAT_MILITARY]You are granted an anti-cavalry unit[ENDCOLOR]', 'en_US'),
('LOC_DB_GOODY_HEAVY_CAV', '[COLOR_FLOAT_MILITARY]You are granted a heavy cavalry unit[ENDCOLOR]', 'en_US'),
('LOC_DB_GOODY_LIGHT_CAV', '[COLOR_FLOAT_MILITARY]You are granted a light cavalry unit[ENDCOLOR]', 'en_US'),
('LOC_DB_GOODY_MELEE', '[COLOR_FLOAT_MILITARY]You are granted a melee unit[ENDCOLOR]', 'en_US'),
('LOC_DB_GOODY_RANGED', '[COLOR_FLOAT_MILITARY]You are granted a ranged unit[ENDCOLOR]', 'en_US'),
('LOC_DB_GOODY_RECON', '[COLOR_FLOAT_MILITARY]You are granted a recon unit[ENDCOLOR]', 'en_US'),
('LOC_DB_GOODY_SIEGE', '[COLOR_FLOAT_MILITARY]You are granted a siege unit[ENDCOLOR]', 'en_US'),


('LOC_SDG_RELIGIOUS_BELIEFS_NAME', 'Religious Beliefs', 'en_US'),

('LOC_SDG_BELIEF_CLASS_FOOD_NAME', 'Food & Growth', 'en_US'),
('LOC_SDG_BELIEF_CLASS_PRODUCTION_NAME', 'Production', 'en_US'),
('LOC_SDG_BELIEF_CLASS_MILITARY_NAME', 'Military', 'en_US'),
('LOC_SDG_BELIEF_CLASS_SCIENCE_NAME', 'Science', 'en_US'),
('LOC_SDG_BELIEF_CLASS_CULTURE_NAME', 'Culture', 'en_US'),
('LOC_SDG_BELIEF_CLASS_AMENITIES_NAME', 'Amenity', 'en_US'),
('LOC_SDG_BELIEF_CLASS_HOUSING_NAME', 'Housing', 'en_US'),
('LOC_SDG_BELIEF_CLASS_GOLD_NAME', 'Gold', 'en_US'),
('LOC_SDG_BELIEF_CLASS_RELIGION_NAME', 'Faith & Religion', 'en_US'),
('LOC_SDG_BELIEF_CLASS_CITY_NAME', 'Harvest', 'en_US'),
('LOC_SDG_BELIEF_CLASS_RESOURCES_NAME', 'Resource', 'en_US'),
('LOC_SDG_BELIEF_CLASS_WONDERS_NAME', 'Wonder', 'en_US'),
('LOC_SDG_BELIEF_CLASS_NAVAL_NAME', 'Naval', 'en_US'),
('LOC_SDG_BELIEF_CLASS_MUSES_NAME', 'Great People', 'en_US'),
('LOC_SDG_BELIEF_CLASS_FAITHPURCHASES_NAME', 'Faith Purchase', 'en_US'),

('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_FOOD_BELIEFS_NAME', '- Food & Growth Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_PRODUCTION_BELIEFS_NAME', '- Production Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_MILITARY_BELIEFS_NAME', '- Military Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_SCIENCE_BELIEFS_NAME', '- Science Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_CULTURE_BELIEFS_NAME', '- Culture Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_AMENITIES_BELIEFS_NAME', '- Amenity Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_HOUSING_BELIEFS_NAME', '- Housing Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_GOLD_BELIEFS_NAME', '- Gold Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_RELIGION_BELIEFS_NAME', '- Faith & Religion Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_CITY_BELIEFS_NAME', '- Harvest Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_RESOURCES_BELIEFS_NAME', '- Resource Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_WONDERS_BELIEFS_NAME', '- Wonder Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_NAVAL_BELIEFS_NAME', '- Naval Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_MUSES_BELIEFS_NAME', '- Great People Beliefs', 'en_US'),
('LOC_SDG_PEDIA_RELIGIONS_PAGEGROUP_FAITHPURCHASES_BELIEFS_NAME', '- Faith Purchase Beliefs', 'en_US'),


('LOC_SDG_ABILITY_PROPHET_NAME', 'Great Prophet{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_ABILITY_PROPHET_DESC', 'Adds a new belief to your religion.', 'en_US'),
('LOC_SDG_MOD_GREAT_PROPHET_STRENGTH_AOE', '+5[ICON_Religion]Religious Strength and +1[ICON_Movement]Movement to religious units within 2 tiles.', 'en_US'),

('LOC_SDG_ABILITY_GREAT_PROPHET_STRENGTH_NAME', 'Great Prophet{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_ABILITY_GREAT_PROPHET_STRENGTH_DESC', '+5[ICON_Religion]Religious Strength from Great Prophet.', 'en_US'),
('LOC_SDG_MOD_GREAT_PROPHET_STRENGTH_PREVIEW', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_GREAT_PROPHET_STRENGTH_NAME}', 'en_US'),

('LOC_SDG_ABILITY_GREAT_PROPHET_MOVEMENT_NAME', 'Great Prophet{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_ABILITY_GREAT_PROPHET_MOVEMENT_DESC', '+1[ICON_Movement]Movement from Great Prophet.', 'en_US'),

('LOC_SDG_BLANK_PANTHEON', '', 'en_US'),
('LOC_SDG_BLANK_PANTHEON_DESC', 'God of Poverty - DOES NOTHING[NEWLINE][NEWLINE]For some reason, the game limits the number of [ICON_GreatProphet]Great Prophets to the number of pantheon choices in the game.  So this is a placeholder pantheon just to make sure all of the [ICON_GreatProphet]Great Prophets show up.  Or you can think of it as hardcore mode.[NEWLINE][NEWLINE]From[ICON_Faith]Soli Deo Gloria[ICON_Faith]', 'en_US'),
('LOC_SDG_BLANK_PANTHEON2', '', 'en_US'),
('LOC_SDG_BLANK_PANTHEON2_DESC', 'God of Poverty - DOES NOTHING', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_PARSHVANATHA', 'Parshvanatha', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_PARSHVANATHA_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_MOSES', 'Moses', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_MOSES_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_ELIJAH', 'Elijah', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_ELIJAH_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_PAUL', 'Paul', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_PAUL_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_MARCION', 'Marcion', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_MARCION_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_ORIGEN', 'Origen', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_ORIGEN_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_ARIUS', 'Arius', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_ARIUS_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CHRYSOSTOM', 'John Chrysostom', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CHRYSOSTOM_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_AUGUSTINE', 'Augustine', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_AUGUSTINE_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_GREGORY_THE_GREAT', 'Gregory the Great', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_GREGORY_THE_GREAT_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_ALI', 'Ali', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_ALI_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CALVIN', 'John Calvin', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_CALVIN_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_ROGER_WILLIAMS', 'Roger Williams', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_ROGER_WILLIAMS_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_WESLEY', 'John Wesley', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_WESLEY_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOSEPH_SMITH', 'Joseph Smith', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_JOSEPH_SMITH_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_BAHAULLAH', 'Baha''u''llah', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_BAHAULLAH_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_GEORGE_MACDONALD', 'George MacDonald', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_GEORGE_MACDONALD_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_WILLIAM_J_SEYMOUR', 'William J. Seymour', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_WILLIAM_J_SEYMOUR_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_ALBERT_SCHWEITZER', 'Albert Schweitzer', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_ALBERT_SCHWEITZER_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_CS_LEWIS', 'C. S. Lewis', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_CS_LEWIS_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_MLK', 'Martin Luther King, Jr.', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_MLK_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_SUN_MYUNG_MOON', 'Sun Myung Moon', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_SUN_MYUNG_MOON_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_PAUL_II', 'John Paul II', 'en_US'),
-- ('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_JOHN_PAUL_II_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_GREAT_PERSON_INDIVIDUAL_GARY_RANDALL', 'Gary Randall', 'en_US'),
('LOC_PEDIA_GREATPEOPLE_PAGE_SDG_GREAT_PERSON_INDIVIDUAL_GARY_RANDALL_CHAPTER_HISTORY_PARA_1', 'Gary Randall was born in Madison, SD, on August 10, 1949, and was baptized shortly thereafter as an infant at Trinity Lutheran Church. At age 11, during a televised Billy Graham crusade, Gary asked Jesus into his heart and said he was never the same since. Around that same time, he started to teach himself to play the guitar.[NEWLINE][NEWLINE]His older brother and sister, Dean and Dianne, sparked his interest in music. They both could play the accordion and provided live music in their house when he was a kid. "And my brother could play the piano by ear," Gary said. "My sister played the piano pretty well too, but she did it by the book." After receiving a Harmony guitar for Christmas in 1961, Gary and music were inseparable. "No day went by when I skipped practicing the guitar."[NEWLINE][NEWLINE]Gary started performing professionally in 1970 when he was a junior in college. He left Madison at age 21 with bass player Jay Nielson and headed to Minneapolis to join the house band for Arthur''s Four Seasons and The Flame. As they performed in the Twin Cities area, they were picked up by an agent and started traveling around the Upper Great Plains. A year later, he married his high school sweetheart, Debbie Pearson. "We''d play acoustic rock ''n'' roll... the Everly Brothers, James Taylor, the Beatles, Gordon Lightfoot. It was a pretty good era, when you think about it, for the quality of music."[NEWLINE][NEWLINE]Then one night after a gig, there was an incident at the Flame in the Twin Cities where gunshots were fired. Gary wasn''t directly involved, but the encounter shook him. He and Debbie decided shortly thereafter that for the safety of their young boys they needed to move back to small-town Madison.[NEWLINE][NEWLINE]Once home, Gary found other work to support his family, while booking gigs and teaching guitar lessons on the side. Since Nielson had stayed in the Twin Cities, Gary started performing as a solo act... playing both secular concerts with popular music covers as well as religious events like weddings, funerals, and baptisms. For many of these special occasions he wrote songs dedicated to the bride, groom, deceased, or newly baptized.[NEWLINE][NEWLINE]In 1991 Gary produced his first album of original music. Each song blends Gary''s peaceful finger-picked acoustic guitar with his multi-tracked tenor harmonies... all performed by himself. Few other songwriters can match his humble sincerity and spiritually acute lyrics. His music soothes the soul.[NEWLINE][NEWLINE]While Gary had always preferred spiritual music to secular, at this point his career turned exclusively toward serving Jesus. For the next 27 years he was performing concerts nationwide with invitations from Alaska to Houston, TX, and from Washington State to Florida. Randall performed with ministry events of all kinds at universities, retreats, and camps; and was always in demand for church services, weddings, and funerals. Several other albums of his work followed, including one of just wedding songs. In April 2018 he was inducted into the South Dakota Rock and Roll Hall of Fame with a Lifetime Achievement award.[NEWLINE][NEWLINE]Gary believed that nothing related to making music is more special than performing live in front of an appreciative audience. He said the musicians can feel the feedback sent out by their listeners. "And for an artist, nothing can beat that positive feedback. Musicians appreciate that."[NEWLINE][NEWLINE]Gary''s life left a legacy with his whole community. He was always ready to help, always ready to give, always ready to encourage. Gary never counted the cost of his time and never asked "What''s in this for me?" He didn''t pay attention to theological or doctrinal differences between denominations and you never knew which church he would be in on Sunday. His conversations centered on making someone''s day better and encouraging them to walk with Christ as their Lord and Savior. Nothing was more important to him. Even a quick trip to the grocery store could sometimes take an hour. He always had time for you.[NEWLINE][NEWLINE]Gary helped and encouraged a lot of strugglers throughout life. His philosophy was that no matter how bad someone''s circumstances had gotten, they could turn everything around with just one good decision.[NEWLINE][NEWLINE]The friendships and bonds he formed were always near to his heart. He wasn''t materially rich or successful in the eyes of the world, but held wealth beyond compare in friends and family. He loved the "open door policy" established in their home... he and Debbie didn''t lock their house, opting to instead trust in the Lord. And some days he''d be surprised to come home and see an old friend waiting for him on his couch in need of advice.[NEWLINE][NEWLINE]Likewise, when Gary''s boys were growing up, they always had numerous friends over for conversation, food and fun. Sometimes the friends would beat them home from school and just hang out with Gary. These relationships carried over as the kids grew up to become close friends and admirers.[NEWLINE][NEWLINE]Gary enjoyed the outdoors, recreational biking, and tennis. He loved hunting, fishing, hiking, and camping in the Black Hills with his kids and lifelong friends.[NEWLINE][NEWLINE]For the last five years of his life, Gary battled cancer, and through the struggle continued to serve the Lord. Just three weeks before his death, frail in stature and deaf in one ear, he put on a benefit concert in Pipestone, MN, and donated the ticket sales to an addiction treatment center that had helped a family member.[NEWLINE][NEWLINE]On November 17, 2018, Gary passed away. His funeral was attended by hundreds. The church was packed to standing room only. That was his treasure.', 'en_US'),

('LOC_SDG_IN_CITIES', '[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_SDG_WHEN_TRAINED', '[NEWLINE][when trained, purchased, or granted in cities that follow this religion]', 'en_US'),
('LOC_SDG_FOLLOWING_THIS', '[NEWLINE][following this religion in the city]', 'en_US'),

('LOC_SDG_MANNA_FROM_HEAVEN_DESC', '+1[ICON_Food]Food{LOC_SDG_IN_CITIES}', 'en_US'),
('LOC_SDG_MANNA_FROM_HEAVEN', 'Manna from Heaven', 'en_US'),

('LOC_SDG_CHILD_MARRIAGE', 'Child Marriage', 'en_US'),
('LOC_SDG_CHILD_MARRIAGE_DESC', '+1[ICON_Food]Food per 7 [ICON_CITIZEN]population{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_BE_FRUITFUL', 'Be Fruitful and Multiply', 'en_US'),
('LOC_SDG_BE_FRUITFUL_DESC', '+1[ICON_Food]Food for every 2 specialty districts{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_POLYGAMY', 'Polygamy', 'en_US'),
('LOC_SDG_POLYGAMY_DESC', '+20% growth rate{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_EVERY_SPERM_IS_SACRED', 'Every Sperm Is Sacred', 'en_US'),
('LOC_SDG_EVERY_SPERM_IS_SACRED_DESC', '+10%[ICON_FOOD]Food{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_FOOD_FOR_PEACE', 'Food For Peace', 'en_US'),
('LOC_SDG_FOOD_FOR_PEACE_DESC', '+1%[ICON_FOOD]Food for each [ICON_CITIZEN]citizen{LOC_SDG_FOLLOWING_THIS}', 'en_US'),



('LOC_SDG_CHILD_LABOR', 'Child Labor', 'en_US'),
('LOC_SDG_CHILD_LABOR_DESC', '+1[ICON_Production]Production{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_CONSIDER_THE_ANT', 'Consider the Ant', 'en_US'),
('LOC_SDG_CONSIDER_THE_ANT_DESC', '+1[ICON_Production]Production per 7 [ICON_CITIZEN]population{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_NULLA_DIES_SINE_LINEA', 'Nulla Dies Sine Linea', 'en_US'),
('LOC_SDG_NULLA_DIES_SINE_LINEA_DESC', '+1[ICON_Production]Production for every 2 specialty districts{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_DESERET', 'Deseret', 'en_US'),
('LOC_SDG_DESERET_DESC', '+10%[ICON_Production]Production{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_PROTESTANT_WORK_ETHIC', 'Protestant Work Ethic', 'en_US'),
('LOC_SDG_PROTESTANT_WORK_ETHIC_DESC', '+1%[ICON_Production]Production for each [ICON_CITIZEN]citizen{LOC_SDG_FOLLOWING_THIS}', 'en_US'),



('LOC_SDG_SWORD_OF_GIDEON', 'Sword of Gideon', 'en_US'),
('LOC_SDG_ABILITY_SWORD_OF_GIDEON_NAME', '{LOC_SDG_SWORD_OF_GIDEON}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_SWORD_OF_GIDEON_DESC', 'Land units get +25% combat experience{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_SWORD_OF_GIDEON_DESC', '+25% combat experience (except when defending city ranged attacks)', 'en_US'),

('LOC_SDG_JOSHUAS_TRUMPET', 'Joshua''s Trumpet', 'en_US'),
('LOC_SDG_ABILITY_JOSHUAS_TRUMPET_NAME', '{LOC_SDG_JOSHUAS_TRUMPET}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_JOSHUAS_TRUMPET_DESC', 'Melee and anti-cavalry units do full damage to the city''s walls (like a battering ram) and bypass the walls when damaging the city''s health (like a siege tower){LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_JOSHUAS_TRUMPET_DESC', 'When adjacent to a city, enables all melee and anti-cavalry units to do full damage to the city''s walls (like a battering ram) and bypass the walls when damaging the city''s health (like a siege tower)', 'en_US'),

('LOC_SDG_ECRASEZ_LINFAME', 'Ecrasez l''Infame', 'en_US'),
('LOC_SDG_ABILITY_ECRASEZ_LINFAME_NAME', '{LOC_SDG_ECRASEZ_LINFAME}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_ECRASEZ_LINFAME_DESC', 'Land units create religious pressure in nearby cities for combat kills and convert captured cities to your majority religion{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_ECRASEZ_LINFAME_DESC', 'Combat kills create religious pressure in nearby cities. Captured cities convert to your majority religion.', 'en_US'),

('LOC_SDG_SHATTER_THE_TEETH', 'Shatter the Teeth', 'en_US'),
('LOC_SDG_ABILITY_SHATTER_THE_TEETH_NAME', '{LOC_SDG_SHATTER_THE_TEETH}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_SHATTER_THE_TEETH_DESC', 'Land units get +3[ICON_Strength]Combat Strength when attacking other units{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_SHATTER_THE_TEETH_DESC', '{DB_POS_COLOR}+3[ENDCOLOR][ICON_Strength]Combat Strength when attacking other units', 'en_US'),
('LOC_SDG_SHATTER_THE_TEETH_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_SHATTER_THE_TEETH_NAME}', 'en_US'),

('LOC_SDG_VENI_VIDI_VICI', 'Veni, Vidi, Vici', 'en_US'),
('LOC_SDG_ABILITY_VENI_VIDI_VICI_NAME', '{LOC_SDG_VENI_VIDI_VICI}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_VENI_VIDI_VICI_DESC', 'Land units get +2[ICON_Strength]Combat Strength when attacking units and +1[ICON_Strength]Combat Strength when defending against units{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_VENI_VIDI_VICI_DESC', '{DB_POS_COLOR}+2[ENDCOLOR][ICON_Strength]Combat Strength when attacking other units and {DB_POS_COLOR}+1[ENDCOLOR][ICON_Strength]Combat Strength when defending against units', 'en_US'),
('LOC_SDG_VENI_VIDI_VICI_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_VENI_VIDI_VICI_NAME}', 'en_US'),

('LOC_SDG_TZEVAOT', 'Tzevaot', 'en_US'),
('LOC_SDG_ABILITY_TZEVAOT_NAME', '{LOC_SDG_TZEVAOT}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_TZEVAOT_DESC', 'Land units get +1[ICON_Strength]Combat Strength when attacking units and +2[ICON_Strength]Combat Strength when defending against units{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_TZEVAOT_DESC', '{DB_POS_COLOR}+1[ENDCOLOR][ICON_Strength]Combat Strength when attacking other units and {DB_POS_COLOR}+2[ENDCOLOR][ICON_Strength]Combat Strength when defending against units', 'en_US'),
('LOC_SDG_TZEVAOT_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_TZEVAOT_NAME}', 'en_US'),

('LOC_SDG_ARMOR_OF_GOD', 'Armor of God', 'en_US'),
('LOC_SDG_ABILITY_ARMOR_OF_GOD_NAME', '{LOC_SDG_ARMOR_OF_GOD}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_ARMOR_OF_GOD_DESC', 'Land units get +3[ICON_Strength]Combat Strength when defending against units{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_ARMOR_OF_GOD_DESC', '{DB_POS_COLOR}+3[ENDCOLOR][ICON_Strength]Combat Strength when defending against units', 'en_US'),
('LOC_SDG_ARMOR_OF_GOD_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_ARMOR_OF_GOD_NAME}', 'en_US'),

('LOC_SDG_HIS_TRUTH', 'His Truth Is Marching On', 'en_US'),
('LOC_SDG_ABILITY_HIS_TRUTH_NAME', '{LOC_SDG_HIS_TRUTH}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_HIS_TRUTH_DESC', 'Land units get +3[ICON_Strength]Combat Strength in foreign territory when fighting units that follow another religion{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_HIS_TRUTH_DESC', '{DB_POS_COLOR}+3[ENDCOLOR][ICON_Strength]Combat Strength in foreign territory when fighting units that follow another religion', 'en_US'),
('LOC_SDG_HIS_TRUTH_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_HIS_TRUTH_NAME}', 'en_US'),

('LOC_SDG_CARTHAGO_DELENDA_EST', 'Carthago Delenda Est', 'en_US'),
('LOC_SDG_ABILITY_CARTHAGO_DELENDA_EST_NAME', '{LOC_SDG_CARTHAGO_DELENDA_EST}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_CARTHAGO_DELENDA_EST_DESC', 'Land units get +6[ICON_Strength]Combat Strength in foreign territory when attacking units that follow another religion{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_CARTHAGO_DELENDA_EST_DESC', '{DB_POS_COLOR}+6[ENDCOLOR][ICON_Strength]Combat Strength in foreign territory when attacking units that follow another religion', 'en_US'),
('LOC_SDG_CARTHAGO_DELENDA_EST_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_CARTHAGO_DELENDA_EST_NAME}', 'en_US'),

('LOC_SDG_DEUS_VULT', 'Deus Vult', 'en_US'),
('LOC_SDG_ABILITY_DEUS_VULT_NAME', '{LOC_SDG_DEUS_VULT}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_DEUS_VULT_DESC', 'Land units get +4[ICON_Strength]Combat Strength when fighting units within the borders of foreign cities that follow this religion{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_DEUS_VULT_DESC', '{DB_POS_COLOR}+4[ENDCOLOR][ICON_Strength]Combat Strength when fighting units within the borders of enemy cities that follow this religion', 'en_US'),
('LOC_SDG_DEUS_VULT_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_DEUS_VULT_NAME}', 'en_US'),

('LOC_SDG_CRUSADE', 'Crusade', 'en_US'),
('LOC_SDG_ABILITY_CRUSADE_NAME', '{LOC_SDG_CRUSADE}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_CRUSADE_DESC', 'Land units get +8[ICON_Strength]Combat Strength when attacking units within the borders of foreign cities that follow this religion{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_CRUSADE_DESC', '{DB_POS_COLOR}+8[ENDCOLOR][ICON_Strength]Combat Strength when attacking units within the borders of enemy cities that follow this religion', 'en_US'),
('LOC_SDG_CRUSADE_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_CRUSADE_NAME}', 'en_US'),


('LOC_SDG_WALL_OF_RIGHTEOUSNESS', 'Wall of Righteousness', 'en_US'),
('LOC_SDG_ABILITY_WALL_OF_RIGHTEOUSNESS_NAME', '{LOC_SDG_WALL_OF_RIGHTEOUSNESS}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_WALL_OF_RIGHTEOUSNESS_DESC', 'Land units get +10[ICON_Strength]Combat Strength when defending against units within the borders of your cities that follow this religion{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_WALL_OF_RIGHTEOUSNESS_DESC', '{DB_POS_COLOR}+10[ENDCOLOR][ICON_Strength]Combat Strength when defending against units within the borders of your cities that follow this religion', 'en_US'),
('LOC_SDG_WALL_OF_RIGHTEOUSNESS_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_WALL_OF_RIGHTEOUSNESS_NAME}', 'en_US'),

-- note: there's a related update query at bottom of this file
('LOC_SDG_A_MIGHTY_FORTRESS', 'A Mighty Fortress', 'en_US'),
('LOC_SDG_A_MIGHTY_FORTRESS_DESC', 'Provides walled City Centers and Encampments with an additional city ranged attack, an additional range for city ranged attacks, and immunity from battering rams and siege towers{LOC_SDG_IN_CITIES}', 'en_US'),


('LOC_SDG_A_MEMORY_OF_SOLFERINO', 'A Memory of Solferino', 'en_US'),
('LOC_SDG_A_MEMORY_OF_SOLFERINO_DESC', 'Land units get +10 Healing when they heal in any territory{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_A_MEMORY_OF_SOLFERINO_HEAL_NAME', '{LOC_SDG_A_MEMORY_OF_SOLFERINO}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_ABILITY_A_MEMORY_OF_SOLFERINO_HEAL_DESC', '+10 Healing in any territory', 'en_US'),




('LOC_SDG_THE_WATCHMAKER', 'The Watchmaker', 'en_US'),
('LOC_SDG_THE_WATCHMAKER_DESC', '+1[ICON_Science]Science{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_A_FINE_TUNED_UNIVERSE', 'A Fine-Tuned Universe', 'en_US'),
('LOC_SDG_A_FINE_TUNED_UNIVERSE_DESC', '+1[ICON_Science]Science per 7 [ICON_CITIZEN]population{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_IRREDUCIBLE_COMPLEXITY', 'Irreducible Complexity', 'en_US'),
('LOC_SDG_IRREDUCIBLE_COMPLEXITY_DESC', '+1[ICON_Science]Science for every 2 specialty districts{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_NON_OVERLAPPING_MAGISTERIA', 'Non-Overlapping Magisteria', 'en_US'),
('LOC_SDG_NON_OVERLAPPING_MAGISTERIA_DESC', '+10%[ICON_Science]Science{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_TRUTH_CANNOT_CONTRADICT_TRUTH', 'Truth Cannot Contradict Truth', 'en_US'),
('LOC_SDG_TRUTH_CANNOT_CONTRADICT_TRUTH_DESC', '+1%[ICON_Science]Science for each [ICON_CITIZEN]citizen{LOC_SDG_FOLLOWING_THIS}', 'en_US'),



('LOC_SDG_WILDERNESS_PREACHERS', 'Wilderness Preachers', 'en_US'),
('LOC_SDG_WILDERNESS_PREACHERS_DESC', '+100% [ICON_OPEN_BORDERS]Border expansion rate{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_CIRCUIT_RIDERS', 'Circuit Riders', 'en_US'),
('LOC_SDG_CIRCUIT_RIDERS_DESC', '+100% [ICON_OPEN_BORDERS]Border expansion rate{LOC_SDG_IN_CITIES}', 'en_US'),



('LOC_SDG_PSALMS', 'Psalms', 'en_US'),
('LOC_SDG_PSALMS_DESC', '+1[ICON_Culture]Culture{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_GREGORIAN_CHANTS', 'Gregorian Chants', 'en_US'),
('LOC_SDG_GREGORIAN_CHANTS_DESC', '+1[ICON_Culture]Culture per 7 [ICON_CITIZEN]population{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_HYMNS', 'Hymns', 'en_US'),
('LOC_SDG_HYMNS_DESC', '+1[ICON_Culture]Culture for every 2 specialty districts{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_ORATORIOS', 'Oratorios', 'en_US'),
('LOC_SDG_ORATORIOS_DESC', '+10%[ICON_Culture]Culture{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_REQUIEM_MASSES', 'Requiem Masses', 'en_US'),
('LOC_SDG_REQUIEM_MASSES_DESC', '+1%[ICON_Culture]Culture for each [ICON_CITIZEN]citizen{LOC_SDG_FOLLOWING_THIS}', 'en_US'),

('LOC_SDG_SLAVE_SPIRITUALS', 'Slave Spirituals', 'en_US'),
('LOC_SDG_SLAVE_SPIRITUALS_DESC', '+2[ICON_Culture]Culture from Plantations{LOC_SDG_IN_CITIES}', 'en_US'),



('LOC_SDG_NEARER_MY_GOD', 'Nearer, My God, to Thee', 'en_US'),
('LOC_SDG_NEARER_MY_GOD_DESC', '+1[ICON_Amenities]Amenity{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_BE_STILL_MY_SOUL', 'Be Still My Soul', 'en_US'),
('LOC_SDG_BE_STILL_MY_SOUL_DESC', '+1[ICON_Amenities]Amenity per 7 [ICON_CITIZEN]population{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_ODE_TO_JOY', 'Ode to Joy', 'en_US'),
('LOC_SDG_ODE_TO_JOY_DESC', '+1[ICON_Amenities]Amenity for every 2 specialty districts{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_HALLELUJAH_CHORUS', 'Hallelujah Chorus', 'en_US'),
('LOC_SDG_HALLELUJAH_CHORUS_DESC', '+1[ICON_Amenities]Amenity from [ICON_DISTRICT_HOLYSITE]Holy Sites and +1[ICON_Faith]Faith from land/water [ICON_DISTRICT_ENTERTAINMENT]Entertainment Complexes. Double if the districts are adjacent.{LOC_SDG_IN_CITIES}', 'en_US'),



('LOC_SDG_KOSHER_FOOD', 'Kosher Food', 'en_US'),
('LOC_SDG_KOSHER_FOOD_DESC', '+2[ICON_Housing]Housing{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_CONVENTS', 'Convents', 'en_US'),
('LOC_SDG_CONVENTS_DESC', '+1[ICON_Housing][NEWLINE]+1[ICON_Housing]Housing per 7 [ICON_CITIZEN]population{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_MONASTERIES', 'Monasteries', 'en_US'),
('LOC_SDG_MONASTERIES_DESC', '+1[ICON_Housing][NEWLINE]+1[ICON_Housing]Housing for every 2 specialty districts{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_ABBEYS', 'Abbeys', 'en_US'),
('LOC_SDG_ABBEYS_DESC', '+2[ICON_Housing]Housing from [ICON_DISTRICT_HOLYSITE]Holy Sites and +2[ICON_Faith]Faith from [ICON_DISTRICT_NEIGHBORHOOD]Neighborhoods. Double if the districts are adjacent.{LOC_SDG_IN_CITIES}', 'en_US'),


('LOC_SDG_WIDOWS_MITE', 'Widow''s Mite', 'en_US'),
('LOC_SDG_WIDOWS_MITE_DESC', '+3[ICON_Gold]Gold{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_RENDER_UNTO_CAESAR', 'Render Unto Caesar', 'en_US'),
('LOC_SDG_RENDER_UNTO_CAESAR_DESC', '+3[ICON_Gold]Gold per 7 [ICON_CITIZEN]population{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_ACRES_OF_DIAMONDS', 'Acres of Diamonds', 'en_US'),
('LOC_SDG_ACRES_OF_DIAMONDS_DESC', '+3[ICON_Gold]Gold for every 2 specialty districts{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_GOSPEL_OF_WEALTH', 'Gospel of Wealth', 'en_US'),
('LOC_SDG_GOSPEL_OF_WEALTH_DESC', '+30%[ICON_Gold]Gold{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_TREASURES_IN_HEAVEN', 'Treasures in Heaven', 'en_US'),
('LOC_SDG_TREASURES_IN_HEAVEN_DESC', '+3%[ICON_Gold]Gold for each [ICON_CITIZEN]citizen{LOC_SDG_FOLLOWING_THIS}', 'en_US'),

('LOC_SDG_TETZEL', 'Tetzel', 'en_US'),
('LOC_SDG_TETZEL_DESC', 'Apostles start with Indulgence Vendor{LOC_SDG_WHEN_TRAINED}', 'en_US'),



('LOC_SDG_CATECHISTS', 'Catechists', 'en_US'),
('LOC_SDG_CATECHISTS_DESC', '+3[ICON_Faith]Faith{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_READERS', 'Readers', 'en_US'),
('LOC_SDG_READERS_DESC', '+3[ICON_Faith]Faith per 7 [ICON_CITIZEN]population{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_DEACONS', 'Deacons', 'en_US'),
('LOC_SDG_DEACONS_DESC', '+3[ICON_Faith]Faith for every 2 specialty districts{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_VICARS', 'Vicars', 'en_US'),
('LOC_SDG_VICARS_DESC', '+30%[ICON_Faith]Faith{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_DIOCESANS', 'Diocesans', 'en_US'),
('LOC_SDG_DIOCESANS_DESC', '+3%[ICON_Faith]Faith for each [ICON_CITIZEN]citizen{LOC_SDG_FOLLOWING_THIS}', 'en_US'),

('LOC_SDG_SOLI_DEO_GLORIA', 'Soli Deo Gloria', 'en_US'),
('LOC_SDG_SOLI_DEO_GLORIA_DESC', '+3[ICON_Faith]Faith from [ICON_GreatWork_Writing]Great Works{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_AD_MAIOREM_DEI_GLORIAM', 'Ad Maiorem Dei Gloriam', 'en_US'),
('LOC_SDG_AD_MAIOREM_DEI_GLORIAM_DESC', '+5[ICON_Faith]Faith from World Wonders{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_RELIQUARIES', 'Reliquaries', 'en_US'),
('LOC_SDG_RELIQUARIES_DESC', '+400% [ICON_Tourism]Tourism from [ICON_GreatWork_Relic]Relics{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_SYNODUS_HORRENDA', 'Synodus Horrenda', 'en_US'),
('LOC_SDG_SYNODUS_HORRENDA_DESC', 'Inquisitors get +10[ICON_Strength]Combat Strength{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_SYNODUS_HORRENDA_NAME', 'Synodus Horrenda{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_ABILITY_SYNODUS_HORRENDA_DESC', '+10[ICON_Strength]Combat Strength', 'en_US'),
('LOC_SDG_SYNODUS_HORRENDA_COMBAT_DESC', '{DB_POS_VALUE_DARK_BG} {LOC_SDG_ABILITY_SYNODUS_HORRENDA_NAME}', 'en_US'),

('LOC_SDG_ITINERANT_MINISTERS', 'Itinerant Ministers', 'en_US'),
('LOC_SDG_ITINERANT_MINISTERS_DESC', '+3 increase to the distance religious pressure spreads between cities{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_DESERT_ANCHORITES', 'Desert Anchorites', 'en_US'),
('LOC_SDG_DESERT_ANCHORITES_DESC', '+1 [ICON_GreatProphet]Great Prophet point for every 2 desert plots owned within 3 tiles of the city{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_FULTON_SHEEN', 'Fulton Sheen', 'en_US'),
('LOC_SDG_FULTON_SHEEN_DESC', '200% stronger outgoing religious pressure from Broadcast Centers{LOC_SDG_IN_CITIES}', 'en_US'),



('LOC_SDG_OKTOBERFEST', 'Oktoberfest', 'en_US'),
('LOC_SDG_OKTOBERFEST_DESC', '+35% yields from plot harvests and feature removals{LOC_SDG_IN_CITIES}', 'en_US'),


('LOC_SDG_FREEMASONRY', 'Freemasonry', 'en_US'),
('LOC_SDG_FREEMASONRY_DESC', '+3[ICON_Faith]Faith on[ICON_RESOURCE_STONE]Stone{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_LAND_OF_MILK_AND_HONEY', 'Land of Milk and Honey', 'en_US'),
('LOC_SDG_LAND_OF_MILK_AND_HONEY_DESC', '+3[ICON_Faith]Faith on[ICON_RESOURCE_CATTLE]Cattle and[ICON_RESOURCE_HONEY]Honey{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_ENTHEOGENS', 'Entheogens', 'en_US'),
('LOC_SDG_ENTHEOGENS_DESC', '+3[ICON_GreatProphet]Great Prophet points for improved [ICON_RESOURCE_TRUFFLES]Truffles or [ICON_RESOURCE_TOBACCO]Tobacco{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_SALT_OF_THE_EARTH', 'Salt of the Earth', 'en_US'),
('LOC_SDG_SALT_OF_THE_EARTH_DESC', '+5[ICON_Faith]Faith on[ICON_RESOURCE_SALT]Salt{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_JONAH', 'Jonah', 'en_US'),
('LOC_SDG_JONAH_DESC', '+5[ICON_Faith]Faith on[ICON_RESOURCE_WHALES]Whales{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_PEARL_OF_GREAT_PRICE', 'Pearl of Great Price', 'en_US'),
('LOC_SDG_PEARL_OF_GREAT_PRICE_DESC', '+5[ICON_Faith]Faith on[ICON_RESOURCE_PEARLS]Pearls{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_TURTLES_ALL_THE_WAY_DOWN', 'Turtles All the Way Down', 'en_US'),
('LOC_SDG_TURTLES_ALL_THE_WAY_DOWN_DESC', '+5[ICON_Faith]Faith on[ICON_RESOURCE_TURTLES]Turtles{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_I_AM_DEATH', 'I Am Become Death', 'en_US'),
('LOC_SDG_I_AM_DEATH_DESC', '+5[ICON_Science]Science on Uranium{LOC_SDG_IN_CITIES}', 'en_US'),



('LOC_SDG_MONUMENT_TO_THE_GODS', 'Monument to the Gods: Ancient', 'en_US'),
('LOC_SDG_MONUMENT_TO_THE_GODS_DESC', '+50%[ICON_Production]Production towards Ancient and Classical era World Wonders{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_MONUMENT_TO_THE_GODS2', 'Monument to the Gods: Classical', 'en_US'),
('LOC_SDG_MONUMENT_TO_THE_GODS2_DESC', '+50%[ICON_Production]Production towards Classical and Medieval era World Wonders{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_MONUMENT_TO_THE_GODS3', 'Monument to the Gods: Medieval', 'en_US'),
('LOC_SDG_MONUMENT_TO_THE_GODS3_DESC', '+50%[ICON_Production]Production towards Medieval and Renaissance era World Wonders{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_MONUMENT_TO_THE_GODS4', 'Monument to the Gods: Renaissance', 'en_US'),
('LOC_SDG_MONUMENT_TO_THE_GODS4_DESC', '+50%[ICON_Production]Production towards Renaissance and Industrial era World Wonders{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_MONUMENT_TO_THE_GODS5', 'Monument to the Gods: Industrial', 'en_US'),
('LOC_SDG_MONUMENT_TO_THE_GODS5_DESC', '+50%[ICON_Production]Production towards Industrial era and later World Wonders{LOC_SDG_IN_CITIES}', 'en_US'),



('LOC_SDG_ETERNAL_FATHER', 'Eternal Father, Strong to Save', 'en_US'),
('LOC_SDG_ETERNAL_FATHER_DESC', 'Naval units can heal 20/turn in neutral territory{LOC_SDG_WHEN_TRAINED}', 'en_US'),
('LOC_SDG_ABILITY_ETERNAL_FATHER_HEAL_NAME', '{LOC_SDG_ETERNAL_FATHER}{LOC_GOLD_LABEL}', 'en_US'),
('LOC_SDG_ABILITY_ETERNAL_FATHER_HEAL_DESC', 'Can heal 20/turn in neutral territory', 'en_US'),



('LOC_SDG_MELPOMENE', 'Melpomene', 'en_US'),
('LOC_SDG_MELPOMENE_DESC', '+2[ICON_GreatGeneral]Great General points on Encampments{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_CLIO', 'Clio', 'en_US'),
('LOC_SDG_CLIO_DESC', '+2[ICON_GreatScientist]Great Scientist points on Campuses{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_CALLIOPE_TERPSICHORE_EUTERPE', 'Calliope, Terpsichore, and Euterpe', 'en_US'),
('LOC_SDG_CALLIOPE_TERPSICHORE_EUTERPE_DESC', '+2[ICON_GreatWriter]Great Writer, +2[ICON_GreatArtist]Great Artist, and +2[ICON_GreatMusician]Great Musician points on Theater Squares{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_THALIA', 'Thalia', 'en_US'),
('LOC_SDG_THALIA_DESC', '+2[ICON_GreatMerchant]Great Merchant points on Commercial Hubs{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_ERATO', 'Erato', 'en_US'),
('LOC_SDG_ERATO_DESC', '+2[ICON_GreatEngineer]Great Engineer points on Industrial Zones{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_URANIA', 'Urania', 'en_US'),
('LOC_SDG_URANIA_DESC', '+2[ICON_GreatAdmiral]Great Admiral points on Harbors{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_POLYHYMNIA', 'Polyhymnia', 'en_US'),
('LOC_SDG_POLYHYMNIA_DESC', '+1[ICON_GreatProphet]Great Prophet point on Holy Sites{LOC_SDG_IN_CITIES}', 'en_US'),


('LOC_SDG_HANDCART_PIONEERS', 'Handcart Pioneers', 'en_US'),
('LOC_SDG_HANDCART_PIONEERS_DESC', 'May purchase Settlers with[ICON_Faith]Faith{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_HABITAT_FOR_HUMANITY', 'Habitat for Humanity', 'en_US'),
('LOC_SDG_HABITAT_FOR_HUMANITY_DESC', 'May purchase Builders with[ICON_Faith]Faith{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_SEA_ORG', 'Sea Org', 'en_US'),
('LOC_SDG_SEA_ORG_DESC', 'May purchase naval units with[ICON_Faith]Faith{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_PHARAOH_AND_JOSEPH', 'Pharaoh and Joseph', 'en_US'),
('LOC_SDG_PHARAOH_AND_JOSEPH_DESC', 'May purchase granaries and monuments with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_NEHEMIAH', 'Nehemiah', 'en_US'),
('LOC_SDG_NEHEMIAH_DESC', 'May purchase walls with[ICON_Faith]Faith{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_YORISHIRO', 'Yorishiro', 'en_US'),
('LOC_SDG_YORISHIRO_DESC', 'May purchase [ICON_DISTRICT_PRESERVE]Preserve buildings with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_JESUIT_EDUCATION', 'Jesuit Education', 'en_US'),
('LOC_SDG_JESUIT_EDUCATION_DESC', 'May purchase [ICON_DISTRICT_CAMPUS]Campus buildings with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_JIHAD', 'Jihad', 'en_US'),
('LOC_SDG_JIHAD_DESC', 'May purchase [ICON_DISTRICT_ENCAMPMENT]Encampment buildings with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_XMAS', 'Xmas', 'en_US'),
('LOC_SDG_XMAS_DESC', 'May purchase [ICON_DISTRICT_COMMERCIAL_HUB]Commercial Hub buildings with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_FISHERS_OF_MEN', 'Fishers of Men', 'en_US'),
('LOC_SDG_FISHERS_OF_MEN_DESC', 'May purchase [ICON_DISTRICT_HARBOR]Harbor buildings with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_ECCLESIASTICAL_COMMISSION', 'Ecclesiastical Commission', 'en_US'),
('LOC_SDG_ECCLESIASTICAL_COMMISSION_DESC', 'May purchase [ICON_DISTRICT_THEATER]Theater Square buildings with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_SOLIDARITY', 'Solidarity', 'en_US'),
('LOC_SDG_SOLIDARITY_DESC', 'May purchase [ICON_DISTRICT_INDUSTRIAL_ZONE]Industrial Zone buildings with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_FAMILY_HOME_EVENING', 'Family Home Evening', 'en_US'),
('LOC_SDG_FAMILY_HOME_EVENING_DESC', 'May purchase [ICON_DISTRICT_NEIGHBORHOOD]Neighborhood, [ICON_DISTRICT_ENTERTAINMENT]Entertainment Complex, and Water Park district buildings with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_JOHN_FRUM', 'John Frum', 'en_US'),
('LOC_SDG_JOHN_FRUM_DESC', 'May purchase Aerodrome buildings with[ICON_Faith]Faith[NEWLINE]The purchase cost of these buildings is discounted 20%[NEWLINE]+25[ICON_Faith]Faith on Airstrips{LOC_SDG_IN_CITIES}', 'en_US'),

('LOC_SDG_SHAKER_CELIBACY', 'Shaker Celibacy', 'en_US'),
('LOC_SDG_SHAKER_CELIBACY_DESC', '-150% growth rate in the founders'' cities[NEWLINE]May purchase any building or unit with[ICON_Faith]Faith and any district with[ICON_Gold]Gold{LOC_SDG_IN_CITIES}', 'en_US'),

/*
('LOC_SDG_MORALITY_PLAYS', 'Morality Plays', 'en_US'),
('LOC_SDG_MORALITY_PLAYS_DESC', '+1[ICON_Culture]Culture from [ICON_DISTRICT_HOLYSITE]Holy Sites and +1[ICON_Faith]Faith from [ICON_DISTRICT_THEATER]Theater Squares. Double if the districts are adjacent.[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_MORALITY_PLAYS_CHAPTER_HISTORY_PARA_1', 'The morality play is a genre of Medieval and early Tudor theatrical entertainment. Morality plays are a type of allegory in which the protagonist is met by personifications of various moral attributes who try to prompt him or her to choose a good life over one of evil. The plays were most popular in Europe during the 15th and 16th centuries. Having grown out of the religiously based mystery plays of the Middle Ages, they represented a shift towards a more secular base for European theatre. Hildegard von Bingen''s Ordo Virtutum (English: "Order of the Virtues") composed c. 1151, is the earliest known morality play by more than a century, and the only Medieval musical drama to survive with an attribution for both the text and the music.[NEWLINE][NEWLINE]Morality plays typically contain a protagonist who represents either humanity as a whole or a smaller social structure. Supporting characters are personifications of good and evil. This alignment of characters provides the play''s audience with moral guidance. Morality plays are the result of the dominant belief of the time period, that humans had a certain amount of control over their post-death fate while they were on earth.[NEWLINE][NEWLINE]In "Everyman", perhaps the archetypal morality play, the characters take on the common pattern, representing broader ideas. Some of the characters in Everyman are God, Death, Everyman, Good-Deeds, Angel, Knowledge, Beauty, Discretion, and Strength. The personified meanings of these characters are hardly hidden. The premise of Everyman is that God, believing that the people on earth are too focused on wealth and worldly possessions, sends Death to Everyman to remind him of God''s power and the importance of upholding values. The emphasis put on morality, the seemingly vast difference between good and evil, and the strong presence of God makes Everyman one of the most concrete examples of a morality play.', 'en_US'),

('LOC_SDG_AMAZING_GRACE', 'Amazing Grace', 'en_US'),
('LOC_SDG_AMAZING_GRACE_DESC', '+1[ICON_Amenities]Amenity and +1[ICON_Culture]Culture from Shrines[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_AMAZING_GRACE_CHAPTER_HISTORY_PARA_1', '"Amazing Grace" is a Christian hymn published in 1779, with words written by the English poet and Anglican clergyman John Newton (1725-1807).[NEWLINE][NEWLINE]Newton wrote the words from personal experience. He grew up without any particular religious conviction, but his life''s path was formed by a variety of twists and coincidences that were often put into motion by others'' reactions to what they took as his recalcitrant insubordination. He was pressed (conscripted) into service in the Royal Navy, and after leaving the service, he became involved in the Atlantic slave trade. In 1748, a violent storm battered his vessel off the coast of County Donegal, Ireland, so severely that he called out to God for mercy, a moment that marked his spiritual conversion. He continued his slave trading career until 1754 or 1755, when he ended his seafaring altogether and began studying Christian theology.[NEWLINE][NEWLINE]Ordained in the Church of England in 1764, Newton became curate of Olney, Buckinghamshire, where he began to write hymns with poet William Cowper. "Amazing Grace" was written to illustrate a sermon on New Year''s Day of 1773. It is unknown if there was any music accompanying the verses; it may have simply been chanted by the congregation. It debuted in print in 1779 in Newton and Cowper''s Olney Hymns but settled into relative obscurity in England. In the United States, however, "Amazing Grace" was used extensively during the Second Great Awakening in the early 19th century. It has been associated with more than 20 melodies, but in 1835 it was joined to a tune named "New Britain," to which it is most frequently sung today.[NEWLINE][NEWLINE]1 Amazing grace (how sweet the sound)[NEWLINE]that saved a wretch like me![NEWLINE]I once was lost, but now am found,[NEWLINE]was blind, but now I see.[NEWLINE][NEWLINE]2 ''Twas grace that taught my heart to fear,[NEWLINE]and grace my fears relieved;[NEWLINE]how precious did that grace appear[NEWLINE]the hour I first believed![NEWLINE][NEWLINE]3 Through many dangers, toils and snares[NEWLINE]I have already come:[NEWLINE]''tis grace has brought me safe thus far,[NEWLINE]and grace will lead me home.[NEWLINE][NEWLINE]4 The Lord has promised good to me,[NEWLINE]his word my hope secures;[NEWLINE]he will my shield and portion be[NEWLINE]as long as life endures.[NEWLINE][NEWLINE]5 Yes, when this flesh and heart shall fail,[NEWLINE]and mortal life shall cease:[NEWLINE]I shall possess, within the veil,[NEWLINE]a life of joy and peace.[NEWLINE][NEWLINE]6 The earth shall soon dissolve like snow,[NEWLINE]the sun forbear to shine;[NEWLINE]but God, who called me here below,[NEWLINE]will be forever mine.', 'en_US'),

('LOC_SDG_PARSONAGES', 'Parsonages', 'en_US'),
('LOC_SDG_PARSONAGES_DESC', '[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_PARSONAGES_CHAPTER_HISTORY_PARA_1', 'A parsonage is the residence, or former residence, of one or more priests or ministers of religion. Such residences are known by various names, including "rectory" and "clergy house".[NEWLINE][NEWLINE]Parsonages are typically owned and maintained by a church, as a benefit to its clergy. The practice exists in many denominations because of the tendency of clergy to be transferred from one church to another at relatively frequent intervals. Catholic parsonages in particular may be lived in by several priests from a parish. Parsonages sometimes serve as the administrative office of a local parish as well as a residence; they are normally located next to, or at least close to, the church their occupant serves.', 'en_US'),

('LOC_SDG_FOOD_PANTRY', 'Food Pantry', 'en_US'),
('LOC_SDG_FOOD_PANTRY_DESC', '[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_FOOD_PANTRY_CHAPTER_HISTORY_PARA_1', 'A food pantry or food closet is a small front line agency that hands out packages of food from food banks directly to people in need.', 'en_US'),

('LOC_SDG_BE_FRUITFUL', 'Be Fruitful and Multiply', 'en_US'),
('LOC_SDG_BE_FRUITFUL_DESC', '[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_BE_FRUITFUL_CHAPTER_HISTORY_PARA_1', 'In the first chapter of Genesis, God addressed Adam and Eve (the first two people on Earth) as follows: "And God blessed them, and God said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth" (verse 28, KJV)', 'en_US'),

('LOC_SDG_CHURCH_PROPERTY', 'Church Property', 'en_US'),
('LOC_SDG_CHURCH_PROPERTY_DESC', '[NEWLINE][in cities that follow this religion]', 'en_US'),
-- ('LOC_PEDIA_RELIGIONS_PAGE_SDG_CHURCH_PROPERTY_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),

('LOC_SDG_TITHE', 'Tithe', 'en_US'),
('LOC_SDG_TITHE_DESC', '', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_TITHE_CHAPTER_HISTORY_PARA_1', 'A tithe is a one-tenth part of something, paid as a contribution to a religious organization (e.g., clergy or churches). Today, tithes are normally voluntary and paid in cash, cheques, or stocks, whereas historically tithes were required and paid in kind, such as agricultural products. Several European countries operate a formal process linked to the tax system allowing some churches to assess tithes.[NEWLINE][NEWLINE]Traditional Jewish law and practice has included various forms of tithing since ancient times. Orthodox Jews commonly practice ma''aser kesafim (tithing 10% of their income to charity). In modern Israel, Jews continue to follow the laws of agricultural tithing, e.g., ma''aser rishon, terumat ma''aser, and ma''aser sheni.[NEWLINE][NEWLINE]With respect to Christianity, many denominations hold Jesus Christ taught that "tithing must be done in conjunction with a deep concern for justice, mercy and faithfulness" (cf. Matthew 23:23). Tithing was taught at early Christian church councils, including the Council of Tours in 567, as well as the Synod of MAcon in 585. Tithing remains an important doctrine in many Christian denominations, such as the Congregationalist Churches, Methodist Churches and Seventh-day Adventist Church.[NEWLINE][NEWLINE]"Will anyone rob God? Yet you are robbing me! But you say, ''How are we robbing you?'' In your tithes and offerings! You are cursed with a curse, for you are robbing me-the whole nation of you! Bring the full tithe into the storehouse, so that there may be food in my house, and thus put me to the test, says the Lord of hosts; see if I will not open the windows of heaven for you and pour down for you an overflowing blessing. I will rebuke the locust for you, so that it will not destroy the produce of your soil; and your vine in the field shall not be barren, says the Lord of hosts. Then all nations will count you happy, for you will be a land of delight, says the Lord of hosts.[NEWLINE][NEWLINE]-Malachi 3', 'en_US'),

('LOC_SDG_THEOLOGICAL_AESTHETICS', 'Theological Aesthetics', 'en_US'),
('LOC_SDG_THEOLOGICAL_AESTHETICS_DESC', '+15%[ICON_Culture]Culture[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_THEOLOGICAL_AESTHETICS_CHAPTER_HISTORY_PARA_1', 'Theological aesthetics is the interdisciplinary study of theology and aesthetics, and has been defined as being "concerned with questions about God and issues in theology in the light of and perceived through sense knowledge (sensation, feeling, imagination), through beauty, and the arts". This field of study is broad and includes not only a theology of beauty, but also the dialogue between theology and the arts, such as dance, drama, film, literature, music, poetry, and the visual arts.', 'en_US'),


('LOC_SDG_KIBBUTZIM', 'Kibbutzim', 'en_US'),
('LOC_SDG_KIBBUTZIM_DESC', 'Farms provide +1[ICON_Food]Food', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_KIBBUTZIM_CHAPTER_HISTORY_PARA_1', 'A kibbutz (lit. "gathering, clustering"; plural kibbutzim?) is a collective community in Israel that was traditionally based on agriculture. The first kibbutz, established in 1909, was Degania. Today, farming has been partly supplanted by other economic branches, including industrial plants and high-tech enterprises. Kibbutzim began as utopian communities, a combination of socialism and Zionism. In recent decades, some kibbutzim have been privatized and changes have been made in the communal lifestyle. A member of a kibbutz is called a kibbutznik.[NEWLINE][NEWLINE]P.S. The Kibbutzim housing is credited under "Great Person Housing" in your city info', 'en_US'),

('LOC_SDG_95_THESES', '95 Theses', 'en_US'),
('LOC_SDG_95_THESES_DESC', '100% stronger outgoing religious pressure from cities that follow this religion whose owners have researched Printing', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_95_THESES_CHAPTER_HISTORY_PARA_1', 'The Ninety-five Theses is a list of propositions for an academic disputation written in 1517 by Martin Luther, professor of moral theology at the University of Wittenberg, Germany, that started the Reformation... a schism in the Catholic Church which profoundly changed Europe. They advanced Luther''s positions against what he saw as the abuse of the practice of clergy selling plenary indulgences, which were certificates believed to reduce the punishment in purgatory for sins committed by the purchasers or their loved ones.[NEWLINE][NEWLINE]Luther sent the Theses enclosed with a letter to Albert of Brandenburg, the Archbishop of Mainz, on 31 October 1517, a date now considered the start of the Reformation and commemorated annually as Reformation Day. Luther may have also posted the Theses on the door of All Saints'' Church and other churches in Wittenberg in accordance with University custom. The Theses were quickly reprinted, translated, and distributed throughout Germany and Europe. They initiated a pamphlet war with indulgence preacher Johann Tetzel, which spread Luther''s fame even further. Luther''s ecclesiastical superiors had him tried for heresy, which culminated in his excommunication in 1521.[NEWLINE][NEWLINE]Luther took full advantage of the invention of Gutenberg''s printing press, creating pamphlets and tracts that summarized his opinions so rapidly that his adversaries had a difficult time keeping pace.', 'en_US'),


('LOC_SDG_ABIDE_WITH_ME', 'Abide with Me', 'en_US'),
('LOC_SDG_ABIDE_WITH_ME_DESC', '+1 Wildcard policy slot while your civilization is in a Dark Age', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_ABIDE_WITH_ME_CHAPTER_HISTORY_PARA_1', '"Abide with Me" is a Christian hymn by Scottish Anglican Henry Francis Lyte. Lyte wrote the poem in 1847 and set it to music while he lay dying from tuberculosis; he survived only a further three weeks after its completion. The hymn is a prayer for God to remain present with the speaker throughout life, through trials, and through death. The opening line alludes to Luke 24:29, "Abide with us: for it is toward evening, and the day is far spent"[NEWLINE][NEWLINE]1 Abide with me; fast falls the eventide[NEWLINE]The darkness deepens; Lord with me abide[NEWLINE]When other helpers fail and comforts flee[NEWLINE]Help of the helpless, O abide with me[NEWLINE][NEWLINE]2 Swift to its close ebbs out life''s little day;[NEWLINE]Earth''s joys grow dim, its glories pass away.[NEWLINE]Change and decay in all around I see. [NEWLINE]O Lord who changes not, abide with me. [NEWLINE][NEWLINE]3 I need your presence every passing hour. [NEWLINE]What but your grace can foil the tempter''s power? [NEWLINE]Who like yourself my guide and strength can be? [NEWLINE]Through cloud and sunshine, O abide with me. [NEWLINE][NEWLINE]4 I fear no foe with you at hand to bless, [NEWLINE]though ills have weight, and tears their bitterness. [NEWLINE]Where is death''s sting? Where, grave, your victory? [NEWLINE]I triumph still, if you abide with me. [NEWLINE][NEWLINE]5 Hold now your Word before my closing eyes. [NEWLINE]Shine through the gloom and point me to the skies. [NEWLINE]Heaven''s morning breaks and earth''s vain shadows flee; [NEWLINE]in life, in death, O Lord, abide with me.', 'en_US'),

('LOC_SDG_PILGRIMAGE', 'Pilgrimage', 'en_US'),
('LOC_SDG_PILGRIMAGE_DESC', '+1[ICON_Faith]Faith for every 3 followers of this religion in other civilizations and city-states', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_PILGRIMAGE_CHAPTER_HISTORY_PARA_1', 'A pilgrimage is a journey or search of moral or spiritual significance. Typically, it is a journey to a shrine or other location of importance to a person''s beliefs and faith, although sometimes it can be a metaphorical journey into someone''s own beliefs. Many religions attach spiritual importance to particular places: the place of birth or death of founders or saints, or to the place of their "calling" or spiritual awakening, or of their connection (visual or verbal) with the divine, to locations where miracles were performed or witnessed, or locations where a deity is said to live or be "housed", or any site that is seen to have special spiritual powers. Such sites may be commemorated with shrines or temples that devotees are encouraged to visit for their own spiritual benefit: to be healed or have questions answered or to achieve some other spiritual benefit. A person who makes such a journey is called a pilgrim.[NEWLINE][NEWLINE]The Holy Land acts as a focal point for the pilgrimages of the Abrahamic religions of Judaism, Christianity, and Islam. According to a Stockholm University study in 2011, these pilgrims visit the Holy Land to touch and see physical manifestations of their faith, confirm their beliefs in the holy context with collective excitation, and connect personally to the Holy Land.', 'en_US'),

('LOC_SDG_QIBLA', 'Qibla', 'en_US'),
('LOC_SDG_QIBLA_DESC', '+2[ICON_Faith]Faith for every city following this religion in other civilizations and city-states', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_QIBLA_CHAPTER_HISTORY_PARA_1', 'The Qibla (Arabic for "Direction", also transliterated as Qiblah, Qibleh, Kiblah, Kible or Kibla), is the direction that should be faced when a Muslim prays. It is fixed as the direction of the Kaaba in the Hejazi city of Mecca. Most mosques contain a wall niche that indicates the Qiblah. Most multifaith prayer rooms will also contain a Qibla, although usually less standardized in appearance than one would find within a mosque.[NEWLINE][NEWLINE]Muslims all praying towards the same point is traditionally considered to symbolize the unity of the community Muslims worldwide. The Qiblah also has importance beyond prayers, and plays a part in various ceremonies. The head of an animal that is slaughtered using clean methods is usually aligned with the Qiblah. After death, Muslims are usually buried with the body at right angles to the Qibla and the face turned right towards the direction of the Qibla. Thus, archaeology can indicate an Islamic necropolis, if no other signs are present.', 'en_US'),


('LOC_SDG_SCRIPTURE', 'Scripture', 'en_US'),
('LOC_SDG_SCRIPTURE_DESC', '25% stronger outgoing religious pressure from cities that follow this religion; boosted to 75% once the city''s owner has researched Printing', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_SCRIPTURE_CHAPTER_HISTORY_PARA_1', 'Religious texts (also known as scripture, or scriptures, from the Latin scriptura, meaning "writing") are texts which religious traditions consider to be central to their practice or beliefs. Religious texts may be used to provide meaning and purpose, evoke a deeper connection with the divine, convey religious truths, promote religious experience, foster communal identity, and guide individual and communal religious practice. Religious texts often communicate the practices or values of a religious traditions and can be looked to as a set of guiding principles which dictate physical, mental, spiritual, or historical elements considered important to a specific religion. The terms ''sacred'' text and ''religious'' text are not necessarily interchangeable in that some religious texts are believed to be sacred because of their nature as divinely or supernaturally revealed or inspired, whereas some religious texts are simply narratives pertaining to the general themes, practices, or important figures of the specific religion, and not necessarily considered sacred by itself.[NEWLINE][NEWLINE]One of the oldest known religious texts is the Kesh Temple Hymn of Ancient Sumer, a set of inscribed clay tablets which scholars typically date around 2600 BC. The Epic of Gilgamesh from Sumer, considered by some scholars to be a religious text, has origins as early as 2150-2000 BC, and stands as one of the earliest literary works that includes various mythological figures and themes of interaction with the divine. The Rig Veda of ancient Hinduism is estimated to have been composed between 1700-1100 BC, which not only denotes it as one of the oldest known religious texts, but also one of the oldest written religious text which is still actively used in religious practice to this day.[NEWLINE][NEWLINE]There are many possible dates given to the first writings which can be connected to Talmudic and Biblical traditions, the earliest of which is found in scribal documentation of the 8th century BC, followed by administrative documentation from temples of the 5th and 6th centuries BC.[NEWLINE][NEWLINE]High rates of mass production and distribution of religious texts did not begin until the invention of the printing press in 1440, before which all religious texts were hand written copies, of which there were relatively limited quantities in circulation.', 'en_US'),

('LOC_SDG_CLOSED_CANON', 'Closed Canon', 'en_US'),
('LOC_SDG_CLOSED_CANON_DESC', '50% stronger outgoing religious pressure from cities that follow this religion', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_CLOSED_CANON_CHAPTER_HISTORY_PARA_1', 'A biblical canon or canon of scripture is a set of texts which a particular religious community regards as authoritative scripture. The English word "canon" comes from Greek, meaning "rule" or "measuring stick". Christians became the first to use the term in reference to scripture, but Eugene Ulrich regards the idea as Jewish.[NEWLINE][NEWLINE]Most canons today are considered by adherents "closed" (i.e., books cannot be added or removed), reflecting a belief that public revelation has ended.  Once the canon is closed the approved texts can be gathered into a complete and standardized collection for widespread distribution. In contrast, an open canon permits the addition of books through the process of continuous revelation.[NEWLINE][NEWLINE]Canons are developed through debate and agreement on the part of the religious authorities of their respective faiths. Believers consider canonical books as inspired by God or as expressive of the authoritative history of the relationship between God and his people. Sometimes books that were failed candidates for canonization are still circulated within the community as Biblical apocrypha or deuterocanonical.[NEWLINE][NEWLINE]The New Testament canon was agreed upon and asserted to be closed at the Council of Carthage in 397 AD under Saint Augustine of Hippo.', 'en_US'),


('LOC_SDG_EUAGGELION', 'Euangelion', 'en_US'),
('LOC_SDG_EUAGGELION_DESC', '+3 increase to the distance religious pressure spreads between cities', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_EUAGGELION_CHAPTER_HISTORY_PARA_1', 'The word "gospel" comes from the Old English translation of Greek "euangelion", meaning "good news".  The euangelion was a rare movement among religions in that the believers thought it was a story of salvation not just for their own ethnic group, but for everyone.  It''s the Good News for all People and needed to be shared as fast and as far as possible.[NEWLINE][NEWLINE]The Greek term was Latinized as "evangelium" in the Vulgate, which is the source for our words "evangelism" and "evangelical". As exemplified in the Calendar Inscription of Priene, dated about 9 BC, the Koine Greek term was originally used in the Roman Empire to herald the good news of the arrival of a new kingdom - the reign of a Caesar who brought war to an end and granted salvation from destruction to those who pledged allegiance to him. The Calendar Inscription of Priene speaks of the birthday of Caesar Augustus as the beginning of the gospel announcing his kingdom, with a Roman decree to start a new calendar system based on the year of Augustus Caesar''s birth. Into this context, the opening words to the Gospel of Mark are striking: "The beginning of the gospel of Jesus Christ, the Son of God." (Mark 1:1 ESV) Mark is co-opting Caesar''s proclamation and heralding Jesus as the king who ends war by conquering people''s allegiance.[NEWLINE][NEWLINE]In Old English, it was translated as godspel (god "good" + spel "news"). The Old English term was retained as gospel in Middle English Bible translations and as such remains in use in Modern English. The written accounts of the life and teaching of Jesus are also generally known as "Gospels".', 'en_US'),

('LOC_SDG_PLYMOUTH_COLONY', 'Plymouth Colony', 'en_US'),
('LOC_SDG_PLYMOUTH_COLONY_DESC', 'Cities start with this religion in place if founded by a player who has this as their majority religion', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_PLYMOUTH_COLONY_CHAPTER_HISTORY_PARA_1', 'Plymouth Colony was an English colonial venture in North America from 1620 to 1691 at a location that had previously been surveyed and named by Captain John Smith. The settlement served as the capital of the colony and developed into the town of Plymouth, Massachusetts. At its height, Plymouth Colony occupied most of the southeastern portion of Massachusetts.[NEWLINE][NEWLINE]Plymouth Colony was founded by a group of Puritan Separatists initially known as the Brownist Emigration, who came to be known as the Pilgrims. It was one of the earliest successful colonies to be founded by the English in America, along with Jamestown and other settlements in Virginia, and was the first permanent English settlement in the New England region. The colony was able to establish a treaty with Wampanoag Chief Massasoit which helped to ensure its success; in this, they were aided by Squanto, a member of the Patuxet tribe.[NEWLINE][NEWLINE]Despite the colony''s relatively short existence, Plymouth holds a special role in American history. A significant proportion of the citizens of Plymouth were fleeing religious persecution and searching for a place to worship as they saw fit, rather than being entrepreneurs like many of the settlers of Jamestown in Virginia. The social and legal systems of the colony became closely tied to their religious beliefs, as well as to English custom. Many of the people and events surrounding Plymouth Colony have become part of American folklore, including the American tradition of Thanksgiving and the monument of Plymouth Rock.', 'en_US'),

('LOC_SDG_THE_GREAT_COMMISSION', 'The Great Commission', 'en_US'),
('LOC_SDG_THE_GREAT_COMMISSION_DESC', '30% cheaper Apostles in cities that follow this religion', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_THE_GREAT_COMMISSION_CHAPTER_HISTORY_PARA_1', 'In Christianity, the Great Commission is the instruction of the resurrected Jesus Christ to his disciples to spread his teachings to all the nations of the world found in Matthew 28: [NEWLINE][NEWLINE]Now the eleven disciples went to Galilee, to the mountain to which Jesus had directed them. And when they saw him they worshiped him, but some doubted. And Jesus came and said to them, "All authority in heaven and on earth has been given to me. Go therefore and make disciples of all nations, baptizing them in the name of the Father and of the Son and of the Holy Spirit, teaching them to observe all that I have commanded you. And behold, I am with you always, to the end of the age."[NEWLINE][NEWLINE]It has become a tenet in Christian theology emphasizing ministry, missionary work, evangelism, and baptism. The apostles are said to have dispersed from Jerusalem and founded the apostolic sees.', 'en_US'),

('LOC_SDG_CHARIOTS_OF_FIRE', 'Chariots of Fire', 'en_US'),
('LOC_SDG_CHARIOTS_OF_FIRE_DESC', 'Missionaries, Apostles, Gurus, and Inquisitors ignore[ICON_Movement]Movement costs of terrain and features when trained in cities that follow this religion', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_CHARIOTS_OF_FIRE_CHAPTER_HISTORY_PARA_1', 'Chariots of Fire is a 1981 British historical drama film telling the story of two runners in the 1924 Olympics: Eric Liddell, a devout Scottish Christian who runs for the glory of God, and Harold Abrahams, an English Jew who runs to overcome prejudice. It was nominated for seven Academy Awards and won four, including Best Picture and Best Original Screenplay. Vangelis composed a memorable electronic soundtrack and was honored with the Academy Award for Best Original Score.[NEWLINE][NEWLINE]The film''s title was inspired by the line, "Bring me my chariot of fire," from a William Blake poem. Said poem was adapted into the popular British hymn "Jerusalem" which is heard at the end of the film. The original phrase "chariot of fire" is from 2 Kings 2:11 and 6:17.', 'en_US'),

('LOC_SDG_APOSTOLIC_NUNCIATURE', 'Apostolic Nunciature', 'en_US'),
('LOC_SDG_APOSTOLIC_NUNCIATURE_DESC', '+1[ICON_Envoy]Envoy in each City-State when it first adopts this religion', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_APOSTOLIC_NUNCIATURE_CHAPTER_HISTORY_PARA_1', 'An Apostolic Nunciature is a top-level diplomatic mission of the Holy See, equivalent to an embassy. However, it does not issue visas, nor does it have consulates.[NEWLINE][NEWLINE]The head of the Apostolic Nunciature is called a nuncio, an ecclesiastical diplomatic title. A papal nuncio (officially known as an Apostolic nuncio) is a permanent diplomatic representative (head of diplomatic mission) of the Holy See to a state or to one of two international intergovernmental organizations, the European Union or ASEAN, having the rank of an ambassador extraordinary and plenipotentiary, and the ecclesiastical rank of titular archbishop. Papal representatives to other intergovernmental organizations are known as "permanent observers" or "delegates".[NEWLINE][NEWLINE]In several countries that have diplomatic relations with the Holy See, the Apostolic Nuncio is ipso facto the Dean of the Diplomatic Corps. The nuncio is first in the order of precedence among all the diplomats accredited to the country, and he speaks for the diplomatic corps in matters of diplomatic privilege and protocol. Most countries that concede priority to the nuncio are officially Catholic, but some are not.[NEWLINE][NEWLINE]In addition, the nuncio serves as the liaison between the Holy See and the Church in that particular nation, supervising the diocesan episcopate (usually a national conference of bishops which has its own elected President, often the highest-ranking (arch)bishop, especially if his seat carries the title of primate or he has individually been created a cardinal). The nuncio has an important role in the selection of bishops.', 'en_US'),

('LOC_SDG_PAPAL_PRIMACY', 'Papal Primacy', 'en_US'),
('LOC_SDG_PAPAL_PRIMACY_DESC', '+200 religious pressure to a City-State when you send an[ICON_Envoy]Envoy. When combined with Apostolic Nunciature, results in 2 envoys upon adoption.', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_PAPAL_PRIMACY_CHAPTER_HISTORY_PARA_1', 'Papal primacy, also known as the primacy of the Bishop of Rome, is an ecclesiastical doctrine concerning the respect and authority that is due to the pope from other bishops and their episcopal sees.[NEWLINE][NEWLINE]English academic and Catholic priest Aidan Nichols wrote that "at root, only one issue of substance divides the Orthodox and the Catholic Churches, and that is the issue of the primacy." The French Orthodox researcher Jean-Claude Larchet wrote that together with the Filioque controversy, differences in interpretation of this doctrine have been and remain the primary causes of schism between the Catholic Church and the Orthodox Church. In the Eastern Orthodox Churches, some understand the primacy of the Bishop of Rome to be merely one of greater honour, regarding him as primus inter pares ("first among equals"), without effective power over other churches. Other Orthodox Christian theologians, however, view primacy as authoritative power: the expression, manifestation and realization in one bishop of the power of all the bishops and of the unity of the Church.[NEWLINE][NEWLINE]The Catholic Church attributes to the primacy of the Pope "full, supreme, and universal power over the whole Church, a power which he can always exercise unhindered," a power that it attributes also to the entire body of the bishops united with the pope. The power that it attributes to the pope''s primatial authority has limitations that are official, legal, dogmatic, and practical.', 'en_US'),

('LOC_SDG_ZEN_MEDITATION', 'Zen Meditation', 'en_US'),
('LOC_SDG_ZEN_MEDITATION_DESC', '+2[ICON_Amenities]Amenity in cities with 2 specialty districts that follow this religion', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_ZEN_MEDITATION_CHAPTER_HISTORY_PARA_1', 'Zazen is a meditative discipline that is typically the primary practice of the Zen Buddhist tradition. The precise meaning and method of zazen varies from school to school, but in general it can be regarded as a means of insight into the nature of existence. The aim of zazen is just sitting; that is, suspending all judgmental thinking and letting words, ideas, images and thoughts pass by without getting involved in them.', 'en_US'),



('LOC_SDG_WORLD_CHURCH', 'World Church', 'en_US'),
('LOC_SDG_WORLD_CHURCH_DESC', '+1[ICON_Culture]Culture for every 5 followers of this religion in other civilizations', 'en_US'),
-- ('LOC_PEDIA_RELIGIONS_PAGE_SDG_WORLD_CHURCH_CHAPTER_HISTORY_PARA_1', 'TODO', 'en_US'),


('LOC_SDG_CRAZY_HORSE', 'Crazy Horse', 'en_US'),
('LOC_SDG_CRAZY_HORSE_DESC', 'Culture Bomb adjacent tiles when completing a [ICON_DISTRICT_HOLYSITE]Holy Site or preaching a Great Sermon', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_CRAZY_HORSE_CHAPTER_HISTORY_PARA_1', '"My lands are where my dead lie buried." -Crazy Horse, as quoted in National Geographic Vol. CX (July-December 1956), p. 487[NEWLINE][NEWLINE]Crazy Horse (c.?1840-September 5, 1877) was a Lakota war leader of the Oglala band in the 19th century. He took up arms against the United States federal government to fight against encroachment by white American settlers on Native American territory and to preserve the traditional way of life of the Lakota people. His participation in several famous battles of the Black Hills War on the northern Great Plains, among them the Fetterman Fight in 1866 in which he acted as a decoy and the Battle of the Little Bighorn in 1876 in which he led a war party to victory, earned him great respect from both his enemies and his own people.[NEWLINE][NEWLINE]In 1948 Thunderhead Mountain in the Black Hills of South Dakota (near the town of Custer) was designated to become the world''s largest sculpture titled the Crazy Horse Memorial. The sculptor, Korczak Ziolkowski, acknowledged that the carving would not represent Crazy Horse''s physical likeness but rather be a metaphoric tribute to the spirit embodied in his answer to the question from a white man, "Where are your lands now?" Crazy Horse replied, "My lands are where my dead lie buried" and the sculpture depicts him pointing his index finger over the head of his horse''s head.[NEWLINE][NEWLINE]Upon completion, the monument would be 641 feet (195 m) wide and 563 feet (172 m) high. In 2010 the Statue of Unity in India was begun, and finished 8 years later. This statue is 10 meters larger than the completed Crazy Horse would be, and the only close rival among existing statues. Today Crazy Horse Memorial is far from complete and there are no completion date estimates. In 1998, the face of was completed and dedicated.', 'en_US'),

('LOC_SDG_LINCOLNS_SECOND', 'Lincoln''s Second Inaugural', 'en_US'),
('LOC_SDG_LINCOLNS_SECOND_DESC', '50% less war weariness', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_LINCOLNS_SECOND_CHAPTER_HISTORY_PARA_1', 'Abraham Lincoln delivered his second inaugural address on March 4, 1865, during his second inauguration as President of the United States. At a time when victory over secessionists in the American Civil War was within days and slavery in all of the Union was near an end, Lincoln did not speak of happiness, but of sadness. Some see this speech as a defense of his pragmatic approach to Reconstruction, in which he sought to avoid harsh treatment of the defeated South by reminding his listeners of how wrong both sides had been in imagining what lay before them when the war began four years earlier. Lincoln balanced that rejection of triumphalism, however, with recognition of the unmistakable evil of slavery. The address is inscribed, along with the Gettysburg Address, in the Lincoln Memorial.[NEWLINE][NEWLINE]Fellow-Countrymen:[NEWLINE][NEWLINE]At this second appearing to take the oath of the Presidential office there is less occasion for an extended address than there was at the first. Then a statement somewhat in detail of a course to be pursued seemed fitting and proper. Now, at the expiration of four years, during which public declarations have been constantly called forth on every point and phase of the great contest which still absorbs the attention and engrosses the energies of the nation, little that is new could be presented. The progress of our arms, upon which all else chiefly depends, is as well known to the public as to myself, and it is, I trust, reasonably satisfactory and encouraging to all. With high hope for the future, no prediction in regard to it is ventured.[NEWLINE][NEWLINE]On the occasion corresponding to this four years ago all thoughts were anxiously directed to an impending civil war. All dreaded it, all sought to avert it. While the inaugural address was being delivered from this place, devoted altogether to saving the Union without war, insurgent agents were in the city seeking to destroy it without war-seeking to dissolve the Union and divide effects by negotiation. Both parties deprecated war, but one of them would make war rather than let the nation survive, and the other would accept war rather than let it perish, and the war came.[NEWLINE][NEWLINE]One-eighth of the whole population were colored slaves, not distributed generally over the Union, but localized in the southern part of it. These slaves constituted a peculiar and powerful interest. All knew that this interest was somehow the cause of the war. To strengthen, perpetuate, and extend this interest was the object for which the insurgents would rend the Union even by war, while the Government claimed no right to do more than to restrict the territorial enlargement of it. Neither party expected for the war the magnitude or the duration which it has already attained. Neither anticipated that the cause of the conflict might cease with or even before the conflict itself should cease. Each looked for an easier triumph, and a result less fundamental and astounding. Both read the same Bible and pray to the same God, and each invokes His aid against the other. It may seem strange that any men should dare to ask a just God''s assistance in wringing their bread from the sweat of other men''s faces, but let us judge not, that we be not judged. The prayers of both could not be answered. That of neither has been answered fully. The Almighty has His own purposes. "Woe unto the world because of offenses; for it must needs be that offenses come, but woe to that man by whom the offense cometh." If we shall suppose that American slavery is one of those offenses which, in the providence of God, must needs come, but which, having continued through His appointed time, He now wills to remove, and that He gives to both North and South this terrible war as the woe due to those by whom the offense came, shall we discern therein any departure from those divine attributes which the believers in a living God always ascribe to Him? Fondly do we hope, fervently do we pray, that this mighty scourge of war may speedily pass away. Yet, if God wills that it continue until all the wealth piled by the bondsman''s two hundred and fifty years of unrequited toil shall be sunk, and until every drop of blood drawn with the lash shall be paid by another drawn with the sword, as was said three thousand years ago, so still it must be said "the judgments of the Lord are true and righteous altogether."[NEWLINE][NEWLINE]With malice toward none, with charity for all, with firmness in the right as God gives us to see the right, let us strive on to finish the work we are in, to bind up the nation''s wounds, to care for him who shall have borne the battle and for his widow and his orphan, to do all which may achieve and cherish a just and lasting peace among ourselves and with all nations.', 'en_US'),


('LOC_SDG_JOSEPH', 'Joseph', 'en_US'),
('LOC_SDG_JOSEPH_DESC', '+4[ICON_Food]Food from [ICON_DISTRICT_HOLYSITE]Holy Sites[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_JOSEPH_CHAPTER_HISTORY_PARA_1', 'Pharaoh dreamed that he was standing by the Nile, and there came up out of the Nile seven sleek and fat cows, and they grazed in the reed grass. Then seven other cows, ugly and thin, came up out of the Nile after them, and stood by the other cows on the bank of the Nile. The ugly and thin cows ate up the seven sleek and fat cows. And Pharaoh awoke. Then he fell asleep and dreamed a second time; seven ears of grain, plump and good, were growing on one stalk. Then seven ears, thin and blighted by the east wind, sprouted after them. The thin ears swallowed up the seven plump and full ears. Pharaoh awoke, and it was a dream. In the morning his spirit was troubled; so he sent and called for all the magicians of Egypt and all its wise men. Pharaoh told them his dreams, but there was no one who could interpret them to Pharaoh.[NEWLINE][NEWLINE]Then the chief cupbearer said to Pharaoh, "I remember my faults today. Once Pharaoh was angry with his servants, and put me and the chief baker in custody in the house of the captain of the guard. We dreamed on the same night, he and I, each having a dream with its own meaning. A young Hebrew was there with us, a servant of the captain of the guard. When we told him, he interpreted our dreams to us, giving an interpretation to each according to his dream. As he interpreted to us, so it turned out; I was restored to my office, and the baker was hanged."[NEWLINE][NEWLINE]Then Pharaoh sent for Joseph, and he was hurriedly brought out of the dungeon. When he had shaved himself and changed his clothes, he came in before Pharaoh. And Pharaoh said to Joseph, "I have had a dream, and there is no one who can interpret it. I have heard it said of you that when you hear a dream you can interpret it." Joseph answered Pharaoh, "It is not I; God will give Pharaoh a favorable answer." Then Pharaoh said to Joseph, "In my dream I was standing on the banks of the Nile; and seven cows, fat and sleek, came up out of the Nile and fed in the reed grass. Then seven other cows came up after them, poor, very ugly, and thin. Never had I seen such ugly ones in all the land of Egypt. The thin and ugly cows ate up the first seven fat cows, but when they had eaten them no one would have known that they had done so, for they were still as ugly as before. Then I awoke. I fell asleep a second time and I saw in my dream seven ears of grain, full and good, growing on one stalk, and seven ears, withered, thin, and blighted by the east wind, sprouting after them; and the thin ears swallowed up the seven good ears. But when I told it to the magicians, there was no one who could explain it to me."[NEWLINE][NEWLINE]Then Joseph said to Pharaoh, "Pharaoh''s dreams are one and the same; God has revealed to Pharaoh what he is about to do. The seven good cows are seven years, and the seven good ears are seven years; the dreams are one. The seven lean and ugly cows that came up after them are seven years, as are the seven empty ears blighted by the east wind. They are seven years of famine. It is as I told Pharaoh; God has shown to Pharaoh what he is about to do. There will come seven years of great plenty throughout all the land of Egypt. After them there will arise seven years of famine, and all the plenty will be forgotten in the land of Egypt; the famine will consume the land. The plenty will no longer be known in the land because of the famine that will follow, for it will be very grievous. And the doubling of Pharaoh''s dream means that the thing is fixed by God, and God will shortly bring it about. Now therefore let Pharaoh select a man who is discerning and wise, and set him over the land of Egypt. Let Pharaoh proceed to appoint overseers over the land, and take one-fifth of the produce of the land of Egypt during the seven plenteous years. Let them gather all the food of these good years that are coming, and lay up grain under the authority of Pharaoh for food in the cities, and let them keep it. That food shall be a reserve for the land against the seven years of famine that are to befall the land of Egypt, so that the land may not perish through the famine."[NEWLINE][NEWLINE]The proposal pleased Pharaoh and all his servants. Pharaoh said to his servants, "Can we find anyone else like this-one in whom is the spirit of God?" So Pharaoh said to Joseph, "Since God has shown you all this, there is no one so discerning and wise as you. You shall be over my house, and all my people shall order themselves as you command; only with regard to the throne will I be greater than you." And Pharaoh said to Joseph, "See, I have set you over all the land of Egypt." Removing his signet ring from his hand, Pharaoh put it on Joseph''s hand; he arrayed him in garments of fine linen, and put a gold chain around his neck. He had him ride in the chariot of his second-in-command; and they cried out in front of him, "Bow the knee!" Thus he set him over all the land of Egypt. Moreover Pharaoh said to Joseph, "I am Pharaoh, and without your consent no one shall lift up hand or foot in all the land of Egypt." Pharaoh gave Joseph the name Zaphenath-paneah; and he gave him Asenath daughter of Potiphera, priest of On, as his wife. Thus Joseph gained authority over the land of Egypt.[NEWLINE][NEWLINE]Joseph was thirty years old when he entered the service of Pharaoh king of Egypt. And Joseph went out from the presence of Pharaoh, and went through all the land of Egypt. During the seven plenteous years the earth produced abundantly. He gathered up all the food of the seven years when there was plenty in the land of Egypt, and stored up food in the cities; he stored up in every city the food from the fields around it. So Joseph stored up grain in such abundance-like the sand of the sea-that he stopped measuring it; it was beyond measure.[NEWLINE][NEWLINE]-Genesis 41', 'en_US'),

('LOC_SDG_RELIGIOUS_INDUSTRY', 'Religious Industry', 'en_US'),
('LOC_SDG_RELIGIOUS_INDUSTRY_DESC', '+2[ICON_Production]Production on [ICON_DISTRICT_HOLYSITE]Holy Sites and +1[ICON_Faith]Faith from [ICON_DISTRICT_INDUSTRIAL_ZONE]Industrial Zones. Double if the districts are adjacent.[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_RELIGIOUS_INDUSTRY_CHAPTER_HISTORY_PARA_1', '', 'en_US'),



('LOC_SDG_ACRES_OF_DIAMONDS', 'Acres of Diamonds', 'en_US'),
('LOC_SDG_ACRES_OF_DIAMONDS_DESC', '+3[ICON_Gold]Gold from [ICON_DISTRICT_HOLYSITE]Holy Sites and +1[ICON_Faith]Faith from [ICON_DISTRICT_COMMERCIAL_HUB]Commercial Hubs. Double if the districts are adjacent.[NEWLINE][in cities that follow this religion]', 'en_US'),

('LOC_PEDIA_RELIGIONS_PAGE_SDG_ZACCHAEUS_CHAPTER_HISTORY_PARA_1', '[Jesus] entered Jericho and was passing through it. A man was there named Zacchaeus; he was a chief tax collector and was rich. He was trying to see who Jesus was, but on account of the crowd he could not, because he was short in stature. So he ran ahead and climbed a sycamore tree to see him, because he was going to pass that way. When Jesus came to the place, he looked up and said to him, "Zacchaeus, hurry and come down; for I must stay at your house today." So he hurried down and was happy to welcome him. All who saw it began to grumble and said, "He has gone to be the guest of one who is a sinner." Zacchaeus stood there and said to the Lord, "Look, half of my possessions, Lord, I will give to the poor; and if I have defrauded anyone of anything, I will pay back four times as much." Then Jesus said to him, "Today salvation has come to this house, because he too is a son of Abraham. For the Son of Man came to seek out and to save the lost."[NEWLINE]-Luke 19', 'en_US'),


('LOC_SDG_PROVOSTS', 'Provosts', 'en_US'),
('LOC_SDG_PROVOSTS_DESC', '+2[ICON_Faith]Faith from [ICON_DISTRICT_HOLYSITE]Holy Sites[NEWLINE][in cities that follow this religion]', 'en_US'),
('LOC_PEDIA_RELIGIONS_PAGE_SDG_PROVOSTS_CHAPTER_HISTORY_PARA_1', 'Each diocese has a cathedral that is the mother church and home to the diocesan bishop''s cathedra or throne. Some dioceses have more than one cathedral for historical reasons. As cathedrals are sacramental, liturgical and administrative resource centres for their dioceses, their clergy are usually among the most senior in the diocese. Different member churches of the Anglican Communion have different structures of cathedral clergy. The Church of England has perhaps the most complex system. In England, the senior priest of a cathedral is called the dean (until 2000, some used to be known as provosts instead). The dean is assisted by other senior clergy who are called canons or prebendaries. These have different roles within the cathedral community. For example, a Canon Treasurer is responsible for the fabric and finance of the cathedral, a Canon Precentor is responsible for the worship of the cathedral and a Canon Chancellor is responsible for the archives and libraries of the cathedral. Some non-cathedral clergy are awarded the title of Honorary Canon or Prebendary as a particular distinction. Some cathedrals have minor canons who are similar in status to an assistant curate in a parish church. Besides cathedrals, the Church of England (and now also the Anglican Church of Canada) has a number of collegiate churches and royal peculiars that function in a similar fashion, but do not have a bishop''s throne.[NEWLINE][NEWLINE]Other member churches of the Anglican Communion have much simpler cathedral arrangements. Most other cathedrals are also parish churches. In the Scottish Episcopal Church, the senior priest of a cathedral is a provost. In the Anglican Church of Canada, a cathedral''s senior priest is known as the rector of the cathedral and a dean of the diocese. Deans and provosts are styled the Very Reverend, while canons and prebendaries (but not minor canons) are styled the Reverend Canon or Prebendary. In many provinces of the Communion, the title of "canon" is a gift of the bishop, which may be given to senior or distinguished clergy-and, in some cases, to lay people ("lay canons").', 'en_US'),
*/

('LOC_DB_MOD_CULTURE_FROM_CHARMING_APPEAL_DESC', '+{1_num} [ICON_Culture] Culture from charming appeal{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_MOD_CULTURE_FROM_BREATHTAKING_APPEAL_DESC', '+{1_num} [ICON_Culture] Culture from breathtaking appeal{LOC_GOLD_LABEL}', 'en_US'),

('LOC_DB_ABILITY_HIDE_IN_TREES_NAME', 'Hides In Trees{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_ABILITY_HIDE_IN_TREES_DESC', 'When on a woods or rainforest tile, can only be seen by adjacent units or units with the Spotter ability (like a Scout)', 'en_US'),
('LOC_DB_ABILITY_CITIES_SEE_HIDDEN_NAME', 'Cities See Hidden{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_ABILITY_CITIES_SEE_HIDDEN_DESC', 'Can see hidden units when on a tile containing a city center, encampment, or fort', 'en_US'),

-- My new reports in Better Reports
-- LOC_BELIEF_TYPE_
('LOC_DB_BELIEF_HEADER_NAME', 'Beliefs{LOC_GOLD_LABEL}', 'en_US'),
('LOC_DB_CHECKBOX_HIDE_AVAILABLE_BELIEFS', 'Available Beliefs', 'en_US'),
('LOC_DB_CHECKBOX_HIDE_UNAVAILABLE_BELIEFS', 'Unavailable Beliefs', 'en_US'),
('LOC_DB_REPORTS_TAB_BELIEFS', 'Beliefs', 'en_US')

;



-- -----------------------------------------------------------------------
--	Olympic Pantheons
-- -----------------------------------------------------------------------

--  Pantheon Tables
DROP TABLE IF EXISTS OP_Pantheons ;
CREATE TABLE OP_Pantheons (God VARCHAR) ;

INSERT INTO OP_Pantheons (God) VALUES 
('APHRODITE'),
('APOLLO'),
('ARES'),
('ARTEMIS'),
('ATHENA'),
('ATLAS'),
('DEMETER'),
('DIONYSUS'),
('HADES'),
('HELIOS'),
('HEPHAESTUS'),
('HERA'),
('HERMES'),
('PAN'),
('PERSEPHONE'),
('POSEIDON'),
('ZEUS') ;

DROP TABLE IF EXISTS OP_Wonders ;
CREATE TABLE OP_Wonders (God VARCHAR, Wonder VARCHAR, Faith INT) ;

INSERT INTO OP_Wonders 
(God,			Wonder,				Faith) VALUES 
('APOLLO',		'ORACLE',			5),
('ARTEMIS',		'TEMPLE_ARTEMIS',	5),
('HELIOS',		'COLOSSUS',			5),
('ZEUS',		'STATUE_OF_ZEUS',	5) ;


DROP TABLE IF EXISTS OP_Resources ;
CREATE TABLE OP_Resources (God VARCHAR, Resource VARCHAR) ;

INSERT INTO OP_Resources 
(God,			Resource) VALUES 
('ATHENA',		'OLIVES'),
('ATHENA',		'COTTON'),

('APOLLO',		'SHEEP'),

('DIONYSUS',	'TOBACCO'),
('DIONYSUS',	'WINE'),

('HERA',		'CATTLE'),

('ARTEMIS',		'DEER'),
('ARTEMIS',		'FURS'),
('ARTEMIS',		'IVORY'),

('HADES',		'DIAMONDS'),
('HADES',		'SILVER'),
('HADES',		'JADE'),
('HADES',		'AMBER'),
('HADES',		'PEARLS'),

('ATLAS',		'STONE'),

('DEMETER',		'WHEAT'),

('POSEIDON',	'HORSES'),

('HERMES',		'OIL'),
('HERMES',		'MERCURY'),

('ARES',		'IRON'),
('ARES',		'NITER'),
('ARES',		'URANIUM'),

('HEPHAESTUS',	'COPPER'),
('HEPHAESTUS',	'IRON'),
('HEPHAESTUS',	'COAL'),
('HEPHAESTUS',	'ALUMINUM') ;

DROP TABLE IF EXISTS OP_Resource_Yields ;
CREATE TABLE OP_Resource_Yields (God VARCHAR, Food INT, Production INT, Science INT, Culture INT, Faith INT, Gold INT, HolySite INT, Combat INT, CombatRange INT) ;

INSERT INTO OP_Resource_Yields 
(God,			Food,	Production,		Science,	Culture,	Faith,	Gold,	HolySite,	Combat,	CombatRange) VALUES 
('ATHENA',		0, 		0, 				5, 			0, 			0, 		0, 		5, 			5,		2),			-- 2, 2
('DIONYSUS',	0, 		0, 				0, 			0, 			0, 		0, 		5, 			3,		2),			-- 2, 2
('APOLLO',		0,		0,				0,			4,			0,		0,		5,			4,		2),			-- 4
('HERA',		1, 		1, 				1, 			1, 			1, 		1, 		5, 			4,		2),			-- 6
('ARTEMIS',		2, 		1, 				0, 			0, 			0, 		3, 		5, 			4,		2),			-- 4, 2, 2
('HADES',		0, 		1, 				0, 			0, 			0, 		7, 		5, 			4,		2),			-- 2, 2, 2, 2, 0
('ATLAS',		0,		2, 				0, 			0, 			0, 		0, 		3, 			3,		2),			-- 10
('DEMETER',		3,		0, 				0, 			0, 			0, 		0, 		3, 			3,		2),			-- 10
('POSEIDON',	0, 		2, 				0, 			0, 			0, 		0, 		3, 			5,		2),			-- 11
('HERMES',		0, 		2, 				2, 			2, 			2, 		2, 		5, 			3,		2),			-- 2, 10
('ARES',		0, 		2, 				0, 			0, 			0, 		2, 		5, 			6,		2),			-- 10, 10, 5
('HEPHAESTUS',	0, 		4, 				0, 			0, 			0, 		0, 		5, 			3,		2) ;		-- 4, 10, 10, 7


DROP TABLE IF EXISTS OP_Terrains ;
CREATE TABLE OP_Terrains (God VARCHAR, Terrain VARCHAR, Food INT, Production INT, Science INT, Culture INT, Faith INT, Gold INT, HolySite INT, Combat INT, CombatRange INT) ;

INSERT INTO OP_Terrains 
(God,			Terrain,			Food,	Production,		Science,	Culture,	Faith,	Gold,	HolySite,	Combat,	CombatRange) VALUES 
('HELIOS',		'DESERT',			2,		1,				0,			0,			0,		0,		1,			3,		0),
('HELIOS',		'DESERT_HILLS',		2,		1,				0,			0,			0,		0,		1,			3,		0),
('PERSEPHONE',	'SNOW',				2, 		0, 				0, 			1, 			1, 		0, 		1, 			3,		0),
('PERSEPHONE',	'SNOW_HILLS',		2, 		0, 				0, 			1, 			1, 		0, 		1, 			3,		0),
('PERSEPHONE',	'TUNDRA',			1, 		1, 				0, 			0, 			0, 		0, 		1, 			3,		0),
('PERSEPHONE',	'TUNDRA_HILLS',		1, 		1, 				0, 			0, 			0, 		0, 		1, 			3,		0),
('POSEIDON',	'OCEAN',			0, 		5, 				0, 			0, 			0, 		0, 		1, 			5,		0),
('POSEIDON',	'COAST',			0, 		0, 				0, 			0, 			0, 		0, 		1, 			0,		0),
('ZEUS',		'GRASS_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1),
('ZEUS',		'PLAINS_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1),
('ZEUS',		'DESERT_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1),
('ZEUS',		'TUNDRA_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1),
('ZEUS',		'SNOW_MOUNTAIN',	0, 		0, 				0, 			0, 			0, 		0, 		0, 			5,		1) ;


DROP TABLE IF EXISTS OP_Features ;
CREATE TABLE OP_Features (God VARCHAR, Feature VARCHAR, Food INT, Production INT, Science INT, Culture INT, Faith INT, Gold INT, HolySite INT, Combat INT, CombatRange INT) ;

INSERT INTO OP_Features 
(God,			Feature,					Food,	Production,		Science,	Culture,	Faith,	Gold,	HolySite,	Combat,	CombatRange) VALUES 
('HEPHAESTUS',	'VOLCANIC_SOIL',			0, 		4, 				0, 			0, 			0, 		0, 		5, 			3,		0),
('HEPHAESTUS',	'VOLCANO',					0, 		4, 				0, 			0, 			0, 		0, 		5, 			3,		0),
('PAN',			'MARSH',					1, 		0, 				0, 			1, 			0, 		0, 		3, 			4,		0) ;


DROP TABLE IF EXISTS OP_Appeal ;
CREATE TABLE OP_Appeal (God VARCHAR, AppealMin INT, Food INT, Production INT, Science INT, Culture INT, Faith INT, Gold INT, Combat INT, CombatRange INT) ;

INSERT INTO OP_Appeal 
(God,			AppealMin,	Food,	Production,		Science,	Culture,	Faith,	Gold,	Combat,	CombatRange) VALUES 
('APHRODITE',	4,			0, 		0, 				0, 			1, 			0, 		0, 		3,		0) ;

-- Uppercase Gods
INSERT OR REPLACE INTO LocalizedText (Tag, Text, Language)
	SELECT DISTINCT 'LOC_OP_' || God || '_UPPER', God, 'en_US' FROM OP_Pantheons ;

-- District adjacencies
INSERT OR REPLACE INTO LocalizedText (Tag, Text, Language)
	SELECT DISTINCT 'LOC_OP_' || God || '_DISTRICT_FOOD', '+{1_num} [ICON_Food] from {LOC_OP_' || God || '}', 'en_US' FROM OP_Pantheons ;

INSERT OR REPLACE INTO LocalizedText (Tag, Text, Language)
	SELECT DISTINCT 'LOC_OP_' || God || '_DISTRICT_PRODUCTION', '+{1_num} [ICON_Production] from {LOC_OP_' || God || '}', 'en_US' FROM OP_Pantheons ;

INSERT OR REPLACE INTO LocalizedText (Tag, Text, Language)
	SELECT DISTINCT 'LOC_OP_' || God || '_DISTRICT_SCIENCE', '+{1_num} [ICON_Science] from {LOC_OP_' || God || '}', 'en_US' FROM OP_Pantheons ;

INSERT OR REPLACE INTO LocalizedText (Tag, Text, Language)
	SELECT DISTINCT 'LOC_OP_' || God || '_DISTRICT_CULTURE', '+{1_num} [ICON_Culture] from {LOC_OP_' || God || '}', 'en_US' FROM OP_Pantheons ;

INSERT OR REPLACE INTO LocalizedText (Tag, Text, Language)
	SELECT DISTINCT 'LOC_OP_' || God || '_DISTRICT_FAITH', '+{1_num} [ICON_Faith] from {LOC_OP_' || God || '}', 'en_US' FROM OP_Pantheons ;

INSERT OR REPLACE INTO LocalizedText (Tag, Text, Language)
	SELECT DISTINCT 'LOC_OP_' || God || '_DISTRICT_GOLD', '+{1_num} [ICON_Gold] from {LOC_OP_' || God || '}', 'en_US' FROM OP_Pantheons ;

