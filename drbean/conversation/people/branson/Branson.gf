abstract Branson = MyAbstract ** {


  flags startcat = Utt ;

fun

-- Adv

	well	: Adv_manner;
	very	: AdA;
	fairly	: Adv_manner;
	differently	: Adv_manner;
	actually	: AdV;

-- AP

	successful	: AP;
	small	: AP;
	not_quite_the_same	: AP;
	other	: AP;
	best	: AP;

-- Conj

	and	: Conj;

-- Det

	a_lot_of	: MassDet;

-- N

	world	: CN;
	way	: N2;
	top	: PlaceNoun;
	stereotype	: N2;
	reputation	: N;
	life	: N;
	industry	: CN;
	fun_time	: N;
	company	: CN;
	businessperson	: CN;
	business_leader	: CN;
	all	: NP;

-- PN

	virgin	: PN;
	branson	: PN;

-- Prep

	with_PREP	: MannerPrep;
	to	: Prep;
	on	: Prep;
	in_PREP	: Prep;
	for	: Prep;
	as_a_result_of	: CausePrep;
	all_over	: Prep;

-- Pron


-- Subj

	if	: Subj;

-- V

	work	: V;
	work_for	: V2;
	Treat	: NP -> Adv_manner	-> VP;
	tread	: V2;
	think	: VS;
	take_on	: V2;
	shake_up	: V2;
	say	: VS;
	run	: V2;
	like	: VV;
	go_in	: V;
	get	: V2;
	enjoy	: V2;
	do	: V2;
	Deal_with	: NP -> Adv_manner -> VP;
	come_back	: V;
	become	: V2;
}

-- vim: set ts=2 sts=2 sw=2 noet:
