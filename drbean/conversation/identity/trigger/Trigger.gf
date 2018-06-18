abstract Trigger = MyAbstract ** {


  flags startcat = Utt ;

fun

-- Adv

	very	: AdA;
	together	: Adv_copatient;
	suddenly	: AdV;
	in_school	: Adv_location;
	right_away	: Adv_time;
	really	: AdA;
	pretty	: AdA;
	On_own	: NP -> Adv_manner;
	now	: Adv_time;
	just	: AdV;
	forever	: Adv;
	ever	: AdV;
	differently	: Adv;
	always	: AdV;
	actually	: AdA;

-- AP

	unforgettable	: AP;
	twin_A	: AP;
	top	: AP;
	thin	: AP;
	shy	: AP;
	proud	: A2;
	outgoing	: AP;
	last	: AP;
	healthy	: AP;
	good	: AP;
	first	: AP;
	few	: AP;
	envious	: AP;
	dumbest	: AP;
	difficult	: AP;
	different	: AP;
	determined	: A2;
	confident	: AP;
	close	: AP;
	capable	: A2;
	breakthrough	: AP;
	amazing	: AP;
	eighteen	: AP;

-- Conj


-- Det

	three	: Det;
	both	: Postdet;
	another	: Det;
	all	: Predet;

-- N

	week	: CN;
	way	: CN;
	twin_N	: CN;
	turning_point	: CN;
	time	: CN;
	summer	: CN;
	student	: CN;
	stage	: CN;
	sports	: N;
	song	: CN;
	prize	: CN;
	piano	: CN;
	party	: CN;
	parent	: CN;
	language	: CN;
	kid	: CN;
	junk_food	: N;
	job	: CN;
	gym	: CN;
	guitar	: CN;
	friends	: CN;
	experience	: N;
	college_CN	: PlaceNoun;
	college_N	: N;
	choice	: CN;
	brother	: CN;
	backpacking	: N;

-- PN

	yiyun	: PN;
	spanish	: PN;
	sally	: PN;
	jacob	: PN;
	henry	: PN;
	europe	: PN;
	debbie	: PN;
	alex	: PN;

-- Prep

	without_COAGENTPREP	: CoagentPrep;
	with_COAGENTPREP	: CoagentPrep;
	with_RECIPIENTPREP	: RecipientPrep;
	to_PREP	: Prep;
	to_LOCPREP	: LocPrep;
	not_even_with_RECIPIENTPREP	: RecipientPrep;
	up_to_STIMULUSPREP	: StimulusPrep;
	in_TIMEPREP	: TimePrep;
	in_LOCPREP	: LocPrep;
	for_STIMULUSPREP	: StimulusPrep;
	for_TIMEPREP	: TimePrep;
	for_THEMEPREP	: ThemePrep;
	by	: Prep;
	at	: Prep;
	after	: Prep;
	about	: Prep;

-- Pron

	a_lot	: Pron;
	too_much	: Pron;

-- Subj


-- V

	work_it_out	: NP -> VP;
	work_out_it	: V2;
	wishes	: VS;
	lose_weight	: V;
	try	: VV;
	treat	: V2A;
	think_S	: VS;
	think_NP	: V2;
	study	: V2;
	stop	: VV;
	start	: VV;
	speak	: V2;
	sing	: V2;
	share	: V2;
	regret	: VV;
	realize	: VS;
	reach	: V2;
	quit	: VV;
	play	: V2;
	make	: V2V;
	love	: V2;
	look_upto	: V2;
	look_for	: V2;
	learn	: VV;
	join	: V2;
	guess	: VS;
	graduate	: V;
	go	: V;
	get_NP	: V2;
	get_A	: VA;
	find	: VS;
	exercise	: V;
	eat	: V2;
	discover	: VS;
	diet	: V;
	could	: VV;
	cope	: V;
	communicate	: V2;
	bring	: V2;
	became	: VA;
}

-- vim: set ts=2 sts=2 sw=2 noet:
