module Interpretation (module Interpretation, module Topic, module Story_Interpretation) where 

import Data.List
import Data.Maybe
import Control.Monad

import Model
import qualified Topic_Interpretation as Topic
import Story_Interpretation

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
int r ents = error ( "'" ++ r ++ "'" ++ " has no interpretation with entities " ++ (show ents) )

common_objects, common_relations :: [( String, [Entity] -> Bool)]
common_objects = [
	( "person",	\[x] -> person x )
	, ( "thing",	\[x] -> thing x )
	, ( "man", \[x] -> 	unmay1 (predid1 "male") x )
	, ( "woman",	\[x] -> unmay1 (predid1 "female") x )
 ]

common_inflections :: [(String, String)]
common_inflections = [
 ( "men",	"man" ),
 ( "women",	"woman" ),
 ( "persons",	"person" ),
 ( "people",	"person" ),
 ( "things",	"thing" ),
 ( "have",	"had" ),
 ( "ask",	"asked" ),
 ( "say",	"said" ),
 ( "leave",	"left" ),
 ( "give",	"gave" ),
 ( "get",	"got" ),
 ( "take",	"got" ),
 ( "took",	"got" ),
 ( "bought", "got" ),
 --( "worked",   "work" ),
 ( "want", "wanted" ),
 
 ( "accepted", "got" ),
 ( "buy",	"bought" ),
 ( "accept",	"accepted" ),
 ( "tell",	"told" ),
 ( "study",    "studied" ),
 ( "go",	"went" ),
 ( "come",	"came" )
 ]

common_relations = [

 ( "true", \[x] -> unmay1 (predid1 "true") x )
 , ( "had", \[x,y] -> unmay2 (predid2 "have") y x )
 , ( "gave",	\ [x,y,z] ->	unmay3 (predid3 "gave") z y x )
 --( "work", \args -> case args of
 --       [x] -> worker x
 --       [x,y] -> predid2 "work_where" y x || predid2 "work_as" y x ),
-- ( "wanted", \args -> case args of 
--	[x,y,z,w] -> wanted w z y x
--	[x,y,z] -> forgetful4 wanted z y x
--	[x,y]	-> (forgetful3 . forgetful4 ) wanted y x ),
 --, ( "got", \args -> case args of
 --	[x,y,z] -> predid3 "got" z y x
 --	[x,y] -> forgetful3 (predid3 "got") y x )
 ]

-- vim: set ts=2 sts=2 sw=2 noet:
