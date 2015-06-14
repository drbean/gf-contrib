--# -path=.:/home/drbean/GF/gf-contrib/drbean:present

concrete ChatEng of Chat = MyConcrete **
open (ResEng = ResEng), ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, Prelude in {

oper
	get_V = IrregEng.get_V;

lin

	beautiful	= mkAP( mkA "beautiful");
	female	= mkAP( mkA "female");
	good	= mkAP( mkA "good");
	old	= mkAP( mkA "old");
	right	= mkAP( mkA "right");
	young	= mkAP( mkA "young");
	male	= mkAP( mkA "male");

	age	= mkCN( mkN "age");
	city	= mkCN( mkN "city");
	freshman	= mkCN( mkN "freshman");
	girl	= mkCN( mkN "girl");
	guess	= mkCN( mkN "guess");
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
	madison	= mkPN( mkN feminine (mkN "Madison") );
	mandy	= mkPN( mkN feminine (mkN "Mandy") );
	paris	= mkPN( mkN feminine (mkN "Paris") );
	sabrina	= mkPN( mkN feminine (mkN "Sabrina") );
	taiwan	= mkPN( mkN feminine (mkN "Taiwan") );
	turkey	= mkPN( mkN feminine (mkN "Turkey") );
	usa	= mkPN( mkN feminine (mkN "USA") );
	ny	= mkPN( mkN feminine (mkN "NY") );

	come	= mkV2 "come";

}

-- vim: set ts=2 sts=2 sw=2 noet:
