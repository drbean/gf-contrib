concrete MyConcrete of MyAbstract = CatEng, ConjunctionEng ** open ResEng, Prelude, SyntaxEng, (P = ParadigmsEng), VerbEng, ExtraEng, IrregEng, ExtensionsEng in {

lincat
	NounCl = {s : ResEng.Tense => Anteriority => CPolarity => Order => Str; c : NPCase };
	SubordCl	= Adv;
	Time	= CN;
	Title	= CN;
	Place	= NP;
	PlaceNoun	= CN;
	CoagentPrep = Prep;
	InstrumentPrep = Prep;
	ThemePrep = Prep;
	MannerPrep	= Prep;
	TimePrep	= Prep;
	LocPrep	= Prep;
	SourcePrep	= Prep;
	ResultPrep	= Prep;
	PatientPrep	= Prep;
	ExtentPrep	= Prep;
	AttributePrep	= Prep;
	StimulusPrep	= Prep;
	Adv_coagent	= Adv;
	Adv_instrument	= Adv;
	Adv_theme	= Adv;
	Adv_manner	= Adv;
	Adv_time	= Adv;
	Adv_location	= Adv;
	Adv_source	= Adv;
	Adv_result	= Adv;
	Adv_patient	= Adv;
	Adv_extent	= Adv;
	Adv_attribute	= Adv;
	Adv_stimulus	= Adv;
	Adv_goal	= Adv;
	MassDet = Det;
	Partitive = N2;

param
  Auxiliary	= Do | Be | Should;
	-- VPs = Look_bad | Be_bad | Be_vp | Happening | Changing | Causative | Intens | Positing | Informing | Triangulating | Pred2A | Pass | ToPlace | WithPlace | WithStyle | WithCl ;


oper

	no_Quant	= no_Quant;
	some_Quant	= P.mkQuant "some" "some" "some" "some";
	zero_mass_Quant = P.mkQuant "" nonExist;

	know_V = IrregEng.know_V;

	ModalVV	: Str -> Str -> Str -> Str -> Str ->
		{s : VVForm => Str; p : Str; typ : VVType } =
		\inf, pres, pp, prespp, presN -> {
		s = table {
			VVF VInf	=> inf ;
			VVF VPres => pres;
			VVF VPPart	=> pp ;
			VVF VPresPart	=> prespp ;
			-- VVF VPast	=> nonExist ;
			-- VVPastNeg	=> nonExist ;
			VVPresNeg	=> presN
			} ;
		p = [];
		typ	= VVAux;
		lock_VV = {}
		};

	mkpronAgr : Agr -> NP = \ag -> case ag of {
		AgP1 Sg => i_NP;
		AgP1 Pl => we_NP;
		AgP2 Sg => you_NP;
		AgP2 Pl => you_NP;
		AgP3Sg Fem => she_NP;
		AgP3Sg Masc => he_NP;
		AgP3Sg _ => it_NP;
		AgP3Pl _ => they_NP
	};

	mymktag : ( np : NP ) -> ( vp : VP ) -> {s : ResEng.Tense => Anteriority => CPolarity => Str} =
		\np,vp -> { s = \\t,a,p => (vp . s ! t ! a ! p ! OQuest ! np.a ) . aux  ++ (mkpronAgr np.a).s ! npNom };

	negated : CPolarity -> CPolarity = \p -> case p of {
		CPos => CNeg True;
		_ => CPos
		};

	myTagModal : ( np : NP ) -> ( vp : VP ) -> { s : ResEng.Tense => Anteriority => CPolarity => QForm => Str } =
		\np, vp  -> let
		cl = mkCl np vp;
		tag = mymktag np vp in
			{s = \\t,a,p,_ => ( cl . s ! t ! a ! p ! ODir False ) ++ tag . s ! t ! a ! (negated p) };

	mymkIP : (i,me,my : Str) -> Number -> {s : NPCase => Str ; n : Number} =
		\i,me,my,n -> 
		 { s = table {
				 NCase Nom => i;
				 NPAcc => me;
				 NCase Gen | NPNomPoss => my
				 } ;
			 n = n ;
		 };

	mymkIPhrase	: (idet : IDet) -> (cn : CN) -> { s : NPCase => Str; n : Number } =
		\idet,cn -> {
      s = \\c => idet.s ++ cn.s ! idet.n ! npcase2case c ; 
      n = idet.n
      };

	mymkRP : (who, which, whose : Str) -> {s : RCase => Str; a : RAgr} =
	\who,which,whose ->
	{ s = table {
			RC _ (NCase Gen) | RC _ NPNomPoss => whose;
			RC Neutr _ => which;
			RC _ NPAcc => who;
			RC _ (NCase Nom) => who;
			RPrep Neutr => which;
			RPrep _ => who
		};
		a = RNoAg
	};

	mymkConj : (and : Str) -> {s1 : Str ; s2 : Str ; n : Number} =
		\and ->
			{ s1 = [] ;
				s2 = and ;
				n = Pl ;
			};

	mymkN_CN : (n : N) -> (cn : CN) -> {s : Number => Case => Str ; g : Gender } = 
		\noun,cn -> {
			s = \\n,c => noun.s ! Sg ! Nom ++ cn.s ! n ! c;
			g = cn.g
			};

	myThatlessSlashV2S : V2S -> S -> VPSlash = \v,s -> insertExtrac s.s (predVc v);

	myFreeIClSlash : (ip : IP) -> (cl : ClSlash) -> {s : ResEng.Tense => Anteriority => CPolarity => Order => Str; c : NPCase } =
	\ip,cl -> {
	  s = \\t,a,p,_ => ip.s ! npNom ++ cl.s ! t ! a ! p ! oDir ++ cl.c2;
		  c = npNom
			  } ;

	myFreeICl : (ip : IP) -> (vp : VP) -> {s : ResEng.Tense => Anteriority => CPolarity => Order => Str; c : NPCase } =
		\ip,vp -> let qcl = WH_Pred ip vp in
	{
	  s = \\t,a,p,_ => qcl.s ! t ! a ! p ! QDir ;
		  c = npNom
			  };

	myIAdvA	: (iadv : IAdv ) -> (a : A) -> {s : Str} =
	\iadv,a -> ss ( iadv.s ++ a.s ! AAdj Posit Nom);

	myInfICl : (iadv : IAdv) -> (vp : VP) -> {s : ResEng.Tense => Anteriority => CPolarity => QForm => Str } =
		\iadv,vp -> let qcl = mkSC vp in
	{
		s = \\t,a,p,_ => iadv.s ++ qcl.s
		};

	myFreeInfICl : (iadv : IAdv) -> (vp : VP) -> {s : ResEng.Tense => Anteriority => CPolarity => Order => Str; c : NPCase } =
		\iadv,vp -> let qcl = mkSC vp in
	{
		s = \\t,a,p,_ => iadv.s ++ qcl.s;
		c = npNom
		};

	myFreeInfCl :  (vp : VP) -> {s : ResEng.Tense => Anteriority => CPolarity => Order => Str; c : NPCase } =
		\vp -> let cl = 
    infVP VVAux vp Simul CPos (agrP3 Sg) ; --- agr
	in {
		s = \\t,a,p,_ => cl ;
		c = npNom
		};

	mymkNP : (ncl : NounCl) -> {s : NPCase => Str ; a : Agr} =
		\ncl -> let string = ncl.s ! Pres ! Simul ! CPos ! oDir ;
								agreement = toAgr Sg P3 Neutr in {
			s = \\c => string;
			a = agreement;
		};

	myCltoNP : (str : Str) -> (cl : Cl) -> {s : NPCase => Str ; a : Agr} =
		\str,cl -> let np = str ++ cl.s ! Pres ! Simul ! CPos ! oDir ;
								agreement = toAgr Sg P3 Neutr in {
			s = \\_ => np;
			a = agreement;
		};

	mySomething : (ap : AP) -> {s : NPCase => Str ; a : Agr} =
	\ap -> let agreement = something.a;
		adj = ap.s ! agreement;
		nom = something.s ! NCase Nom ++ adj;
		gen = glue nom "\'s" in
			{s = table {
				NCase Nom => nom;
				NPAcc => nom;
				_ => gen };
			a = agreement
			};

	myDetRCltoNP : ( det : Det ) -> ( rcl : RCl ) -> { s : NPCase => Str ; a : Agr} = 
	\det,rcl -> let agreement = (toAgr det.n P3 Masc);
							nom = det.s ++ rcl.s ! Pres ! Simul ! CPos ! agreement;
								gen = glue nom "'s" in {
			s = table {
				NCase Nom => nom;
				NCase Gen => gen;
				NPAcc => nom;
				NPNomPoss => gen };
			a = agreement;
		};


	myDetVPtoNP : (det : Det) -> (vp : VP) -> { s : NPCase => Str ; a : Agr} = 
		\det,vp -> let nom = det.s ++ (PartVP vp).s ! AgP3Pl Masc ;
								gen = glue nom "'s";
								agreement = toAgr det.n P3 Masc in {
			s = table {
				NCase Nom => nom;
				NCase Gen => gen;
				NPAcc => nom;
				NPNomPoss => gen };
			a = agreement;
		};

	myInfinitiveNP : (vp : VP) -> { s : NPCase => Str ; a : Agr} =
	\vp -> let nom = infVP VVInf vp  Simul CPos (AgP3Sg Neutr) ;
					gen = glue nom "'s";
					agreement = AgP3Sg Neutr in {
				s = table {
					NCase Nom => nom;
					NCase Gen => gen;
					NPAcc => nom;
					NPNomPoss => gen };
				a = agreement;
				};

	myModPass3 : (cn : CN) -> (v3 : V3) -> (np : NP) ->
		{s : Number => Case => Str ; g : Gender } =
		\cn,v3,np -> {
			s = table {
				Sg => table {
					Nom => cn.s ! Sg ! Nom ++ v3.s ! VPPart ++ np.s ! NPAcc;
					Gen => cn.s ! Sg ! Nom ++ v3.s ! VPPart ++ np.s ! NPNomPoss
					};
				Pl => table {
					Nom => cn.s ! Pl ! Nom ++ v3.s ! VPPart ++ np.s ! NPAcc;
					Gen => cn.s ! Pl ! Nom ++ v3.s ! VPPart ++ np.s ! NPNomPoss
					}
				};
			g = cn.g
			};

	myPurposeAdv : (conj : Str) -> (vp : VP) -> {s : Str} = 
		\conj,vp -> let purpose = PurposeVP vp in
		{ s = conj ++ purpose.s;
			lock_Adv = {}
			};

  myGerundAdv : (prep : Str) -> (vp : VP) -> {s : Str} =
	\prep, vp -> let
	gerund = GerundAdv vp in
		{ s = prep ++ gerund.s;
			lock_Adv = {}
			};

	mymkAP_N : (adj : AP) -> (noun : N) -> { s : Number => Case => Str ; g : Gender } =
		\adj,noun ->
		{
			s = \\n,c => adj.s ! AgP3Sg Neutr ++ noun.s ! n ! c;
			g = noun.g
		};

	mymkN_Adv : (noun : N) -> (adv : Adv) -> { s : Number => Case => Str ; g : Gender } =
		\noun,adv ->
		{
			s = \\n,c => noun.s ! n ! c ++ adv.s;
			g = noun.g
		};

	myApposNP : (np1 : NP) -> (insert : Str) -> (np2 : NP) -> { s : NPCase => Str ; a : Agr } =
		\np1,insert,np2 ->
		{s = \\n => np1.s ! n ++ insert ++ np2.s ! n; a = np1.a};

  myAdjAsCN : (ap : AP) -> { s : Number => Case => Str ; g : Gender } =
		\ap ->
		{ s = \\n,c => ap.s ! agrgP3 n Neutr;
			g = Neutr
		} ;

	myNPPostPredet : (np : NP) -> (pred : Predet) -> {s : NPCase => Str ; a : Agr} =
	\np,pred ->
		{
		s = \\c => np.s ! c ++ pred.s ;
		a = np.a
		} ;

	myCAdvCNNP : (cadv : CAdv) -> ( cn : CN ) -> ( np : NP ) -> { s : Number => Case => Str ; g : Gender } =
	\cadv,cn,np ->
		{
		s = \\n,c => cadv.s ++ cn.s ! n ! c ++ cadv.p ++ np.s ! npNom;
		g = cn.g};

	myVPPlus : (vp : VP) -> (str : Str) -> {
	  s   : VerbForms;
		p   : Str ;
		prp : Str ;
		ptp : Str ;
		inf : Str ;
		ad  : Agr => Str ;
		s2  : Agr => Str ;
		ext : Str ;
		isSimple : Bool
					}  =
	\vp,str ->
		{
		s = vp.s;
		p = vp.p;
		prp = vp.prp;
		ptp = vp.ptp;
		inf = vp.inf;
		ad = \\a => vp.ad ! a;
		s2 = \\a => vp.s2 ! a ++ str;
		ext = vp.ext;
		isSimple = vp.isSimple
		};

	myMassMod : (un : N) -> (rs : RS) -> { s : Number => Case => Str ; g: Gender } =
	\un,rs ->
		{
		s = \\n,c => un.s ! n ! c ++ rs.s ! AgP3Sg Neutr ;
		g = un.g
		};
	myOrdSuperl : (a : A) -> { s : Case => Str } =
		\a -> {s = \\c => a.s ! AAdj Superl c } ;

	myPartN : (v : V) -> {
		s : Number => Case => Str ;
		g : Gender} =
	\v -> let part = v.s ! VPresPart; partGen = glue part "'s"
		in
		{
			s = table {
				Sg => table {
					Nom => part;
					Gen => partGen};
				Pl => table {
					_ => nonExist }
			};
			g = Neutr;
			lock_N = {}
		} ;

lin
	Be_bad ap	= mkComp ap;
  Be_somewhere located	= mkComp located;
	Be_someone np	= mkComp np;
	Be_AdV_NP adv np = mkComp np;
	Be_coagent adv = mkComp adv;
	Be_theme adv = mkComp adv;
	Be_vp comp	= mkVP comp;
	Look_bad verb adj	= mkVP verb adj;
  Locating prep item	= mkAdv prep item;
	Location det placename = mkNP det placename;
	NamedPlace pn	= mkNP pn;
	Coagency prep coagent	= mkAdv prep coagent;
	Instrumenting prep instrument = mkAdv prep instrument;
	Themeing prep instrument = mkAdv prep instrument;
	Mannering prep style = mkAdv prep style;
	Timing prep time = mkAdv prep time;
	Sourcing prep source = mkAdv prep source;
	Resulting prep result = mkAdv prep result;
	Patienting prep result = mkAdv prep result;
	Extenting prep degree	=mkAdv prep degree;
	Attributing prep attribute	= mkAdv prep attribute;
	Stimulating prep stimulus	= mkAdv prep stimulus;
	Happening action	=	mkVP action;
	Changing action patient	= mkVP action patient;
	V_NP_VP causal patient predicate	= mkVP causal patient predicate;
	Intens attitude predicate	= mkVP attitude predicate;
	NegComplVV v vp = ComplVV v {s=[]; a=Simul} {s =[]; p= CNeg False } vp;
	V_that_S posit event	= mkVP posit event;
	V_S posit event	= ComplBareVS posit event;
	V_SC posit event	= ComplBareVS posit event;
	V_NP_that_S posit patient event	= mkVP posit patient event;
	V_NP_S posit patient event = (ComplSlash (myThatlessSlashV2S posit event) patient);
	V_Q	v topic= mkVP v topic;
	V_NP_whether_S ask recipient topic = mkVP ask recipient topic;
  V_NP_NP v theme recipient = mkVP v theme recipient; 
  V_NP_AP v patient state = mkVP v patient state;
  GetPassV3 v np = insertObj (\\_ => v.s ! VPPart ++ v.p ++ v.c2 ++ v.c3 ++ np.s ! NPAcc) (predAux auxGet) ;
  -- GetNPPPart v np = insertObj (\\_ => np.s ! NPAcc ++ v.s ! VPPart ++ v.p ++ v.c2 ) (predAux auxGet) ;
	passive v = passiveVP v;
	Pass vp = PassVPSlash vp;
	PassAgent vp np = PassAgentVPSlash vp np;
	V2Slash v2	= mkVPSlash v2;
	-- VSSlash vs	= mkVPSlash vs;
	V2VSlash v2v vp	= mkVPSlash v2v vp;
	V2ASlash v2a ap	= mkVPSlash v2a ap;
	V3Slash v3 np	= mkVPSlash v3 np;
	reflexive slash = reflexiveVP slash;
	ModInf cn vp = mkCN cn vp;
	ModPass3 cn v3 np = myModPass3 cn v3 np;
	-- ModSlInf cn vpslash = mkCN cn vpslash;
	MassModInf n vp = mkCN( mkCN n) vp;
	Modified cn rcl = mkCN cn ( mkRS rcl);
	MassMod n rcl = myMassMod n (mkRS rcl);
	SubjRel	rp vp = mkRCl rp vp;
	ObjRel rp clslash = mkRCl rp clslash;
	EmptyRel slash = EmptyRelSlash slash;
	EmptyRelSlash slash = EmptyRelSlash slash;
	DetRCltoNP det rcl	= myDetRCltoNP det rcl;
	DetVPtoNP det vp = myDetVPtoNP det vp;
	InfinitiveNP vp = myInfinitiveNP vp;
	WayNP cl = myCltoNP "the way that" cl;
	HowNP cl = myCltoNP "how" cl;
	ThatNP cl	= myCltoNP "that" cl;
	PartN v	= myPartN v;
	Gerund vp = GerundNP vp;
	GerundSlash vp = GerundCN vp;
	ByGerund vp = ByVP vp;
	SClSlash	np vpslash = mkClSlash np vpslash;
	-- VPClSlash	vpslash = mkClSlash vpslash;
	FreeICl ip vp = myFreeICl ip vp;
	FreeIClSlash ip cl = myFreeIClSlash ip cl;
	IAdvA iadv a = myIAdvA iadv a;
	FreeInfICl iadv vp = myFreeInfICl iadv vp;
	FreeInfCl vp	= myFreeInfCl vp;
	NomCl ncl = mymkNP ncl;
	Mannered np adv = mkNP np adv;
	Sourced np adv	= mkNP np adv;
	Themed np adv	= mkNP np adv;
	AdV_VP adv vp = mkVP adv vp;
	AdV_VPSlash adv vps = AdVVPSlash adv vps;
  WithPlace v located	= mkVP (mkVP v) located;
  AdvVP adv vp	= mkVP adv vp;
	VPAdv vp adv = mkVP vp adv;
  VP_Adv_coagent v pp	= mkVP v pp;
	VP_Adv_instrument vp pp = mkVP vp pp;
	VP_Adv_theme vp pp = mkVP vp pp;
	VP_Adv_manner vp pp = mkVP vp pp;
	VP_Adv_time vp pp = mkVP vp pp;
	VP_Adv_location vp located = mkVP vp located;
	VP_Adv_result vp result = mkVP vp result;
	VP_Adv_extent vp extent = mkVP vp extent;
	VP_Adv_attribute vp attribute = mkVP vp attribute;
	VP_Adv_stimulus vp stimulus	= mkVP vp stimulus;
	VP_Adv_goal vp goal	= mkVP vp goal;
	WithCl vp cl = mkVP vp cl;
	VPToo vp = myVPPlus vp "too";
	VPAlready vp = myVPPlus vp "already";
	WithClPre cl s = mkS cl s;
	WithAdvPre adv s = mkS adv s;
	ThemePre adv s = mkS adv s;
	PatientPre adv s = mkS adv s;
	SourcePre adv s = mkS adv s;
	TimePre adv s = mkS adv s;
	ExtentPre adv s = mkS adv s;
  -- Be_made_sth vp np = PassV3 vp np;

	ICompS i np = mkQS (mkQCl i np);
	YN cl	= mkQCl cl;
	WH_Pred ip vp	= mkQCl ip vp;
	WHose cn = mkIP (GenIP who_WH) cn;
	IPhrase idet cn = mymkIPhrase idet cn;
	WH_ClSlash ip cslash	= mkQCl ip cslash;
	IAdvQCl iadv cl	= mkQCl iadv cl;
	IAdvInfICl iadv vp	= myInfICl iadv vp;
	PosQ qcl	= mkQS qcl;
	NegQ qcl	= mkQS negativePol qcl;
	PosS cl	= mkS cl;
	NegS cl	= mkS negativePol cl;
	QUt q	= mkUtt q;
	Ut s	= mkUtt s;
	Sentence subject predicate	= mkCl subject predicate;
	Exist np = mkCl np;

	Yes	= yes_Utt;
	No	= no_Utt;
	NoAnswer	= ss "No answer";
	Answer np = mkUtt np;

	Inject i = mkSC( mkUtt i);

	Entity pn	= mkNP pn;
	Kind ap cn	= mkCN ap cn;
	MassKind ap n = mymkAP_N ap n;
	Something ap = mySomething ap;
	KindOfKind cn adv	= mkCN cn adv;
	MassKindOfKind n adv	= mymkN_Adv n adv;
  KindInTime cn adv	= mkCN cn adv;
	KindOfTime adj cn	= mkCN adj cn;
	TimeInTime cn adv = mkCN cn adv;
	TimeAsAdv det cn = mkAdv P.noPrep (mkNP det cn);
	TimeAsAdvWithPredet predet det cn = mkAdv P.noPrep (mkNP predet (mkNP det cn) );
	KindInPlace cn adv	= mkCN cn adv;
	NPInPlace np adv = mkNP np adv;
	PlaceKind ap n = mkCN ap n;
	KindToExtent cn adv	= mkCN cn adv;
	Membership det cn place = mkCl( Item det (KindInPlace cn place));
	CompoundCN cn1 cn2 = CompoundCN cn1 cn2;
	PN_CN pn cn	= { s = \\n,c => pn.s ! Nom ++ cn.s ! n ! c;
		g = cn.g };
	Ofpos n2 np	= mkCN n2 np;
	Ofpart part n = mkCN part (mkNP n);
	N2toCN n2 = mkCN n2;
	Item det noun	= mkNP det noun;
	MassItem udet ucn	= mkNP udet ucn;
	Titular cn = mkNP cn;
	PredetItem predet np	= mkNP predet np;
	ApposNP np1 np2 = myApposNP np1 "," np2;
	NPPostPredet np predet = myNPPostPredet np predet;

	a_DET	= a_Det;
	zero_Det_pl	= aPl_Det;
	zero_Det_sg	= mkDet zero_mass_Quant singularNum;
	the_MASS_DET	= theSg_Det;
	some_MASS_DET = mkDet some_Quant singularNum;
	any_MASS_DET = mkDet any_Quant singularNum;
	the_SG_DET	= theSg_Det;
	the_PLURAL_DET = thePl_Det;
	Apos np	= mkDet (GenNP np);
	MassApos np	= mkDet (GenNP np);
	Apos_pl np	= mkDet (GenNP np) pluralNum;
	no_DET	= mkDet no_Quant;
	no_PL_DET	= mkDet no_Quant pluralNum;
	no_NP = mkNP( mkDet no_Quant);
	no_PL_NP = mkNP( mkDet no_Quant pluralNum);
	no_MASSDET = mkDet no_Quant;
	some_PREDET	= ss "some of";
	some_DET = mkDet some_Quant;
	some_PL_DET = mkDet some_Quant pluralNum;
	some_NP = mkNP( mkDet some_Quant);
	some_PL_NP = mkNP( mkDet some_Quant pluralNum);
	something	= something_NP;
	every_DET	= every_Det;
	everyone_NP = mkNP every_Det;
	all_PREDET	= all_Predet;
	that_PRON = mkNP (mkDet that_Quant);
	this_PRON = mkNP (mkDet this_Quant);
	List np1 np2 = mkListNP np1 np2;
	AddList np list = mkListNP np list;
	CloseList conj list = mkNP conj list;
	APList np1 np2 = mkListAP np1 np2;
	AddAP ap list = mkListAP ap list;
	CloseAP conj list = mkAP conj list;
	AdvList np1 np2 = mkListAdv np1 np2;
	AddAdv ap list = mkListAdv ap list;
	CloseAdv conj list = mkAdv conj list;
	ConcatS	conj s1 s2 = mkS conj s1 s2;
	PreConjUtt conj utt = mkPhr (mkPConj conj) utt;

	her_DET	= mkDet she_Pron;
	her_MASSDET	= mkDet she_Pron;
	his_DET	= mkDet he_Pron;
	its	= mkDet it_Pron;
	your	= mkDet youSg_Pron;
	their	= mkDet they_Pron;
	this	= mkDet this_Quant;
	that	= mkDet that_Quant;
	those = mkDet that_Quant pluralNum;

	she = mkNP she_Pron;
	he = mkNP he_Pron;
	it = mkNP it_Pron;
	they = mkNP they_Pron;
	you = mkNP youSg_Pron;
	we	= mkNP we_Pron;

	who_WH	= mymkIP "who" "who" "whose" Sg;
	what_WH	= whatSg_IP;
	what_PL_IDET = { s = "what"; n = Pl };
	which_SG_IDET = { s = "which"; n = Sg };
	how_WH	= how_IAdv;
	that_RP	= ExtraEng.that_RP;
	who_RP	= mymkRP "who" "which" "whose";
	-- in_which	=mkRP in_prep which_RP;
	where_RP	= mymkRP "where" "where" "where";
	when_RP	= mymkRP "when" "when" "when";

	more	= more_CAdv;
	ComparaAP a np = mkAP a np;
	ComparaAdv cadv a np = mkAdv cadv a np;
	ComparaN cadv cn np = mkNP ( myCAdvCNNP cadv cn np);
	ComparaS a s = mkAP a s;
	AdjModified	a s = mkAP a s;
	As_as ap np	= mkAP as_CAdv ap np;
	AdvAdj adv adj = mkAP adv adj;
	A_PP a np = mkAP a np;
	VP_AP vp = PresPartAP vp;
	VPSlash_AP vp = PastPartAP vp;
	VP_NP_AP vp np = PastPartAgentAP vp np;

  about_PREP	= P.mkPrep "about";
  at_PREP	= P.mkPrep "at";
	before_PREP	= P.mkPrep "before";
  from_PREP	= P.mkPrep "from";
	of_PREP	= possess_Prep;
  part_prep	= part_Prep;
  up_PREP	= P.mkPrep "up";

	person	= mkCN( P.mkN Masc ( P.mkN "person" "people"));
	thing	= mkCN( P.mkN Neutr ( P.mkN "thing"));

	can	= can_VV;
	have	= P.mkV2 IrregEng.have_V;
	know_V2	= P.mkV2 know_V;
	know_VS	= P.mkVS know_V;

	Not_Adv a = ParadigmsEng.mkAdv ("not" ++ a.s);
	Very_Adv a = ParadigmsEng.mkAdv ("very" ++ a.s);
	In_order_to vp = myPurposeAdv "in order" vp;
	To_purpose vp	= myPurposeAdv "" vp;
	because_SUBJ	= because_Subj;
	if_SUBJ	= if_Subj;
	when_SUBJ = when_Subj;
	so_SUBJ	= P.mkSubj "so";
	or_CONJ	= or_Conj;

	Subjunct subj s	= mkAdv subj s;

	TagS np vp = myTagModal np vp;

}

-- vim: set ts=2 sts=2 sw=2 noet:
