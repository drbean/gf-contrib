module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Enjoy
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF "./Enjoy.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF "./Enjoy.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF "./Enjoy.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF "./Enjoy.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF "./Enjoy.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

    "Finn sounds down in the dumps."
		, "Finn sounds miserable."
    , "Finn is miserable."
		, "It is raining."
		, "Finn has no money."
		, "And Finn feels unfit too!"
		, "Rob has some news that might put a smile on Finn's face."
		, "The study tells us how we can make ourselves happier."
		, "Rob and Finn use some words about happiness too."
    , "Finn says that sounds good."
		, "Finn says he feels happier already."
    , "Rob asks Finn what things make him feel happy?"
    , "Finn says the finer things in life, good food , fine wine and things like that make him feel happier"
		, "Finn asks Rob what things make him feel happy."
		, "Rob tells Finn that everything makes him feel happy!"
		, " Rob says that nothing worries him."
		, " Rob says that he always looks for the positive things even in a bad situation."
		, "Rob says that you could also say that he is happy-go-lucky!"
		, "Rob asks Finn which country is top of the list in happiness in the World Happiness Database"
    , "Finn thinks Finland has a high quality of life but he says the happiest nation is Canada."

  ]

-- vim: set ts=2 sts=2 sw=2 noet:
