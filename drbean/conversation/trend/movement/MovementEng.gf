--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete MovementEng of Movement = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	two_CARD	= mkCard (mkNumeral n2_Unit);
	three_CARD	= mkCard (mkNumeral n3_Unit);
	five_CARD	= mkCard (mkNumeral n5_Unit);
lin

-- Adv

	now	= mkAdv "now";
	less	= mkAdv "less";
	actually	= mkAdv "actually";

-- AP

	more_ADJ	= mkAP( mkA "more") ;
	shirtless	= mkAP( mkA "shirtless") ;
	second	= mkAP( mkA "second") ;
	risky	= mkAP( mkA "risky") ;
	public	= mkAP( mkA "public") ;
	new	= mkAP( mkA "new") ;
	lone	= mkAP( mkA "lone") ;
	important	= mkAP( mkA "important") ;
	great	= mkAP( mkA "great") ;
	first	= mkAP( mkA "first") ;
	easy	= mkAP( mkA "easy");
	crucial	= mkAP( mkA "crucial") ;

-- Conj

	if	= mkConj "if";
	but	= mkConj "but";
	because	= mkConj "because";
	and	= mkConj "and";

-- Det

	two = mkDet two_CARD;
	three	= mkDet three_CARD;
	just	= ss "just";
	not_just	= ss "not just";
	five	= mkDet five_CARD;

-- N

	three_N	= mkN "three" nonExist;
	tipping_point	= mkCN( mkN "tipping point") ;
	role	= mkCN( mkN "role") ;
	reason	= mkN2( mkN "reason") not_to;
	people	= mkCN( mkN "people") ;
	part	= mkN2( mkN "part") part_prep;
	other	= mkCN( mkN "other") ;
	nut	= mkCN( mkN "nut") ;
	news	= mkN "news" nonExist;
	movement	= mkCN( mkN "movement") ;
	momentum	= mkN "momentum" nonExist;
	leader	= mkCN( mkN "leader") ;
	in_crowd	= mkCN( mkN "in-crowd") ;
	guy	= mkCN( mkN "guy") ;
	guts	= mkCN( mkN nonExist "guts" ) ;
	follower	= mkCN( mkN "follower") ;
	fence	= mkCN( mkN "fence") ;
	equal	= mkCN( mkN "equal") ;
	crowd	= mkCN( mkN "crowd") ;
	credit	= mkN "credit" nonExist;
	courage	= mkN "courage" nonExist;

-- PN

	derek_sivers	= mkPN( mkN feminine (mkN "Derek Sivers") );

-- Prep

	on	= mkPrep "on";
	with_PREP	= mkPrep "with";
	to	= mkPrep "to";
	not_to	= mkPrep "not to";
	into	= mkPrep "into";
	for	= mkPrep "for";
	as	= mkPrep "as";
	as_attribute	= mkPrep "as";
	about	= mkPrep "about";

-- Pron


-- Subj


-- V

	do	= mkV2( mkV "do") noPrep;
	talk	= mkV2( mkV "talk") about;
	find	= ingV2V( mkV "find") noPrep noPrep;
	need	= mkV2V( mkV "need") noPrep to;
	stand_up	= partV( mkV "stand") "up";
	transform	= mkV3( mkV "transform") noPrep into;
	take	= mkV2V( mkV "take") noPrep to;
	stick	= mkV2( mkV "stick") with_PREP;
	start	= mkV2( mkV "start") noPrep;
	stand_out	= partV( mkV "stand") "out";
	sit	= mkV2( mkV "sit") on;
	show_V2	= mkV2( mkV "show") noPrep;
	show	= mkV3( mkV "show") noPrep noPrep;
	should	= ModalVV "should" "should" "should" "should" "shouldn't" ;
	ridicule	= mkV2( mkV "ridicule") noPrep;
	prefer	= mkV2( mkV "prefer") to;
	must	= ModalVV "must" "must" "must" "must" "mustn't" ;
	join_in	= partV( mkV "join") "in";
	hurry	= mkV "hurry";
	get	= mkV2( mkV "get") noPrep;
	follow	= mkV "follow";
	emulate	= mkV2( mkV "emulate") noPrep;
	embrace	= mkV3( mkV "embrace") noPrep as;
	embrace_attribute	= mkV2( mkV "embrace") noPrep;
	care	= mkV2( mkV "care") about;

}

-- vim: set ts=2 sts=2 sw=2 noet:
