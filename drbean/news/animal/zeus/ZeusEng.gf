--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete ZeusEng of Zeus = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	fourteen_CARD = mkCard( mkNumeral "14" );
	fortyfour_CARD = mkCard( mkNumeral "14" );
	four_CARD = mkCard (mkNumeral n4_Unit);
	seven_CARD = mkCard (mkNumeral n7_Unit);
	two_CARD	= mkCard (mkNumeral n2_Unit);

	-- lin_card : (n : Card) -> Str;
	-- lin_card n = n.s ! R.Nom ++ feet_tall.s;

lin

-- Adv

	ever_since	= mkAdv "ever since";
	often	= mkAdv "often";
	quicker	= mkAdv "quicker";
	recently	= mkAdv "recently";
	at_the_shoulder	= mkAdv "at the shoulder";
	usually	= mkAdv "usually";
	seven_feet_four_inches  = mkAdv "seven feet four inches";

-- AP

	younger		= mkAP( mkA "younger") ;
	quick		= mkA "quick";
	-- four_feet_tall = n_feet_tall four_CARD;
	n_inches_tall	= mkAP( mkA "n inches tall") ;
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

	around	= ss "around";
	fourteen	= mkDet( mkNumeral "14");
	fortyfour	= mkDet( mkNumeral  "44" );
	four = mkDet four_CARD;
	only	= only_Predet;
	seven = mkDet seven_CARD;
	two = mkDet two_CARD;

-- N

	age	= mkN "age" nonExist;
	birthday	= mkCN( mkN "birthday") ;
	cause	= mkN2( mkN "cause") of_PREP;
	death	= mkN "death" nonExist;
	dog	= mkCN( mkN "dog") ;
	tallest_dog	= mkCN tallest dog;
	feet	= mkCN( mkN "foot" "feet") ;
	great_dane	= mkCN( mkN "Great Dane") ;
	hospital	= mkCN( mkN "hospital") ;
	inch	= mkCN( mkN "inch") ;
	leg	= mkCN( mkN "leg") ;
	life_span	= mkN2( mkN "life span") for;
	month	= mkCN( mkN "month") ;
	people	= mkCN( mkN "people") ;
	poodle	= mkCN( mkN "poodle") ;
	record	= mkN2( mkN "record") for;
	school	= mkCN( mkN "school") ;
	therapy_dog	= mkCN( mkN "therapy dog") ;
	world	= mkCN( mkN "world") ;
	year	= mkCN( mkN "year") ;

-- PN

	twenty_twelve	= mkPN( mkN nonhuman (mkN "2012") );
	the_guiness_book_of_world_records	= mkPN( mkN nonhuman (mkN "the Guiness Book of World Records") );
	the_smithsonian	= mkPN( mkN nonhuman (mkN "the Smithsonian") );
	zeus	= mkPN( mkN masculine (mkN "Zeus") );

-- Prep

	into	= mkPrep "into";
	according_to	= mkPrep "according to";
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

-- V

	age_v	= mkVA( mkV "age") ;
	get_into	= mkV2( mkV "get") into;
	average	= mkV2( mkV "average");
	die	= mkVA( mkV "die") ;
	hold	= mkV2( mkV "hold") noPrep;
	love	= mkV2( mkV "love") noPrep;
	miss	= mkV2( mkV "miss") noPrep;
	pass_away	= partV( mkV "pass") "away";
	visit	= mkV2( mkV "visit") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
