--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete TriggerEng of Trigger = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	on_own np	= ParadigmsEng.mkAdv "on " . np ! gen . " own";
	now	= ParadigmsEng.mkAdv "now";
	more	= ParadigmsEng.mkAdA "more" ;
	a_lot_	= ParadigmsEng.mkAdV "a lot " ;
	just	= ParadigmsEng.mkAdV "just" ;
	forever	= ParadigmsEng.mkAdv "forever" ;
	ever	= ParadigmsEng.mkAdV "ever" ;
	differently	= ParadigmsEng.mkAdv "differently" ;
	always	= ParadigmsEng.mkAdv "always" ;
	actually	= ParadigmsEng.mkAdA "actually" ;

-- AP

	last	= mkAP( mkA "last") ;
	healthy	= mkAP( mkA "healthy") ;
	good	= mkAP( mkA "good") ;
	first	= mkAP( mkA "first") ;
	few	= mkAP( mkA "few") ;
	envious	= mkAP( mkA "envious") ;
	dumbest	= mkAP( mkA "dumbest") ;
	difficult	= mkAP( mkA "difficult") ;
	different	= mkAP( mkA "different") ;
	determined	= mkA2( mkA "determined") to;
	confident	= mkAP( mkA "confident") ;
	close	= mkAP( mkA "close") ;
	capable	= mkA2( mkA "capable") of_PREP;
	breakthrough	= mkAP( mkA "breakthrough") ;
	amazing	= mkAP( mkA "amazing") ;
	18	= mkAP( mkA "18") ;

-- Conj


-- Det

	both	= ss "both";
	another	= mkDet( ParadigmsEng.mkQuant "another" nonExist) singularNum;
	all	= ss "all";

-- N

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

	jacob	= mkPN( mkN masculine (mkN "Jacob") );
	henry	= mkPN( mkN masculine (mkN "Henry") );
	europe	= mkPN( mkN nonhuman (mkN "Europe") );
	debbie	= mkPN( mkN feminine (mkN "Debbie") );
	alex	= mkPN( mkN masculine (mkN "Alex") );

-- Prep

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


-- Subj


-- V

	make	= mkV2V( mkV "make") noPrep noPrep;
	love	= mkV2( mkV "love") noPrep;
	lose	= mkV2( mkV "lose") noPrep;
	look	= mkV2( mkV "look") for_THEMEPREP;
	look	= mkV2( mkV "look") up_to_STIMULUSPREP;
	learn	= mkVV( mkV "learn") ;
	join	= mkV2( mkV "join") noPrep;
	guess	= mkVS( mkV "guess") ;
	graduate	= mkV "graduate";
	go	= mkV "go";
	get_NP	= mkV2( mkV "get") noPrep;
	get_A	= mkVA( mkV "get") ;
	find	= mkVS( mkV "find") ;
	exercise	= mkV "exercise";
	eat	= mkV2( mkV "eat") noPrep;
	discover	= mkVS( mkV "discover") ;
	diet	= mkV "diet";
	could	= mkVV( mkV "could") ;
	cope	= mkV "cope";
	communicate	= mkV2( mkV "communicate") with;
	bring	= mkV2( mkV "bring") noPrep;
	became	= mkVA( mkV "became") ;

}

-- vim: set ts=2 sts=2 sw=2 noet:
