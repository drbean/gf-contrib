--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete CommunicationEng of Communication = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	instead	= ParadigmsEng.mkAdv "instead" ;
	not	= ParadigmsEng.mkAdV "not" ;

-- AP

	single	= mkAP( mkA "single") ;
	relevant	= mkA2( mkA "relevant") to;

-- Conj

	but	= mkConj "but";
	and	= mkConj "and";

-- Det

	lots_of	= mkDet( ParadigmsEng.mkQuant "lots of" nonExist) singularNum;

-- N

	jargon	= mkN "jargon" nonExist;
	visual	= mkCN( mkN nonhuman (mkN "visual") );
	slide	= mkCN( mkN nonhuman (mkN "slide") );
	sentence	= mkCN( mkN nonhuman (mkN "sentence") );
	scientist	= mkCN( mkN human (mkN "scientist") );
	science	= mkN "science" nonExist;
	principle	= mkCN( mkN nonhuman (mkN "principle") );
	presentation	= mkCN( mkN nonhuman (mkN "presentation") );
	make_everything_as_simple_as_possible	= mkN "Make everything as simple as possible but not simpler" nonExist;
	bullet_point	= mkCN( mkN nonhuman (mkN "bullet point") );

-- PN

	einstein	= mkPN( mkN masculine (mkN "Einstein") );

-- Prep

	in_SOURCEPREP	= mkPrep "in";
	to	= mkPrep "to";
	on	= mkPrep "on";
	as	= mkPrep "as";

-- Pron


-- Subj

	when	= mkSubj "when";

-- V

	help	= mkV2V( mkV "help") noPrep to;
	follow	= mkV2( mkV "follow") noPrep;
	use	= mkV2( mkV "use") noPrep;
	understand	= mkV "understand";
	try	= mkVV( mkV "try") ;
	tell	= mkV3( mkV "tell") noPrep noPrep;
	talk	= mkV "talk";
	should	= ModalVV "should" "should" "should" "should" "should" ;
	must	= ModalVV "must" "must" "must" "must" "must" ;

}

-- vim: set ts=2 sts=2 sw=2 noet:
