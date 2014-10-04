--# -path=.:/home/drbean/GF/gf-contrib/drbean:./gf-contrib/drbean/conversation/work/dickson:present

concrete JacksonEng of Jackson = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, Prelude in {

oper

	card_N = mkN "card";

lin

	one	= mkDet( mkCard (mkNumeral n1_Unit));
	five	= mkDet( mkCard (mkNumeral n5_Unit));
	another = mkDet (mkQuant "another" "other");
	some	= someSg_Det;

	for_prep	= mkPrep "for";
	into_prep	= mkPrep "into";

  good	= mkAP( mkA "good" "better" "best" "well" );
	beautiful	= mkAP( mkA "beautiful");
	big	= mkAP( mkA "big");

	with_sign = mkAdv "with a sign";

	pretty	= mkAdA "pretty";
	very	= mkAdA "very";
	so	= mkAdA "so";

	first	= mkAP( mkA "first");
	great	= mkAP( mkA "great");
	homeless	= mkAP( mkA "homeless");
	little	= mkAP( mkA "little");
	lonely	= mkAP( mkA "lonely");
	middle_class	= mkAP( mkA "middle-class");

	ten_dollar_bill	= mkCN( mkN "10-dollar bill");
  family	= mkCN( mkN "family");
	age	= mkCN( mkN "age");
	apartment	= mkCN( mkN "apartment");
	bag	= mkCN( mkN "gift bag");
	birthday_card	= mkCN( mkN "birthday" card_N);
	bottle	= mkN2( mkN "bottle");
	budget	= mkCN( mkN "budget");
	card	= mkCN card_N;
	child	= mkCN( mkN "child" "children");
	daughter	= mkCN( mkN "daughter");
	dummy	= mkCN( mkN "dummy");
	fragrance	= mkCN( mkN "fragrance");
	idea	= mkN2( mkN "idea");
	job	= mkCN( mkN "job");
	joy	= mkN2( mkN "joy");
	man	= mkCN( mkN "man");
	month	= mkCN( mkN "month");
	shelter	= mkCN( mkN "shelter");
	sign	= mkCN( mkN "sign");
	smell_N2	= mkN2( mkN "smell");
	week	= mkCN( mkN "week");
	woman	= mkCN( mkN  "woman" "women");

  queen	= mkPN( mkN feminine (mkN "Queen") );
	christmas	= mkPN( mkN nonhuman (mkN "Christmas") );
	colorado	= mkPN( mkN nonhuman (mkN "the State of Colorado") );

	cooking	= mkN "cooking";
	lotion	= mkN "lotion";
	money	= mkN "money";
	rent	= mkN "rent";
	savings	= mkN "savings";
	spirits	= mkN "spirits";
	unemployment	= mkN "unemployment";
	enjoying_life	= mkN "enjoying life";
	retiring	= mkN "retiring";
	sitting_back	= mkN "sitting back";

	buy	= mkV3 "buy";
	buy_V2	= mkV2 "buy";
	take_care	= mkV2 (partV (mkV "take") "care") of_prep;
	cover	= mkV2 "cover";
	cry	= mkV "cry";
	dress	= mkV "dress";
	feel	= mkVA( mkV "feel");
	get	= mkV2 "get";
	go_out	= partV (mkV "go") "out";
	hand	= mkV3 "hand";
	off	= mkV "off";
	lay_off	= mkV2( partV lay_V "off");
	lift	= mkV2 "lift";
	look	= mkVA( mkV "look");
	lose	= mkV2 "lose";
	move_in	= partV (mkV "move") "in";
	Open	= mkV2 "open";
	receive	= mkV2 "receive";
	remember	= mkV2 "remember";
	should = ModalVV "should" "should" nonExist nonExist (variants {"shouldn't"; "should not"});
	smell_V2	= mkV2 "smell";
	have	= mkV2 "have";
	have_V2V	= mkV2V (mkV "have") noPrep to_Prep;
	take	= mkV "take";
	thank	= mkV2 "thank";
	think	= mkVS( mkV "think");
	turn	= mkV2 "turn" into_prep;
	want	= mkV2V( mkV "want") noPrep to_Prep;
	work	= mkV2 "work" for_prep;

}

-- vim: set ts=2 sw=2 noet:
