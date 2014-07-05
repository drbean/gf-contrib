module Main where

import PGF
import Dickson
import LogicalForm
import Evaluation

--import Model
import WordsCharacters

import Data.List
import Data.Char
import GHC.IO.Handle
import System.IO

import System.Environment.FindBin

main :: IO () 
main = do
  path <- getProgPath
  gr <- readPGF ( path ++ "/Dickson.pgf" )
  hClose stderr
  hDuplicateTo stdout stderr
  s <- getLine
  let l = (chomp . lc_first) s
  putStrLn ("Unknown_words: " ++ (unknown l) )
  let ps = parses l gr
  let ls = linear transform gr ps
  putStrLn ("Parsed: " ++ (show ps) )
  putStrLn ("Answer: " ++ (foldl takeAnswer "No answer" ls) )
  let courses = map (label . fg) ps
  putStrLn ("Course: " ++ foldl takeCourse "Unparseable" courses )

unknown :: String -> String
unknown str = unwords ( filter (\x -> not (elem x wordlist)) (words str) )

parses :: String -> PGF -> [Tree]
parses s gr = concat ( parseAll gr (startCat gr) s )

transform :: Tree -> Tree
transform = gf . answer . fg

answer :: GUtt -> GUtt
-- answer (GUt (GPosQ (GWH_Cop Gwho_WH np)))	= (GUt (GNegQ (GTagQ np (GHappening Glaugh))))
-- answer (GUt (GPosQ (GWH_Pred Gwho_WH (GChanging v np)))) = (GUt (GNegQ (GTagQ np (GHappening Glaugh))))
-- answer (GUt (GPosQ (GWH_Pred Gwho_WH (GHappening vp)))) = Gdee
-- answer (GUt (GPosQ (GYN (GCop np1 np2))))  = np1
answer utt	| (eval . transS) utt == Boolean True = GYes
		| (eval . transS) utt == Boolean False = GNo
		| (eval . transS) utt == NoAnswer = GNoAnswer

linear :: (Tree -> Tree) -> PGF -> [Tree] -> [ String ]
linear tr gr ps = concat $ map ((linearizeAll gr) . tr) ps

lc_first :: String -> String
lc_first str@(s:ss) = case ( or $ map (flip isPrefixOf str) ["Dee", "Alf", "Monday"] ) of
	True  -> (s:ss)
	False -> ((toLower s):ss)

chomp :: String -> String
chomp []                      = []
-- chomp ('\'':'s':xs)           = " 's" ++ chomp xs
-- chomp ('s':'\'':xs)           = "s 's" ++ chomp xs
chomp (x:xs) | x `elem` ".,?" = chomp xs
            | otherwise      =     x:chomp xs

label :: GUtt -> String
-- label (GUt (GPosQ (GWH_Cop _ _)))	= "WH"
label (GQUt (GPosQ (GWH_NP _ _)))	= "WH"
label (GQUt (GNegQ (GWH_NP _ _)))	= "WH"
label (GQUt (GPosQ (GWH_AP _ _)))	= "WH"
label (GQUt (GNegQ (GWH_AP _ _)))	= "WH"
label (GQUt (GPosQ (GWH_Pred _ _)))	= "WH"
label (GQUt (GNegQ (GWH_Pred _ _)))	= "WH"
label (GQUt (GPosQ (GYN _)))	= "YN"
label (GQUt (GNegQ (GYN _)))	= "YN"
label (GQUt (GPosQ (GTagQ _ _)))	= "Tag"
label (GQUt (GNegQ (GTagQ _ _)))	= "Tag"
label (GQUt (GPosQ (GTagComp _ _)))	= "Tag"
label (GQUt (GNegQ (GTagComp _ _)))	= "Tag"
label _				= "Unparseable"

takeCourse :: String -> String -> String
takeCourse _ "WH" = "WH"
takeCourse "WH" _ = "WH"
takeCourse _ "YN" = "YN"
takeCourse "YN" _ = "YN"
takeCourse _ "Tag"  = "Tag"
takeCourse "Tag" _  = "Tag"
takeCourse _ "S"  = "S"
takeCourse "S" _  = "S"
takeCourse "Unparseable" _  = "Unparseable"
takeCourse _  _   = error "undefined course, not WH, YN, S, or Unparseable"

takeAnswer :: String -> String -> String
takeAnswer _ "yes" = "yes"
takeAnswer "yes" _ = "yes"
takeAnswer "no" _  = "no"
takeAnswer _ "no" = "no"
takeAnswer "No answer" _ = "No answer"
takeAnswer _ "No answer" = "No answer"
takeAnswer _  _   = error "undefined answer, not Yes, No, or No answer"

