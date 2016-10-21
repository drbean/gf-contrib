--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete PovertyEng of Poverty = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	two_CARD	= mkCard (mkNumeral n2_Unit);
	ten_CARD	= mkCard (mkNumeral  "10");

lin

-- Adv

	then	= ParadigmsEng.mkAdv "then" ;
	then	= ParadigmsEng.mkAdv "then";
	still	= ParadigmsEng.mkAdv "still";
	so	= ParadigmsEng.mkAdv "so";
	really	= ParadigmsEng.mkAdv "really";
	not	= ParadigmsEng.mkAdv "not";
	no_longer	= ParadigmsEng.mkAdv "no longer";

-- AP

	total	= mkAP( mkA "total") ;
	second	= mkAP( mkA "second") ;
	poor_A	= mkA "poor";
	poor	= mkAP poor_A ;
	old	= mkAP( mkA "old") ;
	married	= mkAP( mkA "married") ;
	low_cost	= mkAP( mkA "low-cost") ;
	good	= mkAP( mkA "good") ;
	first	= mkAP( mkA "first") ;
	eighteen	= mkAP( mkA "eighteen") ;
	dead	= mkAP( mkA "dead") ;
	blessed	= mkA2( mkA "blessed") with_PREP;

-- Conj

	and	= mkConj "and";
	or	= mkConj "or";
	but	= mkConj "but";

-- Det

	two	= mkDet two_CARD;
	ten	= mkDet ten_CARD;
	many	= mkDet (mkQuant nonExist "many") pluralNum;
	fifty	= mkDet( mkNumeral "50");
	fourhundred	= mkDet( mkNumeral  "400" );

-- IAdv

	no_matter_how	= ss "no matter how";

-- N

	year	= mkCN( mkN "year") ;
	woman	= mkCN( mkN "woman" "women") ;
	value	= mkCN( mkN "value") ;
	twenty_one	= mkN "twenty-one" nonExist;
	time	= mkN "time" nonExist;
	shanty	= mkCN( mkN "shanty") ;
	sewing_machine	= mkCN( mkN "sewing machine") ;
	savings	= mkCN( mkN nonExist "savings") ;
	rent	= mkN "rent" nonExist;
	percent	= mkN2( mkN "percent") part_prep;
	patient	= mkCN( mkN "patient") ;
	organization	= mkCN( mkN "organization") ;
	nairobi	= mkCN( mkN "Nairobi") ;
	mortgage	= mkCN( mkN "mortgage") ;
	money	= mkN "money" nonExist;
	mom	= mkCN( mkN "mom") ;
	mathare_valley	= mkCN( mkN "Mathare Valley") ;
	man	= mkCN( mkN "man") ;
	husband	= mkCN( mkN "husband") ;
	ball_gown	= mkCN( mkN "ball gown") ;
	frills_and_ribbons	= mkN "frills and ribbons" nonExist;
	everything	= mkN "everything" nonExist;
	dream	= mkCN( mkN "dream") ;
	dollar	= mkCN( mkN "dollar") ;
	doctor	= mkCN( mkN "doctor") ;
	housing_development	= mkCN( mkN "housing development") ;
	definition	= mkCN( mkN "definition") ;
	daughter	= mkCN( mkN "daughter") ;
	child	= mkCN( mkN "child" "children") ;
	business	= mkN "business" nonExist;
	aids	= mkN "AIDS" nonExist;

-- PN

	jane	= mkPN( mkN feminine (mkN "Jane") );
	jamii_bora	= mkPN( mkN feminine (mkN "Jamii Bora") );

-- Prep

	with_PREP	= mkPrep "with";
	to	= mkPrep "to";
	over	= mkPrep "over";
	outside	= mkPrep "outside";
	into	= mkPrep "into";
	for	= mkPrep "for";
	by	= mkPrep "by";
	about	= mkPrep "about";

-- Pron


-- Subj

	before	= mkSubj "before";

-- V

	do	= mkV2( mkV "do") noPrep;
	tell	= mkV2S( mkV "tell") noPrep;
	start	= mkV2( mkV "start") noPrep;
	spend	= mkV2V( mkV "spend") noPrep to;
	serve	= mkV "serve";
	sell	= mkV3( mkV "sell") noPrep to;
	say	= mkVS( mkV "say") ;
	save	= mkV2( mkV "save") noPrep;
	repurpose	= mkV2( mkV "repurpose") noPrep;
	pay	= mkV3( mkV "pay") noPrep in_PREP;
	move	= mkV2( mkV "move") into;
	match	= mkV3( mkV "match") noPrep to;
	marry	= mkV2( mkV "marry") noPrep;
	live	= mkV2( mkV "live") in_PREP;
	lend	= mkV3( mkV "lend") noPrep noPrep;
	lend_to	= mkV3( mkV "lend") noPrep to;
	leave	= mkV2( mkV "leave") noPrep;
	hear	= mkV2( mkV "hear") about;
	give	= mkV2( mkV "give") noPrep;
	get	= mkVA( mkV "get") ;
	feel	= mkVA( mkV "feel") ;
	die	= mkV "die";
	counsel	= mkV2( mkV "counsel") noPrep;
	buy	= mkV2( mkV "buy") noPrep;
	build	= mkV2( mkV "build") noPrep;
	borrow	= mkV2( mkV "borrow") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
