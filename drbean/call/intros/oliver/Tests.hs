module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Oliver
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Oliver.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF ( "./Oliver.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF ( "./Oliver.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF ( "./Oliver.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF ( "./Oliver.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [
	"Oliver's name is Oliver."
	, "Oliver's Chinese name is Pan YanMin."
	, "Oliver lives in PingZhen."
	, "Oliver was born in Taipei."
	, "There are four people in Oliver's family."
	, "Oliver has a mother."
	, "Oliver has a father."
	, "Oliver has an older sister."
	, "Oliver's older sister studies in ... University."
	, "Oliver loves listening to music in his free time."
	, "Music makes Oliver feel happy and relaxed."
	, "Basketball is Oliver's favorite sport."
	, "When Oliver is on the court, he focuses on what he wants."
	, "Oliver is a humorous person."
	, "Oliver is an optimistic person."
	, "Oliver thinks positive."
	, "Oliver is on Facebook as Oliver Pan."
  ]

yn_dic_test = [
	"Is Oliver's name Oliver?"
	, "Is Oliver's Chinese name Pan YanMin?"
	, "Does Oliver live in PingZhen?"
	-- , "Oliver was born in Taipei?"
	, "Are there four people in Oliver's family?"
	, "Does Oliver have a mother?"
	, "Does Oliver have a father?"
	, "Does Oliver have an older sister?"
	, "Does Oliver's older sister study in Kainan University."
	, "Does Oliver love listening to music in his free time?"
	, "Does listening to music make Oliver feel happy?"
	, "Does listening to music make Oliver feel relaxed?"
	, "Does Oliver feel relaxed?"
	, "Does Oliver say that he is relaxed?"
	, "Is basketball Oliver's favorite sport?"
	, "When Oliver is on the court, does he focus on what he wants?"
	, "Is Oliver a humorous person?"
	, "Is Oliver an optimistic person?"
	, "Does Oliver positive?"
	, "Is Oliver on Facebook as Oliver Pan?"

  ]

wh_dic_test = [
	"Whose name is Oliver?"
	, "Whose Chinese name is Pan YanMin?"
	, "Who lives in PingZhen?"
	-- , "Who was born in Taipei?"
	, "In whose family are there four people?"
	, "Who has a mother?"
	, "Who has a father?"
	, "Who has an older sister?"
	, "Whose older sister studies in Kainan University."
	, "Who loves listening to music in his free time?"
	, "Music makes Oliver feel happy and relaxed?"
	, "Basketball is Oliver's favorite sport?"
	, "When he is on the court, who focuses on what he wants?"
	, "Who is a humorous person?"
	, "Who is an optimistic person?"
	, "Who thinks positive?"
	, "Who is on Facebook as Oliver Pan?"
  ]

tag_dic_test = [
	"Oliver's name is Oliver, isn't it?"
	, "Oliver's Chinese name is Pan YanMin, isn't it?"
	, "Oliver lives in PingZhen, doesn't he?"
	-- , "Oliver was born in Taipei, wasn't he?"
	, "There are four people in Oliver's family, aren't there?"
	, "Oliver has a mother, doesn't he?"
	, "Oliver has a father, doesn't he?"
	, "Oliver has an older sister, doesn't he?"
	, "Oliver's older sister studies in Kainan University, doesn't she?"
	, "Oliver loves listening to music in his free time, doesn't he?"
	, "Music makes Oliver feel happy and relaxed, doesn't it?"
	, "Basketball is Oliver's favorite sport, isn't it?"
	, "When Oliver is on the court, he focuses on what he wants."
	, "Oliver is a humorous person, isn't he?"
	, "Oliver is an optimistic person, isn't he?"
	, "Oliver thinks positive, doesn't he?"
	, "Oliver is on Facebook as Oliver Pan, isn't he?"
	]


-- vim: set ts=2 sts=2 sw=2 noet:
