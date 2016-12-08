module Tests where

import Control.Monad
import Data.Maybe
import Data.Char
import Data.List

import Data.DRS

import PGF
import Marketing
import Representation
import Evaluation
import Model

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

gr :: IO PGF
gr = readPGF "./Marketing.pgf"

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
  gr	<- readPGF "./Marketing.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map f ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ts)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

ans tests = do
  gr	<- readPGF "./Marketing.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

reps tests = do
  gr	<- readPGF "./Marketing.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF "./Marketing.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF "./Marketing.pgf"
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

	"Companies can give employees and customers more control, or less control."
	, "Companies can collaborate with employees and customers on the creation of ideas, designs and products."
	, "Radiohead gives customers control over pricing of an album."
	, "The chocolate company Anthon Berg asks customers to purchase chocolate with the promise of good deeds towards loved ones."
	, "Outdoor clothing company Patagonia asks consumers not to buy a jacket during the peak of the shopping season."
	, "Patagonia builds long-term loyalty based on shared values."
	, "The Brazilian company Semco Group lets employees set their own work schedules and even their salaries."
	, "Travel service Nextpedition does not tell the traveler the destination until the last moment."
	, "Dutch airline KLM launches a surprise campaign, randomly handing out small gifts to travellers en route to their destination."
	, "A recent study suggests that having employees complete occasional altruistic tasks throughout the day increases their sense of overall productivity."
	, "Design company frog holds internal speed-meet sessions that connect old and new employees, helping them get to know each other fast."

  ]

-- vim: set ts=2 sts=2 sw=2 noet:
