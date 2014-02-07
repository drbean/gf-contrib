module Story_Interpretation where 

import Model
import Dickson

gnp_list :: [(GNP,Entity)]
gnp_list = [
	(Gdee, D)
	,(Galf, A)
	]

ided :: GNP -> [(GNP,Entity)] -> Entity
ided name list@(c:cs) = let
	ided' name []	= error "Can't find named entity in namelist"
	ided' name (c:_) | fst c == name = snd c
	ided' name (c:cs) = ided' name cs
	in ided' name list

adjective_list :: GAP -> String
adjective_list Gbad     = "bad"
adjective_list Gbetter  = "better"
adjective_list Gfirst   = "first"
adjective_list Ghard    = "hard"
adjective_list Glittle  = "little"
adjective_list Gmad     = "mad"
adjective_list Gnext    = "next"
adjective_list Gnone    = "none"
adjective_list Gright   = "right"
adjective_list Gsame    = "same"
adjective_list Gseveral = "several"
adjective_list Gtwo     = "two"

kind_list :: GCN -> String
kind_list Gapprentice	= "apprentice"
kind_list Gdad	= "dad"
kind_list Geighty	= "eighty"
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
kind_list Gpound	= "pound"
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
	( "superintendent",	\[x] -> predid1 "superintendent" x	),
	( "supervisor",	\[x] -> predid1 "supervisor" x	),
	( "husband",	\[x] -> predid1 "husband" x	),
	( "vocational_school",	\[x] -> predid1 "vocational_school" x	),
	( "construction",	\[x] -> predid1 "construction" x	),
	( "electrician",	\[x] -> predid1 "electrician" x	),
	( "interviewer",	\[x] -> predid1 "interviewer" x	),
	( "transformer",	\[x] -> predid1 "transformer" x	),
	( "ship",	\[x] -> predid1 "ship" x	),
	( "shipyard",	\[x] -> predid1 "shipyard" x	),
	( "disappointment",	\[x] -> predid1 "disappointment" x	),
	( "money",	\[x] -> predid1 "money" x	),
	( "upbringing",	\[x] -> predid1 "upbringing" x	),
	( "story",	\[x] -> predid1 "story" x	),
	( "job",	\[x] -> predid1 "job" x	)
	]

inflections = [
	]

relations = [
	]


