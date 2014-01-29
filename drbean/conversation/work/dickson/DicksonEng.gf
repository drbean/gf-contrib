--# -path=.:./gf-contrib/drbean/conversation/work/dickson:./lib/alltenses

concrete DicksonEng of Dickson = DicksonI with
	(Syntax = SyntaxEng),
	(LexDickson = LexDicksonEng) **
	open ResEng, Prelude in {

	lin TagQ cl	=
		let tag : Str = "doesn't she" in
		{s = table QForm
				[cl.s ! Pres ! Simul ! CPos ! ODir ++ ", " ++ tag];
			};
	}
