--# -path=.:./engine:/home/drbean/GF/lib/src/translator:alltenses

concrete TriggerEng of Trigger = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtendEng, ConstructX, Prelude, (R=ResEng) in {

oper

	work_out = mkV2( partV( mkV "work") "out") noPrep;
	own	= mkCN( mkN nonhuman (mkN "own") );
	np_own : NP -> {s : R.NPCase => Str ; a : R.Agr} = \np -> mkNP (mkDet (GenNP np)) own;
	on = mkPrep "on";

lin

-- Adv

	very	= ParadigmsEng.mkAdA "very";
	together	= ParadigmsEng.mkAdv "together";
	suddenly	= ParadigmsEng.mkAdV "suddenly";
	in_school	= ParadigmsEng.mkAdv "in school";
	right_away	= ParadigmsEng.mkAdv "right away";
	really	= ParadigmsEng.mkAdA "really";
	pretty	= ParadigmsEng.mkAdA "pretty";
	On_own np	= Mannering on (np_own np);
	now	= ParadigmsEng.mkAdv "now";
	just	= ParadigmsEng.mkAdV "just" ;
	forever	= ParadigmsEng.mkAdv "forever" ;
	ever	= ParadigmsEng.mkAdV "ever" ;
	differently	= ParadigmsEng.mkAdv "differently" ;
	always	= ParadigmsEng.mkAdv "always" ;
	actually	= ParadigmsEng.mkAdA "actually" ;

-- AP

	unforgettable	= mkAP( mkA "unforgettable") ;
	twin_A	= mkAP( mkA "twin") ;
	top	= mkAP( mkA "top") ;
	thin	= mkAP( mkA "thin") ;
	shy	= mkAP( mkA "shy") ;
	proud	= mkA2( mkA "proud") of_PREP;
	outgoing	= mkAP( mkA "outgoing") ;
	last	= mkAP( mkA "last") ;
	healthy	= mkAP( mkA "healthy") ;
	good	= mkAP( mkA "good") ;
	first	= mkAP( mkA "first") ;
	few	= mkAP( mkA "few") ;
	envious	= mkAP( mkA "envious") ;
	dumbest	= mkAP( mkA "dumbest") ;
	difficult	= mkAP( mkA "difficult") ;
	different	= mkAP( mkA "different") ;
	determined	= mkA2( mkA "determined") to_PREP;
	confident	= mkAP( mkA "confident") ;
	close	= mkAP( mkA "close") ;
	capable	= mkA2( mkA "capable") of_PREP;
	breakthrough	= mkAP( mkA "breakthrough") ;
	amazing	= mkAP( mkA "amazing") ;
	eighteen	= mkAP( mkA "18") ;

-- Conj


-- Det

	three	= mkDet( mkCard (mkNumeral n3_Unit));
	both	= ss "both";
	another	= mkDet( ParadigmsEng.mkQuant "another" nonExist) singularNum;
	all	= ss "all";

-- N

	week	= mkCN( mkN nonhuman (mkN "week") );
	way	= mkCN( mkN nonhuman (mkN "way") );
	twin_N	= mkCN( mkN human (mkN "twin") );
	turning_point	= mkCN( mkN nonhuman (mkN "turning point") );
	time	= mkCN( mkN nonhuman (mkN "time") );
	summer	= mkCN( mkN nonhuman (mkN "summer") );
	student	= mkCN( mkN human (mkN "student") );
	stage	= mkCN( mkN nonhuman (mkN "stage") );
	sports	= mkN nonExist "sports";
	song	= mkCN( mkN nonhuman (mkN "song") );
	prize	= mkCN( mkN nonhuman (mkN "prize") );
	piano	= mkCN( mkN nonhuman (mkN "piano") );
	party	= mkCN( mkN nonhuman (mkN "party") );
	parent	= mkCN( mkN human (mkN "parent") );
	language	= mkCN( mkN nonhuman (mkN "language") );
	kid	= mkCN( mkN human (mkN "kid") );
	junk_food	= mkN "junk food" nonExist;
	job	= mkCN( mkN nonhuman (mkN "job") );
	gym	= mkCN( mkN nonhuman (mkN "gym") );
	guitar	= mkCN( mkN nonhuman (mkN "guitar") );
	friends	= mkCN( mkN human (mkN "friends") );
	experience	= mkN "experience" nonExist;
	college_CN	= mkCN( mkN nonhuman (mkN "college") );
	college_N	= mkN "college" nonExist;
	choice	= mkCN( mkN nonhuman (mkN "choice") );
	brother	= mkCN( mkN human (mkN "brother") );
	backpacking	= mkN "backpacking" nonExist;

-- PN

	yiyun	= mkPN( mkN feminine (mkN "YiYun") );
	spanish	= mkPN( mkN nonhuman (mkN "Spanish") );
	sally	= mkPN( mkN human (mkN "Sally") );
	jacob	= mkPN( mkN masculine (mkN "Jacob") );
	henry	= mkPN( mkN masculine (mkN "Henry") );
	europe	= mkPN( mkN nonhuman (mkN "Europe") );
	debbie	= mkPN( mkN feminine (mkN "Debbie") );
	alex	= mkPN( mkN masculine (mkN "Alex") );

-- Prep

	without_COAGENTPREP	= mkPrep "without";
	with_COAGENTPREP	= mkPrep "with";
	with_RECIPIENTPREP	= mkPrep "with";
	to_PREP	= mkPrep "to";
	not_even_with_RECIPIENTPREP	= mkPrep "not even with";
	up_to_STIMULUSPREP	= mkPrep "up to";
	in_TIMEPREP	= mkPrep "in";
	in_LOCPREP	= mkPrep "in";
	for_STIMULUSPREP	= mkPrep "for";
	for_TIMEPREP	= mkPrep "for";
	for_THEMEPREP	= mkPrep "for";
	by	= mkPrep "by";
	at	= mkPrep "at";
	after	= mkPrep "after";
	about	= mkPrep "about";

-- Pron

	-- a_lot	= mkPron "a lot";
	-- too_much	= mkPron "too much";

-- Subj


-- V

	work_it_out np	= ComplSlashPartLast (V2Slash work_out) np;
	work_out_it	= work_out;
	wishes	= mkVS( mkV "wishes") ;
	lose_weight	= partV IrregEng.lose_V "weight";
	try	= mkVV( mkV "try") ;
	treat	= mkV2A( mkV "treat") noPrep;
	think_NP	= mkV2 IrregEng.think_V noPrep;
	think_S	= mkVS IrregEng.think_V ;
	study	= mkV2( mkV "study") noPrep;
	stop	= mkVV( mkV "stop") ;
	start	= mkVV( mkV "start") ;
	speak	= mkV2( mkV "speak") noPrep;
	sing	= mkV2( mkV "sing") noPrep;
	share	= mkV2( mkV "share") noPrep;
	regret	= mkVV( mkV "regret") ;
	realize	= mkVS( mkV "realize") ;
	reach	= mkV2( mkV "reach") noPrep;
	quit	= mkVV( mkV "quit") ;
	play	= mkV2( mkV "play") noPrep;
	make	= mkV2V( mkV "make") noPrep noPrep;
	love	= mkV2( mkV "love") noPrep;
	look_for	= mkV2( mkV "look") for_THEMEPREP;
	look_upto	= mkV2( mkV "look") up_to_STIMULUSPREP;
	learn	= mkVV( mkV "learn") ;
	join	= mkV2( mkV "join") noPrep;
	guess	= mkVS( mkV "guess") ;
	graduate	= mkV "graduate";
	go	= IrregEng.go_V;
	get_NP	= mkV2( mkV "get") noPrep;
	get_A	= mkVA( mkV "get") ;
	find	= mkVS( mkV "find") ;
	exercise	= mkV "exercise";
	eat	= mkV2( mkV "eat") noPrep;
	discover	= mkVS( mkV "discover") ;
	diet	= mkV "diet";
	could	= mkVV( mkV "could") ;
	cope	= mkV "cope";
	communicate	= mkV2( mkV "communicate") with_COAGENTPREP;
	bring	= mkV2( mkV "bring") noPrep;
	became	= mkVA( mkV "became") ;

}

-- vim: set ts=2 sts=2 sw=2 noet:
