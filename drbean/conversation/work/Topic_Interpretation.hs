module Topic_Interpretation where 

import Data.List

import Model
-- import Story_Interpretation

objects, relations :: [( String, [Entity] -> Bool)]
objects = [
	( "worker",	\ [x] -> predid1 "worker" x	),
	( "daughter",	\ [x] -> predid1 "daughter" x	),
	( "mother",	\ [x] -> predid1 "isMother" x	)
 ]

inflections :: [(String, String)]
inflections = [
 ]

relations = [
	( "disappointed",	\[x]	-> predid1 "disappointed" x	)
 
 ]

-- vim: set ts=8 sts=4 sw=4 noet:
