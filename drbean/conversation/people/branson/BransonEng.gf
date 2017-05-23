--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete BransonEng of Branson = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	treat	= mkV2( mkV "treat") noPrep;
	deal	= mkV2( mkV "deal") with_PREP;

lin

-- Adv

	well	= ParadigmsEng.mkAdv "well" ;
	very	= ParadigmsEng.mkAdA "very" ;
	fairly	= ParadigmsEng.mkAdv "fairly" ;
	differently	= ParadigmsEng.mkAdv "differently" ;
	actually	= ParadigmsEng.mkAdV "actually" ;

-- AP

	successful	= mkAP( mkA "successful") ;
	small	= mkAP( mkA "small") ;
	not_quite_the_same	= mkAP( mkA "not quite the same") ;
	other	= mkAP( mkA "other") ;
	best	= mkAP( mkA "best") ;

-- Conj

	and	= mkConj "and";

-- Det

	a_lot_of	= mkDet( ParadigmsEng.mkQuant "a lot of" nonExist) singularNum;

-- N

	world	= mkCN( mkN nonhuman (mkN "world") );
	way	= mkN2( mkN nonhuman (mkN "way") ) of_PREP;
	top	= mkCN( mkN "top") ;
	stereotype	= mkN2( mkN nonhuman (mkN "stereotype") ) of_PREP;
	reputation	= mkN "reputation" nonExist;
	life	= mkN "life" nonExist;
	industry	= mkCN( mkN nonhuman (mkN "industry") );
	fun_time	= mkN "fun" nonExist;
	company	= mkCN( mkN nonhuman (mkN "company") );
	businessperson	= mkCN( mkN human (mkN "businessperson") );
	business_leader	= mkCN( mkN human (mkN "business leader") );
	all	= mkNP(mkN "all" nonExist);

-- PN

	virgin	= mkPN( mkN nonhuman (mkN "Virgin") );
	branson	= mkPN( mkN masculine (mkN "Branson") );

-- Prep

	with_PREP	= mkPrep "with" ;
	to	= mkPrep "to";
	on	= mkPrep "on";
	in_PREP	= mkPrep "in";
	for	= mkPrep "for";
	as_a_result_of	= mkPrep "as a result of";
	all_over	= mkPrep "all over";

-- Pron


-- Subj

	if	= mkSubj "if";

-- V

	work	= mkV "work";
	work_for	= mkV2( mkV "work") for;
	Treat np well = VP_Adv_manner ( mkVP treat np ) well;
	tread	= mkV2( mkV "tread") all_over;
	think	= mkVS( mkV "think") ;
	take_on	= mkV2( partV( mkV "take") "on" ) noPrep;
	Take_on pron	= myPartLast (mkVP take_on pron);
	shake_up	= mkV2( partV( mkV "shake") "up" ) noPrep;
	say	= mkVS( mkV "say") ;
	run	= mkV2( mkV "run") noPrep;
	like	= mkVV( mkV "like") ;
	go_in	= partV( mkV "go") "in";
	get	= mkV2( mkV "get") to;
	enjoy	= mkV2( mkV "enjoy") noPrep;
	do	= mkV2( mkV "do") noPrep;
	Deal_with np well	= VP_Adv_manner ( mkVP deal np ) well;
	come_back	= partV( mkV "come") "back";
	become	= mkV2( mkV "become") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
