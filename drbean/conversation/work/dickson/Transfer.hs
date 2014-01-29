module Main where

import PGF
import Dickson
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

answer :: GUtt -> GNP
answer (GUt (GWH (GWH_Cop Gwho_WH np)))	= np
answer (GUt (GWH (GWH_Pred Gwho_WH (GChanging v np)))) = np
answer (GUt (GYN (GCop np1 np2)))  = np1

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
