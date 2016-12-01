--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete ThanksgivingEng of Thanksgiving = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	well	= ParadigmsEng.mkAdv "well" ;
	then	= ParadigmsEng.mkAdV "then" ;
	also	= ParadigmsEng.mkAdV "also" ;

-- AP

	same	= mkAP( mkA "same") ;
	math	= mkAP( mkA "math") ;
	farm_board	= mkAP( mkA "Farm Board") ;

-- Conj

	but	= mkConj "but";
	and	= mkConj "and";

-- Det

	other	= mkDet( ParadigmsEng.mkQuant "other" nonExist) singularNum;
	each	= mkDet( ParadigmsEng.mkQuant "each" nonExist) singularNum;

-- N

	year	= mkCN( mkN nonhuman (mkN "year") );
	turkey	= mkCN( mkN nonhuman (mkN "turkey") );
	tension	= mkN "tension" nonExist;
	story	= mkCN( mkN nonhuman (mkN "story") );
	reporter	= mkCN( mkN human (mkN "reporter") );
	critic	= mkCN( mkN human (mkN "critic") );
	report	= mkCN( mkN nonhuman (mkN "report") );
	reader	= mkCN( mkN human (mkN "reader") );
	price	= mkN2( mkN nonhuman (mkN "price") ) of_PREP;
	press_release	= mkCN( mkN nonhuman (mkN "press release") );
	paper	= mkCN( mkN nonhuman (mkN "paper") );
	newspaper	= mkCN( mkN nonhuman (mkN "newspaper") );
	mistake	= mkCN( mkN nonhuman (mkN "mistake") );
	market	= mkCN( mkN nonhuman (mkN "market") );
	dinner	= mkCN( mkN nonhuman (mkN "dinner") );
	cost	= mkN2( mkN nonhuman (mkN "cost") ) of_PREP;

-- PN

	the_farm_board	= mkPN( mkN nonhuman (mkN "the Farm Board") );
	thanksgiving	= mkPN( mkN nonhuman (mkN "Thanksgiving") );

-- Prep

	to	= mkPrep "to";
	on	= mkPrep "on";
	about	= mkPrep "about";
	in_PREP	= mkPrep "in";

-- Pron


-- Subj

	because	= mkSubj "because";

-- V

	write	= mkV2( mkV "write") noPrep;
	go	= mkV2( mkV "go") to;
	go_up	= partV( mkV "go") "up";
	think	= mkV2( mkV "think") about;
	take	= mkV2( mkV "take") noPrep;
	send	= mkV3( mkV "send") noPrep to;
	sell	= mkV2( mkV "sell") noPrep;
	say	= mkVS( mkV "say") ;
	make	= mkV2( mkV "make") noPrep;
	interest	= mkV2( mkV "interest") noPrep;
	go_down	= partV( mkV "go") "down";
	find	= mkV2( mkV "find") noPrep;
	add	= mkV3( mkV "add") noPrep to;

}

-- vim: set ts=2 sts=2 sw=2 noet:
