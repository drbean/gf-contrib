--# -path=.:/home/drbean/GF/gf-contrib/drbean:present

concrete ChatEng of Chat = MyConcrete **
open (ResEng = ResEng), ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, Prelude in {

oper
	get_V = IrregEng.get_V;

lin

	hello	= mkInterj "Hello";
	hi	= mkInterj "Hi";

	fifteen	= mkAP( mkA "15");
	sixteen	= mkAP( mkA "16");
	eighteen	= mkAP( mkA "18");
	beautiful	= mkAP( mkA "beautiful");
	female	= mkAP( mkA "female");
	good	= mkAP( mkA "good");
	old	= mkAP( mkA "old");
	right	= mkAP( mkA "right");
	young	= mkAP( mkA "young");
	male	= mkAP( mkA "male");

	from	= mkPrep "from";
	in_place	= mkPrep "in";
	like	= mkPrep "like";
	on	= mkPrep "on";
	to	= mkPrep "to";

	age	= mkCN( mkN "age");
	city	= mkCN( mkN "city");
	freshman	= mkCN( mkN "freshman");
	girl	= mkCN( mkN "girl");
	guess_CN	= mkCN( mkN "guess");
	man	= mkCN( mkN "man");
	name	= mkCN( mkN "name");
	nationality	= mkCN( mkN "nationality");
	question	= mkCN( mkN "question");
	sophomore	= mkCN( mkN "sophomore");
	stranger	= mkCN( mkN "stranger");
	student	= mkCN( mkN "student");
	woman	= mkCN( mkN "woman");

	alice	= mkPN( mkN masculine (mkN "Alice") );
	ariel	= mkPN( mkN masculine (mkN "Ariel") );
	ellarose	= mkPN( mkN masculine (mkN "Ellarose") );
	facebook	= mkPN( mkN feminine (mkN "Facebook") );
	filibee	= mkPN( mkN feminine (mkN "Filibee") );
	junior	= mkPN( mkN feminine (mkN "Junior") );
	madison	= mkNP( mkPN( mkN "Madison") );
	mandy	= mkPN( mkN feminine (mkN "Mandy") );
	paris	= mkNP( mkPN( mkN "Paris") );
	sabrina	= mkPN( mkN feminine (mkN "Sabrina") );
	taiwan	= mkNP( mkPN( mkN "Taiwan") );
	turkey	= mkNP( mkPN( mkN "Turkey") );
	usa	= mkNP( mkPN( mkN "the USA") );
	ny	= mkNP( mkPN( mkN "NY") );

	come	= mkV2 "come";
	disconnect	= mkV "disconnect";
	greet	= mkV2 "greet";
	say	= mkVS( mkV "say");
	talk	= mkV2 "talk";
	tell	= mkV2S IrregEng.tell_V noPrep;
	understand	= mkV "understand";
	guess_V2	= mkV2 "guess";

}

-- vim: set ts=2 sts=2 sw=2 noet:
