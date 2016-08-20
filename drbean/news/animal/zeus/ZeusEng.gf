--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete ZeusEng of Zeus = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	often	= mkAdv "often";
	quicker	= mkAdv "quicker";
	recently	= mkAdv "recently";
	at_the_shoulder	= mkAdv "at the shoulder";
	usually	= mkAdv "usually";
	younger	= mkAdv "younger";

-- AP

	amazing	= mkAP( mkA "amazing") ;
	big	= mkAP( mkA "big") ;
	hind	= mkAP( mkA "hind") ;
	old	= mkAP( mkA "old") ;
	sixth	= mkAP( mkA "sixth") ;
	smaller	= mkAP( mkA "smaller") ;
	tall	= mkAP( mkA "tall") ;
	tallest	= mkAP( mkA "tallest") ;
	toy	= mkAP( mkA "toy") ;

-- Conj

	and	= mkConj "and";

-- Det

	fourteen	= mkDet( mkNumeral "14");
	fortyfour	= mkDet( mkNumeral  "44" );
	four = mkDet( mkCard (mkNumeral n4_Unit));
	only	= only_Predet;
	seven = mkDet( mkCard (mkNumeral n7_Unit));
	two = mkDet( mkCard (mkNumeral n2_Unit));

-- N

	twenty_twelve	= mkN "2012" nonExist;
	age	= mkCN( mkN "age") ;
	birthday	= mkCN( mkN "birthday") ;
	cause	= mkN2( mkN "cause") of_PREP;
	death	= mkN "death" nonExist;
	dog	= mkCN( mkN "dog") ;
	feet	= mkCN( mkN "foot" "feet") ;
	great_dane	= mkCN( mkN "Great_Dane") ;
	hospital	= mkCN( mkN "hospital") ;
	inch	= mkCN( mkN "inch") ;
	leg	= mkCN( mkN "leg") ;
	life_span	= mkN2( mkN "life_span") for;
	month	= mkCN( mkN "month") ;
	people	= mkCN( mkN "people") ;
	poodle	= mkCN( mkN "poodle") ;
	record	= mkN2( mkN "record") for;
	school	= mkCN( mkN "school") ;
	therapy_dog	= mkCN( mkN "therapy_dog") ;
	world	= mkCN( mkN "world") ;
	year	= mkCN( mkN "year") ;

-- PN

	the_guiness_book_of_world_records	= mkPN( mkN feminine (mkN "the_Guiness_Book_of_World_Records") );
	the_smithsonian	= mkPN( mkN feminine (mkN "the_Smithsonian") );
	zeus	= mkPN( mkN feminine (mkN "Zeus") );

-- Prep

	according_to	= mkPrep "according_to";
	around	= mkPrep "around";
	as	= mkPrep "as";
	at	= mkPrep "at";
	before	= mkPrep "before";
	for	= mkPrep "for";
	in_PREP	= mkPrep "in";
	like	= mkPrep "like";
	on	= mkPrep "on";
	than	= mkPrep "than";

-- Pron


-- Subj

	because	= mkSubj "because";

-- V

	average	= mkV2( mkV "average") around;
	die	= mkVA( mkV "die") ;
	get_into	= partV( mkV "get_into") "";
	hold	= mkV2( mkV "hold") noPrep;
	love	= mkV2( mkV "love") noPrep;
	miss	= mkV2( mkV "miss") noPrep;
	pass_away	= partV( mkV "pass") "away";
	visit	= mkV2( mkV "visit") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
