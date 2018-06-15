--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete TriggerEng of Trigger = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	forever	= ParadigmsEng.mkAdv "forever" ;
	ever	= ParadigmsEng.mkAdV "ever" ;
	differently	= ParadigmsEng.mkAdv "differently" ;
	always	= ParadigmsEng.mkAdv "always" ;
	actually	= ParadigmsEng.mkAdA "actually" ;

-- AP

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

	experience	= mkN "experience" nonExist;
	college_CN	= mkCN( mkN nonhuman (mkN "college") );
	college_N	= mkN "college" nonExist;
	choice	= mkCN( mkN nonhuman (mkN "choice") );
	brother	= mkCN( mkN human (mkN "brother") );
	backpacking	= mkN "backpacking" nonExist;

-- PN

	europe	= mkPN( mkN nonhuman (mkN "Europe") );
	debbie	= mkPN( mkN feminine (mkN "Debbie") );
	alex	= mkPN( mkN masculine (mkN "Alex") );

-- Prep

	for	= mkPrep "for";
	for	= mkPrep "for";
	by	= mkPrep "by";
	at	= mkPrep "at";
	after	= mkPrep "after";
	about	= mkPrep "about";

-- Pron


-- Subj


-- V

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
