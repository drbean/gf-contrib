--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete EnjoyEng of Enjoy = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	also	= mkAdv "also";
	in_flames	= mkAdv "in flames";

-- AP

	assistant	= mkAP( mkA "assistant") ;

-- Conj


-- Det

	every	= mkDet "every";

-- N

	attention	= mkN "attention" nonExist;
	basis	= mkCN( mkN "basis") ;
	captain	= mkCN( mkN "captain") ;
	conversation	= mkCN( mkN "conversation") ;
	courage	= mkN "courage" nonExist;
	day	= mkCN( mkN "day") ;
	head_of_development	= mkCN( mkN "head of development") ;
	difference	= mkN2( mkN "difference") in_PREP;
	dog	= mkCN( mkN "dog") ;
	fire_company	= mkCN( mkN "fire company") ;
	firefighter	= mkCN( mkN "firefighter") ;
	food	= mkN "food" nonExist;
	generosity	= mkN "generosity" nonExist;
	act	= mkN2( mkN "act") part_prep;

-- PN

	bezos	= mkPN( mkN feminine (mkN "Bezos") );

-- Prep

	at	= mkPrep "at";
	for	= mkPrep "for";
	from	= mkPrep "from";

-- Pron


-- Subj


-- V

	ask	= mkV2V( mkV "ask") ;
	call	= mkV3( mkV "call") noPrep noPrep;
	clean_up	= partV( mkV "clean") "up";
	get	= mkV3( mkV "get") noPrep noPrep;
	affect	= mkV2( mkV "affect") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
