interface LexTrinka = open Syntax in {
oper

	a_Det	: Det;
	zero_Det	: Det;
	the_Det	: Det;
	thePlural_Det	: Det;

	who_WH	: IP;
	what_WH	: IP;

	of_prep	: Prep;

	yes_Utt	: Utt;
	no_Utt	: Utt;
	no_answer_Utt	: Utt;

	become_V  : V;
	smile_V	: V;

	big_A	: A;

	doorman_N	: N;

	trinka_N	: N;

}

-- vim: set ts=8 sts=2 sw=2 noet:
