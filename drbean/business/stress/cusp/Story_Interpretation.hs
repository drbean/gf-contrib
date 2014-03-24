module Story_Interpretation where 

import Model
import Cusp

entity_list :: GPN -> Entity
entity_list Gbarbara	= ent_ided "Barbara"
entity_list Gtadeusz	= ent_ided "Tadeusz"
entity_list Geva	= ent_ided "Eva"
entity_list Gfast_track	= ent_ided "Fast-Track"
entity_list Gdr_bean	= ent_ided "Dr Bean"

adjective_list :: GAP -> String
adjective_list Gambitious     = "ambitious"
adjective_list Gbad    = "bad"
adjective_list Gcompetitive  = "competitive"
adjective_list Gconfident     = "confident"
adjective_list Gdifficult     = "difficult"
adjective_list Geach	= "each"
adjective_list Gexperienced	= "experienced"
adjective_list Gfast	= "fast"
adjective_list Gfew	= "few"
adjective_list Gfive	= "five"
adjective_list Ggood	= "good"
adjective_list Ghard	= "hard"
adjective_list Ghonest	= "honest"
adjective_list Glocal	= "local"
adjective_list Glong	= "long"
adjective_list Gnext	= "next"
adjective_list Gother	= "other"
adjective_list Goutgoing     = "outgoing"
adjective_list Gpast	= "past"
adjective_list Gpatient	= "patient"
adjective_list Gpolish	= "Polish"
adjective_list Gpoor	= "poor"
adjective_list Gpossible     = "possible"
adjective_list Grealistic     = "realistic"
adjective_list Gsafe	= "safe"
adjective_list Gsoon	= "soon"
adjective_list Gsuccessful     = "successful"
adjective_list Gtrue	= "true"
adjective_list Gunable	= "unable"
adjective_list Gvarious	= "various"

n2_kind_list :: GN2 -> String
n2_kind_list Gdirector_2	= "director"
n2_kind_list Ghead_2	= "head"


uncount_list :: GNP -> String
-- uncount_list Gmoney	= "money"
-- uncount_list Gstuff	= "stuff"
-- uncount_list Gtime	= "time"
uncount_list Gwork	= "work"
uncount_list Ggood_judgement	= "good judgement"
uncount_list Gexperience	= "experience"
uncount_list Gsales_experience	= "experience"

kind_list :: GCN -> String
kind_list Gability	= "ability"
kind_list Gadministration	= "administration"
kind_list Gaim	= "aim"
kind_list Gbusiness 	= "business"
kind_list Gclub	= "club"
kind_list Gcompany	= "company"
kind_list Gcourse	= "course"
kind_list Gdepartment	= "department"
kind_list Gdirector 	= "director"
kind_list Geffort	= "effort"
kind_list Ghand	= "hand"
kind_list Ghead	= "head"
kind_list Gjob	= "job"
kind_list Glearner	= "learner"
kind_list Glot	= "lot"
kind_list Gmain	= "main"
kind_list Gman	= "man"
kind_list Gmarket	= "market"
kind_list Gmaterial 	= "material"
kind_list Gpair	= "pair"
kind_list Gpeople	= "people"
kind_list Gpersonality	= "personality"
kind_list Gpolish_N	= "Polish"
kind_list Grespect	= "respect"
kind_list Gresult	= "result"
kind_list Grisk	= "risk"
kind_list Gsales_department	= "department"
kind_list Gshare	= "share"
kind_list Gsystem	= "system"
kind_list Gteam	= "team"
kind_list Gterm	= "term"
kind_list Gthing	= "thing"
kind_list Gtime	= "time"
kind_list Gtop	= "top"
kind_list Gtraining 	= "training"
kind_list Gway	= "way"
kind_list Gwoman	= "woman"
kind_list Gyear	= "year"

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
changing_list Gwork_in  	= "work"
changing_list Gknow_V2	= "know"


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

	( "ability",	\[x]	-> predid1 "ability" x	)
	, ( "administration",	\[x]	-> predid1 "administration" x	)
	, ( "aim",	\[x]	-> predid1 "aim" x	)
	, ( "business",	\[x]	-> predid1 "business" x	)
	, ( "club",	\[x]	-> predid1 "club" x	)
	, ( "company",	\[x]	-> predid1 "company" x	)
	, ( "course",	\[x]	-> predid1 "course" x	)
	, ( "department",	\[x]	-> predid1 "department" x	)
	, ( "director",	\[x]	-> predid1 "director" x	)
	, ( "effort",	\[x]	-> predid1 "effort" x	)
	, ( "experience",	\[x]	-> predid1 "experience" x	)
	, ( "hand",	\[x]	-> predid1 "hand" x	)
	, ( "head",	\[x]	-> predid1 "head" x	)
	, ( "job",	\[x]	-> predid1 "job" x	)
	, ( "judgement",	\[x]	-> predid1 "judgement" x	)
	, ( "learner",	\[x]	-> predid1 "learner" x	)
	, ( "lot",	\[x]	-> predid1 "lot" x	)
	, ( "main",	\[x]	-> predid1 "main" x	)
	, ( "market",	\[x]	-> predid1 "market" x	)
	, ( "material",	\[x]	-> predid1 "material" x	)
	, ( "pair",	\[x]	-> predid1 "pair" x	)
	, ( "people",	\[x]	-> predid1 "people" x	)
	, ( "personality",	\[x]	-> predid1 "personality" x	)
	, ( "Polish",	\[x]	-> predid1 "polish" x	)
	, ( "respect",	\[x]	-> predid1 "respect" x	)
	, ( "result",	\[x]	-> predid1 "result" x	)
	, ( "risk",	\[x]	-> predid1 "risk" x	)
	, ( "share",	\[x]	-> predid1 "share" x	)
	, ( "system",	\[x]	-> predid1 "system" x	)
	, ( "team",	\[x]	-> predid1 "team" x	)
	, ( "term",	\[x]	-> predid1 "term" x	)
	, ( "thing",	\[x]	-> predid1 "thing" x	)
	, ( "time",	\[x]	-> predid1 "time" x	)
	, ( "top",	\[x]	-> predid1 "top" x	)
	, ( "training",	\[x]	-> predid1 "training" x	)
	, ( "way",	\[x]	-> predid1 "way" x	)
	, ( "year",	\[x]	-> predid1 "year" x	)




	, ( "woman",	\[x]	-> predid1 "woman" x	)
	, ( "man",	\[x]	-> predid1 "man" x	)

	]

inflections = [
	( "children",	"child")
	, ( "good judgement",	"judgement")
	]

relations = [
	( "bad",	\[x]	-> predid1 "bad" x	)
	, ( "better",	\[x]	-> predid1 "better" x	)
	, ( "first",	\[x]	-> predid1 "first" x	)
	, ( "hard",	\[x]	-> predid1 "hard" x	)
	, ( "little",	\[x]	-> predid1 "little" x	)
	, ( "mad",	\[x]	-> predid1 "mad" x	)

	, ( "ambitious",	\[x]	-> predid1 "ambitious" x	)
	, ( "competitive",	\[x]	-> predid1 "competitive" x	)
	, ( "confident",	\[x]	-> predid1 "confident" x	)
	, ( "difficult",	\[x]	-> predid1 "difficult" x	)
	, ( "experienced",	\[x]	-> predid1 "experienced" x	)
	, ( "judgement",	\[x]	-> predid1 "judgement" x	)


	, ( "fast",	\[x]	-> predid1 "fast" x	)
	, ( "hard",	\[x]	-> predid1 "hard" x	)
	, ( "honest",	\[x]	-> predid1 "honest" x	)
	, ( "local",	\[x]	-> predid1 "local" x	)
	, ( "outgoing",	\[x]	-> predid1 "outgoing" x	)
	, ( "patient",	\[x]	-> predid1 "patient" x	)
	, ( "poor",	\[x]	-> predid1 "poor" x	)
	, ( "realistic",	\[x]	-> predid1 "realistic" x	)
	, ( "successful",	\[x]	-> predid1 "successful" x	)



	, ( "laugh",	\[x] -> predid1 "laugh" x	)
	, ( "know",	\args -> case args of
				[x,y]	-> predid2 "know" y x
				[x]	-> (forgetful2 . predid2) "know" x	)
	, ( "like",	\[x, y]	-> predid2 "like" y x	)
	, ( "look_here",	\[x]	-> predid1 "look_here" x	)
	, ( "slow_down",	\[x]	-> predid1 "slow_down" x	)

	, ( "stand",	\[x,y]	-> predid2 "stand" y x	)

	]


