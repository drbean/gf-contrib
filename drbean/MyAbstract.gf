abstract MyAbstract = Cat ** {


  flags startcat = Utt ;

fun
	-- Is	: NP -> AP -> Cl;
	-- Cop		: NP -> NP -> Cl;
	Look_bad	: VA -> AP -> VP;
	Be_bad	: AP -> Comp;
	Be_someone	: NP -> Comp;
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

}

-- vim: set ts=8 sts=2 sw=2 noet:
