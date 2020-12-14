module Test where
import Test.HUnit

import Pokemon

constructTests = []



eq = Attack {aType="Ground", pp=12, basePower = 100, isSp = False,
  acc = 100}


groudon = Pokemon {name= "Groudon", ability1="Drought", ability2="None",
  type1="Ground", type2= "", hp = 100, atk=150, def= 140, spAtk=100, spDef=90,
  speed = 90 , isBurned=False, nat="", moves=[eq], evs = [0,0,0,0,0,0]}

--test1 = TestCase (assertEqual ("",))
