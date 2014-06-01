--# -path=.:gf-contrib/drbean
abstract Trinka = Cat ** {


  flags startcat = Utt ;

fun

  -- Is   : NP -> AP -> Cl;
  -- Cop          : NP -> NP -> Cl;
  Look_bad        : VA -> AP -> VP;
  Be_bad  : AP -> Comp;
  Be_someone      : NP -> Comp;
  Be_vp   : Comp -> VP;
  Location  : Prep -> NP -> Adv;
  Happening       : V -> VP ;
  Changing        : V2 -> NP -> VP;
  Causative:      V2V -> NP -> VP -> VP;
  Intens: VV -> VP -> VP;
  Positing:       VS -> S -> VP;
  Informing:      V2S -> NP -> S -> VP;
  Triangulating:  V3 -> NP -> NP -> VP;
  Pred2A: V2A -> NP -> AP -> VP;
  Located:  VP -> Adv -> VP;
  PassV3   : V3 -> NP -> VP ;               -- be called John
  YN      : Cl -> QCl;

        TagQ    : NP -> VP -> QCl;
        TagComp : NP -> Comp -> QCl;
        -- TagNP        : NP -> NP -> QCl;
        -- TagAP        : NP -> AP -> QCl;

        -- WH_Cop       : IP -> Comp -> QCl;
  WH_NP   : IP -> NP -> QCl;
  WH_AP   : IP -> AP -> QCl;
        WH_Pred : IP -> VP -> QCl;
        PosQ    : QCl -> QS;
        NegQ    : QCl -> QS;
        PosS    : Cl -> S;
        NegS    : Cl -> S;
        Ut      : QS -> Utt;
        Sentence        : NP -> VP -> Cl;

        Yes, No, NoAnswer       : Utt;

        Entity  : PN -> NP;
        Kind    : AP -> CN -> CN;
        Item    : Det -> CN -> NP;
        Ofpos   : N2 -> NP -> CN;

        a_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
        zero_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
        the_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
        thePlural_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
        Apos  : NP -> Det;

        who_WH  : IP;
        what_WH : IP;

  about_prep	: Prep;
  at_prep	: Prep;
  by_prep	: Prep;
  from_prep	: Prep;
  in_prep	: Prep;
  like_prep	: Prep;
  of_prep	: Prep;
  on_prep	: Prep;
  over_prep	: Prep;
  part_prep	: Prep;
  to_prep	: Prep;
  up_prep	: Prep;


        become  : V2;
        can     : VV;

	smile	: V;
	ask	: V2Q;
	come	: V;
	cut	: V2;
	fit	: V;
	get	: V2;
	give	: V3;
	graduate	: V2;
	have	: V2;
	know	: V2;
	live	: V2;
	make	: V2A;
	put	: V3;
	put_on	: V2;
	run	: V2;
	say	: VS;
	shine	: V2;
	start	: VV;
	talk	: V2;
	tell	: V2;
	tell_to	: V2V;
	treat	: V3;
	walk	: V2;
	work_V	: V;

	big	: AP;
	beautiful	: AP;
	front	: AP;
	good	: AP;
	great	: AP;
	happy	: AP;
	important	: AP;
	last	: AP;
	nice	: AP;
	oPen	: AP;
	sick	: AP;
	young	: AP;
	shined	: AP;

	doorman	: CN;
	barber	: CN;
	coat	: CN;
	day	: CN;
	dollar	: CN;
	door	: CN;
	fact	: CN;
	father	: CN;
	friend	: CN;
	garage	: CN;
	guest	: CN;
	hour	: CN;
	job	: CN;
	kit	: CN;
	lady	: CN;
	life	: CN;
	locker	: CN;
	man	: CN;
	manager	: CN;
	meeting	: CN;
	morning	: CN;
	paradise	: CN;
	school	: CN;
	shoe	: CN;
	shop	: CN;
	story	: CN;
	thing	: CN;
	time	: CN;
	tip	: CN;
	way	: CN;
	year	: CN;
	vip	: CN;

	work_NP  : NP;
	school_NP  : NP;

	ed	: PN;
	debra : PN;
	jackie : PN;
	christmas	: PN;
	god	: PN;
	plaza : PN;
	merry_xmas	: PN;

}

-- vim: set ts=8 sts=2 sw=2 noet:
