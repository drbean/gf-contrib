--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete KnotEng of Knot = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	not_only_that	= ParadigmsEng.mkAdv "not only that" ;
	somewhere_in_life	= ParadigmsEng.mkAdv "somewhere in life" ;
	somewhere_else	= ParadigmsEng.mkAdv "somewhere else" ;
	sometimes	= ParadigmsEng.mkAdv "sometimes" ;
	simply	= ParadigmsEng.mkAdV "simply" ;
	often	= ParadigmsEng.mkAdv "often" ;
	less_often	= ParadigmsEng.mkAdv "less often" ;
	less	= ParadigmsEng.mkAdv "less" ;

-- AP

	transverse	= mkAP( mkA "transverse") ;
	weak	= mkAP( mkA "weak") ;
	stronger	= mkAP( mkA "stronger") ;
	strong	= mkAP( mkA "strong") ;
	small	= mkAP( mkA "small") ;
	other	= mkAP( mkA "other") ;
	long	= mkAP( mkA "long") ;
	down_ADJ	= mkAP( mkA "down") ;
	better	= mkAP( mkA "better") ;

-- Conj

	and	= mkConj "and";

-- Det

	most	= mkDet( ParadigmsEng.mkQuant nonExist "most") pluralNum;
	our_DET	= mkDet we_Pron;


-- N

	way	= mkCN( mkN nonhuman (mkN "way") );
	strand	= mkCN( mkN nonhuman (mkN "strand") );
	shoe	= mkCN( mkN nonhuman (mkN "shoe") );
	result	= mkCN( mkN nonhuman (mkN "result") );
	knot	= mkCN( mkN nonhuman (mkN "knot") );
	knot_PLACENOUN	= mkCN( mkN nonhuman (mkN "knot") );
	form	= mkN2( mkN nonhuman (mkN "form") ) of_PREP;
	direction	= mkCN( mkN nonhuman (mkN "direction") );
	cord	= mkCN( mkN nonhuman (mkN "cord") );
	bow	= mkCN( mkN nonhuman (mkN "bow") );
	bow_PLACENOUN	= mkCN( mkN nonhuman (mkN "bow") );
	base	= mkN2( mkN nonhuman (mkN "base") ) of_PREP;
	base_of_knot = Ofpos base (Item the_SG_DET knot);
	axis	= mkN2( mkN nonhuman (mkN "axis") ) of_PREP;
	axis_of_shoe	=Ofpos axis (Item the_SG_DET shoe);
	advantage	= mkCN( mkN nonhuman (mkN "advantage") );

-- PN


-- Prep

	under_PREP	= mkPrep "under";
	to_PREP	= mkPrep "to";
	down_PREP	= mkPrep "down";
	around_PREP	= mkPrep "around";
	along	= mkPrep "along";

-- Pron


-- Subj


-- V

	tie	= mkV2( mkV "tie") noPrep;
	yield	= mkV2( mkV "yield") noPrep;
	teach	= mkV2V( mkV "teach" "taught" "taught") noPrep to_PREP;
	start_over	= partV( mkV "start") "over";
	see	= mkVS( mkV "see") ;
	pull	= mkV2( mkV "pull") noPrep;
	look	= mkVA( mkV "look") ;
	let_V2A	= mkV2A( mkV "let") noPrep;
	orient	= reflV( mkV "orient");
	go	= mkV2( mkV "go") noPrep;
	get	= mkV2( mkV "get") noPrep;
	come_untied	= partV( mkV "come") "untied";

}

-- vim: set ts=2 sts=2 sw=2 noet:
