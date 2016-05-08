--# -path=.:/home/drbean/GF/lib/src/translator:/home/drbean/GF/gf-contrib/drbean/business/managing/culture:/home/drbean/GF/gf-contrib/drbean/business/managing/culture/engine:present

concrete CultureEng of Culture = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude, (R=ResEng) in {

oper

	difference = mkN "difference";

lin

-- Adv

	all_AdA	= mkAdv "all";
	differently	= mkAdv "differently";
	even	= mkAdV "even";
	just	= mkAdv "just";
	normally	= mkAdv "normally";
	of_course	= mkAdv "of course";
	very	= mkAdv "very";
	actually	= mkAdv "actually";
-- AP

	big	= mkAP( mkA "big");
	cultural	= mkAP( mkA "cultural");
	different	= mkAP( mkA "different");
	difficult	= mkAP( mkA "difficult");
	important	= mkAP( mkA "important");
	other	= mkAP( mkA "other");
	real	= mkAP( mkA "real");
	same	= mkAP( mkA "same");
	true	= mkAP( mkA "true");
	unique	= mkAP( mkA "unique");
-- Conj

	and	= mkConj "and";
	but	= mkConj "but";
	or	= mkConj "or";
-- Subj

	because	= mkSubj "because";
	just_because	= mkSubj "just because";
	when	= mkSubj "when";
	although	= mkSubj "although";
-- Det

	all	= all_Predet;
-- N

	culture	= mkCN( mkN "culture") ;
	country	= mkCN( mkN "country");
	difference_CN	= mkCN difference;
	difference_in = mkN2 difference in_prep;
	difference_between = mkN2 difference between;
	everyone	= mkN "everyone";
	group	= mkCN( mkN "group");
	individual	= mkCN( mkN "individual");
	same_N2	= mkN2( mkN "same") as;
	same_about	= mkN2( mkN "same") about;
	same_CN	= mkCN( mkN "same") ;
	thing_N2	= mkN2( mkN "thing") about;
	understanding	= mkCN( mkN "understanding");
	way	= mkCN( mkN "way");
-- PN

	india	= mkPN( mkN feminine (mkN "India") );
	africa	= mkPN( mkN feminine (mkN "Africa") );
-- Prep

	as	= mkPrep "as";
	between	= mkPrep "between";
	from	= mkPrep "from";
	in_prep	= mkPrep "in";
	to	= mkPrep "to";
	with_prep	= mkPrep "with";
	about	= mkPrep "about";
	according_to	= mkPrep "according to";
-- V

	assume	= mkVS( mkV "assume");
	look	= mkV2 "look";
	mean	= mkVS( mkV "mean");
	need	= mkVV( mkV "need");
	realize	= mkVS( mkV "realize");
	remember	= mkV2 "remember";
	remember_that	= mkVS( mkV "remember");
	think_V	= mkV "think";
	think	= mkV2 "think";
	think_about	= mkV2( mkV "think") about;
	think_that	= mkVS( mkV "think");
	treat	= mkV3( mkV "treat") noPrep as;
	work		= mkV2( mkV "work") with_prep;
}

-- vim: set ts=2 sts=2 sw=2 noet:
