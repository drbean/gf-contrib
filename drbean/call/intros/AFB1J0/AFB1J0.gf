abstract AFB1J0 = Cat ** {


  flags startcat = Utt ;

fun
	-- Is	: NP -> AP -> Cl;
	-- Cop		: NP -> NP -> Cl;
	Look_bad	: VA -> AP -> VP;
	Be_bad	: AP -> Comp;
	Be_mod	: Adv -> Comp;
	Be_someone	: NP -> Comp;
	Be_vp	: Comp -> VP;


	Location:   Prep -> NP -> Adv;

	Happening	: V -> VP ;
	Changing	: V2 -> NP -> VP;
	Causative:	V2V -> NP -> VP -> VP;
	Intens:	VV -> VP -> VP;
	Positing:	VS -> S -> VP;
	Informing:	V2S -> NP -> S -> VP;
	Located:  VP -> Adv -> VP;
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
	KindOfKind  : CN -> Adv -> CN;
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
	in_prep	: Prep;
	from_prep	: Prep;

	become	: V2;
	can	: VV;
	come  : V2;
	graduate  : V2;
	have	: V2;
	like	: V2;
	want  : VV;

	brother	: CN;
	brother_2	: N2;
	child	: CN;
	dream  : CN;
	fashion_designer  : CN;
	family	: CN;
	father	: CN;
	father_2	: N2;
	graduation	: CN;
	job	: CN;
	life	: CN;
	man	: CN;
	money	: NP;
	mother	: CN;
	mother_2	: N2;
	school	: CN;
	sister	: CN;
	sister_2	: N2;
	thing	: CN;
	time	: NP;
	way	: CN;
	woman	: CN;
	work	: NP;
-- betty
  watching_action_movies  : NP;
  watching_scary_movies	: NP;
  playing_with_her_nephews  : NP;
  fast_and_furious  : NP;
  21  : NP;
  dogs_and_cats	: NP;
  nephew  : CN;
  cute	: AP;
  senior  : CN;

-- emily2
  difficult : AP;
  friend : CN;
  london  : NP;
  freshman  : CN;
  new_york  : NP;

  oliver	: PN;
  jeremy	: PN;
  may	: PN;
  betty	: PN;
  emily2  : PN;
  taoyuan	: PN;


}

-- vim: set ts=8 sts=2 sw=2 noet:
