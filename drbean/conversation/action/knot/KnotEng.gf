--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete KnotEng of Knot = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	somewhere_in_life	= ParadigmsEng.mkAdv "somewhere in life" ;
	somewhere_else	= ParadigmsEng.mkAdv "somewhere else" ;
	sometimes	= ParadigmsEng.mkAdv "sometimes" ;
	simply	= ParadigmsEng.mkAdV "simply" ;
	often	= ParadigmsEng.mkAdv "often" ;
	less	= less_CAdv ;
	down_ADV	= ParadigmsEng.mkAdv "down" ;

-- AP

	weak	= mkAP( mkA "weak") ;
	stronger	= mkAP( mkA "stronger") ;
	strong	= mkAP( mkA "strong") ;
	small	= mkAP( mkA "small") ;
	other	= mkAP( mkA "other") ;
	long	= mkAP( mkA "long") ;
	better	= mkAP( mkA "better") ;

-- Conj

	and	= mkConj "and";

-- Det

	our_DET	= mkDet we_Pron;
	not_only	= ss "not only";
	most_of	= ss "most of";

-- N

	way	= mkCN( mkN nonhuman (mkN "way") );
	strand	= mkCN( mkN nonhuman (mkN "strand") );
	shoe	= mkCN( mkN nonhuman (mkN "shoe") );
	result	= mkCN( mkN nonhuman (mkN "result") );
	knot	= mkCN( mkN nonhuman (mkN "knot") );
	form	= mkCN( mkN nonhuman (mkN "form") );
	direction	= mkCN( mkN nonhuman (mkN "direction") );
	cord	= mkCN( mkN nonhuman (mkN "cord") );
	bow	= mkCN( mkN nonhuman (mkN "bow") );
	base	= mkCN( mkN nonhuman (mkN "base") );
	axis	= mkCN( mkN nonhuman (mkN "axis") );
	advantage	= mkCN( mkN nonhuman (mkN "advantage") );

-- PN


-- Prep

	to_PREP	= mkPrep "to";
	down_PREP	= mkPrep "down";
	at	= mkPrep "at";
	around	= mkPrep "around";
	along	= mkPrep "along";

-- Pron


-- Subj


-- V

	yield	= mkV2( mkV "yield") noPrep;
	teach	= mkV2V( mkV "teach") noPrep to_PREP;
	start_over	= partV( mkV "start") "over";
	see	= mkVS( mkV "see") ;
	pull	= mkV2( mkV "pull") noPrep;
	look	= mkVA( mkV "look") ;
	let_V2A	= mkV2A( mkV "let") noPrep;
	orient	= reflV( mkV "orient");
	go	= mkV "go";
	get	= mkV2( mkV "get") noPrep;
	come_untied	= partV( mkV "come") "untied";

}

-- vim: set ts=2 sts=2 sw=2 noet: