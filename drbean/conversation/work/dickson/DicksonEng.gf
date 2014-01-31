--# -path=.:./gf-contrib/drbean/conversation/work/dickson

concrete DicksonEng of Dickson = DicksonI with
	(Syntax = SyntaxEng),
	(LexDickson = LexDicksonEng) **
	open ResEng,Prelude in {

	lincat
		Tense	= Syntax.Tense;
		Ant	= Syntax.Ant;
		Pol	= Syntax.Pol;
	lin TagQ np cl	= let tag = case (fromAgr np.a).g of
			{	Fem  => "doesn't she";
				Masc => "doesn't he";
				Neutr => "doesn't it" }
		in
		{s = table { Pres => table {
			Simul => table { CPos => table { ODir => cl.s ! Pres ! Simul ! CPos ! ODir ++ ", " ++ tag; OQuest => nonExist };
					 CNeg True => table { ODir => cl.s ! Pres ! Simul ! CNeg True ! ODir; OQuest => nonExist };
					 CNeg False => table { ODir => cl.s ! Pres ! Simul ! CNeg False ! ODir; OQuest => nonExist }};
			Anter => table { CPos => table { ODir => cl.s ! Pres ! Anter ! CPos ! ODir; OQuest => nonExist };
					 CNeg True => table { ODir => cl.s ! Pres ! Anter ! CNeg True ! ODir; OQuest => nonExist };
					 CNeg False => table { ODir => cl.s ! Pres ! Anter ! CNeg False ! ODir; OQuest => nonExist }}};
			Past => table {
			Simul => table { CPos => table { ODir => cl.s ! Past ! Simul ! CPos ! ODir; OQuest => nonExist };
					 CNeg True => table { ODir => cl.s ! Past ! Simul ! CNeg True ! ODir; OQuest => nonExist };
					 CNeg False => table { ODir => cl.s ! Past ! Simul ! CNeg False ! ODir; OQuest => nonExist }};
			Anter => table { CPos => table { ODir => cl.s ! Past ! Anter ! CPos ! ODir; OQuest => nonExist };
					 CNeg True => table { ODir => cl.s ! Past ! Anter ! CNeg True ! ODir; OQuest => nonExist };
					 CNeg False => table { ODir => cl.s ! Past ! Anter ! CNeg False ! ODir; OQuest => nonExist }}};
			Fut => table {
			Simul => table { CPos => table { ODir => cl.s ! Fut ! Simul ! CPos ! ODir; OQuest => nonExist };
					 CNeg True => table { ODir => cl.s ! Fut ! Simul ! CNeg True ! ODir; OQuest => nonExist };
					 CNeg False => table { ODir => cl.s ! Fut ! Simul ! CNeg False ! ODir; OQuest => nonExist }};
			Anter => table { CPos => table { ODir => cl.s ! Fut ! Anter ! CPos ! ODir; OQuest => nonExist };
					 CNeg True => table { ODir => cl.s ! Fut ! Anter ! CNeg True ! ODir; OQuest => nonExist };
					 CNeg False => table { ODir => cl.s ! Fut ! Anter ! CNeg False ! ODir; OQuest => nonExist }}};
			Cond => table {
			Simul => table { CPos => table { ODir => cl.s ! Cond ! Simul ! CPos ! ODir; OQuest => nonExist };
					 CNeg True => table { ODir => cl.s ! Cond ! Simul ! CNeg True ! ODir; OQuest => nonExist };
					 CNeg False => table { ODir => cl.s ! Cond ! Simul ! CNeg False ! ODir; OQuest => nonExist }};
			Anter => table { CPos => table { ODir => cl.s ! Cond ! Anter ! CPos ! ODir; OQuest => nonExist };
					 CNeg True => table { ODir => cl.s ! Cond ! Anter ! CNeg True ! ODir; OQuest => nonExist };
					 CNeg False => table { ODir => cl.s ! Cond ! Anter ! CNeg False ! ODir; OQuest => nonExist }}}
			 };
		lock_Cl = <>;
			};
	}
