abstract Candidate = Cat ** {


  flags startcat = Utt ;

fun
	-- Is	: NP -> AP -> Cl;
	-- Cop		: NP -> NP -> Cl;
	Look_bad	: VA -> AP -> VP;
	Be_bad	: AP -> Comp;
	Be_dee	: NP -> Comp;
	Be_vp	: Comp -> VP;
	Happening	: V -> VP ;
	Changing	: V2 -> NP -> VP;
	Causative:	V2V -> NP -> VP -> VP;
	Intens:	VV -> VP -> VP;
	Positing:	VS -> S -> VP;
	Informing:	V2S -> NP -> S -> VP;
	YN	: Cl -> QCl;

	TagQ	: NP -> VP -> QCl;
	TagComp	: NP -> Comp -> QCl;
	-- TagNP	: NP -> NP -> QCl;
	-- TagAP	: NP -> AP -> QCl;

	-- WH_Cop	: IP -> Comp -> QCl;
	WH_NP	: IP -> NP -> QCl;
	WH_AP	: IP -> AP -> QCl;
	WH_Pred	: IP -> VP -> QCl;
	PosQ	: QCl -> QS;
	NegQ	: QCl -> QS;
	PosS	: Cl -> S;
	NegS	: Cl -> S;
	Ut	: QS -> Utt;
	Sentence	: NP -> VP -> Cl;

	Yes, No, NoAnswer	: Utt;

	Entity	: PN -> NP;
	MassN	: A -> N -> NP;
	Kind	: AP -> CN -> CN;
	Item	: Det -> CN -> NP;
	Ofpos	: N2 -> NP -> CN;

	a_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	zero_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	the_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	thePlural_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));

	who_WH	: IP;
	what_WH	: IP;

	of_prep	: Prep;

	become	: V2;
	can	: VV;
	get	: V2;
	get_along	: V2;
	go	: V2;
	have	: V2;
	hire	: V2;
	interview	: V2;
	know	: V;
	know_VS	: VS;
	laugh	: V;
	-- let	: V2;
	lift	: V2;
	like	: V2;
	look_here	: V;
	look	: VA;
	-- make	: V2
	need	: VV;
	prove	: V2;
	say	: VS;
	see	: V2;
	slow_down	: V;
	start	: VV;
	take	: V2V;
	tell	: V2S;
	think	: VS;
	work_V	: V;

	ambitious	: AP;
	bad	: AP;
	competitive	: AP;
	confident	: AP;
	difficult	: AP;
	each	: AP;
	fast	: AP;
	few	: AP;
	five	: AP;
	good	: AP;
	hard	: AP;
	honest	: AP;
	local	: AP;
	long	: AP;
	next	: AP;
	other	: AP;
	outgoing	: AP;
	past	: AP;
	patient	: AP;
	polish	: AP;
	poor	: AP;
	possible	: AP;
	realistic	: AP;
	safe	: AP;
	soon	: AP;
	successful	: AP;
	true	: AP;
	unable	: AP;
	various	: AP;

	ability	: CN;
	administration	: CN;
	aim	: CN;
	business	: CN;
	club	: CN;
	company	: CN;
	course	: CN;
	department	: CN;
	director	: CN;
	director_2	: N2;
	effort	: CN;
	experience	: CN;
	hand	: CN;
	head	: CN;
	job	: CN;
	good_judgement	: NP;
	judgement	: NP;
	learner	: CN;
	lot	: CN;
	main	: CN;
	man	: CN;
	market	: CN;
	material	: CN;
	pair	: CN;
	people	: CN;
	personality	: CN;
	polish_N	: CN;
	respect	: CN;
	result	: CN;
	risk	: CN;
	sales	: CN;
	share	: CN;
	system	: CN;
	team	: CN;
	term	: CN;
	thing	: CN;
	time	: CN;
	top	: CN;
	training	: CN;
	way	: CN;
	woman	: CN;
	year	: CN;

	barbara	: PN;
	tadeusz	: PN;
	eva	: PN;
	fast_track	: PN;
	dr_bean	: PN;

}

-- vim: set ts=8 sts=2 sw=2 noet:
