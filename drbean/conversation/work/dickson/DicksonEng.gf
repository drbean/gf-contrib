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
  tag : NP -> VP -> {s : Str} =
    \subj,verb -> { s = case <(fromAgr subj.a).n, (fromAgr subj.a).g,Pos,Do> of {
      <Sg,Fem,Pos,Do>	=> "doesn't she"; -- table { Pos => table { Do => "doesn't she"; Be => "isn't she"};
      <Sg,Fem,Neg,Do>	=> "does she"; -- table { Pos => table { Do => "doesn't she"; Be => "isn't she"};
			  -- Neg => table { Do => "does she"; Be => "is she" }};
      <Sg,Masc,Pos,Do> => "doesn't he"; -- table { Pos => table { Do => "doesn't he"; Be => "isn't he"};
      <Sg,Masc,Neg,Do> => "does he"; -- table { Pos => table { Do => "doesn't he"; Be => "isn't he"};
			  -- Neg => table { Do => "does he"; Be => "is he" }};
      <Sg,Neutr,Pos,Do>=> "doesn't it"; -- table { Pos => table { Do => "doesn't it"; Be => "isn't it"};
      <Sg,Neutr,Neg,Do>=> "does it"; -- table { Pos => table { Do => "doesn't it"; Be => "isn't it"};
			  -- Neg => table { Do => "does it"; Be => "is it" }};
      <Pl,_,Pos,Do>	=> "don't they"; -- table { Pos => table { Do => "don't they"; Be => "aren't they"};
      <Pl,_,Neg,Do>	=> "do they" -- table { Pos => table { Do => "don't they"; Be => "aren't they"};
			  -- Neg => table { Do => "do they"; Be => "are they" }}
    }
  };

lin
  TagQ np vp	= let cl = mkCl np vp
  in
  {s = table { Pres => table {
      Simul => table { CPos => table { QDir => cl.s ! Pres ! Simul ! CPos ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg True => table { QDir => cl.s ! Pres ! Simul ! CNeg True ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg False => table { QDir => cl.s ! Pres ! Simul ! CNeg False ! ODir ++ (tag np vp).s; QIndir => nonExist }};
      Anter => table { CPos => table { QDir => cl.s ! Pres ! Anter ! CPos ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg True => table { QDir => cl.s ! Pres ! Anter ! CNeg True ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg False => table { QDir => cl.s ! Pres ! Anter ! CNeg False ! ODir ++ (tag np vp).s; QIndir => nonExist }}};
    Past => table {
      Simul => table { CPos => table { QDir => cl.s ! Past ! Simul ! CPos ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg True => table { QDir => cl.s ! Past ! Simul ! CNeg True ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg False => table { QDir => cl.s ! Past ! Simul ! CNeg False ! ODir ++ (tag np vp).s; QIndir => nonExist }};
      Anter => table { CPos => table { QDir => cl.s ! Past ! Anter ! CPos ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg True => table { QDir => cl.s ! Past ! Anter ! CNeg True ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg False => table { QDir => cl.s ! Past ! Anter ! CNeg False ! ODir ++ (tag np vp).s; QIndir => nonExist }}};
    Fut => table {
      Simul => table { CPos => table { QDir => cl.s ! Fut ! Simul ! CPos ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg True => table { QDir => cl.s ! Fut ! Simul ! CNeg True ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg False => table { QDir => cl.s ! Fut ! Simul ! CNeg False ! ODir ++ (tag np vp).s; QIndir => nonExist }};
      Anter => table { CPos => table { QDir => cl.s ! Fut ! Anter ! CPos ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg True => table { QDir => cl.s ! Fut ! Anter ! CNeg True ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg False => table { QDir => cl.s ! Fut ! Anter ! CNeg False ! ODir ++ (tag np vp).s; QIndir => nonExist }}};
    Cond => table {
      Simul => table { CPos => table { QDir => cl.s ! Cond ! Simul ! CPos ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg True => table { QDir => cl.s ! Cond ! Simul ! CNeg True ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg False => table { QDir => cl.s ! Cond ! Simul ! CNeg False ! ODir ++ (tag np vp).s; QIndir => nonExist }};
      Anter => table { CPos => table { QDir => cl.s ! Cond ! Anter ! CPos ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg True => table { QDir => cl.s ! Cond ! Anter ! CNeg True ! ODir ++ (tag np vp).s; QIndir => nonExist };
		       CNeg False => table { QDir => cl.s ! Cond ! Anter ! CNeg False ! ODir ++ (tag np vp).s; QIndir => nonExist }}}
     };
  lock_QCl = <>;
	  };
	}

-- vim: set ts=8 sts=2 sw=2 noet:
