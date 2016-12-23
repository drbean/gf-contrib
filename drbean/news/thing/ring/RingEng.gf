--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete RingEng of Ring = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	also	= ParadigmsEng.mkAdA "also" ;

-- AP

	worth	= mkA2( mkA "worth") noPrep;
	poor	= mkAP( mkA "poor") ;
	dead	= mkAP( mkA "dead") ;

-- Conj

	but	= mkConj "but";

-- Det


-- N

	widow	= mkCN( mkN human (mkN "widow") );
	wedding_ring	= mkCN( mkN nonhuman (mkN "wedding" (mkN "ring") ) );
		ring	= mkCN( mkN nonhuman (mkN "ring") );
		husband	= mkCN( mkN human (mkN "husband") );
		child	= mkCN( mkN human (mkN "child" "children") );
		USD21_000	= mkN "$21,000" nonExist;
		USD1_850	= mkN "$1,850" nonExist;

-- PN

	salvation_army	= mkPN( mkN nonhuman (mkN "the Salvation Army") );
	renee	= mkPN( mkN feminine (mkN "Renee") );
	gerta	= mkPN( mkN feminine (mkN "Gerta") );

-- Prep

	for_GOALPREP	= mkPrep "for";
	to	= mkPrep "to";

-- Pron


-- Subj


-- V

	want	= mkV2( mkV "want") noPrep;
	want_to	= mkV2V( mkV "want") noPrep to;
	return_to	= mkV3( mkV "return") to noPrep;
	return	= mkV3( mkV "return") noPrep to;
	help	= mkV2( mkV "help") noPrep;
	give_to	= mkV3( mkV "give") noPrep to;
	give	= mkV3( mkV "give") noPrep noPrep;
	belong	= mkV2( mkV "belong") to;

}

-- vim: set ts=2 sts=2 sw=2 noet:
