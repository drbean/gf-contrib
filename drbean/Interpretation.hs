module Interpretation where 

import Data.List

import Model
-- import Story_Interpretation

-- type Interp a	= String -> [a] -> Bool
-- 
-- inttuples = objects ++ relations ++ Story.objects ++ Story.relations
-- 			    ++ Topic.objects ++ Topic.relations
-- infltuples = inflections ++ Topic.inflections ++ Story.inflections
-- 
-- int :: Interp Entity
-- 
-- int word = int' word inttuples infltuples where
-- 	int' w [] []	= error $ "'" ++ w ++ "'" ++ " has no interpretation"
-- 	int' w [] ((infl,word):infls) | w == infl	=  int' word inttuples []
-- 	int' w [] (i:is)	= int' w [] is
-- 	int' w ((word,interpretation):is) infls | w == word	= interpretation
-- 	int' w (i:is) infls	= int' w is infls

objects, relations :: [( String, [Entity] -> Bool)]
objects = [
	( "person",	\ [x] -> person x	)
	, ( "thing",	\ [x] -> thing x	)
	, ( "man",	\ [x] -> predid1 "male" x	)
	, ( "woman",	\ [x] -> predid1 "female" x	)
 ]

inflections :: [(String, String)]
inflections = [
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

relations = [

 ( "true", \[x] -> predid1 "true" x )
 , ( "had", \[x,y] -> predid2 "have" y x )
 , ( "gave",	\ [x,y,z] ->	predid3 "gave" z y x )
 --( "work", \args -> case args of
 --       [x] -> worker x
 --       [x,y] -> predid2 "work_where" y x || predid2 "work_as" y x ),
-- ( "wanted", \args -> case args of 
--	[x,y,z,w] -> wanted w z y x
--	[x,y,z] -> forgetful4 wanted z y x
--	[x,y]	-> (forgetful3 . forgetful4 ) wanted y x ),
 , ( "got", \args -> case args of
 	[x,y,z] -> predid3 "got" z y x
 	[x,y] -> forgetful3 (predid3 "got") y x )
 ]

-- vim: set ts=8 sts=4 sw=4 noet:
