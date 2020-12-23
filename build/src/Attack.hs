module Attack where

type Type = String

data Attack = Attack {aType:: Type, pp:: Integer, basePower::Integer,
  isSp :: Bool, acc:: Integer} deriving (Show)
