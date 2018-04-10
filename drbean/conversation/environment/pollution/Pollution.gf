abstract Pollution = MyAbstract ** {


  flags startcat = Utt ;

fun

-- Adv


-- AP

	urban	: AP;
	underground	: AP;
	terrible	: AP;
	other	: AP;
	huge	: AP;
	environmental	: AP;
	dead	: AP;
	bad	: AP;
	avox	: AP;

-- Conj


-- Det

	one	: Det;
	a_lot_of	: Det;

-- N

	farm	: CN;
	livestock_farm	: CN;
	wildlife	: N;
	way	: N2;
	water_pollution	: N;
	water	: N;
	uncle	: CN;
	tv_station	: CN;
	town	: Place;
	top_executive	: CN;
	suburb	: CN;
	story	: CN;
	statue	: CN;
	soil	: N;
	river	: PlaceNoun;
	publicity	: N;
	pollution	: N;
	plant	: CN;
	oil_spill	: CN;
	marine_life	: N;
	management	: N;
	law	: CN;
	health	: N2;
	Growth	: NP -> N;
	rain_forest	: CN;
	fish	: CN;
	farmland	: N;
	factory	: CN;
	Extinction	: NP -> N;
	environment	: CN;
	Destruction	: NP -> N;
	company	: CN;
	chemical	: CN;
	building	: CN;
	bird	: CN;
	areas	: CN;
	amount	: N2;
	air_pollution	: N;
	air	: N;
	acid_rain	: N;

-- PN

	carla	: PN;
	avox_industries	: PN;
	andy	: PN;

-- Prep

	to	: Prep;
	outside	: LocPrep;
	on	: ThemePrep;
	into	: LocPrep;
	in_LOCPREP	: Prep;
	at	: Prep;
	against	: Prep;
	about	: Prep;

-- Pron


-- Subj

	if	: Subj;

-- V

	work	: V;
	threaten	: V2;
	think	: VS;
	talk	: V2;
	see	: V2;
	say	: VS;
	run	: V2;
	Pump	: NP -> Adv_location -> VP;
	pollute	: V2;
	kill	: V2;
	ignore	: V2;
	hate	: V2;
	harm	: V2;
	happen	: V;
	get	: V2V;
	erode	: V2;
	eat_up	: V2;
	contaminate	: V2;
	change	: V2;
	accelerate	: V2;
	ask	: VS;
}

-- vim: set ts=2 sts=2 sw=2 noet:
