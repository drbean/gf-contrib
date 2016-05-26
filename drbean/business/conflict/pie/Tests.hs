module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Pie
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF "./Pie.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF "./Pie.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF "./Pie.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF "./Pie.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF "./Pie.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

	"Mnookin is an expert in negotiation and conflict resolution."
	, "Mnookin knows a lot about how negotiation can be used to resolve conflicts."
	, "He believes negotiation requires the management of three tensions."
	, "The first tension is between the opportunity to expand the pie and the necessity of having to divide up the pie into slices."
	, "The most common mistake in negotiation people make is having a zero-sum mindset."
	, "They think the only issue is who gets what slice."
	, "They fail to realize that there are opportunities through negotiation to also expand the pie."
	, "In order to create value, it is very important that you really understand each other's interests, your long-term goals, and your resources."
	, "The reason that there is a tension is because to create value, it's very important that you really understand each other's interests, your long-term goals, and your resources, or what you might have to trade."
	, "The difficulty is that people are often very fearful about sharing this information, because they are afraid of being exploited in the distributive aspect of bargaining."
	, "Part of the negotiation training and much of the teaching Mnookin does at Harvard really is to help people learn how to manage that tension."
	

  ]

-- vim: set ts=2 sts=2 sw=2 noet:
