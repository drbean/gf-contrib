abstract Dickson = MyAbstract ** {


  flags startcat = Utt ;

fun

	two	: Det;
	several	: Det;
	about	: Predet;

	for_prep	: Prep;

	-- PassV2V	: VPSlash -> VP;
	-- Slash	: V2V -> VP -> VPSlash;
	allow	: V2V;
	do	: VA;
	get_along	: V2;
	get	: V2;
	get_3	: V3;
	give	: V3;
	go	: V2;
	have	: V2;
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
	need_V2	: V2;
	need_VV	: VV;
	prove	: VP;
	slow_down	: V;
	start	: VV;
	take	: V2V;
	take_away	: V3;
	tell_to	: V2V;
	think	: VS;
	want	: VV;
	work_V	: V;
	work_with	: V2;

	bad	: AP;
	better	: AP;
	first	: AP;
	here_to_work	: AP;
	little	: AP;
	too_little	: AP;
	mad	: AP;
	hard	: AP;

	next_Monday	: Adv;

	apprentice	: CN;
	child	: CN;
	dad	: CN;
	electrician	: CN;
	end	: CN;
	family	: CN;
	father	: CN;
	father_2	: N2;
	graduation	: CN;
	guy	: CN;
	husband	: CN;
	husband_2	: N2;
	interviewer : CN;
	job	: CN;
	kind	: CN;
	knack	: CN;
	life	: NP;
	man_CN	: CN;
	man_N	: N;
	money	: NP;
	night	: CN;
	position	: CN;
	raise	: CN;
	school	: CN;
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
	word	: CN;
	work	: NP;

	uncle_alf	: PN;
	alf	: PN;
	dee	: PN;
	monday	: PN;

}

-- vim: set ts=2 sts=2 sw=2 noet:
