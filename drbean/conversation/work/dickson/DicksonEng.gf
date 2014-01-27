--# -path=.:./gf-contrib/drbean/conversation/work/dickson:./lib/alltenses

concrete DicksonEng of Dickson = DicksonI with
	(Syntax = SyntaxEng),
	(LexDickson = LexDicksonEng) ;
