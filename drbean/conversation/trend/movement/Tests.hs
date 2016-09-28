module Tests where

import Control.Monad
import Data.Maybe
import Data.Char
import Data.List

import Data.DRS

import PGF
import Movement
import Representation
import Evaluation
import Model

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

gr :: IO PGF
gr = readPGF "./Movement.pgf"

langs :: IO [Language]
langs = liftM languages gr

lang :: IO Language
lang = liftM head langs

morpho :: IO Morpho
morpho = liftM2 buildMorpho gr lang

liftOp :: Monad m => (a -> b -> c) -> m a -> b -> m c
liftOp f a b = a >>= \a' -> return (f a' b)

miss :: [String] -> IO [String]
miss ws =
	liftOp morphoMissing morpho ws

cat2funs :: String -> IO ()
cat2funs cat = do
	gr' <- gr
	let fs = functionsByCat gr' (mkCId cat)
	let ws = filter (isLower . head . showCId) fs
	let is = map (reverse . dropWhile (\x ->  (==) x '_' || isUpper x) . reverse .showCId ) ws
	putStrLn (unwords is)

catByPOS :: String -> IO ()
catByPOS  pos = do
	gr' <- gr
	let allCats = categories gr'
	let cats = filter (isPrefixOf pos . showCId) allCats
	putStrLn (unwords (map showCId cats))

trans = id

run f tests = do
  gr	<- readPGF "./Movement.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map f ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ts)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

ans tests = do
  gr	<- readPGF "./Movement.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

reps tests = do
  gr	<- readPGF "./Movement.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF "./Movement.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF "./Movement.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

	"Derek Sivers talks about how to start a movement."
	, "A leader needs the guts to stand out."
	, "A leader needs the guts to be ridiculed."
	, "What the leader does is easy to follow."
	, "The first follower has a crucial role."
	, "The first follower shows everyone how to follow."
	, "The leader embraces the first follower as an equal."
	, "The first follower is actually a leader."
	, "It takes guts to stand out as the first follower."
	, "The first follower is what transforms a lone nut into a leader."
	, "With a second follower, it isn't two nuts."
	, "Three is a crowd and a crowd is news."
	, "A movement must be public."
	, "It is important to show not just the leader, because new followers emulate the followers , not the leader."
	, "With five more followers, we have momentum and a tipping point."
	, "We have a movement."
	, "As more people join in, it's less risky."
	, "Those sitting on the fence now have no reason not to join in."
	, "Now, followers don't stand out."
	, "Now, followers aren't ridiculed."
	, "Now, they are part of the in-crowd, if they hurry."
	, "Now those that prefer to stick with the crowd join in, because they are ridiculed for not joining in."
	, "If you care about starting a movement, you should have the courage to follow."
	, "If you care about starting a movement, you should have the courage to show others how to follow."
	, "The shirtless guy gets all the credit, but the first follower transforms the lone nut into a leader."
	, "When you find a lone nut doing something great, you should have the courage to stand up and join in."


  ]

-- vim: set ts=2 sts=2 sw=2 noet:
