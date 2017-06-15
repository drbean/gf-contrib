--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete SleepEng of Sleep = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	here	= ParadigmsEng.mkAdv "here" ;
	also	= ParadigmsEng.mkAdV "also" ;

-- AP

	productive	= compoundA( mkA "productive") ;
	personal	= compoundA( mkA "personal") ;
	own	= compoundA( mkA "own") ;
	multiple	= compoundA( mkA "multiple") ;
	joyful	= compoundA( mkA "joyful") ;
	inspired	= compoundA (mkA "inspired");
	great	= compoundA( mkA "great") ;
	good	= mkA2( mkA "good") for;
	best	= mkA2( mkA "best") for;

-- Conj

	and	= mkConj "and";

-- Det

	enough	= mkDet( ParadigmsEng.mkQuant "enough" nonExist) singularNum;
	all	= ss "all";

-- N

	world	= mkCN( mkN nonhuman (mkN "world") );
	way	= mkN2( mkN nonhuman (mkN "way") ) to;
	sleep	= mkN "sleep" nonExist;
	power	= mkN2( mkN nonhuman (mkN "power") ) of_PREP;
	moment	= mkCN( mkN nonhuman (mkN "moment") );
	life	= mkCN( mkN nonhuman (mkN "life" "lives") );
	level	= mkCN( mkN nonhuman (mkN "level") );
	idea	= mkCN( mkN nonhuman (mkN "idea") );
	gratitude	= mkN "gratitude" nonExist;
	eye	= mkCN( mkN nonhuman (mkN "eye") );
	engine	= mkCN( mkN nonhuman (mkN "engine") );
	effectiveness	= mkN "effectiveness" nonExist;
	crisis	= mkCN( mkN nonhuman (mkN "crisis" "crises") );
	career	= mkCN( mkN nonhuman (mkN "career") );

-- PN

	arianna_huffington	= mkPN( mkN feminine (mkN "Arianna Huffington") );

-- Prep

	to	= mkPrep "to";
	on	= mkPrep "on";
	inside	= mkPrep "inside";
	in_LOCPREP	= mkPrep "in";
	for	= mkPrep "for";
	at	= mkPrep "at";

-- Pron


-- Subj

	as	= mkSubj "as";

-- V

	urge	= mkV2V( mkV "urge") noPrep to;
	tell	= mkV2S( mkV "tell") noPrep;
	shut	= mkV2( mkV "shut") noPrep;
	lie	= mkV2( mkV "lie") inside;
	get	= mkV2( mkV "get") noPrep;
	face	= mkV2( mkV "face") noPrep;
	discover	= mkV2( mkV "discover") noPrep;
	bring	= mkV2( mkV "bring") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
