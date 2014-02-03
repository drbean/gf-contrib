--# -path=.:./gf-contrib/drbean/conversation/work/dickson:present

concrete DicksonEng of Dickson = DicksonI with
  (Syntax = SyntaxEng),
  (LexDickson = LexDicksonEng) **
  open ResEng,Prelude in {

lincat
  Tag	= {s : Str};
  Aux	= {s : Str};
  Pron	= Syntax.Pron;
param
  Auxiliary	= Do ; -- | Be;

oper
  tag : NP -> {s : Polarity => Str} =
    \subj -> { s = case <(fromAgr subj.a).n, (fromAgr subj.a).g,Do> of {
      <Sg,Fem,Do> => table { Pos => "doesn't she"; Neg => "does she" };
      <Sg,Masc,Do>  => table { Pos => "doesn't he"; Neg => "does he" };
      <Sg,Neutr,Do> => table { Pos => "doesn't it"; Neg => "does it" };
      <Pl,_,Do>	=> table { Pos => "don't they"; Neg => "do they" }
    }
  };

lin
  TagQ np vp	= let cl = mkCl np vp
  in
  {s = table {
    Pres => table {
      Simul => table {
	CPos => table {
	  QDir => cl.s ! Pres ! Simul ! CPos ! ODir ++ (tag np).s ! Pos;
	  QIndir => "nonExist" };
	CNeg True => table {
	  QDir => cl.s ! Pres ! Simul ! CNeg True ! ODir ++ (tag np).s ! Neg;
	  QIndir => "nonExist" };
	CNeg False => table {
	  QDir => cl.s ! Pres ! Simul ! CNeg False ! ODir ++ (tag np).s ! Neg;
	  QIndir => "nonExist" }
	  }
	}
     };
  lock_QCl = <>;
	  };
	}

-- vim: set ts=8 sts=2 sw=2 noet:
