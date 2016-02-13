--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean:./gf-contrib/drbean/business/careers/candidate:present

concrete CandidateEng of Candidate = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	ModalVV	: Str -> Str -> Str -> Str -> Str ->
		{s : R.VVForm => Str; p : Str; typ : R.VVType } =
		\inf, pres, pp, prespp, presN -> {
		s = table {
			R.VVF R.VInf	=> inf ;
			R.VVF R.VPres => pres;
			R.VVF R.VPPart	=> pp ;
			R.VVF R.VPresPart	=> prespp ;
			-- R.VVF R.VPast	=> past ;
			-- R.VVPastNeg	=> pastN ;
			R.VVPresNeg	=> presN
			} ;
		p = [];
		typ	= R.VVAux;
		lock_VV = {}
		};
	administration_N	= mkN "administration" nonExist;
	director_N	= mkN masculine (mkN "director");
	head_N	= mkN human (mkN "head");
	material_N	= mkN "material";
	like_V	= mkV "like";
	do_V	= IrregEng.do_V;
	enjoy_V	= mkV "enjoy";
	help_V	= mkV "help";
	try_V	= mkV "try";
	work_V	= mkV "work";
	a_lot =  mkQuant  "a lot of" "a lot of" "a lot" "a lot";
	good_A	= mkA "good" "better" "best" "well";

lin

	five = mkDet( mkCard (mkNumeral n5_Unit));
	a_few = mkDet( mkQuant nonExist "a few") pluralNum;
	any_sg = mkDet( mkQuant "any" nonExist) singularNum;
	any = mkDet( mkQuant nonExist "any") pluralNum;
	a_lot_of_sg	= mkDet a_lot singularNum;
	a_lot_of	= mkDet a_lot pluralNum;

	ambitious	= mkAP( mkA "ambitious");
	bad	= mkAP( mkA "bad");
	competitive	= mkAP( mkA "competitive");
	confident	= mkAP( mkA "confident");
	difficult = mkAP( mkA "difficult");
	difficult_to_work_with = mkAP( mkA "difficult to work with");
	fast	= mkAP( mkA "fast");
	good	= mkAP good_A;
	main	= mkAP( mkA "main");
	many = mkAP( mkA "many");
	next	= mkAP( mkA "next");
	outgoing	= mkAP( mkA "outgoing");
	patient	= mkAP( mkA "patient");
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

	GoodMass n = mkN "good" n;
	ability	= mkN "ability";
	administration_of_team	= mkN "administration of the sales team";
	aim	= mkCN( mkN "aim");
	company	= mkCN( mkN "company");
	director	= mkCN director_N;
	director_of = mkN2 director_N of_prep;
	head	= mkCN head_N;
	head_of	= mkN2 head_N of_prep;
	job	= mkCN( mkN "job");
	judgement	= mkN "judgement";
	learner	= mkCN( mkN "learner");
	local_business_club	= mkCN( mkN "local business club");
	market	= mkCN( mkN "market");
	market_share	= mkN "market share";
	material	= mkN "Fast-Track" material_N;
	person	= mkCN( mkN "person" "people");
	personality	= mkCN( mkN "personality");
	polish	= mkN "Polish";
	result	= mkCN( mkN "result");
	risk	= mkCN( mkN "risk");
	safe_pair_of_hands	= mkCN( mkN "safe pair of hands");
	sales_department	= mkCN( mkN "sales department");
	sales_experience	= mkN "sales experience";
	sales_team	= mkCN( mkN "sales team");
	thing	= mkCN( mkN "thing");
	time	= mkN "time";
	top	= mkCN( mkN "top");
	training_course	= mkCN( mkN "training course");
	year	= mkCN( mkN "year");

	apply	= mkV2 "apply" for;
	choose	= mkV2 "choose";
	do	= mkV2 do_V;
	do_for	= mkV3 do_V noPrep for;
	enjoy_ing	= ingVV enjoy_V;
	enjoy_V2	= mkV2 enjoy_V;
	expand	= mkV "expand";
	feel	= mkVS feel_V;
	get_to = mkVP get_V;
	get = mkV2 get_V;
	get_V2V  = mkV2V get_V noPrep to_Prep;
	go_on	= mkV2V go_V on_Prep to_Prep;
	have	= mkV2 have_V;
	help_V2	= mkV2 help_V;
	help	= mkV2V help_V noPrep noPrep;
	improve	= mkV2 "improve";
	increase	= mkV2 "increase";
	lead	= mkV2 "lead";
	like_to	= mkVV like_V;
	like_ing	= ingVV like_V;
	motivate	= mkV2 "motivate";
	offer	= mkV2 "offer";
	a_lot_to_offer = mkNP( mkCN( mkN "a lot to offer"));
	organize	= mkV2 "organize";
	respect	= mkV2 "respect";
	say	= mkVS say_V;
	sell	= mkV2 IrregEng.sell_V;
	should = ModalVV "should" "should" nonExist nonExist "shouldn't";
	start	= ingVV( mkV "start");
	take	= mkV2 take_V;
	tell	= mkV2V tell_V noPrep to_Prep;
	think	= mkVS IrregEng.think_V;
	try	= mkVV try_V;
	try_hard = mkVV (partV try_V "hard");
	want	= mkVV( mkV "want");
	want_sb	= mkV2V( mkV "want") noPrep to_Prep;
	win	= mkV "win";
	work	= work_V;
	work_with	= mkV2 work_V with_prep;
	would = ModalVV "would" "would" nonExist nonExist "wouldn't";

	well	= mkAdv "well";
	better	= mkAdv "better";
	hard	= mkAdv "hard";
	really	= mkAdv "really";
	slowly	= mkAdv "slowly";
	asap	= mkAdv "as soon as possible";
	amap	= mkAdv "as much as possible";
	in_the_long_term	= mkAdv "in the long term";
	over_the_next_five_years	= mkAdv "over the next five years";

	for	= mkPrep "for";
	by	= mkPrep "by";
}

-- vim: set ts=2 sts=2 sw=2 noet:
