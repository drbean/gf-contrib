--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete MarshmallowEng of Marshmallow = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	in_trouble	= ParadigmsEng.mkAdv "in trouble" ;
	there	= ParadigmsEng.mkAdv "there" ;
	there_ADV	= ParadigmsEng.mkAdv "there" ;
	still	= ParadigmsEng.mkAdA "still" ;
	still_there	= ConstructorsEng.mkAdv still there_ADV;
	most	= ParadigmsEng.mkAdA "most" ;
	already	= ParadigmsEng.mkAdV "already" ;
	alone	= ParadigmsEng.mkAdv "alone" ;

-- AP

	successful	= mkAP( mkA "successful") ;
	important	= mkAP( mkA "important") ;
	happy	= mkAP( mkA "happy") ;
	great	= mkAP( mkA "great") ;
	good	= mkAP( mkA "good") ;
	follow_up	= mkAP( mkA "follow-up") ;
	bad	= mkAP( mkA "bad") ;

-- Conj

	or	= mkConj "or";
	and	= mkConj "and";

-- Det

	four	= mkDet( mkCard (mkNumeral n4_Unit));
	fifteen	= mkDet( ParadigmsEng.mkQuant nonExist "fifteen") pluralNum;
	fourteen_and_a_half	= mkDet( ParadigmsEng.mkQuant nonExist "fourteen-and-a-half") pluralNum;
	fourteen	= mkDet( ParadigmsEng.mkQuant nonExist "fourteen") pluralNum;
	two	= mkDet( mkCard (mkNumeral n2_Unit));
	three	= mkDet( mkCard (mkNumeral n3_Unit));
	one	= mkDet( mkCard (mkNumeral n1_Unit));

-- N

	four_NP	= mkNP zero_Det_sg ( mkN "four" nonExist ) ;
	two_NP	= mkNP( mkCN( mkN nonExist "two") ) ;
	year	= mkCN( mkN "year") ;
	teacher	= mkCN( mkN "teacher") ;
	success	= mkN "success" nonExist;
	study	= mkCN( mkN "study") ;
	student	= mkCN( mkN "student") ;
	skirt	= mkCN( mkN "skirt") ;
	self_discipline	= mkN "self-discipline" nonExist;
	school	= mkCN( mkN "school") ;
	room	= mkCN( mkN "room") ;
	relationship	= mkN2( mkN "relationship") with_PREP;
	professor	= mkCN( mkN "professor") ;
	principle	= mkN2( mkN "principle") of_PREP;
	plan	= mkCN( mkN "plan") ;
	percentage	= mkN2( mkN "percentage") part_prep;
	pants	= mkCN( mkN nonExist "pants") ;
	minute	= mkCN( mkN "minute") ;
	marshmallow	= mkCN( mkN "marshmallow") ;
	kid	= mkCN( mkN "kid") ;
	gratification	= mkN "gratification" nonExist;
	grade	= mkCN( mkN "grade") ;
	a_few	= mkNP( mkCN( mkN nonExist "a few") ) ;
	factor	= mkN2( mkN "factor") in_PREP;
	factor_for	= mkN2( mkN "factor") for;
	door	= mkCN( mkN "door") ;
	college	= mkN "college" nonExist;
	child	= mkCN( mkN "child" "children") ;
	ability	= mkCN( mkN "ability") ;

-- PN


-- Prep

	with_PREP	= mkPrep "with";
	to	= mkPrep "to";
	out_of	= mkPrep "out of";
	later	= mkPost "later";
	in_PREP	= mkPrep "in";
	in_LOCPREP	= mkPrep "in";
	for	= mkPrep "for";
	at	= mkPrep "at";
	at_THEMEPREP	= mkPrep "at";

-- Pron


-- Subj

	if	= mkSubj "if";
	as_soon_as	= mkSubj "as soon as";
	after	= mkSubj "after";

-- V

	understand	= mkV2( mkV "understand") noPrep;
	tell	= mkV2S( mkV "tell") noPrep;
	return	= mkV "return";
	play	= mkV2( mkV "play") with_PREP;
	make_it	= mkV2( partV( mkV "make") "it") to;
	look	= mkV2( mkV "look") at;
	leave	= mkV3( mkV "leave") noPrep with_PREP;
	last	= mkV2( mkV "last") noPrep;
	get	= mkV2( mkV "get") noPrep;
	find	= mkVS( mkV "find") ;
	eat	= mkV2( mkV "eat") noPrep;
	drop_out	= partV( mkV "drop") "out";
	delay	= mkV2( mkV "delay") noPrep;
	close	= mkV2( mkV "close") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
