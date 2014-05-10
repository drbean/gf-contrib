concrete MyConcrete of MyAbstract = open Prelude, SyntaxEng, ConstructorsEng, ParadigmsEng, ExtraEng, IrregEng in {

lincat
	Utt	= SyntaxEng.Utt;
	PN	= SyntaxEng.PN;
	NP	= SyntaxEng.NP;
	AP	= SyntaxEng.AP;
	Comp	= SyntaxEng.Comp;
	Cl	= SyntaxEng.Cl;
	QCl	= SyntaxEng.QCl;
	S	= SyntaxEng.S;
	QS	= SyntaxEng.QS;
	SC	= SyntaxEng.SC;
	V	= SyntaxEng.V;
	VP	= SyntaxEng.VP;
	V2	= SyntaxEng.V2;
	V2V	= SyntaxEng.V2V;
	V2S	= SyntaxEng.V2S;
	VV	= SyntaxEng.VV;
	VS	= SyntaxEng.VS;
	VA	= SyntaxEng.VA;
	Det	= SyntaxEng.Det;
	CN	= SyntaxEng.CN;
	N2	= SyntaxEng.N2;
	IP	= SyntaxEng.IP;
	Prep	= SyntaxEng.Prep;

lin
	-- Is item quality	=	mkCl item quality;
	-- Cop item1 item2	= mkCl item1 item2;
	Be_bad ap	= SyntaxEng.mkComp ap;
	Be_someone np	= SyntaxEng.mkComp np;
	Be_vp comp	= SyntaxEng.mkVP comp;
	Look_bad verb adj	= SyntaxEng.mkVP verb adj;
	Happening action	=	SyntaxEng.mkVP action;
	Changing action patient	= SyntaxEng.mkVP action patient;
	Causative causal patient predicate	= SyntaxEng.mkVP causal patient predicate;
	Intens attitude predicate	= SyntaxEng.mkVP attitude predicate;
	Positing posit event	= SyntaxEng.mkVP posit event;
	Informing posit patient event	= SyntaxEng.mkVP posit patient event;
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
	Ofpos n2 np	= SyntaxEng.mkCN n2 np;
	Apos np	= SyntaxEng.mkDet (GenNP np);
	Item det noun	= SyntaxEng.mkNP det noun;

	a_Det	= SyntaxEng.a_Det;
	zero_Det	= SyntaxEng.aPl_Det;
	the_Det	= SyntaxEng.the_Det;
	thePlural_Det = SyntaxEng.thePl_Det;

	who_WH	= SyntaxEng.whoSg_IP;
	what_WH	= SyntaxEng.whatSg_IP;

	of_prep	= SyntaxEng.possess_Prep;
	can	= can_VV;
	become	= mkV2 IrregEng.become_V;

}

-- vim: set ts=8 sts=2 sw=2 noet:
