abstract Candidate = MyAbstract ** {


  flags startcat = Utt ;

fun

	a_few	: Det;
	five	: Det;
	any_sg	: MassDet;
	any	: Det;
	a_lot_of_sg	: MassDet;
	a_lot_of	: Det;

	apply	: V2;
	choose	: V2;
	do	: V2;
	do_for	: V3;
	enjoy_V2	: V2;
	enjoy_ing	: VV;
	expand	: V;
	feel	: VS;
	get_to	: Motion;
	get	: V2;
	get_V2V	: V2V;
	go_on	: V2V;
	help_V2	: V2;
	help	: V2V;
	improve	: V2;
	increase	: V2;
	lead	: V2;
	like_to	: VV;
	like_ing	: VV;
	motivate	: V2;
	offer	: V2;
	a_lot_to_offer : NP;
	organize	: V2;
	respect	: V2;
	say	: VS;
	sell	: V2;
	should	: VV;
	start	: VV;
	take	: V2;
	tell	: V2V;
	think	: VS;
	try	: VV;
	try_hard	: VV;
	want	: VV;
	want_sb	: V2V;
	win	: V;
	work	: V;
	work_with	: V2;
	would	: VV;

	ambitious	: AP;
	bad	: AP;
	competitive	: AP;
	confident	: AP;
	difficult	: AP;
	difficult_to_work_with	: AP;
	fast	: AP;
	good	: AP;
	main	: AP;
	many	: AP;
	next	: AP;
	outgoing	: AP;
	patient	: AP;
	possible	: AP;
	realistic	: AP;
	successful	: AP;
	true	: AP;
	various	: AP;

	GoodMass: N -> N;
	ability	: N;
	administration_of_team	: N;
	aim	: CN;
	company	: CN;
	director	: CN;
	director_of	: N2;
	head	: CN;
	head_of	: N2;
	job	: CN;
	judgement	: N;
	learner	: CN;
	local_business_club	: CN;
	market	: PlaceName;
	market_share	: N;
	material	: N;
	person	: CN;
	personality	: CN;
	polish	: N;
	result	: CN;
	risk	: CN;
	safe_pair_of_hands	: CN;
	sales_experience	: N;
	sales_department	: PlaceName;
	sales_team	: CN;
	thing	: CN;
	time	: N;
	top	: PlaceName;
	training_course	: CN;
	year	: CN;

	well	: Style;
	better	: Style;
	hard	: Style;
	really	: Adv;
	slowly	: Adv;
	asap	: Style;
	amap	: Style;
	in_the_long_term	: Time;
	over_the_next_five_years	: Time;

	barbara	: PN;
	tadeusz	: PN;
	eva	: PN;
	drbean	: PN;
	fast_track	: PN;

	for	: Prep;
	by	: Prep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
