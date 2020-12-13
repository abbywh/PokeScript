module Pokemon where

type PokeName = String
---Will eventually become a or Constructor
type Ability = String
type Type = String

data Attack = Attack {aType:: Type, pp:: Integer, basePower::Integer,
  isSp :: Bool, acc:: Integer} deriving (Show)

data Pokemon = Pokemon {name:: PokeName, ability1 :: Ability,
  ability2 :: Ability, type1:: Type, type2:: Type, hp:: Integer, atk:: Integer,
  def:: Integer, spAtk :: Integer, spDef :: Integer, speed :: Integer,
  moves:: [Attack]} deriving (Show)
