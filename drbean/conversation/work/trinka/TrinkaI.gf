incomplete concrete TrinkaI of Trinka = open Syntax, ParadigmsEng, ExtraEng, LexTrinka in {

lincat
Utt	= Syntax.Utt;
PN	= Syntax.PN;
NP	= Syntax.NP;
Adv	= Syntax.Adv;
AP	= Syntax.AP;
Comp	= Syntax.Comp;
Cl	= Syntax.Cl;
QCl	= Syntax.QCl;
S	= Syntax.S;
QS	= Syntax.QS;
SC	= Syntax.SC;
V	= Syntax.V;
VP	= Syntax.VP;
V2	= Syntax.V2;
V2V	= Syntax.V2V;
V2S	= Syntax.V2S;
V2A	= Syntax.V2A;
V2Q	= Syntax.V2Q;
V3	= Syntax.V3;
VV	= Syntax.VV;
VS	= Syntax.VS;
VA	= Syntax.VA;
Det	= Syntax.Det;
CN	= Syntax.CN;
N2	= Syntax.N2;
IP	= Syntax.IP;
Prep	= Syntax.Prep;


lin

  -- Is item quality	=	mkCl item quality;
  -- Cop item1 item2	= mkCl item1 item2;
  Be_bad ap	= mkComp ap;
  Be_someone np	= mkComp np;
  Be_vp comp	= mkVP comp;
  Look_bad verb adj	= mkVP verb adj;
  Location prep item	= mkAdv prep item;
  Happening action	=	mkVP action;
  Changing action patient	= mkVP action patient;
  Causative causal patient predicate	= mkVP causal patient predicate;
  Intens attitude predicate	= mkVP attitude predicate;
  Positing posit event	= mkVP posit event;
  Informing posit patient event	= mkVP posit patient event;
  Triangulating v patient recipient = mkVP v patient recipient; 
  Pred2A v patient state = mkVP v patient state;
  
  
  PassV3 v np = insertObj (\\_ => v.s ! VPPart ++ v.p ++ v.c2 ++ v.c3 ++ np.s ! NPAcc) (predAux auxBe) ;
  Located action location	= mkVP action location;
  YN cl	= mkQCl cl;
  -- WH_Cop ip comp	= mkQCl ip comp;
  WH_NP ip np	= mkQCl ip np;
  WH_AP ip ap	= mkQCl ip ap;
  WH_Pred ip vp	= mkQCl ip vp;
  PosQ qcl	= mkQS qcl;
  NegQ qcl	= mkQS negativePol qcl;
  PosS cl	= mkS cl;
  NegS cl	= mkS negativePol cl;
  Ut q	= mkUtt q;
  Sentence subject predicate	= mkCl subject predicate;

  Yes	= yes_Utt;
  No	= no_Utt;
  -- NoAnswer	= no_answer_Utt;

  Entity pn	= mkNP pn;
  Kind ap cn	= mkCN ap cn;
  Ofpos n2 np	= mkCN n2 np;
  Apos np	= mkDet (GenNP np);
  Item det noun	= mkNP det noun;

  a_Det	= LexTrinkaEng.a_Det;
  zero_Det	= LexTrinkaEng.zero_Det;
  the_Det	= LexTrinkaEng.the_Det;
  thePlural_Det = LexTrinkaEng.thePlural_Det;

  who_WH	= LexTrinkaEng.who_WH;
  what_WH	= LexTrinkaEng.what_WH;

  about_prep	= LexTrinka.about_prep;
  at_prep	= LexTrinka.at_prep;
  by_prep	= LexTrinka.by_prep;
  from_prep	= LexTrinka.from_prep;
  in_prep	= LexTrinka.in_prep;
  like_prep	= LexTrinka.like_prep;
  of_prep	= LexTrinka.of_prep;
  on_prep	= LexTrinka.on_prep;
  over_prep	= LexTrinka.over_prep;
  part_prep	= LexTrinka.part_prep;
  to_prep	= LexTrinka.to_prep;
  up_prep	= LexTrinka.up_prep;

  can	= can_VV;
  become	= mkV2 become_V;


  smile	= smile_V;
  ask	= mkV2Q ask_V noPrep;
  come	= come_V;
  come_in	= mkV come_V in_prep;
  come_back	= mkV come_V "back";
  come_by	= mkV come_V by_prep;
  cut	= mkV2 cut_V by_prep;
  fit	= fit_V;
  get	= mkV2 get_V;
  give	= mkV3 give_V;
  graduate	= mkV2 graduate_V from_prep;
  have	= mkV2 have_V;
  know	= mkV2 know_V;
  live	= mkV2 live_V;
  make	= mkV2A make_V noPrep;
  put = mkV3 put_V noPrep on_prep;
  put_on	= mkV2 (partV put_V "on");
  run	= mkV2 run_V to_prep;
  say	= mkVS say_V;
  shine	= mkV2 shine_V noPrep;
  start	= ingVV start_V;
  talk	= mkV2 talk_V to_prep;
  tell	= mkV2 tell_V;
  tell_to	= mkV2V tell_V noPrep to_prep;
  treat	= mkV3 treat_V noPrep like_prep;
  walk	= mkV2 walk_V to_prep;
  work_V	= LexTrinkaEng.work_V;

  big	= mkAP big_A;
  beautiful	= mkAP beautiful_A;
  front	= mkAP front_A;
  good	= mkAP good_A;
  great	= mkAP great_A;
  happy	= mkAP happy_A;
  important	= mkAP important_A;
  last	= mkAP last_A;
  nice	= mkAP nice_A;
  oPen	= mkAP open_A;
  sick	= mkAP sick_A;
  young	= mkAP young_A;
  shined	= mkAP shined_A;

  doorman	= mkCN doorman_N;
  barber	= mkCN barber_N;
  coat	= mkCN coat_N;
  day	= mkCN day_N;
  dollar	= mkCN dollar_N;
  door	= mkCN door_N;
  fact	= mkCN fact_N;
  father	= mkCN father_N;
  friend	= mkCN friend_N;
  garage	= mkCN garage_N;
  guest	= mkCN guest_N;
  hour	= mkCN hour_N;
  job	= mkCN job_N;
  kit	= mkCN kit_N;
  lady	= mkCN lady_N;
  life	= mkCN life_N;
  locker	= mkCN locker_N;
  man	= mkCN man_N;
  manager	= mkCN manager_N;
  meeting	= mkCN meeting_N;
  morning	= mkCN morning_N;
  paradise	= mkCN paradise_N;
  school	= mkCN school_N;
  shoe	= mkCN shoe_N;
  shop	= mkCN shop_N;
  story	= mkCN story_N;
  thing	= mkCN thing_N;
  time	= mkCN time_N;
  tip	= mkCN tip_N;
  way	= mkCN way_N;
  work_NP	= mkNP work_N;
  school_NP	= mkNP school_N;
  year	= mkCN year_N;
  vip	= mkCN vip_N;

  ed  = mkPN ed_N;
  debra = mkPN debra_N;
  jackie  = mkPN jackie_N;
  christmas = mkPN christmas_N;
  god	= mkPN god_N;
  plaza = mkPN plaza_N;
  merry_xmas	= mkPN merry_xmas_N;

}

-- vim: set ts=8 sts=2 sw=2 noet:
