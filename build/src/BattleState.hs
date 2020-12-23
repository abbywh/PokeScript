module BattleState where
  import Pokemon
  import Initialize

  data BattleState = {message :: Maybe String,
    currentTeam :: [Pokemon], enemyTeam :: [Pokemon]}

  
