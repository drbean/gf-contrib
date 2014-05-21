incomplete concrete TrinkaI of Trinka = open Syntax, ParadigmsEng, ExtraEng, LexTrinka in {

lincat
Utt	= Syntax.Utt;
PN	= Syntax.PN;
NP	= Syntax.NP;
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
	Happening action	=	mkVP action;
	Changing action patient	= mkVP action patient;
	Causative causal patient predicate	= mkVP causal patient predicate;
	Intens attitude predicate	= mkVP attitude predicate;
	Positing posit event	= mkVP posit event;
	Informing posit patient event	= mkVP posit patient event;
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
	NoAnswer	= no_answer_Utt;

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

	of_prep	= LexTrinkaEng.of_prep;
	can	= can_VV;
	become	= mkV2 become_V;


	smile	= smile_V;

	big	= mkAP big_A;

	doorman	= mkCN doorman_N;

	trinka	= mkPN trinka_N;

}

-- vim: set ts=8 sts=2 sw=2 noet:
