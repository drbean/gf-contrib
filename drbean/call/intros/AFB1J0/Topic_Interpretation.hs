module Topic_Interpretation where 

import Data.List

import Model
-- import Story_Interpretation

objects, relations :: [( String, [Entity] -> Bool)]
objects = [
	( "worker",	\ [x] -> predid1 "worker" x	),
	( "daughter",	\ [x] -> predid1 "daughter" x	),
	( "dad",	\ [x] -> predid1 "father" x	),
	( "mother",	\ [x] -> predid1 "isMother" x	)
 ]

inflections :: [(String, String)]
inflections = [
 ]

relations = [
	( "disappoint",	\[x]	-> predid1 "disappoint" x	)
        , ( "work", \args -> case args of
                [x,y,z] -> predid3 "work" z y x
                [x,y] -> (forgetful3 . predid3) "work" y x
		[x] -> (forgetful2 . forgetful3 . predid3) "work" x )

 
 ]

-- vim: set ts=8 sts=4 sw=4 noet:
