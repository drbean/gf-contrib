--# -path=.:/home/drbean/GF/gf-contrib/drbean:./gf-contrib/drbean/business/careers/candidate:present

concrete CandidateEng of Candidate = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude in {

oper

	director_N	= mkN masculine (mkN "director");
	head_N	= mkN human (mkN "head");
	like_V	= mkV "like";
	enjoy_V	= mkV "enjoy";
	work_V	= mkV "work";
	a_lot =  mkQuant  "a lot of" "a lot of" "a lot" "a lot";

lin

	five = mkDet( mkCard (mkNumeral n5_Unit));
	a_few = mkDet( mkQuant nonExist "a few") pluralNum;
	any_sg = mkDet( mkQuant nonExist "any") singularNum;
	any = mkDet( mkQuant nonExist "any") pluralNum;
	many = many_Det;
	a_lot_of_sg	= mkDet a_lot singularNum;
	a_lot_of	= mkDet a_lot pluralNum;

	ambitious	= mkAP( mkA "ambitious");
	bad	= mkAP( mkA "bad");
	competitive	= mkAP( mkA "competitive");
	confident	= mkAP( mkA "confident");
	difficult	= mkAP( mkA "difficult");
	difficult_to_work_with = mkAP difficult (mkVP (V2Slash work_with));
	fast	= mkAP( mkA "fast");
	good	= mkAP( mkA "good" "better" "best" "well");
	hard	= mkAP( mkA "hard");
	main	= mkAP( mkA "main");
	next	= mkAP( mkA "next");
	outgoing	= mkAP( mkA "outgoing");
	patient	= mkAP( mkA "patient");
	polish_A	= mkAP( mkA "Polish" );
	possible	= mkAP( mkA "possible");
	realistic	= mkAP( mkA "realistic");
	successful	= mkAP( mkA "successful");
	true	= mkAP( mkA "true");
	various	= mkAP( mkA "various");

	barbara	= mkPN( mkN feminine (mkN "Barbara") );
	tadeusz	= mkPN( mkN masculine (mkN "Tadeusz") );
	eva	= mkPN( mkN feminine (mkN "Eva") );
	drbean	= mkPN( mkN masculine (mkN "Dr Bean") );
	fast_track	= mkPN( mkN nonhuman (mkN "Fast-Track") );
	polish_N	= mkPN( mkN nonhuman (mkN "Polish" ) );

	ability	= mkN "ability";
	administration	= mkN "administration";
	aim	= mkCN( mkN "aim");
	company	= mkCN( mkN "company");
	department	= mkCN( mkN "department");
	director	= mkCN director_N;
	director_of = mkN2 director_N of_prep;
	head	= mkCN head_N;
	head_of	= mkN2 head_N of_prep;
	job	= mkCN( mkN "job");
	judgement	= mkN "judgement";
	learner	= mkCN( mkN "learner");
	local_business_club	= mkCN( mkN "local business club");
	market	= mkCN( mkN "market");
	market_share	= mkCN( mkN "market share");
	material	= mkN "material";
	person	= mkCN( mkN "person" "people");
	personality	= mkCN( mkN "personality");
	result	= mkCN( mkN "result");
	risk	= mkCN( mkN "risk");
	safe_pair_of_hands	= mkCN( mkN "safe pair of hands");
	sales_experience	= mkN "sales experience";
	sales_team	= mkCN( mkN "sales team");
	thing	= mkCN( mkN "thing");
	time	= mkN "time";
	top	= mkCN( mkN "top");
	training_course	= mkCN( mkN "training course");
	year	= mkCN( mkN "year");

	apply	= mkV2 "apply" "for";
	choose	= mkV2 "choose";
	enjoy_ing	= ingVV enjoy_V;
	enjoy_V2	= mkV2 enjoy_V;
	expand	= mkV "expand";
	feel	= mkVS feel_V;
	get_to = mkVP get_V;
	get = mkV2 get_V;
	get_V2V  = mkV2V get_V noPrep to_Prep;
	have	= mkV2 have_V;
	improve	= mkV2 "improve";
	increase	= mkV2 "increase";
	like_to	= mkVV like_V;
	like_ing	= ingVV like_V;
	motivate	= mkV2 "motivate";
	offer	= mkV2 "offer";
	a_lot_to_offer = mkNP( mkCN( mkN "a lot to offer"));
	organize	= mkV2 "organize";
	respect	= mkV2 "respect";
	say	= mkVS say_V;
	start	= ingVV( mkV "start");
	take	= mkV2 take_V;
	tell	= mkV3 tell_V;
	think	= mkVS IrregEng.think_V;
	try	= ingVV( mkV "try");
	want	= mkVV( mkV "want");
	win	= mkV "win";
	work	= work_V;
	work_with	= mkV2 work_V with_prep;

	really	= mkAdv "really";
	slowly	= mkAdv "slowly";
	asap	= mkAdv "as soon as possible";
	amap	= mkAdv "as much as possible";
	in_the_long_term	= mkAdv "in the long term";

	for	= mkPrep "for";
	by	= mkPrep "by";
}

-- vim: set ts=2 sts=2 sw=2 noet:
