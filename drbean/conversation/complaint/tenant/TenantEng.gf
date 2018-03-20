--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete TenantEng of Tenant = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	right_away	= ParadigmsEng.mkAdv "right away" ;
	out	= ParadigmsEng.mkAdv "out" ;
	on	= ParadigmsEng.mkAdv "on" ;
	off	= ParadigmsEng.mkAdv "off" ;
	all_night	= ParadigmsEng.mkAdv "all night" ;

-- AP

	shut	= mkAP( mkA "shut") ;
	quiet	= mkAP( mkA "quiet") ;
	busy = mkAP (mkA "busy" );

-- Conj

	but	= mkConj "but";
	and	= mkConj "and";

-- Det


-- N

	dog_PLACE	= mkCN( mkN "dog") ;
	problem	= mkCN( mkN nonhuman (mkN "problem") );
	complaint	= mkCN( mkN nonhuman (mkN "complaint") );
	tenant	= mkCN( mkN human (mkN "tenant") );

	fixing	= mkN "fixing" nonExist;
	temperature_control	= mkCN( mkN nonhuman (mkN "temperature control") );
	refrigerator	= mkCN( mkN nonhuman (mkN "refrigerator") );
	oven	= mkCN( mkN nonhuman (mkN "oven") );
	neighbor	= mkCN( mkN human (mkN "neighbor") );
	lightbulb	= mkCN( mkN nonhuman (mkN "lightbulb") );
	light	= mkCN( mkN nonhuman (mkN "light") );
	ladder	= mkCN( mkN nonhuman (mkN "ladder") );
	kitchen_window	= mkCN( mkN nonhuman (mkN "kitchen window") );
	fuse_box	= mkCN( mkN nonhuman (mkN "fuse box") );
	electricity	= mkN "electricity" nonExist;
	dog	= mkCN( mkN nonhuman (mkN "dog") );
	cousin	= mkCN( mkN human (mkN "cousin") );
	building_manager	= mkCN( mkN human (mkN "building manager") );
	building	= mkCN( mkN nonhuman (mkN "building") );
	apartment	= mkCN( mkN nonhuman (mkN "apartment") );

-- PN

	mrs_taylor	= mkPN( mkN feminine (mkN "Mrs Taylor") );
	mrs_harris	= mkPN( mkN feminine (mkN "Mrs Harris") );
	mr_won	= mkPN( mkN masculine (mkN "Mr Won") );
	mr_two	= mkPN( mkN masculine (mkN "Mr Two") );
	jack_burr	= mkPN( mkN masculine (mkN "Jack Burr") );
	mr_burr	= mkPN( mkN masculine (mkN "Mr Burr") );

-- Prep

	to	= mkPrep "to";
	to_LOCPREP	= mkPrep "to";
	out_front_of_LOCPREP	= mkPrep "out front of";
	near	= mkPrep "near";
	at	= mkPrep "at";
	in_LOCPREP	= mkPrep "in";
	about	= mkPrep "about";

-- Pron


-- Subj


-- V

	do	= mkV3( mkV "do") noPrep about;
	want_V2V	= mkV2V( mkV "want") noPrep to;
	need_V2	= mkV2( mkV "need") noPrep;
	want	= mkVV( mkV "want") ;
	try	= mkVV( mkV "try") ;
	say	= mkVS( mkV "say") ;
	promise	= mkVV( mkV "promise") ;
	open_V2	= mkV2( mkV "open") noPrep;
	need	= mkVV( mkV "need") ;
	look_at	= mkV2( mkV "look") at;
	keep	= ingVV( mkV "keep") ;
	keep_V2A	= mkV2A( mkV "keep") noPrep;
	jam	= mkV2A( mkV "jam") noPrep;
	help_V2	= mkV2( mkV "help") noPrep;
	help_V	= mkV "help";
	guess	= mkVS( mkV "guess") ;
	Go adv_result	= VP_Adv_result (mkVP ( mkV "go")) adv_result;
	Go_LOC adv_location	= VP_Adv_location (mkVP ( mkV "go")) adv_location;
	give	= mkV3( mkV "give") noPrep noPrep;
	get	= mkV2V( mkV "get") noPrep to;
	fix	= mkV2( mkV "fix") noPrep;
	cook	= mkV2( mkV "cook") noPrep;
	check	= mkV2( mkV "check") noPrep;
	call	= mkV2( mkV "call") noPrep;
	call_V2V	= mkV2V( mkV "call") noPrep to;
	burn	= mkV2( mkV "burn") noPrep;
	bark	= mkV "bark";
	ask	= mkV2V( mkV "ask") noPrep to;
	adjust	= mkV2( mkV "adjust") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
