--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean/conversation/work/smallwood:/home/drbean/GF/gf-contrib/drbean/conversation/work/smallwood/engine:present

concrete SmallwoodEng of Smallwood = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	home	= mkAdv "home";
	a_hundred_percent	= mkAdv "a hundred percent";
	later	= mkAdv "later";
	for_fifteen_minutes	= mkAdv "for 15 minutes";
	on_a_dress = mkAdv "on a dress";
	this_much	= mkAdv "this much";
-- AP

	first	= mkAP( mkA "first");
	hard	= mkAP( mkA "hard");
	impossible	= mkAP( mkA "impossible");
	miserable	= mkAP( mkA "miserable");
	old	= mkAP( mkA "old");
	pink	= mkAP( mkA "pink");
	red	= mkAP( mkA "red");
	second_year	= mkAP( mkA "second year");
	short	= mkAP( mkA "short");
	terrible	= mkAP( mkA "terrible");
	pink_a	= mkAP( mkA "pink_A");
	red_a	= mkAP( mkA "red_A");
-- Det

one = mkDet (mkCard (mkNumeral n1_Unit));

-- IP

how_many = mkIP how8many_IDet;

-- N

	beginning	= mkCN( mkN "beginning");
	class	= mkCN( mkN "class");
	class_participation	= mkN "class participation";
	course	= mkCN( mkN "course");
	decision	= mkCN( mkN "decision");
	desk	= mkCN( mkN "desk");
	dress	= mkCN( mkN "dress");
	big_block_geometric_squares	= mkCN( mkN nonExist "big block geometric squares");
	guy	= mkCN( mkN "guy");
	heels	= mkCN( mkN nonExist "heels");
	idea	= mkCN( mkN "idea");
	accounting	= mkN "accounting";
	business_law	= mkN "business law";
	college	= mkN "college";
	everything	= mkN "everything";
	finance	= mkN "finance";
	interview_n	= mkCN( mkN "interview");
	life	= mkN "life";
	fifteen_minutes	= mkN "15 minutes";
	work	= mkN "work";
	pink_n	= mkN "pink";
	red_n	= mkN "red";
	job	= mkCN( mkN "job");
	letter	= mkCN( mkN "letter");
	man	= mkCN( mkN "man");
	mini_dress	= mkCN( mkN "mini-dress");
	mother	= mkCN( mkN "mother");
	question	= mkCN( mkN "question");
	shade	= mkN2( mkN "shade");
	sleeve	= mkCN( mkN "sleeve");
	square	= mkCN( mkN "square");
	thing	= mkCN( mkN "thing");
	tights	= mkCN( mkN nonExist "tights");
	wife	= mkCN( mkN "wife");
	woman	= mkCN( mkN "woman");
	worker	= mkCN( mkN "worker");
-- PN

	douglass	= mkPN( mkN nonhuman (mkN "Douglass") );
	tia	= mkPN( mkN feminine (mkN "Tia") );
	mr_payne	= mkPN( mkN masculine (mkN "Mr Payne") );
	mr_batchelor	= mkPN( mkN masculine (mkN "Mr Batchelor") );

-- Prep

	for_time = mkPrep "for";
	on	= mkPrep "on";
	over	= mkPrep "over";
	to	= mkPrep "to";

-- Sentence

-- I_dont_need_this = mkS (mkCl "I don't need this job this much.");
-- I_hope_you_are_prepared = mkS (mkCl "I hope you are prepared, Ms. Casciato, because the most difficult question of the period will be yours.");
-- Ms_Casciato_you_are = mkS (mkCl "Ms. Casciato, you are the only woman who has ever gotten this far in my class. And I will make sure every day is a living hell for you.");
-- Stand_up_and_turn_around = mkS (mkCl "Stand up and turn around.");
-- Do_you_stay_home = mkS (mkCl "Do you stay home?");
-- Do_you_work = mkS (mkCl "Do you work?");
-- What_do_you_do_with_your_children = mkS (mkCl "What do you do with your children?");
-- What_are_you_talking_about = mkS (mkCl "What are you talking about?");
-- You_need_to_stand_up_and_turn_around = mkS (mkCl "You need to stand up and turn around.");
-- Youre_hired = mkS (mkCl "You're hired.");

-- V

	apply	= mkV2 "apply";
	go	= mkV2 "go";
	grade	= mkV2( mkV "grade");
	graduate	= mkV2 "graduate";
	have_on	= mkV2 (partV IrregEng.have_V "on");
	interview_v	= mkV2 "interview";
	know	= mkV2 "know";
	lean	= mkVP( mkV "lean");
	like	= mkV2 "like";
	love	= mkV2 "love";
	make	= mkV2 "make";
	own	= mkV2 "own";
	say	= mkVS( mkV "say");
	smile	= mkV "smile";
	start	= mkVV( mkV "start");
	stand_up	= partV( mkV "stand") "up";
	hire	= mkV2 "hire";
	tell	= mkV2V( mkV "tell") noPrep to_prep;
	turn_around	= partV( mkV "turn") "around";
	need_VV	= mkVV( mkV "need");
	need_V2	= mkV2 "need";
	study	= mkV2 "study";
	take	= mkV2 "take";
	think	= mkVS( mkV "think");
	used	= mkVV( mkV "used");
	walk_in	= partV( mkV "walk") "in";
	write	= mkV2 "write";
}

-- vim: set ts=2 sts=2 sw=2 noet:
