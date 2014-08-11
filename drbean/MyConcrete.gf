concrete MyConcrete of MyAbstract = open ResEng, Prelude, ConstructorsEng, ParadigmsEng, ExtraEng, IrregEng, StructuralEng in {

lincat
  Utt	= Utt;
  PN	= PN;
  NP	= NP;
	ListNP	= ListNP;
  N	= N;
  A	= A;
  AP	= AP;
  Adv	= Adv;
  AdV	= AdV;
  AdA	= AdA;
  Comp	= Comp;
  Cl	= Cl;
  QCl	= QCl;
  S	= S;
  QS	= QS;
  SC	= SC;
  V	= V;
  VP	= VP;
	VPSlash = VPSlash;
	RCl	= RCl;
	RS	= RS;
	RP	= RP;
	ClSlash	= ClSlash;
  V2	= V2;
  V3	= V3;
  V2V	= V2V;
  V2S	= V2S;
  V2A	= V2A;
  VV	= VV;
  VS	= VS;
  VA	= VA;
	Quant	= Quant;
  Det	= Det;
  Predet	= Predet;
  CN	= CN;
  N2	= N2;
  IP	= IP;
  Prep	= Prep;
  CAdv	= CAdv;
	Freq	= Adv;
	Times	= NP;
	Period	= Adv;
	Subj	= Subj;
	Conj	= Conj;
	Title	= CN;
	Place	= NP;
	PlaceName	= CN;
	LocPrep	= Prep;
	Located	= Adv;
	Motion	= VP;
	Style	= Adv;

param
  Auxiliary	= Do | Be;

oper

	no_Quant	= StructuralEng.no_Quant;
	some_Quant	= mkQuant "some" "some" "some" "some";

	know_V = IrregEng.know_V;

  tag : NP -> {s : Auxiliary => Polarity => Str} =
    \subj -> { s = case <(fromAgr subj.a).n, (fromAgr subj.a).g> of {
      <Sg,Fem> => table {
		      Do => table {Pos => "doesn't she"; Neg => "does she" };
		      Be => table {Pos => "isn't she"; Neg => "is she" }
		      };
      <Sg,Masc>  => table {
		      Do => table { Pos => "doesn't he"; Neg => "does he" };
		      Be => table {Pos => "isn't he"; Neg => "is he" }
		      };
      <Sg,Neutr> => table {
		      Do => table { Pos => "doesn't it"; Neg => "does it" };
		      Be => table {Pos => "isn't it"; Neg => "is it" }
		      };
      <Pl,_>	=> table {
		      Do => table { Pos => "don't they"; Neg => "do they" };
		      Be => table {Pos => "aren't they"; Neg => "are they" }
		      }
    }
  };

  auxiliary : VP -> Auxiliary =
    \vp -> case vp of {
      vp => Be;
      _	=> Do
    };

lin
	Be_bad ap	= mkComp ap;
  Be_mod located	= mkComp located;
	Be_someone np	= mkComp np;
	Be_vp comp	= mkVP comp;
	Look_bad verb adj	= mkVP verb adj;
  Locating prep item	= ConstructorsEng.mkAdv prep item;
	Location det placename = mkNP det placename;
	FreqAdv times period	= ConstructorsEng.mkAdv noPrep (mkNP times period);
	Happening action	=	mkVP action;
	Changing action patient	= mkVP action patient;
	Causative causal patient predicate	= mkVP causal patient predicate;
	Intens attitude predicate	= mkVP attitude predicate;
	Positing posit event	= mkVP posit event;
	Informing posit patient event	= mkVP posit patient event;
  Triangulating v patient recipient = mkVP v patient recipient; 
  Pred2A v patient state = mkVP v patient state;
  GetPassV3 v np = insertObj (\\_ => v.s ! VPPart ++ v.p ++ v.c2 ++ v.c3 ++ np.s ! NPAcc) (predAux auxGet) ;
  GetNPPPart v np = insertObj (\\_ => np.s ! NPAcc ++ v.s ! VPPart ++ v.p ++ v.c2 ) (predAux auxGet) ;
	Pass vp = PassVPSlash vp;
	V2Slash v2	= mkVPSlash v2;
	-- VSSlash vs	= mkVPSlash vs;
	V2VSlash v2v vp	= mkVPSlash v2v vp;
	V3Slash v3 np	= mkVPSlash v3 np;
	Modified cn rcl = mkCN cn ( mkRS rcl);
	SubjRel	rp vp = mkRCl rp vp;
	ObjRel rp clslash = mkRCl rp clslash;
	VPClSlash	np vpslash = mkClSlash np vpslash;
  VPPlaced vp located	= mkVP vp located;
  AdvVP adv vp	= mkVP adv vp;
  WithFreq action frequency	= mkVP action frequency;
  WithStyle action style	= mkVP action style;
  -- Be_made_sth vp np = PassV3 vp np;
	YN cl	= mkQCl cl;
	WH_Pred ip vp	= mkQCl ip vp;
	WH_ClSlash ip cslash	= mkQCl ip cslash;
	PosQ qcl	= mkQS qcl;
	NegQ qcl	= mkQS negativePol qcl;
	PosS cl	= mkS cl;
	NegS cl	= mkS negativePol cl;
	QUt q	= mkUtt q;
	Ut s	= mkUtt s;
	Sentence subject predicate	= mkCl subject predicate;

	Yes	= yes_Utt;
	No	= no_Utt;
	NoAnswer	= ss "No answer";
	Answer np = mkUtt np;

	Entity pn	= mkNP pn;
	Kind ap cn	= mkCN ap cn;
  KindOfKind cn adv	= mkCN cn adv;
	Ofpos n2 np	= mkCN n2 np;
	Item det noun	= mkNP det noun;
	Titular cn = mkNP cn;
	PredetItem predet np	= mkNP predet np;

	a_Det	= a_Det;
	zero_Det	= aPl_Det;
	the_Det	= the_Det;
	thePlural_Det = thePl_Det;
	Apos np	= mkDet (GenNP np);
	Apos_pl np	= mkDet (GenNP np) pluralNum;
	no_Det	= mkDet no_Quant;
	no_pl_Det	= mkDet no_Quant pluralNum;
	no_NP = mkNP( mkDet no_Quant);
	no_pl_NP = mkNP( mkDet no_Quant pluralNum);
	some_Det = mkDet some_Quant;
	some_pl_Det = mkDet some_Quant pluralNum;
	some_NP = mkNP( mkDet some_Quant);
	some_pl_NP = mkNP( mkDet some_Quant pluralNum);
	Genitive_NP	np = mkNP (mkDet (GenNP np));
	List np1 np2 = mkListNP np1 np2;
	AddList np list = mkListNP np list;
	CloseList conj list = mkNP conj list;

	who_WH	= whoSg_IP;
	what_WH	= whatSg_IP;
	which_RP	= which_RP;
	that_RP	= ExtraEng.that_RP;

	more	= more_CAdv;
	ComparaAP a np = ConstructorsEng.mkAP a np;
	ComparaAdv cadv a np = ConstructorsEng.mkAdv cadv a np;
	ComparaS a s = mkAP a s;

  about_prep	= mkPrep "about";
  as_prep	= mkPrep "as";
  at_prep	= mkPrep "at";
	before_prep	= mkPrep "before";
  from_prep	= mkPrep "from";
  in_prep	= mkPrep "in";
  like_prep	= mkPrep "like";
	of_prep	= possess_Prep;
  on_prep	= mkPrep "on";
  over_prep	= mkPrep "over";
  part_prep	= part_Prep;
  to_prep	= to_Prep;
  up_prep	= mkPrep "up";
  with_prep	= mkPrep "with";

	can	= can_VV;
	become	= mkV2 IrregEng.become_V;
	know_V2	= mkV2 know_V;
	know_VS	= mkVS know_V;

	too_AdA	= too_AdA;
	because_Subj	= because_Subj;
	or_Conj	= or_Conj;

	Subjunct subj s	= ConstructorsEng.mkAdv subj s;

 TagQ np vp	= let
   cl = mkCl np vp;
 in
 {s = table {
     Pres => table {
       Simul => table {
         CPos => table {
           QDir => (cl.s ! Pres ! Simul ! CPos ! ODir False) ++ ((tag np).s ! Do ! Pos );
           QIndir => "nonExist" };
         CNeg True => table {
           QDir => (cl.s ! Pres ! Simul ! (CNeg True) ! ODir False) ++ ((tag np).s ! Do ! Neg );
           QIndir => "nonExist" };
         CNeg False => table {
           QDir => (cl.s ! Pres ! Simul ! (CNeg False) ! ODir False) ++ ((tag np).s ! Do ! Neg );
           QIndir => "nonExist" }
           }
         }
   };
 lock_QCl = <>;
 };

 --TagNP np1 np2	= let
 --  cl = mkCl np1 np2;
 --in
 --{s = table {
 --    Pres => table {
 --      Simul => table {
 --        CPos => table {
 --          QDir => (cl.s ! Pres ! Simul ! CPos ! ODir False) ++ ((tag np1).s ! Be ! Pos );
 --          QIndir => "nonExist" };
 --        CNeg True => table {
 --          QDir => (cl.s ! Pres ! Simul ! (CNeg True) ! ODir False) ++ ((tag np1).s ! Be ! Neg );
 --          QIndir => "nonExist" };
 --        CNeg False => table {
 --          QDir => (cl.s ! Pres ! Simul ! (CNeg False) ! ODir False) ++ ((tag np1).s ! Be ! Neg );
 --          QIndir => "nonExist" }
 --          }
 --        }
 --  };
 --lock_QCl = <>;
 --};

 --TagAP np ap	= let
 --  cl = mkCl np ap;
 --in
 --{s = table {
 --    Pres => table {
 --      Simul => table {
 --        CPos => table {
 --          QDir => (cl.s ! Pres ! Simul ! CPos ! ODir False) ++ ((tag np).s ! Be ! Pos );
 --          QIndir => "nonExist" };
 --        CNeg True => table {
 --          QDir => (cl.s ! Pres ! Simul ! (CNeg True) ! ODir False) ++ ((tag np).s ! Be ! Neg );
 --          QIndir => "nonExist" };
 --        CNeg False => table {
 --          QDir => (cl.s ! Pres ! Simul ! (CNeg False) ! ODir False) ++ ((tag np).s ! Be ! Neg );
 --          QIndir => "nonExist" }
 --          }
 --        }
 --  };
 --lock_QCl = <>;
 --};

  TagComp np comp	= let cl = mkCl np (mkVP comp)
  in
  {s = table {
    Pres => table {
      Simul => table {
        CPos => table {
          QDir => (cl.s ! Pres ! Simul ! CPos ! ODir False) ++ ((tag np).s ! Be ! Pos );
          QIndir => "nonExist" };
        CNeg True => table {
          QDir => (cl.s ! Pres ! Simul ! CNeg True ! ODir False) ++ ((tag np).s ! Be ! Neg );
          QIndir => "nonExist" };
        CNeg False => table {
          QDir => (cl.s ! Pres ! Simul ! CNeg False ! ODir False) ++ ((tag np).s ! Be ! Neg );
          QIndir => "nonExist" }
          }
        }
     };
  lock_QCl = <>;
  };

}

-- vim: set ts=2 sts=2 sw=2 noet:
