--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete BlairEng of Blair = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv


-- AP

	own	= mkAP( mkA "own") ;
	missing	= mkA2( mkA "missing") in_LOCPREP;

-- Conj


-- Det

	another	= mkDet( ParadigmsEng.mkQuant "another" nonExist) singularNum;

-- N

	texas	= mkNP( mkCN( mkN "Texas") ) ;
	story	= mkCN( mkN nonhuman (mkN "story") );
	soldier	= mkCN( mkN human (mkN "soldier") );
	newspaper	= mkCN( mkN "newspaper") ;
	the_new_york_times	= mkNP( mkCN( mkN "the New York Times") );
	mother	= mkCN( mkN human (mkN "mother") );
	iraq	= mkCN( mkN "Iraq") ;
	intern	= mkCN( mkN human (mkN "intern") );
	information	= mkN "information" nonExist;
	home_state	= mkCN( mkN "home state") ;
	editor	= mkCN( mkN human (mkN "editor") );

-- PN

	the_times	= mkNP( mkPN( mkN nonhuman (mkN "the Times") ) );
	blair	= mkPN( mkN masculine (mkN "Blair") );
	raines	= mkPN( mkN masculine (mkN "Raines") );
	hernandez	= mkPN( mkN feminine (mkN "Hernandez" nonExist "Hernandez'" nonExist ) );

-- Prep

	with_COAGENT	= mkPrep "with";
	to	= mkPrep "to";
	in_LOCPREP	= mkPrep "in";
	from	= mkPrep "from";
	for	= mkPrep "for";
	at	= mkPrep "at";
	as	= mkPrep "as";

-- Pron


-- Subj


-- V

	leave	loc = myVPPlus( mkVP( mkV "leave")) (loc.s ! R.NCase R.Nom);
	work loc	= myVPPlus( mkVP(  mkV "work" )) loc.s;
	tell	= mkV2( mkV "tell") noPrep;
	interview	= mkV2( mkV "interview") noPrep;
	fire	= mkV2( mkV "fire") noPrep;
	copy	= mkV3( mkV "copy") noPrep for;

}

-- vim: set ts=2 sts=2 sw=2 noet:
