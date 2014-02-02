--# -path=.:./gf-contrib/drbean/conversation/work/dickson:alltenses

concrete DicksonEng of Dickson = DicksonI with
	(Syntax = SyntaxEng),
	(LexDickson = LexDicksonEng) **
	open ResEng,Prelude in {

	lincat
		Tag	= {s : Str};
		Aux	= {s : Str};
		Pron	= Syntax.Pron;
	param
		Auxiliary	= Do | Be;

	lin	Isnt_he pron aux = let tags = table { -- P3 => table {
				Sg => table { Fem => table { Pos => table { Do => "doesn't she"; Be => "isn't she"};
								Neg => table { Do => "does she"; Be => "is she" }};
						Masc => table { Pos => table { Do => "doesn't he"; Be => "isn't he"};
								Neg => table { Do => "does he"; Be => "is he" }};
						Neutr => table { Pos => table { Do => "doesn't it"; Be => "isn't it"};
								Neg => table { Do => "does it"; Be => "is it" }}};
				Pl => table { Fem => table { Pos => table { Do => "don't they"; Be => "aren't they"};
								Neg => table { Do => "do they"; Be => "are they" }};
						Masc => table { Pos => table { Do => "don't they"; Be => "aren't they"};
								Neg => table { Do => "do they"; Be => "are they" }};
						Neutr => table { Pos => table { Do => "don't they"; Be => "aren't they"};
								Neg => table { Do => "do they"; Be => "are they" }}}
						-- }
			} in
			{s = tags ! (fromAgr pron.a).n ! (fromAgr pron.a).g  ! Neg ! Do };

		TagQ np vp	= let cl = mkCl np vp
		in
		{s = table { Pres => table {
			Simul => table { CPos => table { ODir => cl.s ! Pres ! Simul ! CPos ! ODir; OQuest => nonExist };
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
