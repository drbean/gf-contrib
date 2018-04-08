--# -path=.:./engine:/home/drbean/GF/lib/src/translator:alltenses 

concrete PollutionEng of Pollution = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv


-- AP

	urban	= mkAP( mkA "urban") ;
	underground	= mkAP( mkA "underground") ;
	terrible	= mkAP( mkA "terrible") ;
	other	= mkAP( mkA "other") ;
	huge	= mkAP( mkA "huge") ;
	environmental	= mkAP( mkA "environmental") ;
	dead	= mkAP( mkA "dead") ;
	bad	= mkAP( mkA "bad") ;
	avox	= mkAP( mkA "Avox") ;

-- Conj


-- Det

	one	= mkDet( mkCard (mkNumeral n1_Unit));
	a_lot_of	= mkDet( ParadigmsEng.mkQuant nonExist "a lot of") pluralNum;

-- N

	wildlife	= mkN "wildlife" nonExist;
	way	= mkN2( mkN nonhuman (mkN "way") ) to;
	water_pollution	= mkN "water pollution" nonExist;
	water	= mkN "water" nonExist;
	uncle	= mkCN( mkN human (mkN "uncle") );
	tv_station	= mkCN( mkN nonhuman (mkN "TV station") );
	town	= mkN "town" nonExist;
	top_executive	= mkCN( mkN human (mkN "top executive") );
	suburb	= mkCN( mkN nonhuman (mkN "suburb") );
	story	= mkCN( mkN nonhuman (mkN "story") );
	statue	= mkCN( mkN nonhuman (mkN "statue") );
	soil	= mkN "soil" nonExist;
	river	= mkCN( mkN nonhuman (mkN "river") );
	pollution	= mkN "pollution" nonExist;
	plant	= mkCN( mkN nonhuman (mkN "plant") );
	oil_spill	= mkCN( mkN nonhuman (mkN "oil spill") );
	marine_life	= mkN "marine life" nonExist;
	management	= mkN "management" nonExist;
	law	= mkCN( mkN nonhuman (mkN "law") );
	health	= mkN2( mkN nonhuman (mkN "health") ) of_PREP;
	growth	= mkN2( mkN nonhuman (mkN "growth") ) of_PREP;
	rain_forest	= mkCN( mkN nonhuman (mkN "rain forest") );
	fish	= mkCN( mkN nonhuman (mkN "fish" "fish") );
	farmland	= mkN "farmland" nonExist;
	factory	= mkCN( mkN nonhuman (mkN "factory") );
	extinction	= mkN "extinction" nonExist;
	environment	= mkCN( mkN nonhuman (mkN "environment") );
	destruction	= mkN "destruction" nonExist;
	company	= mkCN( mkN nonhuman (mkN "company") );
	chemical	= mkCN( mkN nonhuman (mkN "chemical") );
	building	= mkCN( mkN nonhuman (mkN "building") );
	bird	= mkCN( mkN nonhuman (mkN "bird") );
	areas	= mkCN( mkN nonhuman (mkN "areas") );
	amount	= mkCN( mkN nonhuman (mkN "amount") );
	air_pollution	= mkN "air pollution" nonExist;
	air	= mkN "air" nonExist;
	acid_rain	= mkN "acid rain" nonExist;

-- PN

	carla	= mkPN( mkN feminine (mkN "Carla") );
	avox_industries	= mkPN( mkN nonhuman (mkN "Avox Industries") );
	andy	= mkPN( mkN masculine (mkN "Andy") );

-- Prep

	to	= mkPrep "to";
	outside	= mkPrep "outside";
	on	= mkPrep "on";
	into	= mkPrep "into";
	in_LOCPREP	= mkPrep "in";
	at	= mkPrep "at";
	against	= mkPrep "against";
	about	= mkPrep "about";

-- Pron


-- Subj

	if	= mkSubj "if";

-- V

	work	= mkV "work";
	threaten	= mkV2( mkV "threaten") noPrep;
	think	= mkVS( mkV "think") ;
	talk	= mkV2( mkV "talk") to_Prep;
	see	= mkV2( mkV "see") noPrep;
	say	= mkVS( mkV "say") ;
	run	= mkV2( mkV "run") noPrep;
	pump	= mkV3( mkV "pump") ;
	publicity	= mkV "publicity";
	pollute	= mkV2( mkV "pollute") noPrep;
	kill	= mkV2( mkV "kill") noPrep;
	ignore	= mkV2( mkV "ignore") noPrep;
	hate	= mkV2( mkV "hate") noPrep;
	harm	= mkV2( mkV "harm") noPrep;
	happen	= mkV "happen" "happened";
	get	= mkV2V( mkV "get") noPrep to;
	erode	= mkV2( mkV "erode") noPrep;
	eat_up	= partV( mkV "eat") "up";
	contaminate	= mkV2( mkV "contaminate") noPrep;
	change	= mkV2( mkV "change") noPrep;
	accelerate	= mkV2( mkV "accelerate") noPrep;
	ask	= mkVS( mkV "ask") ;

}

-- vim: set ts=2 sts=2 sw=2 noet: