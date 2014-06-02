module Story_Interpretation where 

import Model
import Trinka

entity_list :: GPN -> Entity
entity_list Ged	= ent_ided "Ed"
entity_list Gdebra	= ent_ided "Debra"
entity_list Gjackie	= ent_ided "Jackie"
entity_list Gchristmas	= ent_ided "Christmas"
entity_list Ggod	= ent_ided "God"
entity_list Gplaza	= ent_ided "Plaza"
entity_list Gmerry_xmas	= ent_ided "Merry_xmas"

adjective_list :: GAP -> String
adjective_list Gbig	= "big"
adjective_list Gbeautiful	= "beautiful"
adjective_list Ggood	= "good"
adjective_list Ggreat	= "great"
adjective_list Ghappy	= "happy"
adjective_list Glast	= "last"
adjective_list Gnice	= "nice"
adjective_list Gsick	= "sick"
adjective_list Gyoung	= "young"
adjective_list Gshined	= "shined"

uncount_list :: GNP -> String
uncount_list Gwork_NP	= "work_NP"
uncount_list Gschool_NP	= "school_NP"

n2_kind_list :: GN2 -> String
n2_kind_list Gfather	= "father"

kind_list :: GCN -> String
kind_list Gdoorman	= "doorman"
kind_list Gbarber	= "barber"
kind_list Gcoat	= "coat"
kind_list Gday	= "day"
kind_list Gdollar	= "dollar"
kind_list Gdoor	= "door"
kind_list Gfact	= "fact"
kind_list Gfriend	= "friend"
kind_list Ggarage	= "garage"
kind_list Gguest	= "guest"
kind_list Ghour	= "hour"
kind_list Gjob	= "job"
kind_list Gkit	= "kit"
kind_list Glady	= "lady"
kind_list Glife	= "life"
kind_list Glocker	= "locker"
kind_list Gman	= "man"
kind_list Gmanager	= "manager"
kind_list Gmeeting	= "meeting"
kind_list Gmorning	= "morning"
kind_list Gparadise	= "paradise"
kind_list Gshoe	= "shoe"
kind_list Gshop	= "shop"
kind_list Gstory	= "story"
kind_list Gthing	= "thing"
kind_list Gtime	= "time"
kind_list Gtip	= "tip"
kind_list Gway	= "way"
kind_list Gyear	= "year"
kind_list Gvip	= "vip"


happening_list :: GV -> String
happening_list Gfit	= "fit"
happening_list Gsmile	= "smile"
happening_list Gcome	= "come"
happening_list Gwork_V	= "work_V"

changing_list :: GV2 -> String
changing_list Gbecome	= "become"
changing_list Gcut	= "cut"
changing_list Gget  	= "get"
changing_list Ggraduate	= "graduate"
changing_list Ghave 	= "have"
changing_list Gknow	= "know"
changing_list Glike_V	= "like_V"
changing_list Glive	= "live"
changing_list Gput_on	= "put_on"
changing_list Grun	= "run"
changing_list Gshine	= "shine"
changing_list Gtalk	= "talk"
changing_list Gtell	= "tell"
changing_list Gwalk	= "walk"

causative_list :: GV2V -> String
causative_list Gtell_to	= "tell_to"

pred2a_list :: GV2A -> String
pred2a_list Gmake	= "make"

intens_list :: GVV -> String
intens_list Gcan	= "can"
intens_list Gstart	= "start"

triangulating_list :: GV3 -> String
triangulating_list Ggive	= "give"
triangulating_list Gput	= "put"
triangulating_list Gtreat	= "treat"


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
	, ( "need",	\[x,y]	-> predid2 "need" y x	)
	, ( "become",	\[x,y]	-> predid2 "become" y x	)
	, ( "can_to_lift",	\[x,y]	-> predid2 "can_to_lift" y x	)

	, ( "hire",	\[x,y]	-> predid2 "hire" y x	)
	, ( "interview",	\[x,y]	-> predid2 "interview" y x	)
	, ( "like",	\[x,y]	-> predid2 "like" y x	)

	]


