-- Naval Carrier
DELETE FROM UnitPromotionPrereqs WHERE UnitPromotion IN 
	(SELECT UnitPromotionType FROM UnitPromotions WHERE PromotionClass = 'PROMOTION_CLASS_NAVAL_CARRIER') ;

INSERT INTO UnitPromotionPrereqs ('UnitPromotion', 'PrereqUnitPromotion') VALUES
('PROMOTION_HANGAR_DECK', 'PROMOTION_FLIGHT_DECK'),
('PROMOTION_HANGAR_DECK', 'PROMOTION_SCOUT_PLANES'),
('PROMOTION_ADVANCED_ENGINES', 'PROMOTION_FLIGHT_DECK'),
('PROMOTION_ADVANCED_ENGINES', 'PROMOTION_SCOUT_PLANES'),
('PROMOTION_FOLDING_WINGS', 'PROMOTION_HANGAR_DECK'),
('PROMOTION_FOLDING_WINGS', 'PROMOTION_ADVANCED_ENGINES'),
('PROMOTION_DECK_CREWS', 'PROMOTION_HANGAR_DECK'),
('PROMOTION_DECK_CREWS', 'PROMOTION_ADVANCED_ENGINES'),
('PROMOTION_SUPER_CARRIER', 'PROMOTION_FOLDING_WINGS'),
('PROMOTION_SUPER_CARRIER', 'PROMOTION_DECK_CREWS')
;