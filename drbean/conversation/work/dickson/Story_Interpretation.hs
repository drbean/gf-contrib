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
	( "apprentice",	\[x]	-> predid1 "apprentice" x	)
	, ( "child",	\[x]	-> predid1 "child" x	)
	, ( "dad",	\[x]	-> predid1 "dad" x	)
	, ( "electrician",	\[x]	-> predid1 "electrician" x	)
	, ( "end",	\[x]	-> predid1 "end" x	)
	, ( "family",	\[x]	-> predid1 "family" x	)
	, ( "graduation",	\[x]	-> predid1 "graduation" x	)
	, ( "guy",	\[x]	-> predid1 "guy" x	)
	, ( "job",	\[x]	-> predid1 "job" x	)
	, ( "kind",	\[x]	-> predid1 "kind" x	)
	, ( "life",	\[x]	-> predid1 "life" x	)
	, ( "man_CN",	\[x]	-> predid1 "man" x	)
	, ( "night",	\[x]	-> predid1 "night" x	)
	, ( "position",	\[x]	-> predid1 "position" x	)
	, ( "school",	\[x]	-> predid1 "school" x	)
	, ( "ship",	\[x]	-> predid1 "ship" x	)
	, ( "shipyard",	\[x]	-> predid1 "shipyard" x	)
	, ( "superintendent",	\[x] -> predid1 "superintendent" x	)
	, ( "supervisor",	\[x] -> predid1 "supervisor" x	)
	, ( "thing",	\[x]	-> predid1 "thing" x	)
	, ( "top",	\[x]	-> predid1 "top" x	)
	, ( "transformer",	\[x]	-> predid1 "transformer" x	)
	, ( "uncle",	\[x]	-> predid1 "uncle" x	)
	, ( "way",	\[x]	-> predid1 "way" x	)
	, ( "week",	\[x]	-> predid1 "week" x	)
	, ( "word",	\[x]	-> predid1 "word" x	)

	, ( "woman",	\[x]	-> predid1 "woman" x	)
	, ( "man",	\[x]	-> predid1 "man" x	)
	, ( "husband",	\[x] -> predid1 "husband" x	)
	, ( "father",	\[x]	-> predid1 "father" x	)
	, ( "construction",	\[x] -> predid1 "construction" x	)
	, ( "electrician",	\[x] -> predid1 "electrician" x	)
	, ( "interviewer",	\[x] -> predid1 "interviewer" x	)
	, ( "shipyard",	\[x] -> predid1 "shipyard" x	)
	, ( "disappointment",	\[x] -> predid1 "disappointment" x	)
	, ( "money",	\[x] -> predid1 "money" x	)
	, ( "upbringing",	\[x] -> predid1 "upbringing" x	)
	, ( "story",	\[x] -> predid1 "story" x	)
	]

inflections = [
	( "father_2",	"father")
	, ( "superintendent_title",	"superintendent")
	, ( "supervisor_title",	"supervisor")
	, ("say:is_little", "say:is_too_little")
	, ("know_VS:is", "think:is")
	]

relations = [
	( "80-pound",	\[x]	-> predid1 "80-pound" x	)
	, ( "at_the_shipyard",	\[x]	-> predid1 "at_the_shipyard" x	)
	, ( "at_the_shipyard_to_work_V",	\[x]	-> predid1 "at_the_shipyard_to_work" x	)
	, ( "bad",	\[x]	-> predid1 "bad" x	)
	, ( "better",	\[x]	-> predid1 "better" x	)
	, ( "first",	\[x]	-> predid1 "first" x	)
	, ( "hard",	\[x]	-> predid1 "hard" x	)
	, ( "little",	\[x]	-> predid1 "little" x	)
	, ( "mad",	\[x]	-> predid1 "mad" x	)
	, ( "same",	\[x]	-> predid1 "same" x	)

	, ( "work_V",	\[x]	-> predid1 "work" x	)
	, ( "laugh",	\[x] -> predid1 "laugh" x	)
	, ( "know",	\[x]	-> predid1 "know" x	)
	, ( "look_bad",	\[x]	-> predid1 "look_bad" x	)
	, ( "slow_down",	\[x]	-> predid1 "slow_down" x	)
	, ( "need_VV_to_slow_down",	\[x]	-> predid1 "need_to_slow_down" x	)

	, ( "become",	\[x,y]	-> predid2 "become" y x	)
	, ( "can_to_lift",	\[x,y]	-> predid2 "can_to_lift" y x	)
	, ( "have_V2",	\[x,y]	-> predid2 "have" y x	)
	, ( "do",	\[x,y]	-> predid2 "do" y x	)
	, ( "go_to_prep",	\[x,y]	-> predid2 "go_to" y x	)
	, ( "hire",	\[x,y]	-> predid2 "hire" y x	)
	, ( "interview",	\[x,y]	-> predid2 "interview" y x	)
	, ( "like",	\[x,y]	-> predid2 "like" y x	)
	, ( "make_V2V_look_bad",	\[x,y]	-> predid2 "make_look_bad" y x	)
	, ( "need_V2",	\[x,y]	-> predid2 "need" y x	)
	, ( "say:is_at_the_shipyard_to_work_V",	\[x,y]	-> predid2 "say:is_at_the_shipyard_to_work" y x	)
	, ( "say:need_VV_to_slow_down",	\[x,y]	-> predid2 "say:need_to_slow_down" y x	)
	, ( "say:is_too_little",	\[x,y]	-> predid2 "say:is_too_little"	y x )
	, ( "tell_to_to_slow_down",	\[x,y]	-> predid2 "tell_to_to_slow_down" y x	)
	, ( "want_to_work_with",	\[x,y]	-> predid2 "want_to_work_with" y x	)
	, ( "work_with",	\[x,y]	-> predid2 "work_with" y x	)
	, ( "think:is_little",	\[x,y]	-> predid2 "think:is_little" y x	)

	, ( "find_to_do",	\[x,y,z]	-> predid3 "find_to_do" z y x	)
	, ( "have_VV_to_do_V2_different",	\[x,y,z]	-> predid3 "have_to_do_different" z y x	)
	, ( "have_VV_to_go_to_prep",	\args -> case args of
			[x,y,z]	-> predid3 "have_to_go_to" z y x
			[x,y]	-> (forgetful3 . predid3) "have_to_go_to" y x )
	, ( "think:need_to_have",	\[x,y,z]	-> predid3 "think:need_to_have" z y x	)
	, ( "say:have_V2",	\[x,y,z]	-> predid3 "say:have" z y x	)
	, ( "say:need_V2",	\[x,y,z]	-> predid3 "say:need" z y x )
	, ( "say:is",	\[x,y,z]	-> predid3 "say:is" z y x	)
	, ( "think:is",	\[x,y,z]	-> predid3 "think:is" z y x	)


	, ( "say:take_away",	\[x,y,z,w]	-> predid4 "say:take_away" w z y x	)
	]


-- vim: set ts=2 sts=2 sw=2 noet:
