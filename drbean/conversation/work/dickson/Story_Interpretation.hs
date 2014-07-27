module Story_Interpretation where 

import Model
import Dickson

entity_list :: GPN -> Entity
entity_list Gdee	 = ent_ided "Dee"
entity_list Guncle_alf	 = ent_ided "Uncle Alf"
entity_list Gmonday	 = ent_ided "Monday"

determiner_list :: GDet -> String
determiner_list Gthe_first	= "the first"

adjective_list :: GAP -> String
adjective_list Geighty_pound     = "80-pound"
adjective_list Gbad     = "bad"
adjective_list Ggood  = "good"
adjective_list Ghard    = "hard"
adjective_list Glittle  = "little"
adjective_list Gtoo_little  = "too_little"
adjective_list Gmad     = "mad"
adjective_list Gsame     = "same"

n2_kind_list :: GN2 -> String
n2_kind_list Gfather_2	= "father"
n2_kind_list Guncle_2	= "uncle"

uncount_list :: GNP -> String
uncount_list Glife	= "life"
uncount_list Gmoney	= "money"
uncount_list Gschool	= "school"
uncount_list Gstuff	= "stuff"
uncount_list Gtime	= "time"
uncount_list Gwork	= "work"
uncount_list Ggraduation	= "graduation"

kind_list :: GCN -> String
kind_list Gapprentice	= "apprentice"
kind_list Gelectrician	= "electrician"
kind_list Gfamily	= "family"
kind_list Gfather	= "father"
kind_list Gguy	= "guy"
kind_list Ginterviewer	= "interviewer"
kind_list Gjob	= "job"
kind_list Gman_CN	= "man"
kind_list Gnight	= "night"
kind_list Gposition	= "position"
kind_list Gship	= "ship"
kind_list Gshipyard	= "shipyard"
kind_list Gsuperintendent	= "superintendent"
kind_list Gsupervisor	= "supervisor"
kind_list Gthing	= "thing"
kind_list Gtop	= "top"
kind_list Gtransformer	= "transformer"
kind_list Guncle	= "uncle"
kind_list Gway	= "way"
kind_list Gweek	= "week"
kind_list Gwoman	= "woman"

happening_list :: GV -> String
happening_list Gwork_V	= "work"
happening_list Glaugh	= "laugh"
happening_list Gslow_down	= "slow_down"

changing_list :: GV2 -> String
changing_list Gbecome	= "become"
changing_list Gget  	= "get"
changing_list Gget_along	= "get_along"
changing_list Ggo   	= "go"
changing_list Ghave_V2 	= "have"
changing_list Ghire 	= "hire"
changing_list Ginterview	= "interview"
changing_list Glift 	= "lift"
changing_list Glike_2 	= "like"
changing_list Gneed_V2 	= "need"
-- changing_list Gprove	= "prove"
changing_list Gsee  	= "see"

causative_list :: GV2V -> String
causative_list Gtake	= "take"

positing_list :: GVS -> String
positing_list Gknow_VS	= "know_VS"
positing_list Gsay	= "say"
positing_list Gthink	= "think"

intens_list :: GVV -> String
intens_list Gcan	= "can"
intens_list Ghave_VV 	= "have"
intens_list Gmust_VV 	= "must"
intens_list Gneed_VV	= "need"
intens_list Gstart	= "start"

triangulating_list :: GV3 -> String
triangulating_list Ggive	= "give"

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
	, ( "man",	\[x]	-> predid1 "man" x	)
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
	( "children",	"child")
	, ("say_little", "say_too_little")
	]

relations = [
	( "bad",	\[x]	-> predid1 "bad" x	)
	, ( "better",	\[x]	-> predid1 "better" x	)
	, ( "first",	\[x]	-> predid1 "first" x	)
	, ( "hard",	\[x]	-> predid1 "hard" x	)
	, ( "little",	\[x]	-> predid1 "little" x	)
	, ( "mad",	\[x]	-> predid1 "mad" x	)

	, ( "work",	\[x]	-> predid1 "work" x	)
	, ( "laugh",	\[x] -> predid1 "laugh" x	)
	, ( "know",	\[x]	-> predid1 "know" x	)
	, ( "look_here",	\[x]	-> predid1 "look_here" x	)
	, ( "slow_down",	\[x]	-> predid1 "slow_down" x	)
	, ( "need_to_slow_down",	\[x]	-> predid1 "need_to_slow_down" x	)

	, ( "say_need_to_slow_down",	\[x,y]	-> predid2 "say_need_to_slow_down" y x	)
	, ( "say_too_little",	\[x,y]	-> predid2 "say_too_little" y x	)
	, ( "need",	\[x,y]	-> predid2 "need" y x	)
	, ( "become",	\[x,y]	-> predid2 "become" y x	)
	, ( "can_to_lift",	\[x,y]	-> predid2 "can_to_lift" y x	)

	, ( "hire",	\[x,y]	-> predid2 "hire" y x	)
	, ( "interview",	\[x,y]	-> predid2 "interview" y x	)
	, ( "like",	\[x,y]	-> predid2 "like" y x	)

	, ( "think_need_to_have",	\[x,y,z]	-> predid3 "think_need_to_have" z y x	)
	]


-- vim: set ts=2 sts=2 sw=2 noet:
