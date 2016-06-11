--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete HappierEng of Happier = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	lots_of_Quant = mkQuant "lots of" "lots of" "lots" "lots";
	many_Quant = mkQuant nonExist "many";
lin

-- Adv

	also	= mkAdv "also";
	never	= mkAdv "never";
	now	= mkAdv "now";
	often	= mkAdv "often";
	only	= mkAdv "only";
	sometimes	= mkAdv "sometimes";
	subjectively	= mkAdv "subjectively";
	very	= mkAdA "very";

-- AP

	active	= mkA2( mkA "active") in_prep;
	big	= mkAP( mkA "big") ;
	different	= mkAP( mkA "different") ;
	happier	= mkAP( mkA "happier") ;
	happy	= mkAP( mkA "happy") ;
	important	= mkA2( mkA "important") about;
	other	= mkAP( mkA "other") ;
	positive	= mkAP( mkA "positive") ;
	rich	= mkAP( mkA "rich") ;
	subjective	= mkAP( mkA "subjective") ;
	social	= mkAP( mkA "social") ;

-- Conj

	and	= mkConj "and";
	but	= mkConj "but";
	or	= mkConj "or";

-- Det

	just	= ss "just";
	lots_of	= mkDet lots_of_Quant;
	many	= mkDet many_Quant plNum;
	one	= mkDet( mkNumeral n1_Unit);

-- N

	community	= mkN "community" nonExist;
	country	= mkCN( mkN "country") ;
	daily_life	= mkN "daily life" nonExist;
	emotion	= mkN "emotion" nonExist;
	engagement	= mkN2( mkN "engagement") with_prep;
	family	= mkN "family" nonExist;
	feeling	= mkCN( mkN "feeling") ;
	flow	= mkN "flow" nonExist;
	framework	= mkN2( mkN "framework") in_prep;
	friend	= mkCN( mkN "friend") ;
	achievement	= mkN "achievement" nonExist;
	goal	= mkCN( mkN "goal") ;
	happiness	= mkN "happiness" nonExist;
	ideology	= mkN "ideology";
	intimacy	= mkN "intimacy" nonExist;
	know	= mkCN( mkN "know") ;
	life	= mkN "life" nonExist;
	meaning	= mkN "meaning" nonExist;
	means	= mkCN( mkN "means") ;
	meditation	= mkN "meditation" nonExist;
	money	= mkN "money" nonExist;
	network	= mkCN( mkN "network") ;
	nothing_N	= mkN "nothing" nonExist;
	one_np	= mkN "one_NP" nonExist;
	philosophy	= mkN "philosophy" nonExist;
	physical_exercise	= mkN "physical exercise" nonExist;
	play	= mkN "play" nonExist;
	presence	= mkN2( mkN "presence") of_prep;
	question	= mkN2( mkN "question") about;
	relationship	= mkN2( mkN "relationship") with_prep;
	religion	= mkN "religion" nonExist;
	school	= mkN "school" nonExist;
	self	= mkCN( mkN "self") ;
	sense	= mkN2( mkN "sense") of_prep;
	social_connection	= mkN "social connection" nonExist;
	social_group	= mkCN( mkN "social group") ;
	something	= mkN "something" nonExist;
	state_of_mind	= mkCN( mkN "state of mind") ;
	tie	= mkN2( mkN "tie") with_prep;
	way	= mkCN( mkN "way") ;
	well_being	= mkN "well-being" nonExist;
	whole	= mkCN( mkN "whole") ;
	work	= mkN "work" nonExist;
	accomplishment	= mkN2( mkN "accomplishment") ;

-- PN


	tal_ben_shahar	= mkPN( mkN masculine (mkN "Tal Ben-Shahar") );
-- Prep

	as	= mkPrep "as";
	at	= mkPrep "at";
	for	= mkPrep "for";

	in_prep	= mkPrep "in";
	in_manner	= mkPrep "in";
	on	= mkPrep "on";
	than	= mkPrep "than";
	through	= mkPrep "through";
	to	= mkPrep "to";
	in_the_way_of	= mkPrep "in the way of";
	with_prep	= mkPrep "with";
	about	= mkPrep "about";
-- Pron


-- Subj

	even_when	= mkSubj "even when";

-- V

	ask	= mkV2( mkV "ask") noPrep;
	assess	= mkV2( mkV "assess") noPrep;
	believe	= mkV2( mkV "believe") noPrep;
	belong	= mkV2( mkV "belong") to;
	bring	= mkV2( mkV "bring") noPrep;
	concentrate	= mkV2( mkV "concentrate") on;
	emphasize	= mkV2( mkV "emphasize") noPrep;
	feel_a	= mkVA( mkV "feel_A") ;
	feel_n	= mkV2( mkV "feel_N") noPrep;
	forget	= mkV2( mkV "forget") about;
	achieve	= mkV2( mkV "achieve") in_prep;
	give	= mkV3( mkV "give") noPrep noPrep;
	improve	= mkV2( mkV "improve") noPrep;

	improve	= mkV2( mkV "improve") noPrep;
	involve	= mkV2( mkV "involve") with_prep;
	mean	= mkV2( mkV "mean") ;
	measure	= mkV2( mkV "measure") ;
	participate	= mkV2( mkV "participate") in_prep;
	pursue	= mkV2( mkV "pursue") noPrep;
	seek	= mkVV( mkV "seek") ;
	serve	= mkV2( mkV "serve") noPrep;
	think	= mkV2( mkV "think") about;
}

-- vim: set ts=2 sts=2 sw=2 noet:
