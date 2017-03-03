--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete AutismEng of Autism = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	nullPrep = mkPrep "";
	myMoment : Cl -> NP =
		\cl -> myCltoNP "the moment" cl;

lin

-- Adv

	MomentAdv cl = ConstructorsEng.mkAdv nullPrep (myMoment cl);

-- AP

	wrong	= mkAP( mkA "wrong") ;
	ultimate	= mkAP( mkA "ultimate") ;
	normal	= mkAP( mkA "normal") ;
	extraordinary	= mkAP( mkA "extraordinary") ;
	different	= mkAP( mkA "different") ;

-- Conj

	and	= mkConj "and";

-- Det

	one	= mkDet( mkCard (mkNumeral n1_Unit));

-- N

	one_N2 = mkN2 "one";
	someone	= mkN "someone" nonExist;
	sacrifice	= mkN2( mkN nonhuman (mkN "sacrifice") ) of_PREP;
	pursuit	= mkN2( mkN nonhuman (mkN "pursuit") ) of_PREP;
	progress	= mkN "progress" nonExist;
	potential	= mkN "potential" nonExist;
	normality	= mkN "normality" nonExist;
	moment	= mkCN( mkN nonhuman (mkN "moment") );
	love	= mkN "love" nonExist;
	individuality	= mkN "individuality" nonExist;
	greatness	= mkN "greatness" nonExist;
	chance	= mkN2( mkN nonhuman (mkN "chance") ) for;
	fact	= mkCN( mkN nonhuman (mkN "fact") );
	difference	= mkCN( mkN nonhuman (mkN "difference") );
	communication	= mkN "communication" nonExist;
	change_N	= mkN "change" nonExist;
	brother	= mkCN( mkN human (mkN "brother") );
	beauty	= mkN "beauty" nonExist;

-- PN

	faith	= mkPN( mkN feminine (mkN "Faith") );

-- Prep

	to	= mkPrep "to";
	like	= mkPrep "like";
	for	= mkPrep "for";
	about	= mkPrep "about";

-- Pron


-- Subj

	if	= mkSubj "if";

-- V

	would	= ModalVV "be possible to" "would" "been possible to" "being possible to" "wouldn't" "would not";
	want	= mkVV( mkV "want") ;
	try	= mkVV( mkV "try") ;
	tell	= mkV2S( mkV "tell") noPrep;
	teach	= mkV3( mkV "teach") noPrep about;
	realize	= mkVS( mkV "realize") ;
	overlook	= mkV2( mkV "overlook") noPrep;
	mean	= mkVS( mkV "mean") ;
	have_to	= mkVV( mkV "have") ;
	give	= mkV3( mkV "give") noPrep noPrep;
	die	= mkV "die";
	could	= mkVV( mkV "could") ;
	communicate	= mkV3( mkV "communicate") noPrep to;
	change	= mkV2( mkV "change") noPrep;
	ask	= mkV2V( mkV "ask") noPrep to;

}

-- vim: set ts=2 sts=2 sw=2 noet:
