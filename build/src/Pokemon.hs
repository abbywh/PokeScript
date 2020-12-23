module Pokemon where

import Attack

type PokeName = String
---Will eventually become a or Constructor
type Ability = String
type Nature = String

data Pokemon = Pokemon {name:: PokeName, ability1 :: Ability,
  ability2 :: Ability, ability3 :: Ability, type1:: Type, type2:: Type, hp:: Integer, atk:: Integer,
  def:: Integer, spAtk :: Integer, spDef :: Integer, speed :: Integer,
  moves:: [Attack], isBurned :: Bool, nat :: Nature, evs ::[Integer]} deriving (Show)


--add in nature rep
otherStatFormula :: Integer -> Integer -> Nature -> Integer
otherStatFormula base ev nat = (2 * base + iv + (ev `div` 4) * level) `div` 100 + 5 where
  iv = 31
  level=100

getTotalHP :: Pokemon -> Integer
getTotalHP p = (2 * base + iv + (ev `div`  4) * level) `div` 100  + level + 10 where
  level = 100
  iv = 31
  ev = (evs p) !! 0
  base = hp p

--attack with only non RNG components
pureAttack :: Pokemon -> Attack -> Pokemon -> Integer
pureAttack p1 at p2= (((((2*level) `div` 5 + 2) * power * at1 `div` d1)
  `div` 50)+2)*modify
  where
    power = basePower at
    level = 100
    stab = if aType at == type1 p1 || aType at == type2 p1 then 1.5 else 1
    --need to implement types
    tp = 1
    burn = if isBurned p1 then 1 `div` 2 else 1
    at1 = case isSp at of
      True -> otherStatFormula (spAtk p1) (evs p1 !! 3) ""
      False -> otherStatFormula (atk p1) (evs p1 !! 1) ""
    d1 = case isSp at of
      True -> otherStatFormula (spDef p2) (evs p2 !! 2) ""
      False -> otherStatFormula (def p2) (evs p2 !! 4) ""
    modify = tp * burn
