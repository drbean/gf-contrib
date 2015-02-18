--# -path=.:/home/drbean/GF/gf-contrib/drbean:/home/drbean/GF/gf-contrib/drbean/call/intros/AFB1J0:present

concrete AFB1J0Eng of AFB1J0 = MyConcrete **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, Prelude in {

lin

  four	= mkDet( mkNumeral n4_Unit);

  chinese	= mkAP( mkA "Chinese");
	favorite	= mkAP( mkA "favorite");
	happy	= mkAP( mkA "happy");
	humorous	= mkAP( mkA "humorous");
	optimistic	= mkAP( mkA "optimistic");
	positive	= mkAP( mkA "positive");
	relaxed	= mkAP( mkA "relaxed");

	as	= mkPrep "as";
	on	= mkPrep "on";

	feel	= mkVA( mkV "feel");
	focus	= mkV2 "focus";
	have	= mkV2 "have";
	live	= mkV2 "live";
	love	= mkV2 "love";
	make	= mkV2V IrregEng.make_V noPrep noPrep;
	study	= mkV2 "study";
	think	= mkVA( mkV "think");

	court	= mkCN( mkN "basketball court");
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

	facebook	= mkPN( mkN nonhuman (mkN "Facebook") );
	oliver	= mkPN( mkN masculine (mkN "Oliver") );
	panYanMin	= mkPN( mkN masculine (mkN "Pan YanMin") );
	pingZhen	= mkPN( mkN nonhuman (mkN "PingZhen") );
	taipei	= mkPN( mkN nonhuman (mkN "Taipei") );
	abc_university	= mkPN( mkN nonhuman (mkN "ABC_University") );
	what_wants	= mkN "what he wants";

}

-- vim: set ts=2 sts=2 sw=2 noet:
