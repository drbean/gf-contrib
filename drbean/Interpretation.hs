module Interpretation  where 

import Data.List
import Data.Maybe
import Control.Monad

import Model

data Answer = Boolean Bool | Yes | No | NoAnswer
	deriving (Eq)
instance Show Answer where
	show (Boolean bool)	= show bool
	show Yes	= "Yes"
	show No	= "No"
	show NoAnswer	= "NoAnswer"

type Interp a	= String -> [a] -> Maybe Answer

int :: Interp Entity
int r [int] = predid1 r >>= (\f -> Just (Boolean (f int) ))
int r [i1,i2] = predid2 r >>= (\f -> Just (Boolean (f i1 i2)))
int r [i1,i2,i3] = predid3 r >>= (\f -> Just (Boolean (f i1 i2 i3)))
int r [i1,i2,i3,i4] = predid4 r >>= (\f -> Just (Boolean (f i1 i2 i3 i4)))
int r ents = error ( "'" ++ r ++ "'" ++ " has no interpretation with entities " ++ (show ents) )

-- vim: set ts=2 sts=2 sw=2 noet:
