concrete MyConcrete of MyAbstract = open Prelude, ResEng, SyntaxEng, ConstructorsEng, ParadigmsEng, ExtraEng, IrregEng in {

lincat
  Utt	= SyntaxEng.Utt;
  PN	= SyntaxEng.PN;
  NP	= SyntaxEng.NP;
  AP	= SyntaxEng.AP;
  Adv	= SyntaxEng.Adv;
  Comp	= SyntaxEng.Comp;
  Cl	= SyntaxEng.Cl;
  QCl	= SyntaxEng.QCl;
  S	= SyntaxEng.S;
  QS	= SyntaxEng.QS;
  SC	= SyntaxEng.SC;
  V	= SyntaxEng.V;
  VP	= SyntaxEng.VP;
  V2	= SyntaxEng.V2;
  V3	= SyntaxEng.V3;
  V2V	= SyntaxEng.V2V;
  V2S	= SyntaxEng.V2S;
  V2A	= SyntaxEng.V2A;
  VV	= SyntaxEng.VV;
  VS	= SyntaxEng.VS;
  VA	= SyntaxEng.VA;
  Det	= SyntaxEng.Det;
  CN	= SyntaxEng.CN;
  N2	= SyntaxEng.N2;
  IP	= SyntaxEng.IP;
  Prep	= SyntaxEng.Prep;
  CAdv	= SyntaxEng.CAdv;

lin
	-- Is item quality	=	mkCl item quality;
	-- Cop item1 item2	= mkCl item1 item2;
	Be_bad ap	= SyntaxEng.mkComp ap;
  Be_mod located	= mkComp located;
	Be_someone np	= SyntaxEng.mkComp np;
	Be_vp comp	= SyntaxEng.mkVP comp;
	Look_bad verb adj	= SyntaxEng.mkVP verb adj;
  Location prep item	= SyntaxEng.mkAdv prep item;
	Happening action	=	SyntaxEng.mkVP action;
	Changing action patient	= SyntaxEng.mkVP action patient;
	Causative causal patient predicate	= SyntaxEng.mkVP causal patient predicate;
	Intens attitude predicate	= SyntaxEng.mkVP attitude predicate;
	Positing posit event	= SyntaxEng.mkVP posit event;
	Informing posit patient event	= SyntaxEng.mkVP posit patient event;
  Triangulating v patient recipient = mkVP v patient recipient; 
  Pred2A v patient state = mkVP v patient state;
  PassV3 v np = insertObj (\\_ => v.s ! VPPart ++ v.p ++ v.c2 ++ v.c3 ++ np.s ! NPAcc) (predAux auxBe) ;
  Located action location	= mkVP action location;
  Be_made_sth vp np = PassV3 vp np;
	YN cl	= SyntaxEng.mkQCl cl;
	-- WH_Cop ip comp	= mkQCl ip comp;
	WH_NP ip np	= SyntaxEng.mkQCl ip np;
	WH_AP ip ap	= SyntaxEng.mkQCl ip ap;
	WH_Pred ip vp	= SyntaxEng.mkQCl ip vp;
	PosQ qcl	= SyntaxEng.mkQS qcl;
	NegQ qcl	= SyntaxEng.mkQS SyntaxEng.negativePol qcl;
	PosS cl	= SyntaxEng.mkS cl;
	NegS cl	= SyntaxEng.mkS SyntaxEng.negativePol cl;
	Ut q	= SyntaxEng.mkUtt q;
	Sentence subject predicate	= SyntaxEng.mkCl subject predicate;

	Yes	= SyntaxEng.yes_Utt;
	No	= SyntaxEng.no_Utt;
	NoAnswer	= ss "No answer";

	Entity pn	= SyntaxEng.mkNP pn;
	Kind ap cn	= SyntaxEng.mkCN ap cn;
  KindOfKind cn adv	= mkCN cn adv;
	Ofpos n2 np	= SyntaxEng.mkCN n2 np;
	Apos np	= SyntaxEng.mkDet (GenNP np);
	Item det noun	= SyntaxEng.mkNP det noun;

	a_Det	= SyntaxEng.a_Det;
	zero_Det	= SyntaxEng.aPl_Det;
	the_Det	= SyntaxEng.the_Det;
	thePlural_Det = SyntaxEng.thePl_Det;

	who_WH	= SyntaxEng.whoSg_IP;
	what_WH	= SyntaxEng.whatSg_IP;

  about_prep	= mkPrep "about";
  at_prep	= mkPrep "at";
  in_prep	= mkPrep "in";
	of_prep	= possess_Prep;
  on_prep	= mkPrep "on";
  over_prep	= mkPrep "over";
  part_prep	= part_Prep;
  to_prep	= to_Prep;
  up_prep	= mkPrep "up";

	can	= can_VV;
	become	= mkV2 IrregEng.become_V;

}

-- vim: set ts=2 sts=2 sw=2 noet:
