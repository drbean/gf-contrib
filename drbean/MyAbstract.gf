abstract MyAbstract = Cat, Conjunction ** {


	flags startcat = Utt ;

cat
	Time;
	Times;
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
	FreqAdv	: NP -> Period -> Time;
	Happening	: V -> VP ;
	Changing	: V2 -> NP -> VP;
	Causative:	V2V -> NP -> VP -> VP;
	Intens:	VV -> VP -> VP;
	Positing:	VS -> S -> VP;
	Informing:	V2S -> NP -> S -> VP;
	Triangulating:	V3 -> NP -> NP -> VP;
  Pred2A: V2A -> NP -> AP -> VP;
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
	VPClSlash	: NP -> VPSlash -> ClSlash;
	ToPlace	:  Motion -> Located -> VP;
	WithPlace	:  VP -> Located -> VP;
	WithTime	: VP -> Time -> VP;
	WithStyle	: VP -> Style -> VP;
	WithCl	: VP -> SubordCl -> VP;

	YN	: Cl -> QCl;

	TagQ	: NP -> VP -> QCl;
	TagComp	: NP -> Comp -> QCl;
	-- TagNP	: NP -> NP -> QCl;
	-- TagAP	: NP -> AP -> QCl;

	WH_Pred	: IP -> VP -> QCl;
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

	Entity	: PN -> NP;
	Kind	: AP -> CN -> CN;
	KindOfKind  : CN -> Adv -> CN;
	KindInPlace	: CN -> Located -> CN;
	PlaceKind	: AP -> PlaceName -> PlaceName;
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

	her_Det	: Det;
	her_MassDet	: MassDet;
	his	: Det;
	its	: Det;

	he	: NP;
	she	: NP;
	it	: NP;

	who_WH	: IP;
	what_WH	: IP;
	which_RP	: RP;
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
	on_prep	: Prep;
	over_prep	: Prep;
	part_prep	: Prep;
	to_prep	: LocPrep;
	up_prep	: Prep;
	with_prep	: Prep;

	become	: V2;
	can	: VV;
	know_V2	: V2;
	know_VS	: VS;

	Very_Style	: Style -> Style;
	because_Subj	: Subj;
	if_Subj	: Subj;
	or_Conj	: Conj;

	Subjunct	: Subj -> S -> SubordCl;

}

-- vim: set ts=2 sts=2 sw=2 noet:
