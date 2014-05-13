--# -path=.:../../../../drbean:present

concrete TrinkaEng of Trinka = TrinkaI with
  (Syntax = SyntaxEng),
  (LexTrinka = LexTrinkaEng) **
  open ResEng,Prelude, IrregEng in {

param
  Auxiliary	= Do | Be;

oper
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

-- vim: set ts=8 sts=2 sw=2 noet:
