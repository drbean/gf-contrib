--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete DinnerEng of Dinner = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	too	= ParadigmsEng.mkAdA "too" ;
	totally	= ParadigmsEng.mkAdA "totally" ;
	so	= ParadigmsEng.mkAdv "so" ;
	rarely	= ParadigmsEng.mkAdv "rarely" ;
	ago	= ParadigmsEng.mkAdv "ago" ;

-- AP

	vital	= mkAP( mkA "vital") ;
	together	= mkAP( mkA "together") ;
	public	= mkAP( mkA "public") ;
	private	= mkAP( mkA "private") ;
	presidential	= mkAP( mkA "presidential") ;
	national	= mkAP( mkA "national") ;
	nasty	= mkAP( mkA "nasty") ;
	little	= mkAP( mkA "little") ;
	light_hearted	= mkAP( mkA "light-hearted") ;
	last	= mkAP( mkA "last") ;
	harsh	= mkAP( mkA "harsh") ;
	different	= mkAP( mkA "different") ;
	clear	= mkAP( mkA "clear") ;
	charitable	= mkAP( mkA "charitable") ;

-- Conj

	and	= mkConj "and";

-- Det

	six_million	= mkDet( mkQuant  nonExist "six million" ) pluralNum;
	more_than	= ss "more than";
	four	= mkDet (mkNumeral n4_Unit);
	every	= ss "every";
	all	= ss "all";

-- N

	year	= mkCN( mkN "year") ;
	wealth	= mkN "wealth" nonExist;
	torch	= mkCN( mkN "torch") ;
	time	= mkCN( mkN "time") ;
	store	= mkCN( mkN "store") ;
	shopping	= mkN "shopping" nonExist;
	ribbing	= mkN "ribbing" nonExist;
	politics	= mkN "politics" nonExist;
	policy	= mkCN( mkN "policy") ;
	night	= mkCN( mkN "night") ;
	level	= mkCN( mkN "level") ;
	keynote_speaker	= mkCN( mkN "keynote speaker") ;
	hair	= mkN "hair" nonExist;
	family	= mkCN( mkN "family") ;
	event	= mkCN( mkN "event") ;
	election	= mkCN( mkN "election") ;
	each_other	= mkN "each other" nonExist;
	dollar	= mkCN( mkN "dollar") ;
	dinner	= mkCN( mkN "dinner") ;
	catholic	= mkCN( mkN "Catholic") ;
	candidate	= mkCN( mkN "candidate") ;

-- PN

	trump	= mkPN( mkN masculine (mkN "Trump") );
	statue_of_liberty	= mkPN( mkN feminine (mkN "the Statue of Liberty") );
	romney	= mkPN( mkN masculine (mkN "Romney") );
	obama	= mkPN( mkN masculine (mkN "Obama") );
	clinton	= mkPN( mkN feminine (mkN "Clinton") );
	cardinal_dolan	= mkPN( mkN masculine (mkN "Cardinal Dolan") );
	al_smith	= mkPN( mkN masculine (mkN "Al Smith") );

-- Prep

	how_to	= mkPrep "how to";
	to	= mkPrep "to";
	not_to	= mkPrep "not to";
	in_PREP	= mkPrep "in";
	for	= mkPrep "for";
	before	= mkPrep "before";
	at	= mkPrep "at";

-- Pron


-- Subj


-- V

	suppose	= mkV2V( mkV "suppose") noPrep to;
	wonder	= mkVV( mkV "wonder") ;
	understand	= mkV2( mkV "understand") noPrep;
	put	= mkV2A( mkV "put") noPrep;
	think	= mkVS( mkV "think") ;
	see	= mkV2( mkV "see") noPrep;
	say	= mkVS( mkV "say") ;
	redistribute	= mkV2( mkV "redistribute") noPrep;
	raise	= mkV2( mkV "raise") noPrep;
	pretend	= mkVV( mkV "pretend") ;
	need	= mkVV( mkV "need") ;
	meet	= mkV "meet";
	lose	= mkV2( mkV "lose") noPrep;
	hate	= mkV2( mkV "hate") noPrep;
	go	= mkV2( mkV "go") noPrep;
	embarrass	= mkV2( mkV "embarrass") noPrep;
	despise	= mkV2( mkV "despise") noPrep;
	change	= mkV2( mkV "change") noPrep;
	believe	= mkVS( mkV "believe") ;

}

-- vim: set ts=2 sts=2 sw=2 noet:
