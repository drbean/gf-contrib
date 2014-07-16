abstract MyAbstract = Cat ** {


	flags startcat = Utt ;

cat
	Freq;
	Times;
	Period;

fun
	-- Is	: NP -> AP -> Cl;
	-- Cop		: NP -> NP -> Cl;
	Look_bad	: VA -> AP -> VP;
	-- Be_made_sth : V3 -> NP -> VP;
	Be_bad	: AP -> Comp;
	Be_someone	: NP -> Comp;
	Be_vp	: Comp -> VP;
	Location  : Prep -> NP -> Adv;
	FreqAdv	: NP -> Period -> Freq;
	Happening	: V -> VP ;
	Changing	: V2 -> NP -> VP;
	Causative:	V2V -> NP -> VP -> VP;
	Intens:	VV -> VP -> VP;
	Positing:	VS -> S -> VP;
	Informing:	V2S -> NP -> S -> VP;
	Triangulating:	V3 -> NP -> NP -> VP;
  Pred2A: V2A -> NP -> AP -> VP;
	-- PassV3	: V3 -> NP -> VP ;	-- be called John
	Pass : VPSlash -> VP;
	V2Slash	: V2 -> VPSlash;
	VSSlash	: VS -> VPSlash;
	V2VSlash	: V2V -> VP -> VPSlash;
	V3Slash	: V3 -> NP -> VPSlash;
	Modified	: CN -> RCl -> CN;
	SubjRel	: RP -> VP -> RCl;
	ObjRel	: RP -> ClSlash -> RCl;
	VPClSlash	: NP -> VPSlash -> ClSlash;
	VPAdv	:  VP -> Adv -> VP;
	AdvVP	: Adv -> VP -> VP;
	WithFreq	: VP -> Freq -> VP;
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
	QUt	: QS -> Utt;
	Ut	: S -> Utt;
	Sentence	: NP -> VP -> Cl;

	Yes, No, NoAnswer	: Utt;

	Entity	: PN -> NP;
	Kind	: AP -> CN -> CN;
	KindOfKind  : CN -> Adv -> CN;
	Item	: Det -> CN -> NP;
	PredetItem	: Predet -> NP -> NP;
	Ofpos	: N2 -> NP -> CN;

	a_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	zero_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	the_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	thePlural_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	Apos  : NP -> Det;
	Apos_pl  : NP -> Det;
	no_Det	: Det;
	no_pl_Det	: Det;
	no_NP	: NP;
	no_pl_NP	: NP;
	some_Det	: Det;
	some_pl_Det	: Det;
	some_NP	: NP;
	some_pl_NP	: NP;
	some_Predet	: Predet;
	Genitive_NP	: NP -> NP;

	who_WH	: IP;
	what_WH	: IP;
	which_RP	: RP;
	that_RP	: RP;

	more : CAdv;
	Comparative : NP -> A ->NP -> Cl;
	More	: A -> AP;

	about_prep	: Prep;
	at_prep	: Prep;
	before_prep	: Prep;
	in_prep	: Prep;
	from_prep	: Prep;
  like_prep	: Prep;
	of_prep	: Prep;
	on_prep	: Prep;
	over_prep	: Prep;
	part_prep	: Prep;
	to_prep	: Prep;
	up_prep	: Prep;
	with_prep	: Prep;

	become	: V2;
	can	: VV;
	know_V2	: V2;
	know_VS	: VS;
	like	: V2;
	say	: VS;
	see	: V2;
	tell	: V2S;

	too_AdA	: AdA;
	because_Subj	: Subj;

	Subjunct	: Subj -> S -> Adv;
}

-- vim: set ts=2 sts=2 sw=2 noet:
