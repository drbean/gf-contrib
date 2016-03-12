module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Drunk_driving
import Representation
import Evaluation
-- import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Drunk_driving.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF ( "./Drunk_driving.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF ( "./Drunk_driving.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF ( "./Drunk_driving.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF ( "./Drunk_driving.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

	"Mrs Tipton is an alcoholic."
  , "Mrs Tipton is in the hospital a long time."
  , "Police arrest Mrs Tipton 4 times."
  , "Mrs Tipton drives home from an afternoon party on July 10,"
  , "Mrs Tipton is drunk."
  , "Mrs Tipton hits a 3-year-old girl on a tricycle."
  , "The girl dies."
  , "Mrs Tipton says that she is sorry."
  , "Mrs Tipton promises to play the little girl's parents some money every month."
  , "Mrs Tipton promises never to drink again."

  ]

yn_dic_test = [

	"Is Mrs Tipton an alcoholic?"
  , "Is Mrs Tipton in the hospital a long time?"
  , "Do police arrest Mrs Tipton 4 times?"
  , "Does Mrs Tipton drive home from an afternoon party on July 10?"
  , "Is Mrs Tipton drunk?"
  , "Does Mrs Tipton hit a 3-year-old girl on a tricycle?"
  , "Does the girl die?"
  , "Does Mrs Tipton say that she is sorry?"
  , "Does Mrs Tipton promise to play the little girl's parents some money every month?"
  , "Does Mrs Tipton promise never to drink again?"

  ]

wh_dic_test = [

	"Who is an alcoholic?"
  , "Who is in the hospital a long time?"
  , "Who arrest Mrs Tipton 4 times?"
  , "Who drives home from an afternoon party on July 10,"
  , "Who is drunk?"
  , "Who hits a 3-year-old girl on a tricycle?"
  , "Who dies?"
	, "Who says that she is sorry?"
  , "Who promises to play the little girl's parents some money every month?"
  , "Who promises never to drink again?"

  ]

tag_dic_test = [

	"Mrs Tipton is an alcoholic, isn't she?"
  , "Mrs Tipton is in the hospital a long time, isn't she?"
  , "Police arrest Mrs Tipton 4 times, don't they?"
  , "Mrs Tipton drives home from an afternoon party on July 10, doesn't she?"
  , "Mrs Tipton is drunk, isn't she?"
  , "Mrs Tipton hits a 3-year-old girl on a tricycle, doesn't she?"
  , "The girl dies, doesn't she?"
  , "Mrs Tipton says that she is sorry, doesn't she?"
  , "Mr Tipton promises to play the little girl's parents some money every month, doesn't she?"
  , "Mrs Tipton promises never to drink again, doesn't she?"

	]

student_test = [
	]

-- vim: set ts=2 sts=2 sw=2 noet:
