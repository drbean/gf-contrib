--# -path=.:./gf-contrib/drbean/conversation/work/dickson:./lib/alltenses

concrete DicksonEng of Dickson = DicksonI with
	(Syntax = SyntaxEng),
	(LexDickson = LexDicksonEng) **

		open ParadigmsEng, ResEng, Prelude in {
	lin
		knack = {s = table
			       Number
			       [table Case ["knack"; "knack's"];
				table Case [nonExist; nonExist]];
			 g = Neutr; lock_N = <>; lock_CN = <>} ;
	 }
