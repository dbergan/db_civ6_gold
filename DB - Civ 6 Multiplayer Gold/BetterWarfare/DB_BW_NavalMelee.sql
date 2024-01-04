INSERT INTO UnitPromotionPrereqs ('UnitPromotion', 'PrereqUnitPromotion') VALUES
('PROMOTION_REINFORCED_HULL', 'PROMOTION_HELMSMAN'),
('PROMOTION_RUTTER', 'PROMOTION_EMBOLON')
;

UPDATE Units SET BaseMoves = BaseMoves - 1 WHERE UnitType = 'UNIT_IRONCLAD';
UPDATE Units SET BaseMoves = BaseMoves + 1 WHERE UnitType = 'UNIT_DESTROYER';