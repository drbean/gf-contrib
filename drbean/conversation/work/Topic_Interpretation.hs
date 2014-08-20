module Topic_Interpretation where 

import Data.List

import Model
import Story_Interpretation

objects, relations :: [( String, [Entity] -> Bool)]
objects = [
	( "worker",	\[x] -> unmay1 (predid1 "worker") x	),
	( "daughter",	\[x] -> unmay1 (predid1 "daughter") x	),
	( "dad",	\[x] -> unmay1 (predid1 "father") x	),
	( "mother",	\[x] -> unmay1 (predid1 "isMother") x	)
 ]

inflections :: [(String, String)]
inflections = [
 ]

relations = [
	( "disappoint",	\[x] -> unmay1 (predid1 "disappoint") x	)
        --, ( "work", \args -> case args of
        --        [x,y,z] -> (predid3 "work")
        --        [x,y] -> (forgetful3 . predid3) "work" y x
	--	[x] -> (forgetful2 . forgetful3 . predid3) "work" x )

 
 ]

-- vim: set ts=8 sts=4 sw=4 noet:
