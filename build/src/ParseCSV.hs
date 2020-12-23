module ParseCSV where
  import Text.ParserCombinators.ReadP
  import Control.Applicative hiding (optional)
  import Data.Char
  import Text.Read hiding (pfail,get)

  import Pokemon
  type Parser = ReadP

  runParser :: ReadP a -> String -> [(a, String)]
  runParser = readP_to_S

  parseString:: Parser String
  parseString = do
    ret <- munch isAlpha
    string ","
    pure ret

  parseStat:: Parser Integer
  parseStat = do
    ret <- munch isDigit
    string ","
    case readMaybe ret of
      Nothing -> pfail
      Just x -> pure x

  parseInt :: Parser Integer
  parseInt = do
    ret <- munch isDigit
    case readMaybe ret of
      Nothing -> pfail
      Just x -> pure x

  parsePokemon :: Parser Pokemon
  parsePokemon = do
    name <- parseString
    type1 <- parseString
    type2 <- parseString
    ability1 <- parseString
    ability2 <- parseString
    abilityHidden <- parseString
    hp <- parseStat
    atk <- parseStat
    def <- parseStat
    sp_attack <- parseStat
    sp_defense <- parseStat
    speed <- parseInt
    string "\r"
    pure $ Pokemon name ability1 ability2 abilityHidden
     type1 type2 hp atk def sp_attack sp_defense speed [] False "" []

  parseCSV :: String -> Maybe Pokemon
  parseCSV str = case runParser parsePokemon str of
      [(x,"")] -> Just x
      _ -> Nothing
