--# -path=.:./engine:present

concrete SummerEng of Summer = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	really	= ParadigmsEng.mkAdA "really";
	at_night	= ParadigmsEng.mkAdv "at night";
	much	= ParadigmsEng.mkAdA "much";
	just	= ParadigmsEng.mkAdV "just";
	full_time	= ParadigmsEng.mkAdv "full-time";
	around	= ParadigmsEng.mkAdv "around";
	also	= ParadigmsEng.mkAdV "also";
	again	= ParadigmsEng.mkAdv "again";

-- AP

	young	= mkAP( mkA "young") ;
	started	= mkAP( mkA "started") ;
	own	= mkAP( mkA "own") ;
	interesting	= mkAP( mkA "interesting") ;
	hot	= mkAP( mkA "hot") ;
	educational	= mkAP( mkA "educational") ;
	easy	= mkAP( mkA "easy") ;
	crazy	= mkAP( mkA "crazy") ;

-- Conj


-- Det

	two	= mkDet( mkCard (mkNumeral n2_Unit));
	one	= mkDet( mkCard (mkNumeral n1_Unit));
	a_lot_of	= ss "a lot of";
	eleven	= mkDet( ParadigmsEng.mkQuant nonExist "eleven") pluralNum;
	eight	= mkDet( mkCard (mkNumeral n8_Unit));

-- N

	vegetable	= mkCN( mkN nonhuman (mkN "vegetable") );
	tutor	= mkCN( mkN human (mkN "tutor") );
	telephone	= mkCN( mkN nonhuman (mkN "telephone") );
	script	= mkCN( mkN nonhuman (mkN "script") );
	restaurant	= mkCN( mkN nonhuman (mkN "restaurant") );
	problem	= mkCN( mkN nonhuman (mkN "problem") );
	phone	= mkCN( mkN nonhuman (mkN "phone") );
	meat	= mkN "meat" nonExist;
	marketing	= mkN "marketing" nonExist;
	marketer	= mkCN( mkN human (mkN "marketer") );
	learning_center	= mkCN( mkN "learning center") ;
	landscaping	= mkN "landscaping" nonExist;
	landscaper	= mkCN( mkN human (mkN "landscaper") );
	kitchen	= mkCN( mkN "kitchen") ;
	kid	= mkCN( mkN human (mkN "kid") );
	job	= mkCN( mkN nonhuman (mkN "job") );
	intern	= mkCN( mkN human (mkN "intern") );
	hour	= mkCN( mkN nonhuman (mkN "hour") );
	game	= mkCN( mkN nonhuman (mkN "game") );
	fun_N	= mkN "fun" nonExist;
	dish	= mkCN( mkN nonhuman (mkN "dish") );
	costume	= mkCN( mkN nonhuman (mkN "costume") );
	computer	= mkCN( mkN nonhuman (mkN "computer") );
	company	= mkCN( mkN nonhuman (mkN "company") );
	chef	= mkCN( mkN human (mkN "chef") );
	cartoon_character	= mkCN( mkN human (mkN "cartoon character") );
	call_CN	= mkCN( mkN nonhuman (mkN "call") );
	amusement_park	= mkCN( mkN nonhuman (mkN "amusement park") );
	afternoon	= mkCN( mkN nonhuman (mkN "afternoon") );
	adult	= mkCN( mkN human (mkN "adult") );
	activity	= mkCN( mkN nonhuman (mkN "activity") );

-- PN

	wonda	= mkPN( mkN feminine (mkN "Wonda") );
	tracy	= mkPN( mkN feminine (mkN "Tracy") );
	paul	= mkPN( mkN masculine (mkN "Paul") );
	mark	= mkPN( mkN masculine (mkN "Mark") );
	carlos	= mkPN( mkN masculine (mkN "Carlos") );

-- Prep

	with_COAGENTPREP	= mkPrep "with";
	around_LOCPREP	= mkPrep "around";
	until_TIMEPREP	= mkPrep "until";
	over_MANNERPREP	= mkPrep "over";
	on_THEMEPREP	= mkPrep "on";
	as_ATTRIBUTEPREP	= mkPrep "as";
	into_STIMULUSPREP	= mkPrep "into";
	in_MANNERPREP	= mkPrep "in";
	in_LOCPREP	= mkPrep "in";
	from_TIMEPREP	= mkPrep "from";
	from_SOURCEPREP	= mkPrep "from";
	for_BENEFICIARYPREP	= mkPrep "for";
	by_THEMEPREP	= mkPrep "by";
	at_TIMEPREP	= mkPrep "at";
	at_LOCPREP	= mkPrep "at";

-- Pron


-- Subj

	when	= mkSubj "when";
	since	= mkSubj "since";
	as_long_as	= mkSubj "as long as";

-- V

	work	= mkV "work";
	wash	= mkV2( mkV "wash") noPrep;
	walk	= mkV2( mkV "walk") around_LOCPREP;
	try	= mkVV( mkV "try") ;
	take	= mkV2 IrregEng.take_V noPrep;
	think	= mkVS( mkV "think") ;
	show_to	= mkV3( mkV "show") noPrep toPrep;
	show	= mkV3( mkV "show") noPrep noPrep;
	sell	= mkV3( mkV "sell") noPrep noPrep;
	run	= mkV2( mkV "run") into_STIMULUSPREP;
	realize	= mkVQ( mkV "realize") ;
	read	= mkV2( mkV "read") from_SOURCEPREP;
	make	= mkV2( mkV "make") noPrep;
	help	= mkV2V( mkV "help") noPrep noPrep;
	get_VA	= mkVA( mkV "get") ;
	get_VV	= mkVV( mkV "get") ;
	get	= mkV2( mkV "get") noPrep;
	earn	= mkV2( mkV "earn") noPrep;
	drive	= mkV2A( mkV "drive") noPrep;
	cut_up	= mkV2( partV( mkV "cut") "up") noPrep;
	choose	= mkV2( mkV "choose") noPrep;
	call_V2	= mkV2( mkV "call") noPrep;
	answer	= mkV2( mkV "answer") noPrep;

}

-- vim: set ts=2 sts=2 sw=2 noet:
