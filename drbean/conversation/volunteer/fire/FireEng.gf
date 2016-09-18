--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete FireEng of Fire = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	also	= mkAdv "also";
	in_flames	= mkAdv "in flames";

-- AP

	witness	= mkA2( mkA "witness") to;
	individual	= mkAP( mkA "individual") ;
	monumental	= mkAP( mkA "monumental") ;
	other	= mkAP( mkA "other") ;
	second	= mkAP( mkA "second") ;
	volunteer_a	= mkAP( mkA "volunteer") ;
	assistant	= mkAP( mkA "assistant") ;

-- Conj

	and = mymkConj "and";

-- Det

	every	= every_Det;

-- N

	grace	= mkN "grace" nonExist;
	homeowner	= mkCN( mkN feminine ( mkN "homeowner" )) ;
	house	= mkCN( mkN "house") ;
	kindness	= mkN "kindness" nonExist;
	life	= mkCN( mkN "life" "lives") ;
	neighborhood_park	= mkCN( mkN "neighborhood park") ;
	non_profit	= mkCN( mkN "non-profit") ;
	opportunity	= mkCN( mkN "opportunity") ;
	pair	= mkN2( mkN "pair") part_prep;
	people	= mkCN( mkN "person" "people") ;
	attention	= mkN2( mkN "attention") from;
	scale	= mkCN( mkN "scale") ;
	scene	= mkCN( mkN "scene") ;
	shoe	= mkCN( mkN "shoe") ;
	soup_kitchen	= mkCN( mkN "soup kitchen") ;
	volunteer_n	= mkN2( mkN "volunteer") on;
	basis	= mkCN( mkN "basis") ;
	captain	= mkN2( mkN "captain") of_PREP;
	conversation	= mkN2( mkN "conversation") with_PREP;
	courage	= mkN "courage" nonExist;
	day	= mkCN( mkN "day") ;
	head_of_development	= mkN2( mkN "head of development") for;
	difference	= mkN2( mkN "difference") in_PREP;
	dog	= mkCN( mkN "dog") ;
	fire_company	= mkCN( mkN "fire company") ;
	firefighter	= mkCN( mkN "firefighter") ;
	food	= mkN "food" nonExist;
	generosity	= mkN "generosity" nonExist;
	act	= mkN2( mkN "act") part_prep;

-- PN

	robin_hood	= mkPN( mkN nonhuman (mkN "Robin Hood") );
	bezos	= mkPN( mkN masculine (mkN "Bezos") );

-- Prep

	in_PREP	= mkPrep "in";
	on	= mkPrep "on";
	on_EXTENT_PREP	= mkPrep "on";
	than	= mkPrep "than";
	to	= mkPrep "to";
	with_PREP	= mkPrep "with";
	at	= mkPrep "at";
	for	= mkPrep "for";
	from	= mkPrep "from";

-- Pron


-- Subj


-- V

	go_upstairs	= partV( mkV "go") "upstairs";
	go_inside	= partV( mkV "go") "inside";
	make	= mkV2( mkV "make") noPrep;
	need	= mkV2V( mkV "need") noPrep to;
	offer	= mkV3( mkV "offer") noPrep noPrep;
	receive	= mkV2( mkV "receive") noPrep;
	say	= mkVS( mkV "say") ;
	serve	= mkV2( mkV "serve") noPrep;
	should	= ModalVV "should" "should" "should" "should" "shouldn't" ;
	tell	= mkV2V( mkV "tell") noPrep to;
	thank	= mkV2( mkV "thank") noPrep;
	thank_for	= mkV3( mkV "thank") noPrep for;
	wait	= mkVV( mkV "wait") ;
	ask	= mkV2V( mkV "ask") noPrep to;
	call	= mkV3( mkV "call") noPrep noPrep;
	clean_up	= mkV2( partV( mkV "clean") "up" );
	get	= mkV3( mkV "get") noPrep noPrep;
	affect	= mkV2( mkV "affect") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
