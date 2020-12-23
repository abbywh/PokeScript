module Command where

import Text.ParserCombinators.ReadP
import Control.Applicative hiding (optional)
import Data.Char

import Pokemon
import Attack

data Command = DoAttack ((PokeName, Attack), PokeName)
type Parser = ReadP

runParser :: ReadP a -> String -> [(a, String)]
runParser = readP_to_S

whitespacify :: Parser a -> Parser a
whitespacify prsr = skipSpaces
                    *> prsr
                    <* skipSpaces
{-
attackParser :: Parser Command
attackParser = do
  p1 <- munch1 isAlpha
  whitespacify $ string "uses"
  atk <- munch1 isDigit
  whitespacify $ string "on"
  p2 <- munch1 isAlpha
  case
  pure DoAttack ((p1,atk),p2)

commandP :: Parser Command
commandP = attackParser


parse :: String -> Maybe Command
parse str = case runParser commandP str of
    [(x,"")] -> Just x
    _ -> Nothing
-}
