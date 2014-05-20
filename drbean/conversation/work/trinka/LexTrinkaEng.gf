instance LexTrinkaEng of LexTrinka = open SyntaxEng, ParadigmsEng, Prelude, IrregEng in {

oper

	a_Det	= aSg_Det;
	zero_Det	= aPl_Det;
	the_Det	= theSg_Det;
	thePlural_Det	= thePl_Det;

	who_WH	= whoSg_IP;
	what_WH	= whatSg_IP;

	of_prep	=  possess_Prep;

	yes_Utt	= SyntaxEng.yes_Utt;
	no_Utt	= SyntaxEng.no_Utt;
	no_answer_Utt = ss "No answer";

	become_V = IrregEng.become_V;
	smile_V	= mkV "smile";

	big_A	= mkA "big";

	doorman_N	= mkN "doorman";

	trinka_N	= mkN masculine (mkN "Ed Trinka");

}

-- vim: set ts=8 sts=2 sw=2 noet:
