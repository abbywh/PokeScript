module Initialize where
  import qualified Data.Map as Map
  import Data.Maybe

  import Pokemon
  import ParseCSV
--Make Pokedex from csv
  pokedex :: IO [Pokemon]
  pokedex = do
    input <- readFile "pokedex_(Update_05.20).csv"
    let l = lines input
    return $ mapMaybe parseCSV l

  --natureMap :: IO 
--Make attackdex from csv
