module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Siar
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Siar.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF ( "./Siar.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF ( "./Siar.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF ( "./Siar.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF ( "./Siar.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [
	"Simon's name is Simon."
	, "Ariel's name is Ariel."
	, "Ariel's Chinese name is ChiYuan Tien."
	, "Ariel is 19 years old."
	, "There are three people in Ariel's family."
	, "There are five people in Simon's family."
	, "Ariel has a father."
	, "Ariel has a mother."
	, "Simon has a father."
	, "Simon has a mother."
	, "Simon has an older brother."
	, "Simon lives in Taipei."
	, "Simon's older brother studies in WenHua University."
	, "Simon has a younger sister."
	, "Simon's younger sister studies in Minghu Junior High School."
	, "Ariel likes to make friends."
	, "Simon likes to play guitar."
	, "Simon likes to play drums."
	, "Playing guitar makes Simon feel happy."
	, "Playing guitar makes Simon feel relaxed."
	, "Playing drums makes Simon feel happy."
	, "Playing drums makes Simon feel relaxed."
	, "Baseball is Simon's favorite sport."
	, "Ariel likes listening to English songs."
	, "Ariel's favorite subject is English."
	, "Simon thinks logically."
	, "Simon is a logical person."
	, "Simon is a humorous person."
	, "Ariel wants to be a translator."
	, "Ariel wants to be a tour guide."
  ]

yn_dic_test = [
	"Is Simon's name Simon?"
	, "Is Ariel's name Ariel?"
	, "Is Ariel's Chinese name ChiYuan Tien?"
	, "Is Ariel 19 years old?"
	, "Are there three people in Ariel's family?"
	, "Are there five people in Simon's family?"
	, "Does Ariel have a father?"
	, "Does Ariel have a mother?"
	, "Does Simon have a father?"
	, "Does Simon have a mother?"
	, "Does Simon have an older brother?"
	, "Does Simon live in Taipei?"
	, "Does Simon's older brother study in WenHua University?"
	, "Does Simon have a younger sister?"
	, "Does Simon's younger sister study in Minghu Junior High School?"
	, "Does Ariel like to make friends?"
	, "Does Simon like to play guitar?"
	, "Does Simon like to play drums?"
	-- , "Does playing guitar make Simon feel happy?"
	-- , "Does playing guitar make Simon feel relaxed?"
	-- , "Does playing drums make Simon feel happy?"
	-- , "Does playing drums make Simon feel relaxed?"
	, "Is baseball Simon's favorite sport?"
	, "Is Simon's favorite sport baseball?"
	, "Does Ariel like listening to English songs?"
	, "Does Ariel like to listen to English songs?"
	, "Is Ariel's favorite subject English?"
	, "Does Simon think logically?"
	, "Is Simon a logical person?"
	, "Is Simon a humorous person?"
	, "Does Ariel want to be a translator?"
	, "Does Ariel want to be a tour guide?"
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
