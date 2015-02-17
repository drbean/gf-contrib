--# -path=.:./gf-contrib/drbean/call/intros/1J0:present

concrete 1J0Eng of 1J0 = MyConcrete **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, Prelude in {

oper


lin

  four	= mkDet( mkNumeral n4_Unit);

  Chinese	= mkAP( mkA "Chinese");
	favorite	= mkAP( mkA "favorite");
	happy	= mkAP( mkA "happy");
	humorous	= mkAP( mkA "humorous");
	optimistic	= mkAP( mkA "optimistic");
	positive	= mkAP( mkA "positive");
	relaxed	= mkAP( mkA "relaxed");

	as	= mkPrep "as";
	in	= mkPrep "in";
	on	= mkPrep "on";

	feel	= mkVA( mkV "feel");
	focus	= mkV2 "focus";
	have	= mkV2 "have";
	live	= mkV2 "live";
	love	= mkV2 "love";
	make	= mkV2A "make";
	study	= mkV2 "study";
	think	= mkVA( mkV "think");

	court	= mkCN( mkN "court");
	family	= mkCN( mkN "family");
	father	= mkCN( mkN "father");
	mother	= mkCN( mkN "mother");
	name	= mkCN( mkN "name");
	older_sister	= mkCN( (mkN feminine (mkN "older_sister")));
	people	= mkCN( mkN "people");
	person	= mkCN( mkN "person");
	sport	= mkCN( mkN "sport");

	basketball	= mkN "basketball";
	free_time	= mkN "free_time";
	music	= mkN "listening_to_music";

	Facebook	= mkPN( mkN (mkN "Facebook") );
	Oliver	= mkPN( mkN masculine (mkN "Oliver") );
	PanYanMin	= mkPN( mkN masculine (mkN "Pan YanMin") );
	PingZhen	= mkPN( mkN (mkN "PingZhen") );
	Taipei	= mkPN( mkN (mkN "Taipei") );
	ABC	= mkPN( mkN (mkN "ABC_University") );
	what_wants	= mkN "what he wants";

}

-- vim: set ts=2 sts=2 sw=2 noet:
