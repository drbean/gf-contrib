--# -path=.:./gf-contrib/drbean/conversation/work/dickson:./lib/alltenses

concrete DicksonEng of Dickson = DicksonI with
	(Syntax = SyntaxEng),
	(LexDickson = LexDicksonEng) **
	open ResEng in {

	lincat
		Tense	= Syntax.Tense;
		Ant	= Syntax.Ant;
		Pol	= Syntax.Pol;
	lin TagQ tense ant pol cl	=
		let tag : Str = case pol of {
			positivePol	=> "doesn't it"
			negativePol	=> "does it"
			}
			in
		{s = table QForm
				[cl.s ! Pres ! Simul ! CPos ! ODir ++ tag];
		lock_QS = <>;
			};
	}
