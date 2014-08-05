module Main where

import Dickson
import LogicalForm
import Evaluation

--import Model
import WordsCharacters

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
  let ps = parses gr l
  let ls = linear transform gr ps
  putStrLn ("Parsed: " ++ (show ps) )
  putStrLn ("Answer: " ++ (foldl takeAnswer "No answer" ls) )
  let courses = map (label . fg) ps
  putStrLn ("Course: " ++ foldl takeCourse "Unparseable" courses )

unknown :: String -> String
unknown str = unwords ( filter (\x -> not (elem x wordlist)) (words str) )

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

-- vim: set ts=2 sts=2 sw=2 noet:
