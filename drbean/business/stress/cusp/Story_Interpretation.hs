module Story_Interpretation where 

import Model
import Cusp

entity_list :: GPN -> Entity
entity_list GCUSP	= ent_ided "CUSP"
entity_list Gbradshaw	= ent_ided "Bradshaw"
entity_list Gc	= ent_ided "C"
entity_list Gcontrol	= ent_ided "control"
entity_list Ggourlay	= ent_ided "Gourlay"
entity_list Gin_equilibrium	= ent_ided "In Equilibrium"
entity_list Gmen	= ent_ided "men"
entity_list Gp	= ent_ided "P"
entity_list Gpressure	= ent_ided "pressure"
entity_list Gs	= ent_ided "S"
entity_list Gsupport	= ent_ided "support"
entity_list Gu	= ent_ided "U"
entity_list Guncertainty	= ent_ided "uncertainty"
entity_list Gstress	= ent_ided "stress"

adjective_list :: GAP -> String
adjective_list Gassertive	= "assertive"
adjective_list Gbad	= "bad"
adjective_list Ggood	= "good"
adjective_list Gbest_placed	= "best-placed"
adjective_list Gcommon	= "common"
adjective_list Gcritically_important	= "critically-important"
adjective_list Gday_to_day	= "day-to-day"
adjective_list Gdifficult	= "difficult"
adjective_list Geffective	= "effective"
adjective_list Gface_to_face	= "face-to-face"
adjective_list Ghelpless	= "helpless"
adjective_list Ghigh	= "high"
adjective_list Glatter	= "latter"
adjective_list Glittle	= "little"
adjective_list Gmain	= "main"
adjective_list Gmore	= "more"
adjective_list Gmost	= "most"
adjective_list Gother	= "other"
adjective_list Gown	= "own"
adjective_list Gparticular	= "particular"
adjective_list Gpoor	= "poor"
adjective_list Gpractical	= "practical"
adjective_list Gsevere	= "severe"
adjective_list Gsimple	= "simple"
adjective_list Gsocial	= "social"
adjective_list Gstressful	= "stressful"
adjective_list Gstructured	= "structured"
adjective_list Gthree	= "three"
adjective_list Gtwo_way	= "two-way"
adjective_list Gunsupported	= "unsupported"
adjective_list Guseful	= "useful"
adjective_list Gvulnerable	= "vulnerable"
adjective_list Gwrong	= "wrong"

n2_kind_list :: GN2 -> String
n2_kind_list Gcause_of	= "cause_of"
n2_kind_list Gcontrol_over	= "control_over"
n2_kind_list Glack_of	= "lack_of"
n2_kind_list Gsense_of	= "sense_of"

-- uncount_list :: GNP -> String
-- uncount_list Gexperience	= "experience"

kind_list :: GCN -> String
kind_list Gapproachability	= "approachability"
kind_list Gassessment	= "assessment"
kind_list Gawareness	= "awareness"
kind_list Gcommunication	= "communication"
kind_list Gdepression	= "depression"
kind_list Gdelegation	= "delegation"
kind_list Gflexibility	= "flexibility"
kind_list Ghealth	= "health"
kind_list Gmanagement	= "management"
kind_list Gopenness	= "openness"
kind_list Gperformance	= "performance"
kind_list Gplacement	= "placement"
kind_list Gresponsibility	= "responsibility"
kind_list Gstaff	= "staff"
kind_list Gtime	= "time"
kind_list Gwork	= "work"


happening_list :: GV -> String
happening_list Gwork_V	= "work"
happening_list Glaugh	= "laugh"
happening_list Gknow	= "know"
happening_list Glook_here	= "look_here"
happening_list Gslow_down	= "slow_down"

changing_list :: GV2 -> String
changing_list Gbecome	= "become"
changing_list Gget  	= "get"
changing_list Ghave 	= "have"
changing_list Glike 	= "like"
changing_list Gneed	= "need"
changing_list Gprove	= "prove"
changing_list Gsee  	= "see"

changing_list Gabdicate	= "abdicate"
changing_list Gagree	= "agree"
changing_list Gboost	= "boost"
changing_list Gcause	= "cause"
changing_list Gconsider	= "consider"
changing_list Gconsult_V	= "consult_V"
changing_list Gcope	= "cope"
changing_list Gdeal	= "deal"
changing_list Genable	= "enable"
changing_list Gfacilitate	= "facilitate"
changing_list Gget	= "get"
changing_list Gidentify	= "identify"
changing_list Ginvestigate	= "investigate"
changing_list Glisten	= "listen"
changing_list Glook_at	= "look_at"
changing_list Gmake	= "make"
changing_list Goffer	= "offer"
changing_list Gpick	= "pick"
changing_list Gprevent	= "prevent"
changing_list Gprovide	= "provide"
changing_list Graise	= "raise"
changing_list Greceive	= "receive"
changing_list Gstand	= "stand"
changing_list Gtake	= "take"
changing_list Gtrain	= "train"


causative_list :: GV2V -> String
causative_list Gallow	= "allow"
causative_list Gencourage	= "encourage"
causative_list Ghelp	= "help"
causative_list Guse	= "use"

positing_list :: GVS -> String
positing_list Gfeel	= "feel"
positing_list Gsay	= "say"
positing_list Gsuggest	= "suggest"
positing_list Gthink	= "think"

intens_list :: GVV -> String
intens_list Gcan	= "can"
intens_list Gneed	= "need"
intens_list Gstart	= "start"
intens_list Gtend	= "tend"

triangulating_list :: GV3 -> String
triangulating_list Gbase	= "base"
triangulating_list Gcall	= "call"
triangulating_list Ggive	= "give"
triangulating_list Gtalk	= "talk"



objects = [

	( "ability",	\[x]	-> predid1 "ability" x	)
	, ( "approachability",	\[x]	-> predid1 "approachability" x	)
	, ( "area",	\[x]	-> predid1 "area" x	)
	, ( "assessment",	\[x]	-> predid1 "assessment" x	)
	, ( "awareness",	\[x]	-> predid1 "awareness" x	)
	, ( "business",	\[x]	-> predid1 "business" x	)
	, ( "cause_of",	\[x]	-> predid1 "cause_of" x	)
	, ( "characteristic",	\[x]	-> predid1 "characteristic" x	)
	, ( "climate",	\[x]	-> predid1 "climate" x	)
	, ( "combination",	\[x]	-> predid1 "combination" x	)
	, ( "comment",	\[x]	-> predid1 "comment" x	)
	, ( "communication",	\[x]	-> predid1 "communication" x	)
	, ( "company",	\[x]	-> predid1 "company" x	)
	, ( "consultation",	\[x]	-> predid1 "consultation" x	)
	, ( "control_over",	\[x]	-> predid1 "control_over" x	)
	, ( "delegation",	\[x]	-> predid1 "delegation" x	)
	, ( "depression",	\[x]	-> predid1 "depression" x	)
	, ( "difference",	\[x]	-> predid1 "difference" x	)
	, ( "difficulty",	\[x]	-> predid1 "difficulty" x	)
	, ( "element",	\[x]	-> predid1 "element" x	)
	, ( "example",	\[x]	-> predid1 "example" x	)
	, ( "experience",	\[x]	-> predid1 "experience" x	)
	, ( "feeling",	\[x]	-> predid1 "feeling" x	)
	, ( "flexibility",	\[x]	-> predid1 "flexibility" x	)
	, ( "framework",	\[x]	-> predid1 "framework" x	)
	, ( "group",	\[x]	-> predid1 "group" x	)
	, ( "health",	\[x]	-> predid1 "health" x	)
	, ( "hotspot",	\[x]	-> predid1 "hotspot" x	)
	, ( "idea",	\[x]	-> predid1 "idea" x	)
	, ( "individual",	\[x]	-> predid1 "individual" x	)
	, ( "key",	\[x]	-> predid1 "key" x	)
	, ( "kind",	\[x]	-> predid1 "kind" x	)
	, ( "lack_of",	\[x]	-> predid1 "lack_of" x	)
	, ( "level",	\[x]	-> predid1 "level" x	)
	, ( "luck",	\[x]	-> predid1 "luck" x	)
	, ( "management",	\[x]	-> predid1 "management" x	)
	, ( "manager",	\[x]	-> predid1 "manager" x	)
	, ( "meeting",	\[x]	-> predid1 "meeting" x	)
	, ( "message",	\[x]	-> predid1 "message" x	)
	, ( "mind",	\[x]	-> predid1 "mind" x	)
	, ( "minute",	\[x]	-> predid1 "minute" x	)
	, ( "model",	\[x]	-> predid1 "model" x	)
	, ( "one",	\[x]	-> predid1 "one" x	)
	, ( "option",	\[x]	-> predid1 "option" x	)
	, ( "openness",	\[x]	-> predid1 "openness" x	)
	, ( "overview",	\[x]	-> predid1 "overview" x	)
	, ( "people",	\[x]	-> predid1 "people" x	)
	, ( "performance",	\[x]	-> predid1 "performance" x	)
	, ( "placement",	\[x]	-> predid1 "placement" x	)
	, ( "plan",	\[x]	-> predid1 "plan" x	)
	, ( "position",	\[x]	-> predid1 "position" x	)
	, ( "problem",	\[x]	-> predid1 "problem" x	)
	, ( "responsibility",	\[x]	-> predid1 "responsibility" x	)
	, ( "risk",	\[x]	-> predid1 "risk" x	)
	, ( "sense_of",	\[x]	-> predid1 "sense_of" x	)
	, ( "situation",	\[x]	-> predid1 "situation" x	)
	, ( "skill",	\[x]	-> predid1 "skill" x	)
	, ( "staff",	\[x]	-> predid1 "staff" x	)
	, ( "strategy",	\[x]	-> predid1 "strategy" x	)
	, ( "study",	\[x]	-> predid1 "study" x	)
	, ( "thing",	\[x]	-> predid1 "thing" x	)
	, ( "time",	\[x]	-> predid1 "time" x	)
	, ( "truth",	\[x]	-> predid1 "truth" x	)
	, ( "way",	\[x]	-> predid1 "way" x	)
	, ( "work",	\[x]	-> predid1 "work" x	)
	, ( "workload",	\[x]	-> predid1 "workload" x	)





	, ( "women",	\[x]	-> predid1 "women" x	)
	, ( "men",	\[x]	-> predid1 "men" x	)

	]

inflections = [
	( "children",	"child")
	, ( "good judgement",	"judgement")
	]

relations = [
	( "assertive",	\[x]	-> predid1 "assertive" x	)
	, ( "bad",	\[x]	-> predid1 "bad" x	)
	, ( "best_placed",	\[x]	-> predid1 "best_placed" x	)
	, ( "brief",	\[x]	-> predid1 "brief" x	)
	, ( "common",	\[x]	-> predid1 "common" x	)
	, ( "critically_important",	\[x]	-> predid1 "critically_important" x	)
	, ( "day_to_day",	\[x]	-> predid1 "day_to_day" x	)
	, ( "difficult",	\[x]	-> predid1 "difficult" x	)
	, ( "effective",	\[x]	-> predid1 "effective" x	)
	, ( "face_to_face",	\[x]	-> predid1 "face_to_face" x	)
	, ( "good",	\[x]	-> predid1 "good" x	)
	, ( "helpless",	\[x]	-> predid1 "helpless" x	)
	, ( "high",	\[x]	-> predid1 "high" x	)
	, ( "latter",	\[x]	-> predid1 "latter" x	)
	, ( "little",	\[x]	-> predid1 "little" x	)
	, ( "managerial",	\[x]	-> predid1 "managerial" x	)
	, ( "main",	\[x]	-> predid1 "main" x	)
	, ( "more",	\[x]	-> predid1 "more" x	)
	, ( "most",	\[x]	-> predid1 "most" x	)
	, ( "other",	\[x]	-> predid1 "other" x	)
	, ( "own",	\[x]	-> predid1 "own" x	)
	, ( "particular",	\[x]	-> predid1 "particular" x	)
	, ( "poor",	\[x]	-> predid1 "poor" x	)
	, ( "practical",	\[x]	-> predid1 "practical" x	)
	, ( "psychological",	\[x]	-> predid1 "psychological" x	)
	, ( "severe",	\[x]	-> predid1 "severe" x	)
	, ( "simple",	\[x]	-> predid1 "simple" x	)
	, ( "social",	\[x]	-> predid1 "social" x	)
	, ( "stressful",	\[x]	-> predid1 "stressful" x	)
	, ( "structured",	\[x]	-> predid1 "structured" x	)
	, ( "three",	\[x]	-> predid1 "three" x	)
	, ( "timely",	\[x]	-> predid1 "timely" x	)
	, ( "two_way",	\[x]	-> predid1 "two_way" x	)
	, ( "unsupported",	\[x]	-> predid1 "unsupported" x	)
	, ( "useful",	\[x]	-> predid1 "useful" x	)
	, ( "vulnerable",	\[x]	-> predid1 "vulnerable" x	)
	, ( "wrong",	\[x]	-> predid1 "wrong" x	)

	k




	, ( "laugh",	\[x] -> predid1 "laugh" x	)
	, ( "know",	\args -> case args of
				[x,y]	-> predid2 "know" y x
				[x]	-> (forgetful2 . predid2) "know" x	)
	, ( "like",	\[x, y]	-> predid2 "like" y x	)
	, ( "look_here",	\[x]	-> predid1 "look_here" x	)
	, ( "slow_down",	\[x]	-> predid1 "slow_down" x	)

	, ( "stand",	\[x,y]	-> predid2 "stand" y x	)

	]


