module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Culture
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Culture.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF ( "./Culture.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF ( "./Culture.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF ( "./Culture.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF ( "./Culture.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

    "Working with people from other countries can be difficult, because what you think isn't what people from other cultures think."
		, "We assume everyone thinks the same way, but that's not true."
		, "We assume everyone thinks the same way."
		, "Normally, we don't even think about the differences in the way people think."
		, "Of course, when we do work with people from other countries, we realize they are different and they think differently."
		, "Of course, when we work with people from other countries, we realize that they are different."
		, "Of course, when we work with people from other countries, we realize that they think differently."
		, "But do they think the same thing about us?"
		, "They think the same thing about us."
		, "Do they think we are different, or do they think they are the same as us? "
		, "They think we are different, or they think they are the same as us. "
	 , "Actually, the cultural differences, although they're important, are not very big."
	 , "The real differences are the differences between individual people."
	 , "Just because everyone from Africa looks the same, that doesn't mean they all think the same."
	 , "Just because everyone from India looks the same, doesn't mean they all think the same."
	 , "They're all unique and you need to remember that."
	 , "Treat everyone as an individual, not according to your understanding of the cultural group."

  ]

-- vim: set ts=2 sts=2 sw=2 noet:
