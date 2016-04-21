module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Piggott
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF "./Piggott.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF "./Piggott.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF "./Piggott.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF "./Piggott.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF "./Piggott.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

	"Joe calls his step-grandfather the Doctor."
	, "The Doctor reacts to a famous radio broadcast."
	, "Joe's step-grandfather is an unusual country doctor."
	, "The Doctor has no sense of humor whatsoever"
	, "The Doctor has no sense of humor when it involves himself."
	, "The Doctor's only recreation is listening to the radio."
	, "When he listens to the radio, Joe just doesn't make a sound,"
	, "When the news is on, Joe doesn't make a sound."
	, "In 1938, on Mercury Theater on the radio, Orson Welles announces that men from Mars land in New Jersey."
	, "Strange beings who land in New Jersey are the vanguard of an invading army from the planet Mars."
	, "Joe has an uncle in New Jersey."
	, "Joe and the Doctor think that Joe's uncle is gone."
	, "The program keeps telling them they are coming in this direction."
	, "The doctor tells his wife to get in the car."
	, "They go over to the Doctor's brother's house so they can all be together when the end comes."
	, "So, they get in the Doctor's Chevrolet automobile and drive around to his brother's house."
	, "They begin talking about it being the end of the world."
	, "They begin confessing to each other."
	, "They begin repenting their sins."
	, "The more they talk, the madder they get at each other."
	, "About 11 o'clock that night, one young skeptic goes back into the house and turns on the radio."
	, "He hears on the news that it is just a drama on Mercury Theater."
	, "He walks back out into the yard where they are confessing to each other."
	, "He waits a few minutes before he tells them that there is nothing to it."
	, "He tells them that it is just a big hoax."
	, "The Doctor and his wife are convinced that there is something to the idea, because they smell rubber burning on the way over there."
	, "They figure that the burning rubber is the scent of the Martians."
	, "They later find out he drives all the way over there with the emergency brake on."
	, "They drive back home without the Doctor saying a word."
	, "This story is told over and over within the family, but Doctor never sees any humor to it at all."
	, "He gets up and leaves in a huff anytime anyone begins to repeat it."

  ]

-- vim: set ts=2 sts=2 sw=2 noet:
