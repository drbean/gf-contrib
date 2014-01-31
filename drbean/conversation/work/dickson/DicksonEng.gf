--# -path=.:./gf-contrib/drbean/conversation/work/dickson

concrete DicksonEng of Dickson = DicksonI with
	(Syntax = SyntaxEng),
	(LexDickson = LexDicksonEng) **
	open ResEng in {

	lincat
		Tense	= Syntax.Tense;
		Ant	= Syntax.Ant;
		Pol	= Syntax.Pol;
	lin TagQ np cl	= 
		{s = cl.s ;
		lock_Cl = <>;
			};
	}
