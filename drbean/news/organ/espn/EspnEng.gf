--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete EspnEng of Espn = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv


-- AP

	wrong	= mkAP( mkA "wrong") ;
	video	= mkAP( mkA "video") ;
	upset	= mkAP( mkA "upset") ;
	math	= mkAP( mkA "math") ;
	first	= mkAP( mkA "first") ;
	assistant	= mkAP( mkA "assistant") ;

-- Conj


-- Det


-- N

	time	= mkCN( mkN "time") ;
	test	= mkCN( mkN "test") ;
	tattoo	= mkCN( mkN "tattoo") ;
	sophomore	= mkCN( mkN "sophomore") ;
	name	= mkCN( mkN "name") ;
	middle_school	= mkNP( mkN "middle school") ;
	majority	= mkCN( mkN "majority") ;
	game	= mkCN( mkN "game") ;
	fan	= mkCN( mkN "fan") ;
	face	= mkCN( mkN "face") ;
	court	= mkCN( mkN "court") ;
	college	= mkNP( mkN "college") ;
	coach	= mkCN( mkN "coach") ;
	arm	= mkCN( mkN "arm") ;
	eight_hundred	= mkN "800" nonExist;
	seven_hundred_ninety	= mkN "790" nonExist;

-- PN

	jeremy_lin	= mkPN( mkN masculine (mkN "Lin" )) ;
	toree	= mkPN( mkN masculine (mkN "Toree") );
	harden	= mkPN( mkN masculine  (mkN "Harden") );

-- Prep

	to	= mkPrep "to";
	out_of	= mkPrep "out of";
	on	= mkPrep "on";
	in_PREP	= mkPrep "in";
	as	= mkPrep "as";

-- Pron


-- Subj

	whether	= mkSubj "whether";
	when	= mkSubj "when";
	if	= mkSubj "if";

-- V

	ask	= mkV2S( mkV "ask") noPrep;
	say	= mkVS( mkV "say") ;
	play	= mkV2( mkV "play") noPrep;
	inspire	= mkV2V( mkV "inspire") noPrep to;
	get	= mkV3( mkV "get") noPrep on;
	slam_dunk	= mkV "slam dunk";
	call	= mkV3( mkV "call") noPrep noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
