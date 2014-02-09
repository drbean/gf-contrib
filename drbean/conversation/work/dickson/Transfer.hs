module Main where

import PGF
import Dickson
import LogicalForm
import Evaluation

--import Model
import WordsCharacters

import Data.List
import Data.Char

import System.Environment.FindBin

main :: IO () 
main = do
  path <- getProgPath
  gr <- readPGF ( path ++ "/Dickson.pgf" )
  s <- getLine
  let l = (chomp . lc_first) s
  putStrLn ("Unknown_words: " ++ (unknown l) )
  let ls = linear transform gr (parses l gr)
  putStrLn ("Parsed: " ++ (concat ls) )

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
answer utt	| (eval . transS) utt == True = GYes
		| (eval . transS) utt == False = GNo

adjectives :: [GAP]
adjectives = [ minBound .. maxBound ]

linear :: (Tree -> Tree) -> PGF -> [Tree] -> [ String ]
linear tr gr ps = concat $ map ((linearizeAll gr) . tr) ps

lc_first :: String -> String
lc_first str@(s:ss) = case ( or $ map (flip isPrefixOf str) ["Alf", "Dee"] ) of
	True  -> (s:ss)
	False -> ((toLower s):ss)

chomp :: String -> String
chomp str = let rev@(c:cs) = reverse str
		in case (c:cs) of
			'.':_ -> reverse cs
			'?':_ -> reverse cs
			otherwise -> reverse rev
