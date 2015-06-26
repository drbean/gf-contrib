--# -path=.:/home/drbean/GF/gf-contrib/drbean:present

concrete ChatEng of Chat = MyConcrete **
open (ResEng = ResEng), ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, Prelude in {

oper
	get_V = IrregEng.get_V;

lin

	hello	= mkInterj "Hello";
	hi	= mkInterj "Hi";

	how_old = ICompAP old;

	fifteen	= mkAP( mkA "15");
	sixteen	= mkAP( mkA "16");
	eighteen	= mkAP( mkA "18");
	nineteen	= mkAP( mkA "19");
	twentyone	= mkAP( mkA "21");
	twentytwo	= mkAP( mkA "22");
	twentythree	= mkAP( mkA "23");
	beautiful	= mkAP( mkA "beautiful");
	female	= mkAP( mkA "female");
	good	= mkAP( mkA "good");
	hispanic	= mkAP( mkA "Hispanic");
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
	freshman	= mkCN( mkN human (mkN "freshman"));
	girl	= mkCN( mkN "girl");
	guess_CN	= mkCN( mkN "guess");
	man	= mkCN( mkN masculine (mkN "man"));
	name	= mkCN( mkN "name");
	nationality	= mkCN( mkN "nationality");
	question	= mkCN( mkN "question");
	sophomore	= mkCN( mkN "sophomore");
	stranger	= mkCN( mkN human (mkN "stranger"));
	student	= mkCN( mkN human (mkN "student"));
	woman	= mkCN( mkN feminine (mkN "woman"));

	alice	= mkPN( mkN feminine (mkN "Alice") );
	ariel	= mkPN( mkN feminine (mkN "Ariel") );
	ellarose	= mkPN( mkN feminine (mkN "Ellarose") );
	filibee	= mkPN( mkN masculine (mkN "Filibee") );
	junior	= mkPN( mkN masculine (mkN "Junior") );
	must	= mkPN( mkN nonhuman (mkN "MUST") );
	mandy	= mkPN( mkN feminine (mkN "Mandy") );
	sabrina	= mkPN( mkN feminine (mkN "Sabrina") );
	taiwan	= mkNP( mkPN( mkN "Taiwan") );
	turkey	= mkNP( mkPN( mkN "Turkey") );
	usa	= mkNP( mkPN( mkN "the USA") );
	dora	= mkPN( mkN feminine (mkN "Dora") );
	cheney	= mkPN( mkN masculine (mkN "Cheney") );
	andy	= mkPN( mkN masculine (mkN "Andy") );
	cherry2	= mkPN( mkN feminine (mkN "Cherry2") );
	viola1	= mkPN( mkN feminine (mkN "Viola1") );
	marian	= mkPN( mkN feminine (mkN "Marian") );
	lisa1	= mkPN( mkN feminine (mkN "Lisa1") );
	yisian	= mkPN( mkN feminine (mkN "YiSian") );
	jessie	= mkPN( mkN feminine (mkN "Jessie") );
	demi	= mkPN( mkN feminine (mkN "Demi") );
	maggie	= mkPN( mkN feminine (mkN "Maggie") );
	annie	= mkPN( mkN feminine (mkN "Annie") );
	jack	= mkPN( mkN masculine (mkN "Jack") );
	stefan	= mkPN( mkN masculine (mkN "Stefan") );

	ask_V2Q	= mkV2Q (mkV "ask") noPrep;
	come	= mkVP IrregEng.come_V;
	disconnect	= mkV "disconnect";
	greet	= mkV2 "greet";
	say	= mkVS( mkV "say");
	talk	= mkV2 "talk";
	tell	= mkV2S IrregEng.tell_V noPrep;
	understand	= mkV "understand";
	guess_V2	= mkV2 "guess";

}

-- vim: set ts=2 sts=2 sw=2 noet:
