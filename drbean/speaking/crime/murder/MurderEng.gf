--# -path=.:/home/drbean/GF/lib/src/translator:./gf-contrib/drbean/conversation/work/dickson:/home/drbean/GF/gf-contrib/drbean/conversation/work/dickson/engine:present

concrete DicksonEng of Dickson = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude in {

lin

	married	= mkAP( mkA "married");
	dying	= mkAP( mkA "dying");
	alive	= mkAP( mkA "alive");

	in	= mkPrep "in";
	on	= mkPrep "on";
	for	= mkPrep "for";
	by	= mkPrep "by";
	to	= mkPrep "to";

	so_much	= mkAdv "so much";
	anymore	= mkAdv "anymore";

	-- PassV2V vp = PassVPSlash vp;
	-- Slash v2v vp = mkVPSlash v2v vp;
	go	= mkVA( mkV "go");
	shoot	= mkV2 "shoot";
	say	= mkVS( mkV "say");
	love	= mkV2 "love";
	watch	= mkV2S "watch";
	suffer	= mkV "suffer";

	wife	= mkCN( mkN "wife");
	cancer	= mkCN( mkN "cancer");
oper
	husband	= mkCN( mkN "husband");
	hospital	= mkCN( mkN "hospital");
	respirator	= mkCN( mkN "respirator");

	eightmonths	= mkN "8 months";
	feb_nine	= mkN "February 9";

	mercer	= mkPN( mkN masculine (mkN "Mercer") );
}
	sara,	= mkPN( mkN feminine (mkN "Sara,") );

-- vim: set ts=2 sw=2 noet:

