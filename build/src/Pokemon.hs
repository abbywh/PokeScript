module Pokemon where

type PokeName = String
---Will eventually become a or Constructor
type Ability = String
type Type = String
type Nature = String

data Attack = Attack {aType:: Type, pp:: Integer, basePower::Integer,
  isSp :: Bool, acc:: Integer} deriving (Show)

data Pokemon = Pokemon {name:: PokeName, ability1 :: Ability,
  ability2 :: Ability, type1:: Type, type2:: Type, hp:: Integer, atk:: Integer,
  def:: Integer, spAtk :: Integer, spDef :: Integer, speed :: Integer,
  moves:: [Attack], isBurned :: Bool, nat :: Nature, evs ::[Integer]} deriving (Show)

--attack with only non RNG components
--pureAttack :: Pokemon -> Attack -> Pokemon -> Integer
pureAttack p1 at p2= (((((2*level) `div` 5 + 2) * power * at1 `div` d1)
  `div` 50)+2)*modify
  where
    power = basePower at
    level = 100
    stab = if aType at == type1 p1 || aType at == type2 p1 then 1.5 else 1
    --need to implement types
    tp = 1
    burn = if isBurned p1 then 1 `div` 2 else 1
    at1 = atk p1
    d1 = def p2
    modify = tp * burn
