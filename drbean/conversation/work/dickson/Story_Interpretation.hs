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
adjective_list Gbad     = "Gbad"
adjective_list Gbetter  = "Gbetter"
adjective_list Gfirst   = "Gfirst"
adjective_list Ghard    = "Ghard"
adjective_list Glittle  = "Glittle"
adjective_list Gmad     = "Gmad"
adjective_list Gnext    = "Gnext"
adjective_list Gnone    = "Gnone"
adjective_list Gright   = "Gright"
adjective_list Gsame    = "Gsame"
adjective_list Gseveral = "Gseveral"
adjective_list Gtwo     = "Gtwo"

kind_list :: GCN -> String
kind_list Gapprentice	= "Gapprentice"
kind_list Gdad	= "Gdad"
kind_list Geighty	= "Geighty"
kind_list Gend	= "Gend"
kind_list Gfamily	= "Gfamily"
kind_list Ggraduation	= "Ggraduation"
kind_list Gguy	= "Gguy"
kind_list Gjob	= "Gjob"
kind_list Gkind	= "Gkind"
kind_list Gknack	= "Gknack"
kind_list Glife	= "Glife"
kind_list Gman	= "Gman"
kind_list Gnight	= "Gnight"
kind_list Gposition	= "Gposition"
kind_list Gpound	= "Gpound"
kind_list Gschool	= "Gschool"
kind_list Gship	= "Gship"
kind_list Gsuperintendent	= "Gsuperintendent"
kind_list Gsupervisor	= "Gsupervisor"
kind_list Gthing	= "Gthing"
kind_list Gtop	= "Gtop"
kind_list Gtransformer	= "Gtransformer"
kind_list Guncle	= "Guncle"
kind_list Gway	= "Gway"
kind_list Gweek	= "Gweek"
kind_list Gword	= "Gword"

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


