abstract Dickson = MyAbstract ** {


  flags startcat = Utt ;

fun

	for_prep	: Prep;

	-- PassV2V	: VPSlash -> VP;
	-- Slash	: V2V -> VP -> VPSlash;
	allow	: V2V;
	get_along	: V2;
	give	: V3;
	go	: V2;
	have	: V2;
	hire	: V2;
	interview	: V2;
	laugh	: V;
	-- let	: V2;
	lift	: V2;
	look	: VA;
	make	: V2A;
	need	: V2;
	need_VV	: VV;
	prove	: V2;
	slow_down	: V;
	start	: VV;
	take	: V2V;
	tell_to	: V2V;
	think	: VS;
	work_V	: V;
	work_with	: V2;

	bad	: AP;
	better	: AP;
	first	: AP;
	little	: AP;
	too_little	: AP;
	mad	: AP;
	hard	: AP;

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
	man	: CN;
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
