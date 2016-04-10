--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean/business/managing/motivating:/home/drbean/GF/gf-contrib/drbean/business/managing/motivating/engine:present

concrete MotivatingEng of Motivating = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

different_A = mkA "different";

lin

-- Adv

	just	= mkAdv "just";
	out	= mkAdv "out";
	really	= mkAdv "really";
	more	= mkAdA "more";
	both	= mkAdv "both";
-- AP

	concerned	= mkAP( mkA "concerned");
	different = mkAP different_A;
	different_pp	= mkA2 different_A to;
	difficult	= mkAP( mkA "difficult");
	good	= mkAP( mkA "good");
	other	= mkAP( mkA "other");
	respected	= mkAP( mkA "respected");
	unique	= mkAP( mkA "unique");
-- Det

	another	= mkDet( mkQuant "another" nonExist);
	any	= mkDet any_Quant;
-- N

	everybody	= mkN "everybody";
	everyone	= mkN "everyone";
	difference	= mkCN( mkN "difference");
	driver	= mkCN( mkN "driver");
	eye	= mkCN( mkN "eye");
	family	= mkCN( mkN "family");
	manager	= mkCN( mkN "manager");
	motivator	= mkCN( mkN "motivator");
	people	= mkCN( mkN "people");
	question	= mkCN( mkN "question");
	secret	= mkCN( mkN "secret");
	situation	= mkCN( mkN "situation");
	way	= mkCN( mkN "way");
	world	= mkCN( mkN "world");
-- PN

-- Prep

	about	= mkPrep "about";
	as	= mkPrep "as";
	at	= mkPrep "at";
	for	= mkPrep "for";
	in_prep	= mkPrep "in";
	like	= mkPrep "like";
	in_order_to	= mkPrep "in order to";
	through	= mkPrep "through";
	to	= mkPrep "to";
-- V

	ask	= mkV2 "ask";
	care	= mkV2( mkV "care") about_prep;
	find	= mkV2 "find";
	know	= mkV2 "know";
	listen	= mkV2 "listen";
	look	= mkV2 "look";
	make	= mkV2 "make";
	motivate	= mkV2 "motivate";
	need	= mkVV( mkV "need");
	tell	= mkV3( mkV "tell");
	think	= mkV "think";
	try	= mkVV( mkV "try");
	understand	= mkV2 "understand";
	want	= mkVV( mkV "want");
}

-- vim: set ts=2 sts=2 sw=2 noet:
