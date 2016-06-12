--# -path=.:./engine:/home/drbean/GF/lib/src/translator:present

concrete HappierEng of Happier = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	lots_of_Quant = mkQuant "lots of" "lots of" "lots" "lots";
	many_Quant = mkQuant nonExist "many";
	more_mass_Quant	= mkQuant "more" nonExist;
lin

-- Adv

	also	= mkAdv "also";
	never	= mkAdv "never";
	now	= mkAdv "now";
	often	= mkAdv "often";
	only	= mkAdV "only";
	sometimes	= mkAdv "sometimes";
	subjectively	= mkAdv "subjectively";
	very	= mkAdA "very";

-- AP

	involved	= mkA2( mkA "involved") with_prep;
	active	= mkA2( mkA "active") in_prep;
	big	= mkAP( mkA "big") ;
	different	= mkAP( mkA "different") ;
	happier	= mkAP( mkA "happier") ;
	happy	= mkAP( mkA "happy") ;
	happy_with	= mkA2( mkA "happy") with_prep;
	important	= mkA2( mkA "important") for;
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
	more_mass_Det = mkDet more_mass_Quant;

-- N

	word_relationships	= mkCN( mkN "word , relationships") ;
	community	= mkN "community" nonExist;
	country	= mkCN( mkN "country") ;
	daily_life	= mkN2( mkN "daily life" nonExist) at;
	emotion	= mkN "emotion" nonExist;
	engagement	= mkN2( mkN "engagement" nonExist) with_prep;
	engagement_N	= mkN "engagement" nonExist;
	family	= mkN "family" nonExist;
	feeling	= mkCN( mkN "feeling") ;
	flow_state	= mkCN( mkN "flow state") ;
	framework	= mkN2( mkN "framework") for;
	friend	= mkCN( mkN "friend") ;
	achievement	= mkN2( mkN "achievement" nonExist);
	goal	= mkCN( mkN "goal") ;
	happiness	= mkN "happiness" nonExist;
	ideology	= mkN "ideology";
	intimacy	= mkN "intimacy" nonExist;
	know	= mkCN( mkN "know") ;
	life_N	= mkN "life" nonExist;
	life	= mkN2( mkN "life") as;
	meaning	= mkN "meaning" nonExist;
	means	= mkCN( mkN nonExist "means") ;
	meditation	= mkN "meditation" nonExist;
	money	= mkN "money" nonExist;
	network	= mkCN( mkN "network") ;
	nothing_N	= mkN "nothing" nonExist;
	one_np	= mkN "one_NP" nonExist;
	person_with	= mkN2( mkN "person" "people") with_prep;
	philosophy	= mkN "philosophy" nonExist;
	physical_exercise	= mkN "physical exercise" nonExist;
	play	= mkN "play" nonExist;
	presence	= mkN2( mkN "presence") of_prep;
	question	= mkN2( mkN "question") about;
	relationship	= mkN2( mkN "relationship") with_prep;
	religion	= mkN "religion" nonExist;
	school	= mkN "school" nonExist;
	self	= mkCN( mkN "self") ;
	sense_of_achievement	= mkCN( mkN "sense of achievement" nonExist) ;
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
	feel_a	= mkVA( mkV "feel") ;
	feel_n	= mkV2( mkV "feel") noPrep;
	forget	= mkV2( mkV "forget") about;
	achieve	= mkV2( mkV "achieve") in_prep;
	give	= mkV3( mkV "give") noPrep noPrep;
	improve	= mkV2( mkV "improve") noPrep;

	improve	= mkV2( mkV "improve") noPrep;
	mean	= mkV2( mkV "mean") ;
	measure	= mkV2( mkV "measure") through;
	participate	= mkV2( mkV "participate") in_prep;
	pursue	= mkV2( mkV "pursue") noPrep;
	seek	= mkVV( mkV "seek") ;
	serve	= mkV2( mkV "serve") noPrep;
	think	= mkV2( mkV "think") about;
}

-- vim: set ts=2 sts=2 sw=2 noet:
