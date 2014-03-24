abstract Cusp = Cat ** {


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
  get	: V2;
  know	: V;
  know_V2	: V2;
  know_VS	: VS;
  like	: V2;
  look	: VA;
  need	: VV;
  prove	: V2;
  say	: VS;
  see	: V2;
  take	: V2V;
  tell	: V2S;


  abdicate	: V2;
  agree	: V2;
  allow	: V2V;
  appear	: VA;
  base	: V3;
  boost	: V2;
  call	: V3;
  cause	: V2V;
  consider	: V2;
  consult	: V2;
  cope	: V2;
  deal	: V2;
  enable	: V2;
  encourage	: V2V;
  feel	: VA;
  feel	: VA;
  feel_S	: VS;
  find	: V2A;
  get	: V2;
  give	: V3;
  happen	: V;
  have	: V2;
  help	: V2V;
  identify	: V2;
  investigate	: V2;
  know	: V2;
  listen	: V2;
  look	: V2;
  make	: V2;
  need	: V2;
  occur	: V;
  offer	: V2;
  pick	: V2;
  prevent	: V2;
  provide	: V2;
  raise	: V2;
  receive	: V2;
  reduce	: V2;
  report	: V2;
  suggest	: VS;
  take	: V2;
  talk	: V3;
  tend	: VV;
  think	: VS;
  train	: V2;
  used	: V2V;
  work	: V;

  assertive	: AP;
  bad	: AP;
  best	: AP;
  best-placed	: AP;
  better	: AP;
  brief	: AP;
  common	: AP;
  critically-important	: AP;
  day-to-day	: AP;
  difficult	: AP;
  effective	: AP;
  face-to-face	: AP;
  good	: AP;
  high	: AP;
  latter	: AP;
  little	: AP;
  main	: AP;
  more	: AP;
  most	: AP;
  other	: AP;
  own	: AP;
  particular	: AP;
  poor	: AP;
  practical	: AP;
  severe	: AP;
  simple	: AP;
  social	: AP;
  stressful	: AP;
  structured	: AP;
  three	: AP;
  timely	: AP;
  two-way	: AP;
  unsupported	: AP;
  useful	: AP;
  vulnerable	: AP;
  wrong  : AP;

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
	experience	: NP;
	hand	: CN;
	head	: CN;
	head_2	: N2;
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
	sales_department	: CN;
	sales_experience	: NP;
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
	work  : NP;
	year	: CN;

  bradshaw	: pn;
  c	: pn;
  control	: pn;
  cusp	: pn;
  gourlay	: pn;
  in_equilibrium  : pn;
  men	: pn;
  p	: pn;
  pressure	: pn;
  s	: pn;
  support	: pn;
  u	: pn;
  uncertainty	: pn;
  women	: pn;

}

-- vim: set ts=8 sts=2 sw=2 noet:
