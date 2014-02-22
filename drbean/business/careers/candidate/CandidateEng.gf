concrete CandidateEng of Candidate = DicksonI with
  (Syntax = SyntaxEng),
  (LexDickson = LexDicksonEng) **
  open ResEng,Prelude in {

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
 TagQ np vp	= let
   cl = mkCl np vp;
 in
 {s = case Do of {
   Be =>
   table {
     Pres => table {
       Simul => table {
         CPos => table {
           QDir => (cl.s ! Pres ! Simul ! CPos ! ODir False) ++ ((tag np).s ! Be ! Pos );
           QIndir => "nonExist" };
         CNeg True => table {
           QDir => (cl.s ! Pres ! Simul ! (CNeg True) ! ODir False) ++ ((tag np).s ! Be ! Neg );
           QIndir => "nonExist" };
         CNeg False => table {
           QDir => (cl.s ! Pres ! Simul ! (CNeg False) ! ODir False) ++ ((tag np).s ! Be ! Neg );
           QIndir => "nonExist" }
           }
         }
       };
   _ => table {
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
       }
   };
 lock_QCl = <>;
 };

  --TagQ np comp	= let cl = mkCl np comp
  --in
  --{s = table {
  --  Pres => table {
  --    Simul => table {
  --      CPos => table {
  --        QDir => cl.s ! Pres ! Simul ! CPos ! ODir ; -- ++ (tag np).s ! Be ! Pos;
  --        QIndir => "nonExist" };
  --      CNeg True => table {
  --        QDir => cl.s ! Pres ! Simul ! CNeg True ! ODir ; -- ++ (tag np).s ! Be ! Neg;
  --        QIndir => "nonExist" };
  --      CNeg False => table {
  --        QDir => cl.s ! Pres ! Simul ! CNeg False ! ODir ; -- ++ (tag np).s ! Be ! Neg;
  --        QIndir => "nonExist" }
  --        }
  --      }
  --   };
  --lock_QCl = <>;
  --};
}

-- vim: set ts=8 sts=2 sw=2 noet:
