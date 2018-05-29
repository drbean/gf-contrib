--# -path=.:./engine:/home/drbean/GF/lib/src/translator:alltenses

concrete PersonalEng of Personal = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	good_A =  mkA "good" "better" "best" "well";

lin

-- Adv

	too	= ParadigmsEng.mkAdv "too" ;

-- AP

	shy	= mkAP( mkA "shy") ;
	second	= mkAP( mkA "second") ;
	red	= mkAP( mkA "red") ;
	professional	= mkAP( mkA "professional") ;
	only	= mkAP( mkA "only") ;
	nervous	= mkAP( mkA "nervous") ;
	first	= mkAP( mkA "first") ;
	few	= mkAP( mkA "few") ;
	expensive	= mkAP( mkA "expensive") ;
	electronic	= mkAP( mkA "electronic") ;
	different	= mkAP( mkA "different") ;
	busy	= mkAP( mkA "busy") ;
	good	= mkAP good_A ;
	best = mkAP( myOrdSuperl good_A);
	bad	= mkAP( mkA "bad" "worse" "worst" "badly") ;

-- Conj

	but	= mkConj "but";

-- Det

	one	= mkDet( mkCard (mkNumeral n1_Unit));

-- N

	woman	= mkCN( mkN human (mkN "woman" "women") );
	way	= mkCN( mkN nonhuman (mkN "way") );
	time_management	= mkN "time management" nonExist;
	thing_on	= mkN2( mkN nonhuman (mkN "thing") ) on;
	suggestion	= mkCN( mkN nonhuman (mkN "suggestion") );
	something_else	= mySomething (mkAP (mkA "else"));
	sister	= mkCN( mkN human (mkN "sister") );
	sign	= mkN2( mkN nonhuman (mkN "sign") ) of_PREP;
	self_help	= mkN "self-help" nonExist;
	schedule	= mkCN( mkN nonhuman (mkN "schedule") );
	reminder	= mkCN( mkN nonhuman (mkN "reminder") );
	problem	= mkCN( mkN nonhuman (mkN "problem") );
	polish	= mkN "polish" nonExist;
	nail_polish	= mkN "nail polish" nonExist;
	nailbiter	= mkCN( mkN human (mkN "nailbiter") );
	nail	= mkCN( mkN nonhuman (mkN "nail") );
	man	= mkCN( mkN human (mkN "man") );
	life	= mkCN( mkN nonhuman (mkN "life" "lives") );
	list	= mkCN( mkN nonhuman (mkN "list") );
	investment	= mkN2( mkN nonhuman (mkN "investment") ) in_PREP;
	idea	= mkCN( mkN nonhuman (mkN "idea") );
	hour	= mkCN( mkN nonhuman (mkN "hour") );
	help_N	= mkN "help" nonExist;
	habit	= mkCN( mkN nonhuman (mkN "habit") );
	finger	= mkCN( mkN nonhuman (mkN "finger") );
	fingernail	= mkCN( mkN nonhuman (mkN "fingernail") );
	everything	= mkN "everything" nonExist;
	device	= mkCN( mkN nonhuman (mkN "device") );
	day	= mkCN( mkN nonhuman (mkN "day") );
	consultant	= mkCN( mkN human (mkN "consultant") );
	club	= mkCN( mkN nonhuman (mkN "club") );
	book	= mkCN( mkN nonhuman (mkN "book") );
	birthday	= mkCN( mkN nonhuman (mkN "birthday") );
	anxiety	= mkN "anxiety" nonExist;
	activity	= mkCN( mkN nonhuman (mkN "activity") );

-- PN


-- Prep

	to	= mkPrep "to";
	on	= mkPrep "on";
	like	= mkPrep "like";
	into	= mkPrep "into";
	in_PREP	= mkPrep "in";
	from	= mkPrep "from";
	for	= mkPrep "for";
	before	= mkPrep "before";
	about	= mkPrep "about";

-- Pron


-- Subj


-- V

	wear	= mkV2( mkV "wear") noPrep;
	use	= mkV2( mkV "use") noPrep;
	try	= mkV2( mkV "try") noPrep;
	transfer_V3	= mkV3( mkV "transfer") noPrep into;
	think_V2V	= mkV2V( mkV "think") noPrep noPrep;
	think_VS	= mkVS( mkV "think") ;
	tap	= mkV2( mkV "tap") noPrep;
	talk	= mkV2( mkV "talk") to;
	stress_out	= partV( mkV "stress") "out";
	start	= mkVV( mkV "start") ;
	should	= ModalVV "should" "shouldn't" "should not";
	send	= mkV2( mkV "send") noPrep;
	say	= mkVS IrregEng.say_V ;
	remember	= mkV2( mkV "remember") noPrep;
	quit	= mkV2( mkV "quit") noPrep;
	program	= mkV2( mkV "program") noPrep;
	prioritize	= mkV2( mkV "prioritize") noPrep;
	organize	= mkV2( mkV "organize") noPrep;
	need	= mkVV( mkV "need") ;
	might	= ModalVV "might" "mightn't" "might not";
	meet	= mkV2 IrregEng.meet_V noPrep;
	make_V2A	= mkV2A IrregEng.make_V noPrep;
	make_V2V	= mkV2V IrregEng.make_V noPrep noPrep;
	make_V2	= mkV2 IrregEng.make_V noPrep;
	join	= mkV2( mkV "join") noPrep;
	help_V	= mkV2V( mkV "help") noPrep noPrep;
	go	= mkVV( mkV "go") ;
	get_done	= mkV2V( mkV "get_done") noPrep noPrep;
	get	= mkV2( mkV "get") noPrep;
	find_out	= partV( mkV "find") "out";
	find	= mkV2( mkV "find") noPrep;
	feel	= mkVS IrregEng.feel_V ;
	do	= mkV2 IrregEng.do_V noPrep;
	cause	= mkV2( mkV "cause") noPrep;
	bite	= mkV2( mkV "bite") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
