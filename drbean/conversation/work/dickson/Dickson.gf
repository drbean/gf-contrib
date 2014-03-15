abstract Dickson = Cat ** {


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
	Kind	: AP -> CN -> CN;
	Item	: Det -> CN -> NP;
	Ofpos	: N2 -> NP -> CN;

	a_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	zero_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	the_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	thePlural_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	Apos  : NP -> Det;

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
	need_V	: VV;
	need	: V2;
	prove	: V2;
	say	: VS;
	see	: V2;
	slow_down	: V;
	start	: VV;
	take	: V2V;
	tell	: V2S;
	think	: VS;
	work_V	: V;

	bad	: AP;
	better	: AP;
	first	: AP;
	little	: AP;
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
	husband_2	: N2;
	interviewer : CN;
	job	: CN;
	kind	: CN;
	knack	: CN;
	life	: CN;
	man	: CN;
	money	: NP;
	night	: CN;
	position	: CN;
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

	alf	: PN;
	dee	: PN;
	monday	: PN;

}

-- vim: set ts=8 sts=2 sw=2 noet:
