--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean:./gf-contrib/drbean/business/careers/tip:present

concrete SmallwoodEng of Smallwood = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

lin

-- Adv

	home	= mkAdv "home";
	a_hundred_percent	= mkAdv "a hundred percent";
	later	= mkAdv "later";
-- AP

	first	= mkAP( mkA "first");
	hard	= mkAP( mkA "hard");
	impossible.	= mkAP( mkA "impossible.");
	miserable	= mkAP( mkA "miserable");
	old	= mkAP( mkA "old");
	pink	= mkAP( mkA "pink");
	red	= mkAP( mkA "red");
	second_year	= mkAP( mkA "second year");
	short	= mkAP( mkA "short");
	terrible	= mkAP( mkA "terrible");
-- Det

one = (mkDet this_Quant (mkCard (mkNumeral n1_Unit))))

-- IP

how_many = mkIP ("how many");

-- N

	beginning	= mkCN( mkN "beginning");
	class	= mkCN( mkN "class");
	course	= mkCN( mkN "course");
	decision	= mkCN( mkN "decision");
	desk	= mkCN( mkN "desk");
	dress	= mkCN( mkN "dress");
	geometric_squares	= mkCN( mkN "geometric squares");
	guy	= mkCN( mkN "guy");
	heels	= mkCN( mkN "heels");
	idea	= mkCN( mkN "idea");
	accounting	= mkN "accounting";
	business_law	= mkN "business law";
	college	= mkN "college";
	everything	= mkN "everything";
	finance	= mkN "finance";
	interview_n	= mkCN( mkN "interview_N");
	life	= mkN "life";
	15_minutes	= mkN "15 minutes";
	participation	= mkN "participation";
	work	= mkN "work";
	job	= mkCN( mkN "job");
	letter	= mkCN( mkN "letter");
	man	= mkCN( mkN "man");
	mini_dress	= mkCN( mkN "mini-dress");
	mother	= mkCN( mkN "mother");
	question	= mkCN( mkN "question");
	sleeve	= mkCN( mkN "sleeve");
	square	= mkCN( mkN "square");
	thing	= mkCN( mkN "thing");
	tights	= mkCN( mkN nonExist "tights");
	wife.	= mkCN( mkN "wife.");
	woman	= mkCN( mkN "woman");
	worker	= mkCN( mkN "worker");
-- PN

	douglass	= mkPN( mkN feminine (mkN "Douglass") );
	tia:	= mkPN( mkN feminine (mkN "Tia:") );
-- Prep

	on	= mkPrep "on";
	over	= mkPrep "over";
	to	= mkPrep "to";

-- Sentence

I_dont_need_this_job_this_much = mkS "I don't need this job this much.";
I_hope_you_are_prepared_Ms_Casciato_because_the_most_difficult_question_of_the_period_will_be_yours = mkS "I hope you are prepared, Ms. Casciato, because the most difficult question of the period will be yours.";
Ms_Casciato_you_are_the_only_woman_who_has_ever_gotten_this_far_in_my_class_And_I_will_make_sure_every_day_is_a_living_hell_for_you = mkS "Ms. Casciato, you are the only woman who has ever gotten this far in my class. And I will make sure every day is a living hell for you.";
Stand_up_and_turn_around = mkS "Stand up and turn around.";
Do_you_stay_home = mkS "Do you stay home?";
Do_you_work = mkS "Do you work?";
What_do_you_do_with_your_children = mkS "What do you do with your children?";
What_are_you_talking_about = mkS "What are you talking about?";
You_need_to_stand_up_and_turn_around = mkS "You need to stand up and turn around.";
Youre_hired = mkS "You're hired.";

-- V

	apply	= mkV2 "apply";
	go	= mkV2 "go";
	grade	= mkV3( mkV "grade");
	graduate	= mkV2 "graduate";
	interview_v	= mkV2 "interview_V";
	have	= mkV2 "have";
	know	= mkV2 "know";
	lean	= mkV "lean";
	like	= mkV2 "like";
	love	= mkV2 "love";
	make	= mkV2 "make";
	own	= mkV2 "own";
	say	= mkVS( mkV "say");
	smile	= mkV "smile";
	start	= mkVV( mkV "start");
	stand_up	= mkV "stand up";
	study	= mkV2 "study";
	take	= mkV2 "take";
	think	= mkVS( mkV "think");
	used	= mkVV( mkV "used");
	write	= mkV2 "write";
}

-- vim: set ts=2 sts=2 sw=2 noet:
