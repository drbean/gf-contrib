abstract MyAbstract = Cat, Conjunction ** {


	flags startcat = Utt ;

cat
	Time;
	Times;
	TimeName;
	Period;
	Title;
	Place;
	PlaceName;
	LocPrep;
	Located;
	Motion;
	Style;
	MassDet;
	SubordCl;
	Partitive;

fun
	Look_bad	: VA -> AP -> VP;
	-- Be_made_sth : V3 -> NP -> VP;
	Be_bad	: AP -> Comp;
	Be_someone	: NP -> Comp;
	Be_somewhere	: Located -> Comp;
	Be_vp	: Comp -> VP;
	Locating  : LocPrep -> Place -> Located;
	Location	: Det -> PlaceName -> Place;
	Timing	: Det -> TimeName -> Times;
	FreqAdv	: NP -> Period -> Time;
	PeriodAdv	: Times -> Period;
	Styling	: Prep -> NP -> Style;
	Happening	: V -> VP ;
	Changing	: V2 -> NP -> VP;
	Causative:	V2V -> NP -> VP -> VP;
	Intens:	VV -> VP -> VP;
	V_that_S:	VS -> S -> VP;
	V_S:	VS -> S -> VP;
	V_SC:	VS -> SC -> VP;
	V_NP_that_S:	V2S -> NP -> S -> VP;
	V_NP_S:	V2S -> NP -> S -> VP;
	V_NP_whether_S:	V2Q -> NP -> QS -> VP;
	Triangulating:	V3 -> NP -> NP -> VP;
  V_NP_AP: V2A -> NP -> AP -> VP;
	-- GetPassV3	: V3 -> NP -> VP ;	-- be called John
	-- GetNPPPart	: V2 -> NP -> VP; -- get the job done right
	Pass : VPSlash -> VP;
	V2Slash	: V2 -> VPSlash;
	-- VSSlash	: VS -> VPSlash;
	V2VSlash	: V2V -> VP -> VPSlash;
	V3Slash	: V3 -> NP -> VPSlash;
	ModInf : CN -> VP -> CN;
	MassModInf : N -> VP -> CN;
	Modified	: CN -> RCl -> CN;
	SubjRel	: RP -> VP -> RCl;
	ObjRel	: RP -> ClSlash -> RCl;
	EmptyRel : ClSlash -> RCl;
	VPClSlash	: NP -> VPSlash -> ClSlash;
	ToPlace	:  Motion -> Located -> VP;
	WithPlace	:  V -> Located -> VP;
	WithTime	: VP -> Period -> VP;
	WithStyle	: VP -> Style -> VP;
	WithCl	: VP -> SubordCl -> VP;

	ICompS	: IComp -> NP -> QS;
	YN	: Cl -> QCl;

	TagQ	: NP -> VP -> QCl;
	TagComp	: NP -> Comp -> QCl;
	TagModal	: NP -> VV -> VP -> QCl;
	-- TagNP	: NP -> NP -> QCl;
	-- TagAP	: NP -> AP -> QCl;

	WH_Pred	: IP -> VP -> QCl;
	WHose	: CN -> IP;
	WH_ClSlash	: IP -> ClSlash -> QCl;
	PosQ	: QCl -> QS;
	NegQ	: QCl -> QS;
	PosS	: Cl -> S;
	NegS	: Cl -> S;
	QUt	: QS -> Utt;
	Ut	: S -> Utt;
	Sentence	: NP -> VP -> Cl;

	Yes, No, NoAnswer	: Utt;
	Answer : NP -> Utt;

	Inject	: Interj -> SC;

	Entity	: PN -> NP;
	Kind	: AP -> CN -> CN;
	KindOfKind  : CN -> Adv -> CN;
	KindInPlace	: CN -> Located -> CN;
	PlaceKind	: AP -> PlaceName -> PlaceName;
	Membership : Det -> CN -> Located -> Cl;
	Item	: Det -> CN -> NP;
	MassItem	: MassDet -> N	-> NP;
	Titular	: Title -> NP;
	PredetItem	: Predet -> NP -> NP;
	Ofpos	: N2 -> NP -> CN;
	Ofpart	: Partitive -> N -> CN;

	a_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	zero_Det_pl : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	zero_Det_sg : MassDet;
	the_mass_Det	: MassDet;
	some_mass_Det	: MassDet;
	theSg_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	thePlural_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	Apos  : NP -> Det;
	MassApos	: NP -> MassDet;
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
	List : NP -> NP -> ListNP;
	AddList : NP -> ListNP -> ListNP;
	CloseList	: Conj -> ListNP -> NP;
	APList : AP -> AP -> ListAP;
	AddAP : AP -> ListAP -> ListAP;
	CloseAP	: Conj -> ListAP -> AP;

	her_Det	: Det;
	her_MassDet	: MassDet;
	he_Det	: Det;
	its	: Det;

	he	: NP;
	she	: NP;
	it	: NP;

	who_WH	: IP;
	what_WH	: IP;
	IdRP	: RP;
	that_RP	: RP;

	more : CAdv;
	ComparaAP : A -> NP -> AP;
	ComparaAdv : CAdv -> A -> NP -> Style;
	ComparaS : AP -> S -> AP;
	More	: A -> AP;
	AdjModified	: AP -> VP -> AP;
	As_as	: AP -> NP -> AP;
	AdvAdj	: AdA -> AP -> AP;

	about_prep	: Prep;
	as_prep	: Prep;
	at_prep	: LocPrep;
	before_prep	: Prep;
	in_prep	: LocPrep;
	from_prep	: Prep;
  like_prep	: Prep;
	of_prep	: Prep;
	on_prep	: LocPrep;
	over_prep	: Prep;
	part_prep	: Prep;
	to_prep	: LocPrep;
	up_prep	: Prep;
	with_prep	: Prep;

	person	: CN;

	become	: V2;
	can	: VV;
	have	: V2;
	know_V2	: V2;
	know_VS	: VS;

	Very_Style	: Style -> Style;
	because_Subj	: Subj;
	if_Subj	: Subj;
	or_Conj	: Conj;

	Subjunct	: Subj -> S -> SubordCl;

}

-- vim: set ts=2 sts=2 sw=2 noet:
