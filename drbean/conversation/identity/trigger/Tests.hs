module Tests where

import Control.Monad
import Data.Maybe
import Data.Char
import Data.List
import qualified Data.Map as Map

import Data.DRS

import PGF2
import Trigger
import Utility
import Model

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

gr :: IO PGF
gr = readPGF "./Trigger.pgf"

cat2funs :: String -> IO ()
cat2funs cat = do
  gr' <- gr
  let fs = functionsByCat gr' (show cat)
  let ws = filter (isLower . head . show) fs
  let is = map (reverse . dropWhile (\x ->  (==) x '_' || isUpper x) . reverse .show ) ws
  putStrLn (unwords is)

catByPOS :: String -> IO ()
catByPOS  pos = do
  gr' <- gr
  let allCats = categories gr'
  let cats = filter (isPrefixOf pos . show) allCats
  putStrLn (unwords (map show cats))

trans = id

run f tests = do
  gr' <- gr
  let Just eng = Map.lookup "TriggerEng" (languages gr')
  let ss = map (chomp . lc_first) tests
  let p =  parse eng (startCat gr')
  let Just incompleteparse = readExpr "ParseIncomplete"
  let Just noaccountfail = readExpr "ParseFailed somewhere"
  let failingparse n string = fromMaybe noaccountfail (readExpr ("ParseFailed at " ++ (show n) ++ " " ++ string))
  let t p = case p of
        ParseOk ((e,prob):rest) -> e
        (ParseFailed offset token) -> failingparse offset token
        ParseIncomplete -> incompleteparse
  let ts = map (t . p) ss
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

{-

ans tests = do
  gr  <- readPGF "./Trigger.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

reps tests = do
  gr  <- readPGF "./Trigger.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
  gr  <- readPGF "./Trigger.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
  gr  <- readPGF "./Trigger.pgf"
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

-}

dic_test = [

  "A turning point for Sally was when she learned Spanish."
  , "She was envious of kids who could speak another language."
  , "When she learned Spanish, she found she was actually pretty good at it."
  , "When she reached the breakthrough stage--when she discovered she could actually communicate with people in the language--she was really proud of herself."
  , "Now she can speak three languages."
  , "Henry has a twin brother and they have always been very close."
  , "When he was 18, they went to different colleges."
  , "That was the first time they had had to cope on their own."
  , "Henry thinks it was good in a way, because they both became more confident and independent."
  , "He realized he was actually capable of working things out on his own."
  , "Debbie guesses she was always pretty shy."
  , "She didn't share a lot with people, not even with her parents."
  , "When she got a prize for being top student, she didn't think too much about it."
  , "But people suddenly started treating her differently."
  , "She thinks some of the kids in school started looking up to her."
  , "And she became a lot more outgoing after that."
  , "Alex stopped exercising."
  , "He thinks it's the dumbest thing he ever did."
  , "He has been trying to lose weight for the last year and a half, but it's really difficult."
  , "He thought he would be thin forever and he ate junk food all the time."
  , "But after college, he quit playing sports."
  , "Now he is determined to join a gym, because he knows he can't get healthy by just dieting."
  , "If YiYun had had a choice, she would have learned to play the guitar."
  , "When she was a kid, her parents made her study piano."
  , "She loves the piano, but wishes she could bring a guitar to a party and have everyone sing songs."
  , "Jacob regrets not going to Europe with his friends when he had the choice."
  , "In the summer after he graduated, he started looking for a job, but his friends went backpacking in Europe for a few weeks."
  , "He thinks he should have gone because he didn't get a job right away and his friends had an unforgettable time together."
  , "He regrets it because they had an amazing experience without him and he could have gone."

  ]

-- vim: set ts=2 sts=2 sw=2 noet:
