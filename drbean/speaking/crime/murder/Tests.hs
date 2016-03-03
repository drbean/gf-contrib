module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Murder
import Representation
import Evaluation
-- import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Murder.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF ( "./Murder.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF ( "./Murder.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF ( "./Murder.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF ( "./Murder.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

	"Charles is 80."
  "Charles and his wife are married."
  , "Sara has cancer."
  , "Sara is dying."
  , "Sara is in hospital."
  , "Sara is in the hospital."
  , "Sara is alive."
  , "Sara is kept alive by a respirator."
  , "Charles goes to the hospital."
  , "Charles shoots his wife."
  , "Charles says, I love her so much."
  , "Charles says, I can't watch her suffer anymore."
  , "Charles says, I love her so much, I can't watch her suffer anymore."

  ]

yn_dic_test = [


	"Is Charles 80?"
	, "Is Charles married?"
	, "Are Charles and Sara married?"
	, "Does Sara have cancer?"
  , "Is Sara dying."
  , "Is Sara in hospital."
  , "Is Sara in the hospital."
  , "Is Sara alive."
  , "Is Sara kept alive by a respirator."
  , "Does Charles go to the hospital."
  , "Does Charles shoot his wife."
  , "Does Charles say, I love her so much."
  , "Does Charles say, I can't watch her suffer anymore."
  , "Does Charles say, I love her so much, I can't watch her suffer anymore."


  ]

wh_dic_test = [
	"Whose name is Simon?"
	, "Whose name is Ariel?"
	, "Whose Chinese name is ChiYuan Tien?"
	, "Who is 19 years old?"
	, "Who has a father?"
	, "Who has a mother?"
	, "Who has an older brother?"
	, "Who lives in Taipei?"
	, "Whose older brother studies in WenHua University?"
	, "Who has a younger sister?"
	, "Whose younger sister studies in Minghu Junior High School?"
	, "Who likes to make friends?"
	, "Who likes to play guitar?"
	, "Who likes to play drums?"
	, "Playing drums makes who feel relaxed?"
	, "Who likes listening to English songs?"
	, "Whose favorite subject is English?"
	, "Who thinks logically?"
	, "Who is a logical person?"
	, "Who is a humorous person?"
	, "Who wants to be a translator?"
	, "Who wants to be a tour guide?"
  ]

tag_dic_test = [
	"Simon's name is Simon, isn't it."
	, "Ariel's name is Ariel, isn'it."
	, "Ariel's Chinese name is ChiYuan Tien, isn't it."
	, "Ariel is 19 years old, isn't she."
	, "There are three people in Ariel's family, aren't there."
	, "There are five people in Simon's family, aren't there."
	, "Ariel has a father, doesn't he."
	, "Ariel has a mother, doesn't he."
	, "Simon has a father, doesn't he."
	, "Simon has a mother, doesn't he."
	, "Simon has an older brother, doesn't he."
	, "Simon lives in Taipei, doesn't he."
	, "Simon's older brother studies in WenHua University, doesn't he."
	, "Simon has a younger sister, doesn't he."
	, "Simon's younger sister studies in Minghu Junior High School, doesn't she."
	, "Ariel likes to make friends, doesn't she."
	, "Simon likes to play guitar, doesn't he."
	, "Simon likes to play drums, doesn't he."
	, "Playing guitar makes Simon feel happy, doesn't it."
	, "Playing guitar makes Simon feel relaxed, doesn't it."
	, "Playing drums makes Simon feel happy, doesn't it."
	, "Playing drums makes Simon feel relaxed, doesn't it."
	, "Baseball is Simon's favorite sport, isn't it"
	, "Ariel likes listening to English songs, doesn't she."
	, "Ariel's favorite subject is English, isn't it"
	, "Simon thinks logically, doesn't he."
	, "Simon is a logical person, isn't he."
	, "Simon is a humorous person, isn't he."
	, "Ariel wants to be a translator, doesn't she."
	, "Ariel wants to be a tour guide, doesn't she."
	]

student_test = [
	]

-- vim: set ts=2 sts=2 sw=2 noet:
