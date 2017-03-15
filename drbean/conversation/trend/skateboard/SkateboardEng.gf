--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete SkateboardEng of Skateboard = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	anywhere	= ParadigmsEng.mkAdv "anywhere" ;

-- AP

	novel	= mkAP( mkA "novel") ;
	normal	= mkAP( mkA "normal") ;
	interesting	= mkAP( mkA "interesting") ;
	electric	= mkAP( mkA "electric") ;
	different	= mkAP( mkA "different") ;

-- Conj

	but	= mkConj "but";
	and	= mkConj "and";

-- Det

	some	= mkDet( ParadigmsEng.mkQuant nonExist "some") pluralNum;
	fifteen	= mkDet( ParadigmsEng.mkQuant nonExist "fifteen") pluralNum;
	every	= mkDet( ParadigmsEng.mkQuant "every" nonExist) singularNum;
	one_thousand	= mkDet( ParadigmsEng.mkQuant nonExist "1,000") pluralNum;

-- N

	word	= mkCN( mkN nonhuman (mkN "word") );
	vehicle	= mkCN( mkN nonhuman (mkN "vehicle") );
	skateboard	= mkCN( mkN nonhuman (mkN "skateboard") );
	perspective	= mkCN( mkN nonhuman (mkN "perspective") );
	people	= mkCN( mkN human (mkN "people") );
	wall_outlet	= mkCN( mkN nonhuman (mkN "wall outlet") );
	motorcycle	= mkCN( mkN nonhuman (mkN "motorcycle") );
	minute	= mkCN( mkN nonhuman (mkN "minute") );
	kilometer	= mkCN( mkN nonhuman (mkN "kilometer") );
	electricity	= mkN "electricity" nonExist;
	dollar	= mkN2( mkN nonhuman (mkN "dollar") ) part_prep;
	day	= mkCN( mkN nonhuman (mkN "day") );
	concept	= mkCN( mkN nonhuman (mkN "concept") );
	car	= mkCN( mkN nonhuman (mkN "car") );
	bicycle	= mkCN( mkN nonhuman (mkN "bicycle") );

-- PN

	sanjay	= mkPN( mkN masculine (mkN "Sanjay") );

-- Prep

	with_PREP	= mkPrep "with";
	on	= mkPrep "on";
	off	= mkPrep "off";
	like	= mkPrep "like";
	less_than	= mkPrep "less than";
	in_PREP	= mkPrep "in";
	from	= mkPrep "from";
	for	= mkPrep "for";
	about	= mkPrep "about";

-- Pron


-- Subj

	when	= mkSubj "when";
	if	= mkSubj "if";

-- V

	weigh	= mkV2( mkV "weigh") less_than;
	use	= mkV2( mkV "use") noPrep;
	think	= mkV2( mkV "think") about;
	run	= mkV3( mkV "run") noPrep for;
	hear	= mkV2( mkV "hear") noPrep;
	demonstrate	= mkV2( mkV "demonstrate") noPrep;
	create	= mkV2( mkV "create") noPrep;
	charge	= mkV2( mkV "charge") noPrep;
	carry	= mkV3( mkV "carry") noPrep with_PREP;
	approach	= mkV3( mkV "approach") noPrep from;

}

-- vim: set ts=2 sts=2 sw=2 noet:
