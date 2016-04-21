--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean/speaking/alien/piggott:/home/drbean/GF/gf-contrib/drbean/speaking/alien/piggott/engine:present

concrete PiggottEng of Piggott = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	just_AdV	= mkAdV "just";
	on_Adv	= mkAdv "on";
	home	= mkAdv "home";
	later	= mkAdv "later";
	never	= mkAdv "never";
	out	= mkAdv "out";
	over	= mkAdv "over";
	together	= mkAdv "together";
	whatsoever	= mkAdv "whatsoever";
	back	= mkAdv "back";
-- AP

	country	= mkAP( mkA "country");
	emergency	= mkAP( mkA "emergency");
	famous	= mkAP( mkA "famous");
	gone	= mkAP( mkA "gone");
	invading	= mkAP( mkA "invading");
	mad	= mkAP( mkA "mad");
	only	= mkAP( mkA "only");
	strange	= mkAP( mkA "strange");
	unusual	= mkAP( mkA "unusual");
	big	= mkAP( mkA "big");
-- Det

	a_few	= mkDet(  mkQuant "a few" "a few");
	just	= ss "just";
	one	= mkDet(  mkNumeral n1_Unit );
	this	= mkDet this_Quant;
	all	= ss "all";
-- N

	each_other	= mkN "each other";
	news	= mkN "news";
	nothing	= mkN "nothing";
	recreation	= mkCN( mkN "recreation" );
	rubber	= mkN "rubber";
	scent	= mkN2( mkN "scent");
	something	=mkN2( mkN "something" ) to;
	car	= mkCN( mkN "car");
	direction	= mkCN( mkN "direction");
	doctor	= mkCN( mkN "doctor");
	drama	= mkCN( mkN "drama");
	end	= mkCN( mkN "end");
	family	= mkCN( mkN "family");
	hoax	= mkCN( mkN "hoax");
	house	= mkCN( mkN "house");
	huff	= mkCN( mkN "huff");
	idea	= mkCN( mkN "idea");
	man	= mkCN( mkN "man");
	martian	= mkCN( mkN "Martian") ;
	minute	= mkCN( mkN "minute");
	night	= mkCN( mkN "night");
	planet	= mkCN( mkN "planet");
	program	= mkCN( mkN "program");
	radio	= mkCN( mkN "radio");
	sense_of_humor	= mkCN( mkN "sense of humor");
	sin	= mkCN( mkN "sin");
	skeptic	= mkCN( mkN "skeptic");
	sound	= mkCN( mkN "sound");
	step_grandfather	= mkCN( mkN "step-grandfather");
	story	= mkCN( mkN "story");
	uncle	= mkCN( mkN "uncle");
	vanguard	= mkCN( mkN "vanguard");
	way	= mkCN( mkN "way");
	wife	= mkCN( mkN "wife");
	word	= mkCN( mkN "word");
	world	= mkCN( mkN "world");
	yard	= mkCN( mkN "yard");
	army	= mkCN( mkN "army");
	being	= mkCN( mkN "being");
	brake	= mkCN( mkN "brake");
	broadcast	= mkCN( mkN "broadcast");
	brother	= mkCN( mkN "brother");
	anytime	= mkN "anytime";
	anyone	= mkN "anyone";
	eleven_o_clock	= mkN "11 o'clock";
	nineteen_thirtyeight	= mkN "1938";
-- PN

	chevrolet_automobile	= mkPN( mkN feminine (mkN "Chevrolet automobile") );
	Doctor	= mkPN( mkN feminine (mkN "Doctor") );
	the_doctor	= mkPN( mkN feminine (mkN "the Doctor") );
	joe	= mkPN( mkN feminine (mkN "Joe") );
	mars	= mkPN( mkN feminine (mkN "Mars") );
	mercury_theater	= mkPN( mkN feminine (mkN "Mercury Theater") );
	new_jersey	= mkNP( mkPN( mkN nonhuman (mkN "New Jersey") ) );
	orson_welles	= mkPN( mkN feminine (mkN "Orson Welles") );
-- Prep

	from	= mkPrep "from";
	in_prep	= mkPrep "in";
	into	= mkPrep "into";
	on	= mkPrep "on";
	to	= mkPrep "to";
	to_coagent	= mkPrep "to";
	with_prep	= mkPrep "with";
	within	= mkPrep "within";
	around	= mkPrep "around";
	at	= mkPrep "at";
	about	= mkPrep "about";
-- V

	come	= mkV "come";
	confess	= mkV "confess";
	convince	= mkV2S(  mkV "convince" ) noPrep;
	drive	= mkV "drive";
	figure	= mkVS( mkV "figure");
	find	= mkVS( mkV "find");
	get_in	= mkV2( mkV "get" ) into;
	call	= mkV3( mkV "call");
	go_over	= partV( mkV "go") "over";
	hear	= mkVS( mkV "hear");
	involve	= mkV2 "involve";
	keep	= mkVV( mkV "keep");
	land	= mkV "land";
	listen	= mkV2( mkV "listen" "listens" "listened" "listened" "listening") to;
	leave	= mkV "leave";
	make	= mkV2 "make";
	react	= mkV2 "react";
	repeat	= mkV2 "repeat";
	repent	= mkV2 "repent";
	say	= mkV2 "say";
	see	= mkV3( mkV "see");
	smell	= ingV2V( mkV "smell") noPrep noPrep;
	talk	= mkV "talk";
	tell	= mkV2S(  mkV "tell" ) noPrep;
	tell_to	= mkV2V( mkV "tell" ) noPrep to;
	think	= mkVS( mkV "think");
	turn_on	= partV( mkV "turn") "on";
	get_up	= partV( mkV "get") "up";
	wait	= mkV2 "wait";
	walk_back_out	= partV( mkV "walk") "back out";
	begin	= ingVV( mkV "begin");
	burn	= mkV "burn";
	announce	= mkVS( mkV "announce");
}

-- vim: set ts=2 sts=2 sw=2 noet:
