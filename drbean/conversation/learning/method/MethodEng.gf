--# -path=.:./engine:/home/drbean/GF/lib/src/translator:alltenses

concrete MethodEng of Method = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	through = mkPrep "through";
	side	= mkN nonhuman (mkN "side");
	card_N	= mkCN( mkN nonhuman (mkN "card") );

lin

-- Adv

	often	= ParadigmsEng.mkAdv "often" ;
	in_common	= ParadigmsEng.mkAdv "in common" ;
	by_heart	= ParadigmsEng.mkAdv "by heart" ;
	best	= ParadigmsEng.mkAdv "best" ;
	always	= ParadigmsEng.mkAdv "always" ;

-- AP

	other	= mkAP( mkA "other") ;
	only	= mkAP( mkA "only") ;
	new	= mkAP( mkA "new") ;
	key	= mkAP( mkA "key") ;

-- Conj


-- Det

	or_so	= ss "or so";
	one	= mkDet( mkCard (mkNumeral n1_Unit));
	every	= mkDet( ParadigmsEng.mkQuant "every" nonExist) singularNum;
	at_least	= ss "at least";

-- N

	word	= mkCN( mkN nonhuman (mkN "word") );
	week	= mkCN( mkN nonhuman (mkN "week") );
	way	= mkN2( mkN nonhuman (mkN "way") ) to_PREP;
	vocabulary	= mkN "vocabulary" nonExist;
	verb	= mkCN( mkN nonhuman (mkN "verb") );
	study_card	= mkCN( mkN nonhuman (mkN "study card") );
	spare_time	= mkN "spare time" nonExist;
	side_LOC	= mkCN side;
	side_N2	= mkN2 side;
	sentence	= mkCN( mkN nonhuman (mkN "sentence") );
	room	= mkCN( mkN nonhuman (mkN "room") );
	record	= mkN2( mkN nonhuman (mkN "record") ) of_PREP;
	piece	= mkN2( mkN nonhuman (mkN "piece") ) part_prep;
	paper	= mkN "paper" nonExist;
	pieces_of_paper	= Item zero_Det_pl (Ofpos piece (MassItem zero_Det_sg paper));
	noun	= mkCN( mkN nonhuman (mkN "noun") );
	night	= mkCN( mkN nonhuman (mkN "night") );
	meaning	= mkCN( mkN nonhuman (mkN "meaning") );
	list	= mkCN( mkN nonhuman (mkN "list") );
	language	= mkCN( mkN nonhuman (mkN "language") );
	information	= mkN2( mkN nonhuman (mkN "information") ) about;
	example	= mkCN( mkN nonhuman (mkN "example") );
	computer	= mkCN( mkN nonhuman (mkN "computer") );
	cd	= mkCN( mkN nonhuman (mkN "CD") );
	category	= mkCN( mkN nonhuman (mkN "category") );
	card_LOC	= card_N;
	card	= card_N;
	accent	= mkCN( mkN nonhuman (mkN "accent") );

-- PN

	won_gyu	= mkPN( mkN masculine (mkN "Won-gyu") );
	wanda	= mkPN( mkN feminine (mkN "Wanda") );
	manny	= mkPN( mkN masculine (mkN "Manny") );
	kelly	= mkPN( mkN feminine (mkN "Kelly") );
	english	= mkPN( mkN nonhuman (mkN "English") );

-- Prep

	in_LOCPREP	= mkPrep "in";
	with_PREP	= mkPrep "with";
	to_PREP	= mkPrep "to";
	on	= mkPrep "on";
	into	= mkPrep "into";
	by	= mkPrep "by";
	at	= mkPrep "at";
	about	= mkPrep "about";

-- Pron


-- Subj

	whether	= mkSubj "whether";
	whenever	= mkSubj "whenever";
	when	= mkSubj "when";
	until	= mkSubj "until";
	before	= mkSubj "before";

-- V

	write	= mkV2( mkV "write") noPrep;
	use	= mkV2( mkV "use") noPrep;
	Go_through np	= mkVP( mkV2( mkV "go") through ) np;
	study	= mkV2( mkV "study") noPrep;
	stick	= mkV3( mkV "stick") noPrep on;
	say	= mkVS( IrregEng.say_V ) ;
	put_down	= mkV2( partV( mkV "put") "down" ) noPrep;
	organize_V3	= mkV3( mkV "organize") noPrep into;
	organize	= mkV2( mkV "organize") noPrep;
	memorize	= mkV2( mkV "memorize") noPrep;
	look	= mkV2( mkV "look") at;
	listen	= mkV2( mkV "listen" "listened") to_PREP;
	learn_V	= mkV "learn";
	learn	= mkV2( mkV "learn") noPrep;
	keep	= mkV2( mkV "keep") noPrep;
	include	= mkV2( mkV "include") noPrep;
	improve	= mkV2( mkV "improve") noPrep;
	go_to_sleep	= partV( mkV "go") "to sleep";
	come_across	= partV( mkV "come") "across";
	believe	= mkVS( mkV "believe") ;
	ask	= mkV2Q( mkV "ask") noPrep;
	add	= mkV3( mkV "add") noPrep to_PREP;

}

-- vim: set ts=2 sts=2 sw=2 noet:
