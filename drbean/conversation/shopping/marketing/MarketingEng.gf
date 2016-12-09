--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete MarketingEng of Marketing = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

-- oper

lin

-- Adv

	randomly	= ParadigmsEng.mkAdV "randomly" ;
	fast	= ParadigmsEng.mkAdv "fast" ;

-- AP

	travel	= mkAP( mkA "travel") ;
	speed_meet	= mkAP( mkA "speed-meet") ;
	small	= mkAP( mkA "small") ;
	shared	= mkAP( mkA "shared") ;
	recent	= mkAP( mkA "recent") ;
	own	= mkAP( mkA "own") ;
	overall	= mkAP( mkA "overall") ;
	old	= mkAP( mkA "old") ;
	occasional	= mkAP( mkA "occasional") ;
	new	= mkAP( mkA "new") ;
	long_term	= mkAP( mkA "long-term") ;
	last	= mkAP( mkA "last") ;
	internal	= mkAP( mkA "internal") ;
	dutch	= mkAP( mkA "Dutch") ;
	design_AP	= mkAP( mkA "design") ;
	clothing	= mkAP( mkA "clothing") ;
	chocolate	= mkAP( mkA "chocolate") ;
	brazilian	= mkAP( mkA "Brazilian") ;
	altruistic	= mkAP( mkA "altruistic") ;

-- Conj

	or	= mkConj "or";
	and	= mkConj "and";

-- Det

	more_DET	= mkDet( ParadigmsEng.mkQuant "more" nonExist) singularNum;
	less	= mkDet( ParadigmsEng.mkQuant "less" nonExist) singularNum;
	even	= mkDet( ParadigmsEng.mkQuant "even" nonExist) singularNum;

-- N

	value	= mkCN( mkN nonhuman (mkN "value") );
	traveler	= mkCN( mkN human (mkN "traveler") );
	task	= mkCN( mkN nonhuman (mkN "task") );
	study	= mkCN( mkN nonhuman (mkN "study") );
	session	= mkCN( mkN nonhuman (mkN "session") );
	service	= mkN2( mkN nonhuman (mkN "service") ) of_PREP;
	sense	= mkN2( mkN nonhuman (mkN "sense") ) of_PREP;
	work_schedule	= mkCN( mkN nonhuman (mkN "work schedule") );
	salary	= mkCN( mkN nonhuman (mkN "salary") );
	promise	= mkCN( mkN nonhuman (mkN "promise") );
	product	= mkCN( mkN nonhuman (mkN "product") );
	productivity	= mkN "productivity" nonExist;
	pricing	= mkN2( mkN nonhuman (mkN "pricing") ) of_PREP;
	patagonia	= mkCN( mkN nonhuman (mkN "Patagonia") );
	moment	= mkCN( mkN nonhuman (mkN "moment") );
	loyalty	= mkN "loyalty" nonExist;
	loved_one	= mkCN( mkN human (mkN "loved one") );
	jacket	= mkCN( mkN nonhuman (mkN "jacket") );
	idea	= mkCN( mkN nonhuman (mkN "idea") );
	gift	= mkCN( mkN nonhuman (mkN "gift") );
	employee	= mkCN( mkN human (mkN "employee") );
	destination	= mkCN( mkN nonhuman (mkN "destination") );
	design	= mkCN( mkN nonhuman (mkN "design") );
	good_deed	= mkCN( mkN nonhuman (mkN "good deed") );
	day	= mkCN( mkN nonhuman (mkN "day") );
	customer	= mkCN( mkN human (mkN "customer") );
	creation	= mkN2( mkN nonhuman (mkN "creation" nonExist) ) of_PREP;
	control	= mkN2( mkN nonhuman (mkN "control" nonExist) ) over;
	consumer	= mkCN( mkN human (mkN "consumer") );
	company	= mkCN( mkN nonhuman (mkN "company") );
	album	= mkCN( mkN nonhuman (mkN "album") );
	airline	= mkCN( mkN nonhuman (mkN "airline") );

-- PN

	semco_group	= mkPN( mkN nonhuman (mkN "Semco Group") );
	radiohead	= mkPN( mkN nonhuman (mkN "Radiohead") );
	nextpedition	= mkPN( mkN nonhuman (mkN "Nextpedition") );
	klm	= mkPN( mkN nonhuman (mkN "KLM") );
	frog	= mkPN( mkN nonhuman (mkN "frog") );
	anthon_berg	= mkPN( mkN nonhuman (mkN "Anthon Berg") );

-- Prep

	on	= mkPrep "on";
	with_PREP	= mkPrep "with";
	until	= mkPrep "until";
	towards	= mkPrep "towards";
	to	= mkPrep "to";
	throughout	= mkPrep "throughout";
	over	= mkPrep "over";
	on	= mkPrep "on";
	en_route_to	= mkPrep "en route to";

-- Pron

	each_other	= mkNP( mkDet( ParadigmsEng.mkQuant "each other" nonExist) singularNum );

-- Subj


-- V

	tell	= mkV3( mkV "tell") noPrep noPrep;
	suggest	= mkVS( mkV "suggest") ;
	set	= mkV2( mkV "set") noPrep;
	purchase	= mkV2( mkV "purchase") noPrep;
	let_V2V	= mkV2V( mkV "let") noPrep noPrep;
	know	= mkV2( mkV "know") noPrep;
	increase	= mkV2( mkV "increase") noPrep;
	hold	= mkV2( mkV "hold") noPrep;
	help	= mkV2V( mkV "help") noPrep noPrep;
	have_V2V	= mkV2V( mkV "have") noPrep noPrep;
	hand_out	= partV( mkV "hand") "out";
	give	= mkV3( mkV "give") noPrep noPrep;
	get	= mkVV( mkV "get") ;
	connect	= mkV2( mkV "connect") noPrep;
	complete	= mkV2( mkV "complete") noPrep;
	collaborate	= mkV2( mkV "collaborate") with_PREP;
	buy	= mkV2( mkV "buy") noPrep;
	build	= mkV2( mkV "build") noPrep;
	base	= mkV3( mkV "base") noPrep on;
	ask	= mkV2S( mkV "ask") to;

}

-- vim: set ts=2 sts=2 sw=2 noet:
