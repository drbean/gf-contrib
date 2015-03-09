--# -path=.:/home/drbean/GF/gf-contrib/drbean:present

concrete OliverEng of Oliver = MyConcrete **
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

	on	= mkPrep "on";

	feel	= mkVA( mkV "feel");
	focus	= mkV2 "focus";
	have	= mkV2 IrregEng.have_V;
	live	= mkVP( mkV "live");
	love	= mkV2 "love";
	make	= mkV2V IrregEng.make_V noPrep noPrep;
	study	= mkVP( mkV "study");
	think	= mkVA( mkV "think");
	say	= mkVS IrregEng.say_V;

	court	= mkCN( mkN "basketball court");
	family	= mkCN( mkN "family");
	father	= mkCN( mkN "father");
	mother	= mkCN( mkN "mother");
	name	= mkCN( mkN "name");
	older_sister	= mkCN( (mkN feminine (mkN "older sister")));
	people	= mkCN( mkN "people");
	person	= mkCN( mkN "person");
	sport	= mkCN( mkN "sport");

	basketball	= mkN "basketball";
	free_time	= mkN "free time";
	music	= mkN "listening to music";

	facebook	= mkPN( mkN nonhuman (mkN "Facebook") );
	oliver	= mkPN( mkN masculine (mkN "Oliver") );
	panYanMin	= mkPN( mkN masculine (mkN "Pan YanMin") );
	oliverPan	= mkPN( mkN masculine (mkN "Oliver Pan") );
	pingZhen	= mkNP( mkPN( mkN nonhuman (mkN "PingZhen") ) );
	taipei	= mkNP( mkPN( mkN nonhuman (mkN "Taipei") ) );
	kainan	= mkNP( mkPN( mkN nonhuman (mkN "Kainan University") ) );
	what_wants	= mkN "what he wants";

}

-- vim: set ts=2 sts=2 sw=2 noet:
