--# -path=.:/home/drbean/GF/lib/src/translator:./gf-contrib/drbean/speaking/crime/murder:/home/drbean/GF/gf-contrib/drbean/speaking/crime/murder/engine:present

concrete MurderEng of Murder = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude in {

oper
	hospital	= mkCN( mkN "hospital");


lin

	eighty	= mkAP( mkA "80");
	married	= mkAP( mkA "married");
	dying	= mkAP( mkA "dying");
	alive	= mkAP( mkA "alive");

	by	= mkPrep "by";
	to	= mkPrep "to";

	so_much	= mkAdv "so much";
	anymore	= mkAdv "anymore";
	on_february_9	= mkAdv "on February 9";
	for_8_months	= mkAdv "for 8 months";

	-- PassV2V vp = PassVPSlash vp;
	-- Slash v2v vp = mkVPSlash v2v vp;
	go	= mkVP( mkV "go");
	keep	= mkV2A( mkV "keep" "kept" "kept") noPrep;
	shoot	= mkV2 "shoot";
	say	= mkVS( mkV "say");
	love	= mkV2 "love";
	watch	= mkV2V( mkV "watch") noPrep noPrep;
	suffer	= mkV "suffer";

	wife	= mkCN( mkN "wife");
	cancer	= mkN "cancer";

	husband	= mkCN( mkN "husband");
	hospital_name	= hospital;
	hospital_place	= Location zero_Det_sg hospital;
	respirator	= mkCN( mkN "respirator");

	charles	= mkPN( mkN masculine (mkN "Charles") );
	sara	= mkPN( mkN feminine (mkN "Sara") );

}

-- vim: set ts=2 sw=2 noet:

