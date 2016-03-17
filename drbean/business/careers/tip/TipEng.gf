--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean:./gf-contrib/drbean/business/careers/tip:present

concrete TipEng of Tip = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

lin

-- Adv

	at_work	= mkAdv "at work";
	in_mind	= mkAdv "in mind";
	just	= mkAdv "just";
	today	= mkAdv "today";
	well	= mkAdv "well";
-- AP

-- Det

-- N

	something	= mkN "something";
	day	= mkCN( mkN "day");
	month	= mkCN( mkN "month");
	plan	= mkCN( mkN "plan");
	purpose	= mkCN( mkN "purpose");
	schedule	= mkCN( mkN "schedule");
	thing	= mkCN( mkN "thing");
	weekend	= mkCN( mkN "weekend");
	year	= mkCN( mkN "year");
-- PN

-- Prep

	about	= mkPrep "about";
	according_to	= mkPrep "according to";
-- V

	change	= mkV2 "change";
	do	= mkV2 "do";
	go	= mkV "go";
	keep	= mkVA( mkV "keep");
	know	= mkV2 "know";
	look_at	= mkV2 "look at";
	need	= mkVV( mkV "need");
	see	= mkVA( mkV "see");
	think_about	= mkV2 "think about";
}

-- vim: set ts=2 sts=2 sw=2 noet:
