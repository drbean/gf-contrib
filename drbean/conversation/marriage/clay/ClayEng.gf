--# -path=.:/home/drbean/GF/gf-contrib/drbean:present

concrete ClayEng of Clay = MyConcrete **
open (ResEng = ResEng), ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, Prelude in {

oper

    mkNP' : (me,my : Str) -> Number -> ResEng.Person -> Gender ->
     {s : ResEng.NPCase => Str ; a : ResEng.Agr} = \me,my,n,p,g ->
   { s = table {
       ResEng.NCase Nom => me ;
       NPAcc => me ;
       ResEng.NCase Gen => my
       } ;
     a = ResEng.toAgr n p g ;
   };

lin

  one	= mkDet( mkNumeral n1_Unit);
  three	= mkDet( mkNumeral n3_Unit);
  four	= mkDet( mkNumeral n4_Unit);
  five	= mkDet( mkNumeral n5_Unit);
  seventeen	= mkDet( mkNumeral n9_Unit);

	on	= mkPrep "on";
	on_back_of	= mkPrep "on the back of";
	down_to	= mkPrep "down to";

	believe	= mkVS( mkV "believe");
	burn	= mkV2 "burn";
	come	= mkV2 "come";
	feel	= mkVA( mkV "feel");
	find	= mkV2 IrregEng.find_V;
	get	= mkVA( mkV "get");
	give	= mkV3( mkV "give");
	go	= mkV "go";
	grab	= mkV2 "grab";
	hand	= mkV3( mkV "hand");
	hang	= mkV "hang";
	have	= mkV2 "have";
	help	= mkV2 "help";
	laugh	= mkV "laugh";
	look	= mkV2 "look";
	make_V2V	= mkV2V IrregEng.make_V noPrep noPrep;
	meet	= mkV2 "meet";
	move	= mkV2 "move";
	put_V3	= mkV3 IrregEng.put_V noPrep on;
	remember_V2	= mkV2 "remember";
	remember_VV	= mkVV( mkV "remember");
	run	= mkV2 "run";
	say	= mkVS( mkV "say");
	see_V2	= mkV2 "see";
	see_V2V	= ingV2V IrregEng.see_V noPrep noPrep;
	separate	= mkV "separate";
	shake	= mkV "shake";
	shoot_V2	= mkV2 "shoot";
	shoot_V3	= mkV3( mkV "shoot");
	talk	= mkV2 "talk";
	tell	= mkV2S IrregEng.tell_V noPrep;
	try	= mkVV( mkV "try");
	walk	= mkV2 "walk";

	altercation	= mkCN( mkN "altercation");
	back	= mkCN( mkN "back");
	bedroom	= mkCN( mkN "bedroom");
	boyfriend	= mkCN( mkN "boyfriend");
	child	= mkCN( mkN "child");
	class_ring	= mkCN( mkN "class ring");
	dad	= mkCN( mkN "dad");
	day	= mkCN( mkN "day");
	door	= mkCN( mkN "door");
	dresser	= mkCN( mkN "dresser");
	engagement_ring	= mkCN( mkN "engagement ring");
	father	= mkCN( mkN "father");
	finger	= mkCN( mkN "finger");
	gentleman	= mkCN( mkN "gentleman");
	guy	= mkCN( mkN "guy");
	house	= mkCN( mkN "house");
	kid	= mkCN( mkN "kid");
	knee	= mkCN( mkN "knee");
	name	= mkCN( mkN "name");
	note	= mkCN( mkN "note");
	person	= mkCN( mkN "person");
	ring	= mkCN( mkN "ring");
	ring_box	= mkCN( mkN "ring box");
	ring_box_Place = ring_box;
	son	= mkCN( mkN "son");
	thing	= mkCN( mkN "thing");
	wedding_ring	= mkCN( mkN "wedding ring");
	wife	= mkCN( mkN "wife");
	woman	= mkCN( mkN "woman");
	year	= mkCN( mkN "year");
	whisper	= mkCN( mkN "whisper");

	city_hall	= mkNP( mkPN (mkN "City Hall") );
	frank	= mkPN( mkN masculine (mkN "Frank") );
	michigan	= mkNP( mkPN (mkN "Michigan") );
	so_and_so	= mkPN( mkN masculine (mkN "So-and-so") );
	rebia	= mkPN( mkN feminine (mkN "Rebia") );
	rebia_and_frank	= mkNP' "Rebia and Frank" "Rebia and Frank's" plural ResEng.P3 human;
	frank_and_rebia	= mkNP'   "Frank and Rebia" "Frank and Rebia's" plural ResEng.P3 human;

	details	= mkN "details";
	dinner	= mkN "dinner";
	home	= mkN "home";
	popcorn	= mkN "popcorn";
	stuff	= mkN "stuff";
	true_love	= mkN "true love";

	beautiful	= mkAP( mkA "beautiful");
	best	= mkAP( mkA "best");
	big	= mkAP( mkA "big");
	biological	= mkAP( mkA "biological");
	happy	= mkAP( mkA "happy");
	magnificent	= mkAP( mkA "magnificent");
	oldest	= mkAP( mkA "oldest");
	pregnant	= mkAP( mkA "pregnant");
	ugly	= mkAP( mkA "ugly");

	always	= mkAdv "always";

}

-- vim: set ts=2 sts=2 sw=2 noet:
