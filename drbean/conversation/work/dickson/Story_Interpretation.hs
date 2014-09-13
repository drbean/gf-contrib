module Story_Interpretation where 

import Model
import Dickson

import Data.Tuple
import Data.Maybe
import Control.Monad

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

unmay1 :: Maybe (Entity -> Bool) -> Entity -> Bool
unmay1 = fromMaybe (\_ -> False)

unmay2 :: Maybe (Entity -> Entity -> Bool) -> Entity -> Entity -> Bool
unmay2 = fromMaybe (\_ _ -> False)

unmay3 :: Maybe (Entity -> Entity -> Entity -> Bool) -> Entity -> Entity -> Entity -> Bool
unmay3 = fromMaybe (\_ _ _ -> False)

unmay4 :: Maybe (Entity -> Entity -> Entity -> Entity -> Bool) -> Entity -> Entity -> Entity -> Entity -> Bool
unmay4 = fromMaybe (\_ _ _ _ -> False)

objects = [
	( "apprentice",	\[x]	-> unmay1 (predid1 "apprentice") x	)
	, ( "child",	\[x]	-> unmay1 (predid1 "child") x	)
	, ( "dad",	\[x]	-> unmay1 (predid1 "dad") x	)
	, ( "electrician",	\[x]	-> unmay1 (predid1 "electrician") x	)
	, ( "end",	\[x]	-> unmay1 (predid1 "end") x	)
	, ( "family",	\[x]	-> unmay1 (predid1 "family") x	)
	, ( "graduation",	\[x]	-> unmay1 (predid1 "graduation") x	)
	, ( "guy",	\[x]	-> unmay1 (predid1 "guy") x	)
	, ( "job",	\[x]	-> unmay1 (predid1 "job") x	)
	, ( "kind",	\[x]	-> unmay1 (predid1 "kind") x	)
	, ( "life",	\[x]	-> unmay1 (predid1 "life") x	)
	, ( "man_CN",	\[x]	-> unmay1 (predid1 "man") x	)
	, ( "night",	\[x]	-> unmay1 (predid1 "night") x	)
	, ( "position",	\[x]	-> unmay1 (predid1 "position") x	)
	, ( "school",	\[x]	-> unmay1 (predid1 "school") x	)
	, ( "ship",	\[x]	-> unmay1 (predid1 "ship") x	)
	, ( "shipyard",	\[x]	-> unmay1 (predid1 "shipyard") x	)
	, ( "superintendent",	\[x] -> unmay1 (predid1 "superintendent") x	)
	, ( "supervisor",	\[x] -> unmay1 (predid1 "supervisor") x	)
	, ( "thing",	\[x]	-> unmay1 (predid1 "thing") x	)
	, ( "top",	\[x]	-> unmay1 (predid1 "top") x	)
	, ( "transformer",	\[x]	-> unmay1 (predid1 "transformer") x	)
	, ( "uncle",	\[x]	-> unmay1 (predid1 "uncle") x	)
	, ( "way",	\[x]	-> unmay1 (predid1 "way") x	)
	, ( "week",	\[x]	-> unmay1 (predid1 "week") x	)
	, ( "word",	\[x]	-> unmay1 (predid1 "word") x	)

	, ( "woman",	\[x]	-> unmay1 (predid1 "woman") x	)
	, ( "man",	\[x]	-> unmay1 (predid1 "man") x	)
	, ( "husband",	\[x] -> unmay1 (predid1 "husband") x	)
	, ( "father",	\[x]	-> unmay1 (predid1 "father") x	)
	, ( "construction",	\[x] -> unmay1 (predid1 "construction") x	)
	, ( "electrician",	\[x] -> unmay1 (predid1 "electrician") x	)
	, ( "interviewer",	\[x] -> unmay1 (predid1 "interviewer") x	)
	, ( "shipyard",	\[x] -> unmay1 (predid1 "shipyard") x	)
	, ( "disappointment",	\[x] -> unmay1 (predid1 "disappointment") x	)
	, ( "money",	\[x] -> unmay1 (predid1 "money") x	)
	, ( "upbringing",	\[x] -> unmay1 (predid1 "upbringing") x	)
	, ( "story",	\[x] -> unmay1 (predid1 "story") x	)
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
	( "eighty_pound",	\[x]	-> unmay1 (predid1 "80-pound") x	)
	, ( "at_the_shipyard",	\[x]	-> unmay1 (predid1 "at_the_shipyard") x	)
	, ( "at_the_shipyard_to_work_V",	\[x]	-> unmay1 (predid1 "at_the_shipyard_to_work") x	)
	, ( "bad",	\[x]	-> unmay1 (predid1 "bad") x	)
	, ( "better",	\[x]	-> unmay1 (predid1 "better") x	)
	, ( "first",	\[x]	-> unmay1 (predid1 "first") x	)
	, ( "hard",	\[x]	-> unmay1 (predid1 "hard") x	)
	, ( "little",	\[x]	-> unmay1 (predid1 "little") x	)
	, ( "mad",	\[x]	-> unmay1 (predid1 "mad") x	)
	, ( "same",	\[x]	-> unmay1 (predid1 "same") x	)

	, ( "is_hire_ed",	\[x]	-> unmay1 (predid1 "is_hire_ed") x	)
	, ( "work_V",	\[x]	-> unmay1 (predid1 "work") x	)
	, ( "laugh",	\[x] -> unmay1 (predid1 "laugh") x	)
	, ( "know",	\[x]	-> unmay1 (predid1 "know") x	)
	, ( "look_bad",	\[x]	-> unmay1 (predid1 "look_bad") x	)
	, ( "slow_down",	\[x]	-> unmay1 (predid1 "slow_down") x	)
	, ( "need_VV_to_slow_down",	\[x]	-> unmay1 (predid1 "need_to_slow_down") x	)

	, ( "become",	\[x,y]	-> unmay2 (predid2 "become") y x	)
	, ( "can_to_lift",	\[x,y]	-> unmay2 (predid2 "can_to_lift") y x	)
	, ( "have_V2",	\[x,y]	-> unmay2 (predid2 "have") y x	)
	, ( "do_V2",	\[x,y]	-> unmay2 (predid2 "do") y x	)
	, ( "go_to_prep",	\[x,y]	-> unmay2 (predid2 "go_to") y x	)
	, ( "hire",	\[x,y]	-> unmay2 (predid2 "hire") y x	)
	, ( "interview",	\[x,y]	-> unmay2 (predid2 "interview") y x	)
	, ( "like",	\[x,y]	-> unmay2 (predid2 "like") y x	)
	, ( "make_V2V_look_bad",	\[x,y]	-> unmay2 (predid2 "make_look_bad") y x	)
	, ( "need_V2",	\[x,y]	-> unmay2 (predid2 "need") y x	)
	, ( "say:is_at_the_shipyard_to_work_V",	\[x,y]	-> unmay2 (predid2 "say:is_at_the_shipyard_to_work") y x	)
	, ( "say:need_VV_to_slow_down",	\[x,y]	-> unmay2 (predid2 "say:need_to_slow_down") y x	)
	, ( "say:is_too_little",	\[x,y]	-> unmay2 (predid2 "say:is_too_little")	y x )
	, ( "tell_to_to_slow_down",	\[x,y]	-> unmay2 (predid2 "tell_to_to_slow_down") y x	)
	, ( "want_to_work_with",	\[x,y]	-> unmay2 (predid2 "want_to_work_with") y x	)
	, ( "work_with",	\[x,y]	-> unmay2 (predid2 "work_with") y x	)
	, ( "like_that:is_hire_ed",	\[x,y]	-> unmay2 (predid2 "like_that:is_hire_ed") y x	)
	, ( "say:is_hire_ed",	\[x,y]	-> unmay2 (predid2 "say:is_hire_ed") y x	)

	, ( "find_to_do_V2",	\[x,y,z]	-> unmay3 (predid3 "find_to_do") z y x	)
	, ( "have_VV_to_do_V2_different",	\[x,y,z]	-> unmay3 (predid3 "have_to_do_different") z y x	)
	, ( "have_VV_to_go_to_prep",	\args -> case args of
			[x,y,z]	-> unmay3 (predid3 "have_to_go_to") z y x
			-- [x,y]	-> unmay2 ( (forgetful3 <=< predid3) "have_to_go_to") y x
			)
	, ( "think:need_VV_to_have_V2",	\[x,y,z]	-> unmay3 (predid3 "think:need_to_have") z y x	)
	, ( "say:have_V2",	\[x,y,z]	-> unmay3 (predid3 "say:have") z y x	)
	, ( "say:need_V2",	\[x,y,z]	-> unmay3 (predid3 "say:need") z y x )
	, ( "say:is",	\[x,y,z]	-> unmay3 (predid3 "say:is") z y x	)
	, ( "say:can_not_to_get_along", \[x,y,z] -> unmay3 (predid3  "say:can_not_to_get_along") z y x )
	, ( "think:is",	\[x,y,z]	-> unmay3 (predid3 "think:is") z y x	)


	, ( "say:take_away",	\[x,y,z,w]	-> unmay4 (predid4 "say:take_away") w z y x	)
	, ( "say:can_get_V3",	\[x,y,z,w]	-> unmay4 (predid4 "say:can_get_V3") w z y x	)
	, ( "let_V2V_to_take_to_see",	\[x,y,z,w]	-> unmay4 (predid4 "let_V2V_to_take_to_see") w z y x	)
	]


-- vim: set ts=2 sts=2 sw=2 noet:
