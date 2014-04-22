incomplete concrete AFB1J0I of AFB1J0 = open Syntax, ParadigmsEng, ExtraEng, LexAFB1J0 in {

lincat
  Utt	= Syntax.Utt;
  PN	= Syntax.PN;
  NP	= Syntax.NP;
  AP	= Syntax.AP;
  Adv	= Syntax.Adv;
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
  Be_mod located	= mkComp located;
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
  Triangulating agent patient recipient = mkVP agent patient recipient; 
  Located action location	= mkVP action location;
  Be_made_sth vp np = passiveVP3 vp np;
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

  Yes	= LexAFB1J0.yes_Utt;
  No	= LexAFB1J0.no_Utt;
  NoAnswer	= LexAFB1J0.no_answer_Utt;

  Entity pn	= mkNP pn;
  Kind ap cn	= mkCN ap cn;
  KindOfKind cn adv	= mkCN cn adv;
  Ofpos n2 np	= mkCN n2 np;
  Apos np	= mkDet (GenNP np);
  Item det noun	= mkNP det noun;

  a_Det	= LexAFB1J0.a_Det;
  zero_Det	= LexAFB1J0.zero_Det;
  the_Det	= LexAFB1J0.the_Det;
  thePlural_Det = LexAFB1J0.thePlural_Det;

  who_WH	= LexAFB1J0.who_WH;
  what_WH	= LexAFB1J0.what_WH;

  of_prep	= LexAFB1J0.of_prep;
  in_prep	= LexAFB1J0.in_prep;
  from_prep	= LexAFB1J0.from_prep;

  become	= become_V2;
  can	= LexAFB1J0.can_VV;
  come  = come_V2;
  graduate	= graduate_V2;
  have	= LexAFB1J0.have_V2;
  like	= like_V2;
  make	= make_V2V;
  study	= study_V;
  want  = want_VV;

  brother_2	= brother_N2;
  brother	= mkCN brother_N2;
  child	= mkCN child_N;
  dream  = mkCN dream_N;
  fashion_designer  = mkCN fashion_designer_N;
  family	= mkCN family_N;
  father_2	= father_N2;
  father	= mkCN father_N2;
  graduation	= mkCN graduation_N;
  job	= mkCN job_N;
  life	= mkCN life_N;
  man	= mkCN man_N;
  money	= mkNP money_N;
  mother_2	= mother_N2;
  mother	= mkCN mother_N2;
  school	= mkCN school_N;
  sister_2	= sister_N2;
  sister	= mkCN sister_N2;
  thing	= mkCN thing_N;
  time	= mkNP time_N;
  way	= mkCN way_N;
  woman	= mkCN woman_N;
  work	= mkNP work_N;

  -- betty
  watching_action_movies  = mkNP watching_action_movies_N;
  watching_scary_movies	= mkNP watching_scary_movies_N;
  dogs_and_cats	= mkNP dogs_and_cats_N;
  playing_with_her_nephews  = mkNP playing_with_her_nephews_N;
  twenty_one  = mkNP twenty_one_N;
  senior  = mkCN senior_N;

  nephew  = mkCN nephew_N;
  cute  = mkAP cute_A;

-- emily2
  difficult = mkAP difficult_A;
  friend = mkCN friend_N;
  japanese = mkPN japanese_N;
  london  = mkPN london_N;
  freshman  = mkCN freshman_N;
  new_york  = mkPN new_york_N;
  go	= go_V2;
  say	= say_VS;
  think	= think_VS;
  call	= mkV3 call_V;

-- silvi
  pet	= mkCN pet_N;
	dog	= mkCN dog_N;
  playing_basketball	= mkNP playing_basketball_N;
  playing_soccer	= mkNP playing_soccer_N;
  dancing	= mkNP dancing_N;

  oliver	= mkPN oliver_N;
  jeremy	= mkPN jeremy_N;
  may	= mkPN may_N;
  betty	= mkPN betty_N;
  emily2  = mkPN emily2_N;
  silvi  = mkPN silvi_N;
  bruce2	= mkPN bruce2_N;
  iris	= mkPN iris_N;
  roger	= mkPN roger_N;

  taoyuan	= mkPN taoyuan_N;
  minghsin  = mkPN minghsin_N;
  taiwan  = mkPN taiwan_N;
  hsinchu = mkPN hsinchu_N;
  fast_and_furious  = mkPN fast_and_furious_N;
  tucheng = mkPN tucheng_N;
  pingzhen  = mkPN pingzhen_N;
  taipei  = mkPN taipei_N;
  london  = mkPN london_N;
  new_york  = mkPN new_york_N;
  gucci	= mkPN gucci_N;
  omo = mkPN omo_N;
  taichung  = mkPN taichung_N;
  yilan	= mkPN yilan_N;
  dwyane_wade  = mkPN dwyane_wade_N;

}

-- vim: set ts=8 sts=2 sw=2 noet:
