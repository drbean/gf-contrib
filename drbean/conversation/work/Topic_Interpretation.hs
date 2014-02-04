module Topic_Interpretation where 

import Data.List

import Model
-- import Story_Interpretation

objects, relations :: [( String, [Entity] -> Bool)]
objects = [
	( "worker",	\ [x] -> worker x	),
	( "administrative_assistant",	\ [x] -> secretary x	),
	( "daughter",	\ [x] -> daughter x	),
	( "mother",	\ [x] -> isMother x	)
 ]

inflections :: [(String, String)]
inflections = [
 ]

relations = [
	( "disappointed",	\[x]	-> disappointed x	)
 
 ]

-- vim: set ts=8 sts=4 sw=4 noet:
