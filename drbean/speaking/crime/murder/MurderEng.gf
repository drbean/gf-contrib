--# -path=.:/home/drbean/GF/lib/src/translator:./gf-contrib/drbean/conversation/work/dickson:/home/drbean/GF/gf-contrib/drbean/conversation/work/dickson/engine:present

concrete DicksonEng of Dickson = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude in {

lin

	two	= mkDet( mkCard (mkNumeral n2_Unit));

	married	= mkAP( mkA "married");
	dying	= mkAP( mkA "dying");
	8	= mkAP( mkA "8");

	in	= mkPrep "in";
	on	= mkPrep "on";
	for	= mkPrep "for";
	by	= mkPrep "by";
	to	= mkPrep "to";


	-- PassV2V vp = PassVPSlash vp;
	-- Slash v2v vp = mkVPSlash v2v vp;
	go	= mkVA( mkV "go");
	shoot	= mkV2 "shoot";

	wife	= mkCN( mkN "wife");
	cancer	= mkCN( mkN "cancer");
oper
	husband	= mkCN( mkN "husband");
	hospital	= mkCN( mkN "hospital");
	months	= mkCN( mkN "months");
	respirator	= mkCN( mkN "respirator");

	mercer	= mkPN( mkN masculine (mkN "Mercer") );
}
	sara,	= mkPN( mkN feminine (mkN "Sara,") );
	feb_nine	= mkPN( mkN inanimate (mkN "February 9") );

-- vim: set ts=2 sw=2 noet:

