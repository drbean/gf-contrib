module Story_Interpretation where 

import Model
import Dickson

import Data.Tuple

entuples :: [(Entity,GPN)]
entuples = [(A,Guncle_alf), (D,Gdee), (O,Gmonday)]

gent2ent :: GPN -> Entity
gent2ent gent	| Just ent <- lookup gent (map swap entuples) = ent
							| otherwise = error ("No entity for " ++ (show gent) )

ent2gent :: Entity -> GPN
ent2gent ent	| Just gent <- lookup ent entuples = gent
							| otherwise = error ("No GEntity for " ++ (show ent) )

instance Eq GPN where
	(==) Gdee Gdee = True
	(==) Guncle_alf Guncle_alf = True
	(==) Gmonday Gmonday = True
	(==) _ _ = False

objects = [
	( "apprentice",	predid1 "apprentice" )
	, ( "child",	predid1 "child" )
	, ( "dad",	predid1 "dad" )
	, ( "electrician",	predid1 "electrician" )
	, ( "end",	predid1 "end" )
	, ( "family",	predid1 "family" )
	, ( "graduation",	predid1 "graduation" )
	, ( "guy",	predid1 "guy" )
	, ( "job",	predid1 "job" )
	, ( "kind",	predid1 "kind" )
	, ( "life",	predid1 "life" )
	, ( "man_CN",	predid1 "man" )
	, ( "night",	predid1 "night" )
	, ( "position",	predid1 "position" )
	, ( "school",	predid1 "school" )
	, ( "ship",	predid1 "ship" )
	, ( "shipyard",	predid1 "shipyard" )
	, ( "superintendent",	predid1 "superintendent" )
	, ( "supervisor",	predid1 "supervisor" )
	, ( "thing",	predid1 "thing" )
	, ( "top",	predid1 "top" )
	, ( "transformer",	predid1 "transformer" )
	, ( "uncle",	predid1 "uncle" )
	, ( "way",	predid1 "way" )
	, ( "week",	predid1 "week" )
	, ( "word",	predid1 "word" )

	, ( "woman",	predid1 "woman" )
	, ( "man",	predid1 "man" )
	, ( "husband",	predid1 "husband" )
	, ( "father",	predid1 "father" )
	, ( "construction",	predid1 "construction" )
	, ( "electrician",	predid1 "electrician" )
	, ( "interviewer",	predid1 "interviewer" )
	, ( "shipyard",	predid1 "shipyard" )
	, ( "disappointment",	predid1 "disappointment" )
	, ( "money",	predid1 "money" )
	, ( "upbringing",	predid1 "upbringing" )
	, ( "story",	predid1 "story" )
	]

inflections = [
	( "father_2",	"father")
	, ( "superintendent_title",	"superintendent")
	, ( "supervisor_title",	"supervisor")
	, ("say:is_little", "say:is_too_little")
	, ("think:is_little", "say:is_too_little")
	, ("know_VS:is", "think:is")
	]

relations = [
	( "eighty_pound",	predid1 "80-pound" )
	, ( "at_the_shipyard",	predid1 "at_the_shipyard" )
	, ( "at_the_shipyard_to_work_V",	predid1 "at_the_shipyard_to_work" )
	, ( "bad",	predid1 "bad" )
	, ( "better",	predid1 "better" )
	, ( "first",	predid1 "first" )
	, ( "hard",	predid1 "hard" )
	, ( "little",	predid1 "little" )
	, ( "mad",	predid1 "mad" )
	, ( "same",	predid1 "same" )

	, ( "work_V",	predid1 "work" )
	, ( "laugh",	predid1 "laugh" )
	, ( "know",	predid1 "know" )
	, ( "look_bad",	predid1 "look_bad" )
	, ( "slow_down",	predid1 "slow_down" )
	, ( "need_VV_to_slow_down",	predid1 "need_to_slow_down" )

	--, ( "become",	\[x,y]	-> predid2 "become" y x	)
	--, ( "can_to_lift",	\[x,y]	-> predid2 "can_to_lift" y x	)
	--, ( "have_V2",	\[x,y]	-> predid2 "have" y x	)
	--, ( "do_V2",	\[x,y]	-> predid2 "do" y x	)
	--, ( "go_to_prep",	\[x,y]	-> predid2 "go_to" y x	)
	--, ( "hire",	\[x,y]	-> predid2 "hire" y x	)
	--, ( "interview",	\[x,y]	-> predid2 "interview" y x	)
	--, ( "like",	\[x,y]	-> predid2 "like" y x	)
	--, ( "make_V2V_look_bad",	\[x,y]	-> predid2 "make_look_bad" y x	)
	--, ( "need_V2",	\[x,y]	-> predid2 "need" y x	)
	--, ( "say:is_at_the_shipyard_to_work_V",	\[x,y]	-> predid2 "say:is_at_the_shipyard_to_work" y x	)
	--, ( "say:need_VV_to_slow_down",	\[x,y]	-> predid2 "say:need_to_slow_down" y x	)
	--, ( "say:is_too_little",	\[x,y]	-> predid2 "say:is_too_little"	y x )
	--, ( "tell_to_to_slow_down",	\[x,y]	-> predid2 "tell_to_to_slow_down" y x	)
	--, ( "want_to_work_with",	\[x,y]	-> predid2 "want_to_work_with" y x	)
	--, ( "work_with",	\[x,y]	-> predid2 "work_with" y x	)

	--, ( "find_to_do_V2",	\[x,y,z]	-> predid3 "find_to_do" z y x	)
	--, ( "have_VV_to_do_V2_different",	\[x,y,z]	-> predid3 "have_to_do_different" z y x	)
	--, ( "have_VV_to_go_to_prep",	\args -> case args of
	--		[x,y,z]	-> predid3 "have_to_go_to" z y x
	--		[x,y]	-> (forgetful3 . predid3) "have_to_go_to" y x )
	--, ( "think:need_VV_to_have_V2",	\[x,y,z]	-> predid3 "think:need_to_have" z y x	)
	--, ( "say:have_V2",	\[x,y,z]	-> predid3 "say:have" z y x	)
	--, ( "say:need_V2",	\[x,y,z]	-> predid3 "say:need" z y x )
	--, ( "say:is",	\[x,y,z]	-> predid3 "say:is" z y x	)
	--, ( "say:can_not_to_get_along", \[x,y,z] -> predid3  "say:can_not_to_get_along" z y x )
	--, ( "think:is",	\[x,y,z]	-> predid3 "think:is" z y x	)


	--, ( "say:take_away",	\[x,y,z,w]	-> predid4 "say:take_away" w z y x	)
	---- , ( "say:can_get_V3",	\[x,y,z,w]	-> predid4 "say:can_get" w z y x	)
	]


-- vim: set ts=2 sts=2 sw=2 noet:
