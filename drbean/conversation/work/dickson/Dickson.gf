abstract Dickson = MyAbstract ** {


  flags startcat = Utt ;

fun

	AdjModified	: AP -> VP -> AP;
	the_first	: Det;
	two	: Det;
	several	: Det;
	about	: Predet;

	for_prep	: Prep;

	-- PassV2V	: VPSlash -> VP;
	-- Slash	: V2V -> VP -> VPSlash;
	allow	: V2V;
	do	: VA;
	do_2	: V2;
	find	: V2V;
	get_along	: V2;
	get	: V2;
	get_3	: V3;
	give	: V3;
	go	: V2;
	have_V2	: V2;
	have_VV	: VV;
	hire	: V2;
	interview	: V2;
	laugh	: V;
	let_V2V	: V2V;
	lift	: V2;
	like_2	: V2;
	like_that	: VS;
	like_to	: VV;
	look	: VA;
	make_V2A	: V2A;
	make_V2V	: V2V;
	must_VV	: VV;
	need_V2	: V2;
	need_VV	: VV;
	prove	: VP;
	slow_down	: V;
	say	: VS;
	see	: V2;
	start	: VV;
	take	: V2V;
	take_away	: V3;
	tell	: V2S;
	tell_to	: V2V;
	think	: VS;
	want	: VV;
	work_V	: V;
	work_with	: V2;

	at_the_shipyard	: AP;
	eighty_pound	: AP;
	bad	: AP;
	good	: AP;
	different	: A;
	little	: AP;
	too_little	: AP;
	mad	: AP;
	hard	: AP;
	same	: AP;

	a_little	: CAdv;
	ever_v	: Adv;
	ever_V	: AdV;
	next_Monday	: Adv;
	on_time	: Adv;
	per_week	: Period;
	right	: Adv;

	apprentice	: CN;
	electrician	: CN;
	family	: CN;
	father	: CN;
	father_2	: N2;
	graduation	: NP;
	guy	: CN;
	husband	: CN;
	husband_2	: N2;
	interviewer : CN;
	job	: CN;
	-- knack	: CN;
	life	: NP;
	man_CN	: CN;
	man_N	: N;
	money	: NP;
	night	: CN;
	position	: CN;
	raise	: CN;
	school	: NP;
	ship	: CN;
	shipyard	: CN;
	stuff	: NP;
	superintendent	: CN;
	supervisor	: CN;
	thing	: CN;
	time	: NP;
	top	: CN;
	transformer	: CN;
	uncle	: CN;
	uncle_2	: N2;
	way	: CN;
	week	: CN;
	woman	: CN;
	work	: NP;

	superintendent_title	: Title;
	supervisor_title	: Title;

	uncle_alf	: PN;
	alf	: PN;
	dee	: PN;
	monday	: PN;

}

-- vim: set ts=2 sts=2 sw=2 noet:
