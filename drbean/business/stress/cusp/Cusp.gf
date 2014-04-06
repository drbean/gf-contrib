abstract Cusp = Cat ** {


  flags startcat = Utt ;

fun
  -- Is	: NP -> AP -> Cl;
  -- Cop		: NP -> NP -> Cl;
  -- Look_bad	: VA -> AP -> VP;
  Feel_helpless	: NP -> Cl;
  Feel_unsupported  : NP -> Cl;
  Be_bad	: AP -> Comp;
  Be_someone	: NP -> Comp;
  Be_vp	: Comp -> VP;
  Happening	: V -> VP ;
  Changing	: V2 -> NP -> VP;
  Causative:	V2V -> NP -> VP -> VP;
  Intens:	VV -> VP -> VP;
  Positing:	VS -> S -> VP;
  Informing:	V2S -> NP -> S -> VP;
  Triangulating:	V3 -> NP -> NP -> VP;
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
  Lack_of : NP -> CN;
  Level_of : NP -> CN;
  -- Little : N -> CN;

  a_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
  zero_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
  the_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
  thePlural_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
  Apos  : NP -> Det;

  who_WH	: IP;
  what_WH	: IP;

  more : CAdv;
  Comparative : NP -> A ->NP -> Cl;
  More	: A -> AP;

  about_prep	: Prep;
  at_prep	: Prep;
  in_prep	: Prep;
  of_prep	: Prep;
  on_prep	: Prep;
  over_prep	: Prep;
  part_prep	: Prep;
  to_prep	: Prep;
  up_prep	: Prep;

  become	: V2;
  can	: VV;
  get	: V2;
  know_V2	: V2;
  know_VS	: VS;
  like	: V2;
  need	: V2;
  -- need_V	: VV;
  prove	: V2;
  say	: VS;
  see	: V2;
  tell	: V2S;


  abdicate	: V2;
  agree	: V2;
  allow	: V2V;
  appear	: VA;
  base	: V3;
  boost	: V2;
  call	: V3;
  cause	: V2;
  consider	: V2;
  consult	: V2;
  cope	: V2;
  deal	: V2;
  enable	: V2;
  encourage	: V2V;
  facilitate	: V2;
  feel	: VA;
  feel_S	: VS;
  -- find	: V2A;
  get	: V2;
  give	: V3;
  happen	: V;
  have	: V2;
  help	: V2V;
  identify	: V2;
  investigate	: V2;
  listen	: V2;
  look_A	: VA;
  look_at	: V2;
  make	: V2;
  occur	: V;
  offer	: V2;
  pick	: V2;
  prevent	: V2;
  provide	: V2;
  raise	: V2;
  receive	: V2;
  reduce	: V2;
  report	: V2;
  stand	: V2;
  suggest	: VS;
  take	: V2;
  talk	: V3;
  talk_about	: V3;
  tend	: VV;
  think	: VS;
  train	: V2;
  use	: V2V;
  work_V	: V;

  assertive	: AP;
  bad	: AP;
  best_placed	: AP;
  brief	: AP;
  common	: AP;
  critically_important	: AP;
  day_to_day	: AP;
  difficult	: AP;
  effective	: AP;
  face_to_face	: AP;
  good	: AP;
  helpless	: AP;
  high_A  : A;
  high	: AP;
  latter	: AP;
  little	: AP;
  managerial	: AP;
  main	: AP;
  most	: AP;
  other	: AP;
  own	: AP;
  particular	: AP;
  poor	: AP;
  practical	: AP;
  psychological	: AP;
  severe	: AP;
  simple	: AP;
  social	: AP;
  stressful	: AP;
  structured	: AP;
  three	: AP;
  timely	: AP;
  two_way	: AP;
  unsupported	: AP;
  useful	: AP;
  vulnerable	: AP;
  vulnerable_A	: A;
  wrong  : AP;



  action	: CN;
  approachability	: NP;
  area	: CN;
  assessment	: NP;
  awareness	: NP;
  business	: CN;
  cause_of	: N2;
  characteristic	: CN;
  climate	: CN;
  combination	: CN;
  comment	: CN;
  communication	: NP;
  company	: CN;
  consultation	: CN;
  control_over	: N2;
  delegation	: NP;
  depression	: NP;
  difference	: CN;
  difficulty	: CN;
  element	: CN;
  example	: CN;
  experience	: CN;
  feeling	: CN;
  flexibility	: NP;
  framework	: CN;
  group	: CN;
  health	: NP;
  hotspot	: CN;
  idea	: CN;
  individual	: CN;
  key	: CN;
  kind	: CN;
  lack : N2;
  level	: N2;
  luck	: CN;
  management	: NP;
  manager	: CN;
  meeting	: CN;
  message	: CN;
  mind	: CN;
  minute	: CN;
  model	: CN;
  one	: CN;
  option	: CN;
  openness	: NP;
  overview	: CN;
  people	: CN;
  performance	: NP;
  placement	: NP;
  plan	: CN;
  position	: CN;
  problem	: CN;
  responsibility	: NP;
  risk	: CN;
  sense_of	: N2;
  situation	: CN;
  skill	: CN;
  staff	: NP;
  strategy	: CN;
  study	: CN;
  thing	: CN;
  time	: NP;
  truth	: CN;
  way	: CN;
  work	: NP;
  workload	: CN;



  bradshaw	: PN;
  c	: PN;
  control	: PN;
  cusp	: PN;
  gourlay	: PN;
  in_equilibrium  : PN;
  men	: NP;
  p	: PN;
  pressure	: PN;
  s	: PN;
  stress	: PN;
  support	: PN;
  u	: PN;
  uncertainty	: PN;
  women	: NP;

}

-- vim: set ts=8 sts=2 sw=2 noet:
