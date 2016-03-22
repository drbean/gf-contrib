--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean/business/careers/tip:/home/drbean/GF/gf-contrib/drbean/business/careers/tip/engine:present

concrete TipEng of Tip = MyConcrete  **
open SyntaxEng, ParadigmsEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

lin

-- Adv

	at_work	= mkAdv "at work";
	in_mind	= mkAdv "in mind";
	just	= mkAdv "just";
	today	= mkAdv "today";
	well	= mkAdv "well";
-- AP

-- Det

  each = each_Det;

	you = mkNP youPol_Pron;

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
	what_to_do	= mkN "what to do";
	what_you_are_doing	= mkN "what you are doing";
-- PN

	barbara	= mkPN( mkN feminine (mkN "Barbara") );
	drbean	= mkPN( mkN feminine (mkN "Dr Bean") );
	eva	= mkPN( mkN feminine (mkN "Eva") );
	fasttrack	= mkPN( mkN feminine (mkN "FastTrack") );
	tadeusz	= mkPN( mkN feminine (mkN "Tadeusz") );
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
	think	= mkV "think";
	should	= ModalVV "should" "should" nonExist nonExist (variants {"shouldn't"; "should not"});
}

-- vim: set ts=2 sts=2 sw=2 noet:
