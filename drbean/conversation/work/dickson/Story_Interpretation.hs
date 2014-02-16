module Story_Interpretation where 

import Model
import Dickson

entity_list :: GPN -> Entity
entity_list Gdee	 = ent_ided "Dee"
entity_list Galf	 = ent_ided "Alf"
entity_list Gmonday	 = ent_ided "Monday"

adjective_list :: GAP -> String
adjective_list Gbad     = "bad"
adjective_list Gbetter  = "better"
adjective_list Gfirst   = "first"
adjective_list Ghard    = "hard"
adjective_list Glittle  = "little"
adjective_list Gmad     = "mad"

n2_kind_list :: GN2 -> String
n2_kind_list Gfather_2	= "father"
n2_kind_list Guncle_2	= "uncle"

kind_list :: GCN -> String
kind_list Gapprentice	= "apprentice"
kind_list Gchild	= "child"
kind_list Gdad	= "dad"
kind_list Gend	= "end"
kind_list Gfamily	= "family"
kind_list Ggraduation	= "graduation"
kind_list Gguy	= "guy"
kind_list Gjob	= "job"
kind_list Gkind	= "kind"
kind_list Gknack	= "knack"
kind_list Glife	= "life"
kind_list Gman	= "man"
kind_list Gnight	= "night"
kind_list Gposition	= "position"
kind_list Gschool	= "school"
kind_list Gship	= "ship"
kind_list Gsuperintendent	= "superintendent"
kind_list Gsupervisor	= "supervisor"
kind_list Gthing	= "thing"
kind_list Gtop	= "top"
kind_list Gtransformer	= "transformer"
kind_list Guncle	= "uncle"
kind_list Gway	= "way"
kind_list Gweek	= "week"
kind_list Gword	= "word"

happening_list :: GV -> String
happening_list Gwork_V	= "work"
happening_list Glaugh	= "laugh"
happening_list Gknow	= "know"
happening_list Glook_here	= "look_here"
happening_list Gslow_down	= "slow_down"

changing_list :: GV2 -> String
changing_list Gbecome	= "become"
changing_list Gget  	= "get"
changing_list Gget_along	= "get_along"
changing_list Ggo   	= "go"
changing_list Ghave 	= "have"
changing_list Ghire 	= "hire"
changing_list Ginterview	= "interview"
changing_list Glift 	= "lift"
changing_list Glike 	= "like"
changing_list Gprove	= "prove"
changing_list Gsee  	= "see"

causative_list :: GV2V -> String
causative_list Gtake	= "take"

positing_list :: GVS -> String
positing_list Gknow_VS	= "know_VS"
positing_list Gsay	= "say"
positing_list Gthink	= "think"

intens_list :: GVV -> String
intens_list Gcan	= "can"
intens_list Gneed	= "need"
intens_list Gstart	= "start"

objects = [
	( "apprentice",	\[x]	-> predid1 "apprentice" x	)
	, ( "child",	\[x]	-> predid1 "child" x	)
	, ( "dad",	\[x]	-> predid1 "dad" x	)
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

	]


