--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean/speaking/alien/indie:/home/drbean/GF/gf-contrib/drbean/speaking/alien/indie/engine:present

concrete IndieEng of Indie = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	back	= mkAdv "back";
	out	= mkAdv "out";
	worldwide	= mkAdv "worldwide";
-- AP

	alien_adj	= mkAP( mkA "alien");
	atmospheric	= mkAP( mkA "atmospheric");
	enormous	= mkAP( mkA "enormous");
	gigantic	= mkAP( mkA "gigantic");
	major	= mkAP( mkA "major");
	mysterious	= mkAP( mkA "mysterious");
	strange	= mkAP( mkA "strange");
-- Det

	a_number_of	= mkDet( mkQuant nonExist "a number of" nonExist "a number") pluralNum;
-- N

	alien	= mkCN( mkN "alien");
	collision_course	= mkCN( mkN "collision course with the Earth");
	convoy	= mkCN( mkN "convoy");
	day	= mkCN( mkN "day");
	fight	= mkCN( mkN "fight");
	globe	= mkCN( mkN "globe");
	government	= mkN "government";
	military	= mkCN( mkN "military");
	object	= mkCN( mkN "object");
	plan	= mkCN( mkN "plan");
	point	= mkN2( mkN "point") around;
	spacecraft	= mkCN( mkN  "spacecraft" "spacecraft");
	species	= mkCN( mkN "species");
	survivor	= mkCN( mkN "survivor");
	communications_system	= mkCN( mkN "communications system");
	testing_ground	= mkCN( mkN "testing ground");
	july_2nd	= mkN "July 2nd";
	july_3rd	= mkN "July 3rd";
	july_4th	= mkN "July 4th";
	chaos	= mkN "chaos";
	freedom	= mkN "freedom";
	humanity	= mkN "humanity";
	interference	= mkN "interference";
	independence_day	= mkN "Independence Day";
-- PN

	area_51	= mkPN( mkN feminine (mkN "Area 51") );
	los_angeles	= mkPN( mkN feminine (mkN "Los Angeles") );
	the_earth	= mkPN( mkN feminine (mkN "the Earth") );
	houston	= mkPN( mkN feminine (mkN "Houston") );
	levinson	= mkPN( mkN feminine (mkN "Levinson") );
	london	= mkPN( mkN feminine (mkN "London") );
	moscow	= mkPN( mkN feminine (mkN "Moscow") );
	new_york	= mkPN( mkN feminine (mkN "New York") );
	paris	= mkPN( mkN feminine (mkN "Paris") );
	washington	= mkPN( mkN feminine (mkN "Washington") );
-- Prep

	against	= mkPrep "against";
	around	= mkPrep "around";
	by	= mkPrep "by";
	for	= mkPrep "for";
	in_prep	= mkPrep "in";
	in_manner	= mkPrep "in";
	into	= mkPrep "into";
	on	= mkPrep "on";
	on_time	= mkPrep "on";
	on_loc	= mkPrep "on";
	to	= mkPrep "to";
	toward	= mkPrep "toward";
	with_prep	= mkPrep "with";
-- V

	believe	= mkVS( mkV "believe");
	capture	= mkV2 "capture";
	devise	= mkV2 "devise";
	discover	= mkVS( mkV "discover");
	enslave	= mkV2 "enslave";
	intend	= mkVV( mkV "intend");
	learn	= mkVS( mkV "learn");
	obliterate	= mkV2 "obliterate";
	pilot	= mkV2( mkV "pilot" "piloted");
	reveal	= mkV2V( mkV "reveal") noPrep to;
	send	= mkV3 IrregEng.send_V into;
	set_out	= partV( mkV "set") "out";
	attack	= mkV2 "attack";
	paralyze	= mkV2 "paralyze";
	become	= mkV2S IrregEng.become_V noPrep;
}

-- vim: set ts=2 sts=2 sw=2 noet:
