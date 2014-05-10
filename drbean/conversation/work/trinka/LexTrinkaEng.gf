instance LexTrinkaEng of LexTrinka = open SyntaxEng, ParadigmsEng, Prelude, IrregEng in {

oper

	smile_V	= mkV "smile";

	big_A	= mkA "big";

	doorman_N	= mkN "doorman";

	trinka_N	= mkN masculine (mkN "Ed Trinka");

}

-- vim: set ts=8 sts=2 sw=2 noet:
