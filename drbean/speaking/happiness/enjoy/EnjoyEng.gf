--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete EnjoyEng of Enjoy = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	too	= mkAdv "too";
	always	= mkAdv "always";
	also	= mkAdv "also";
	already	= mkAdv "already";
-- AP

	raining	= mkAP( mkA "raining") ;
	unfit	= mkAP( mkA "unfit") ;
	positive	= mkAP( mkA "positive") ;
	miserable	= mkAP( mkA "miserable") ;
	high	= mkAP( mkA "high") ;
	happy_go_lucky	= mkAP( mkA "happy-go-lucky") ;
	happy	= mkAP( mkA "happy") ;
	good	= mkAP( mkA "good") ;
	fine	= mkAP( mkA "fine") ;
	down_in_the_dumps	= mkAP( mkA "down in the dumps") ;
	bad	= mkAP( mkA "bad") ;
-- Conj

	but	= mkConj "but";
	and	= mkConj "and";
-- Det

-- N

	quality	= mkCN( mkN "quality") ;
	situation	= mkCN( mkN "situation") ;
	smile	= mkCN( mkN "smile") ;
	study	= mkCN( mkN "study") ;
	wine	= mkN "wine";
	top	= mkN2( mkN "top") ;
	word	= mkN2( mkN "word") ;
	nothing	= mkN "nothing";
	news	= mkN "news";
	nation	= mkCN( mkN "nation") ;
	money	= mkN "money";
	list	= mkCN( mkN "list") ;
	life	= mkN "life";
	happiness	= mkN "happiness";
	food	= mkN "food";
	face	= mkCN( mkN "face") ;
	everything	= mkN "everything";
	country	= mkCN( mkN "country") ;
-- PN

	rob	= mkPN( mkN feminine (mkN "Rob") );
	world_happiness_database	= mkPN( mkN feminine (mkN "World Happiness Database") );
	finland	= mkPN( mkN feminine (mkN "Finland") );
	finn	= mkPN( mkN feminine (mkN "Finn") );
	canada	= mkPN( mkN feminine (mkN "Canada") );
-- Prep

	on	= mkPrep "on";
	like	= mkPrep "like";
	in_prep	= mkPrep "in";
	for	= mkPrep "for";
	even_in	= mkPrep "even in";
	about	= mkPrep "about";

-- Pron

	you = mkNP youSg_Pron;
-- Subj

-- V

	say	= mkVS( mkV "say") ;
	sound	= mkVA( mkV "sound") ;
	tell	= mkV2S( mkV "tell") noPrep;
	think	= mkVS( mkV "think") ;
	use	= mkV2( mkV "use") noPrep;
	worry	= mkV2( mkV "worry") noPrep;
	put	= mkV3( mkV "put") ;
	might	= mkVV( mkV "might") ;
	make	= mkV2V( mkV "make") noPrep noPrep;
	make_V2A	= mkV2A( mkV "make") noPrep;
	look	= mkV2( mkV "look") noPrep;
	feel	= mkVA( mkV "feel") ;
	could	= mkVV( mkV "could") ;
	ask	= mkV2S( mkV "ask") noPrep;
}

-- vim: set ts=2 sts=2 sw=2 noet:
