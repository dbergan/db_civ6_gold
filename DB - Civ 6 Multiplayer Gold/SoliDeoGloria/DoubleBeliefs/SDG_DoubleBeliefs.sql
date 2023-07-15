UPDATE GlobalParameters SET Value = 3 WHERE Name = 'RELIGION_INITIAL_BELIEFS' ;
UPDATE ModifierArguments SET Value = 2 WHERE ModifierId = 'SDG_ADD_BELIEF' AND Name = 'Amount' ;