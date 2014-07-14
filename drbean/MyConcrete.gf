concrete MyConcrete of MyAbstract = open Prelude, ResEng, SyntaxEng, ConstructorsEng, ParadigmsEng, ExtraEng, IrregEng, StructuralEng in {

lincat
  Utt	= SyntaxEng.Utt;
  PN	= SyntaxEng.PN;
  NP	= SyntaxEng.NP;
  N	= SyntaxEng.N;
  AP	= SyntaxEng.AP;
  Adv	= SyntaxEng.Adv;
  AdV	= SyntaxEng.AdV;
  AdA	= SyntaxEng.AdA;
  Comp	= SyntaxEng.Comp;
  Cl	= SyntaxEng.Cl;
  QCl	= SyntaxEng.QCl;
  S	= SyntaxEng.S;
  QS	= SyntaxEng.QS;
  SC	= SyntaxEng.SC;
  V	= SyntaxEng.V;
  VP	= SyntaxEng.VP;
	VPSlash = SyntaxEng.VPSlash;
	RCl	= SyntaxEng.RCl;
	RS	= SyntaxEng.RS;
	RP	= SyntaxEng.RP;
	ClSlash	= SyntaxEng.ClSlash;
  V2	= SyntaxEng.V2;
  V3	= SyntaxEng.V3;
  V2V	= SyntaxEng.V2V;
  V2S	= SyntaxEng.V2S;
  V2A	= SyntaxEng.V2A;
  VV	= SyntaxEng.VV;
  VS	= SyntaxEng.VS;
  VA	= SyntaxEng.VA;
	Quant	= SyntaxEng.Quant;
  Det	= SyntaxEng.Det;
  Predet	= SyntaxEng.Predet;
  CN	= SyntaxEng.CN;
  N2	= SyntaxEng.N2;
  IP	= SyntaxEng.IP;
  Prep	= SyntaxEng.Prep;
  CAdv	= SyntaxEng.CAdv;
	Num	= SyntaxEng.Num;
	Numeral	= SyntaxEng.Numeral;
	Ord	= SyntaxEng.Ord;
	CardOrd	= ResEng.CardOrd;
	Freq	= SyntaxEng.Adv;
	Times	= SyntaxEng.NP;
	Period	= SyntaxEng.Adv;

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
	-- Is item quality	=	mkCl item quality;
	-- Cop item1 item2	= mkCl item1 item2;
	Be_bad ap	= SyntaxEng.mkComp ap;
  Be_mod located	= mkComp located;
	Be_someone np	= SyntaxEng.mkComp np;
	Be_vp comp	= SyntaxEng.mkVP comp;
	Look_bad verb adj	= SyntaxEng.mkVP verb adj;
  Location prep item	= SyntaxEng.mkAdv prep item;
	FreqAdv times period	= SyntaxEng.mkAdv ParadigmsEng.noPrep (SyntaxEng.mkNP times period);
	Happening action	=	SyntaxEng.mkVP action;
	Changing action patient	= SyntaxEng.mkVP action patient;
	Causative causal patient predicate	= SyntaxEng.mkVP causal patient predicate;
	Intens attitude predicate	= SyntaxEng.mkVP attitude predicate;
	Positing posit event	= SyntaxEng.mkVP posit event;
	Informing posit patient event	= SyntaxEng.mkVP posit patient event;
  Triangulating v patient recipient = mkVP v patient recipient; 
  Pred2A v patient state = mkVP v patient state;
  -- PassV3 v np = insertObj (\\_ => v.s ! VPPart ++ v.p ++ v.c2 ++ v.c3 ++ np.s ! NPAcc) (predAux auxBe) ;
	Pass vp = PassVPSlash vp;
	V2Slash v2	= mkVPSlash v2;
	V2VSlash v2v vp	= mkVPSlash v2v vp;
	V3Slash v3 np	= mkVPSlash v3 np;
	Modified cn rcl = mkCN cn ( mkRS rcl);
	SubjRel	rp vp = mkRCl rp vp;
	ObjRel rp clslash = mkRCl rp clslash;
	VPClSlash	np vpslash = mkClSlash np vpslash;
  VPAdv vp adv	= mkVP vp adv;
  AdvVP adv vp	= mkVP adv vp;
  WithFreq action frequency	= mkVP action frequency;
  -- Be_made_sth vp np = PassV3 vp np;
	YN cl	= SyntaxEng.mkQCl cl;
	-- WH_Cop ip comp	= mkQCl ip comp;
	WH_NP ip np	= SyntaxEng.mkQCl ip np;
	WH_AP ip ap	= SyntaxEng.mkQCl ip ap;
	WH_Pred ip vp	= SyntaxEng.mkQCl ip vp;
	PosQ qcl	= SyntaxEng.mkQS qcl;
	NegQ qcl	= SyntaxEng.mkQS SyntaxEng.negativePol qcl;
	PosS cl	= SyntaxEng.mkS cl;
	NegS cl	= SyntaxEng.mkS SyntaxEng.negativePol cl;
	QUt q	= SyntaxEng.mkUtt q;
	Ut s	= SyntaxEng.mkUtt s;
	Sentence subject predicate	= SyntaxEng.mkCl subject predicate;

	Yes	= SyntaxEng.yes_Utt;
	No	= SyntaxEng.no_Utt;
	NoAnswer	= ss "No answer";

	Entity pn	= SyntaxEng.mkNP pn;
	Kind ap cn	= SyntaxEng.mkCN ap cn;
  KindOfKind cn adv	= mkCN cn adv;
	Ofpos n2 np	= SyntaxEng.mkCN n2 np;
	Item det noun	= SyntaxEng.mkNP det noun;
	PredetItem predet np	= SyntaxEng.mkNP predet np;

	a_Det	= SyntaxEng.a_Det;
	zero_Det	= SyntaxEng.aPl_Det;
	the_Det	= SyntaxEng.the_Det;
	thePlural_Det = SyntaxEng.thePl_Det;
	Apos np	= SyntaxEng.mkDet (GenNP np);
	Apos_pl np	= SyntaxEng.mkDet (GenNP np) pluralNum;
	no_Det	= mkDet no_Quant;
	no_pl_Det	= mkDet no_Quant pluralNum;
	no_NP = mkNP( mkDet no_Quant);
	no_pl_NP = mkNP( mkDet no_Quant pluralNum);
	some_Det = mkDet some_Quant;
	some_pl_Det = mkDet some_Quant pluralNum;
	some_NP = mkNP( mkDet some_Quant);
	some_pl_NP = mkNP( mkDet some_Quant pluralNum);

	who_WH	= SyntaxEng.whoSg_IP;
	what_WH	= SyntaxEng.whatSg_IP;
	which_RP	= SyntaxEng.which_RP;
	that_RP	= ExtraEng.that_RP;

  about_prep	= mkPrep "about";
  at_prep	= mkPrep "at";
  from_prep	= mkPrep "from";
  in_prep	= mkPrep "in";
	of_prep	= possess_Prep;
  on_prep	= mkPrep "on";
  over_prep	= mkPrep "over";
  part_prep	= part_Prep;
  to_prep	= to_Prep;
  up_prep	= mkPrep "up";
  with_prep	= mkPrep "with";

	too_AdA	= too_AdA;
	can	= can_VV;
	become	= mkV2 IrregEng.become_V;
	know_V2	= mkV2 know_V;
	know_VS	= mkVS know_V;

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
