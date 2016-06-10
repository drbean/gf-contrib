module Tests where

import Control.Monad
import Data.Maybe
import Data.Char

import Data.DRS

import PGF
import Happier
import Representation
import Evaluation
import Model

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

gr :: IO PGF
gr = readPGF "./Happier.pgf"

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
		putStrLn (unwords (map showCId ws))

trans = id

run f tests = do
  gr	<- readPGF "./Happier.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map f ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ts)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

ans tests = do
  gr	<- readPGF "./Happier.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

reps tests = do
  gr	<- readPGF "./Happier.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF "./Happier.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF "./Happier.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

	"Happiness is improved in many different ways."
	, "Social ties with family, friends and other social networks are very important for happiness."
	, "People with more money are happier, but people who are very rich are not happier."
	, "Physical exercise, meditation and engagement with life also improve happiness."
	, "One framework for thinking about well-being emphasizes positive emotion , engagement with work , school and community , relationships with people , meaning in life and achievement of goals."
	, "Positive emotion can only be assessed subjectively."
	, "Engagement can only be measured through subjective means."
	, "Engagement is the presence of a flow state."
	, "A flow state is a state of mind where you forget about self and concentrate on just one thing."
	, "Relationships means the presence of friends , family , intimacy or social connection."
	, "Meaning is belonging to and serving something bigger than one's self."
	, "Achievement is accomplishment of goals that are pursued even when they bring no positive emotion, have no meaning, and achieve nothing in the way of positive relationships."
	, "You can ask questions about positive emotion."
	, "You feel happy."
	, "You are happy now."
	, "You are happy with your life as a whole."
	, "You can ask questions about engagement"
	, "You are involved with something."
	, "You participate in something."
	, "You are active in your daily life at school  or work or play)."
	, "You can ask questions about relationships"
	, "Your feelings about your friends , family or people you know"
	, "You have lots of friends."
	, "You can ask questions about the meaning of life."
	, "You believe in a religion , philosophy or ideology."
	, "You seek to serve your country , community or social group."
	, "You can ask questions about achievements"
	, "You feel a sense of achievement often , sometimes or never."
	, "Something that gives you a sense of achievement"


  ]

-- vim: set ts=2 sts=2 sw=2 noet:
