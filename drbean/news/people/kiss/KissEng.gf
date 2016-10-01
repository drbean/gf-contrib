--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete KissEng of Kiss = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	not	= mkAdv "not";

-- AP

	second	= mkAP( mkA "second") ;
	earlier	= mkAP( mkA "earlier") ;
	different	= mkAP( mkA "different") ;
	able	= mkAP( mkA "able") ;

-- Conj

	but	= mkConj "but";
	and	= mkConj "and";

-- Det


-- N

	arrest_N	= mkN2( mkN "arrest") of_PREP;
	theater	= mkCN( mkN "theater") ;
	report_N	= mkCN( mkN "report") ;
	police	= mkN "police" nonExist;
	disturbance	= mkCN( mkN "disturbance") ;
	camera	= mkCN( mkN "camera") ;

-- PN

	shia	= mkPN( mkN feminine (mkN "Shia") );
	mario	= mkPN( mkN feminine (mkN "Mario") );
	erykah	= mkPN( mkN feminine (mkN "Erykah") );

-- Prep

	to	= mkPrep "to";
	in_PREP	= mkPrep "in";
	for	= mkPrep "for";
	by	= mkPrep "by";

-- Pron


-- Subj

	as	= mkSubj "as";

-- V

	try	= mkVV( mkV "try") ;
	report_V	= mkV2( mkV "report") noPrep;
	let_V2V	= mkV2V( mkV "let") noPrep noPrep;
	kiss	= mkV2( mkV "kiss") noPrep;
	interview	= mkV2( mkV "interview") noPrep;
	go	= mkV "go";
	find	= mkV2( mkV "find") noPrep;
	escape	= mkV2( mkV "escape") noPrep;
	create	= mkV2( mkV "create") noPrep;
	continue	= mkV2( mkV "continue") noPrep;
	avoid	= mkV2( mkV "avoid") noPrep;
	arrest	= mkV2( mkV "arrest") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
