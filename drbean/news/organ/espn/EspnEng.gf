--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete EspnEng of Espn = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	the_majority_of_the_time	= mkAdv "the majority of the time";
	out_of_800	= mkAdv "out of 800";
	playing_video_games	= myGerundAdv "" (Changing play (Item zero_Det_pl (Kind video game)));

-- AP

	wrong	= mkAP( mkA "wrong") ;
	video	= mkAP( mkA "video") ;
	upset	= mkAP( mkA "upset") ;
	first	= mkAP( mkA "first") ;
	assistant	= mkAP( mkA "assistant") ;

-- Conj


-- Det


-- N

	majority	= mkN2( mkN "majority") part_prep;
	math_test	= mkCN( mkN "math test") ;
	time	= mkCN( mkN "time") ;
	time_CN	= mkCN( mkN "time") ;
	tattoo	= mkCN( mkN "tattoo") ;
	sophomore	= mkCN( mkN "sophomore") ;
	name	= mkCN( mkN "name") ;
	middle_school	= mkNP( mkN "middle school") ;
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
	torre	= mkPN( mkN masculine (mkN "Torre") );
	harden	= mkPN( mkN masculine  (mkN "Harden") );

-- Prep

	to	= mkPrep "to";
	on_LOCATION	= mkPrep "on";
	in_PREP	= mkPrep "in";
	as	= mkPrep "as";

-- Pron


-- Subj

-- V

	get_AP	= mkVA( mkV "get") ;
	ask	= mkV2Q( mkV "ask") noPrep;
	say	= mkVS( mkV "say") ;
	play	= mkV2( mkV "play") noPrep;
	inspire	= mkV2V( mkV "inspire") noPrep to;
	get	= mkV2( mkV "get") noPrep;
	slam_dunk	= mkV "slam dunk";
	call	= mkV3( mkV "call") noPrep noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
