--# -path=.:/home/drbean/GF/gf-contrib/drbean:./gf-contrib/drbean/conversation/work/dickson:present

concrete DicksonEng of Dickson = MyConcrete  **
open SyntaxEng, ParadigmsEng, IrregEng, ExtraEng, Prelude in {

lin

	AdjModified	a s = mkAP a s;
	two	= mkDet( mkCard (mkNumeral n2_Unit));
	several	= mkDet( mkQuant nonExist "several") pluralNum;
	about = ss "about";
	for_prep	= mkPrep "for";

	-- PassV2V vp = PassVPSlash vp;
	-- Slash v2v vp = mkVPSlash v2v vp;
	allow = mkV2V (mkV "allow") noPrep to_prep;
	do	= mkVA do_V;
	get_along	= mkV2 "get" "along with";
	get	= mkV2 get_V;
	get_3	= mkV3 get_V;
	give	= mkV3 IrregEng.give_V;
	go	= mkV2 IrregEng.go_V "to";
	have	= mkV2 (IrregEng.have_V);
	hire	= mkV2 "hire";
	interview	= mkV2 "interview";
	laugh	= mkV "laugh";
	let_V2V	= mkV2V let_V noPrep noPrep;
	lift	= mkV2 "lift";
	like_2	= mkV2 like_V;
	like_that	= mkVS like_V;
	like_to	= mkVV like_V;
	look	= mkVA look_V;
	make_V2A	= mkV2A make_V noPrep;
	make_V2V	= mkV2V make_V noPrep noPrep;
	need_V2 = mkV2 need_V ;
	need_VV = mkVV need_V ;
	prove	= reflexiveVP( mkV2 "prove");
	say	= mkVS IrregEng.say_V;
	see	= mkV2 IrregEng.see_V;
	slow_down	= partV (mkV "slow") "down";
	start = ingVV (mkV "start");
	take = mkV2V take_V noPrep to_prep;
	take_away	= mkV3 (partV take_V "away") noPrep from_prep;
	tell = mkV2S IrregEng.tell_V noPrep;
	tell_to	= mkV2V IrregEng.tell_V noPrep to_prep;
	think = mkVS (IrregEng.think_V);
	want	= mkVV (mkV "want");
	work_V	= mkV "work";
	work_with	 = mkV2 "work" with_prep;

	at_the_shipyard	= mkAP( mkA "at the shipyard");
  bad	= mkAP( mkA "bad");
  better	= mkAP( mkA "better");
  first	= mkAP( mkA "first");
  little	= mkAP( little_A );
	too_little	= mkAP too_AdA little_A;
  mad	= mkAP( mkA "mad");
	next jjjj
  slow	= mkAP( mkA "slow");
  hard	= mkAP( mkA "hard");

	next_Monday	= mkAdv "the next Monday";
  apprentice	= mkCN( mkN "apprentice");
  child	= mkCN( mkN "child");
  dad	= mkCN( mkN "dad");
  electrician	= mkCN( mkN "electrician");
  end	= mkCN( mkN "end");
  family	= mkCN( mkN "family");
  father_2	= mkN2 father_N part_prep;
  father	= mkCN father_N;
  guy	= mkCN guy_N;
  graduation	= mkCN( mkN "graduation");
  husband_2	= mkN2 ( husband_N ) of_prep;
  husband	= mkCN( husband_N );
	interviewer	= mkCN( mkN masculine (mkN "interviewer") );
  job	= mkCN( mkN "job");
	life = mkNP( mkN "life");
	man_CN	= mkCN man;
	man_N	= man;
	money = mkNP( mkN "money");
  night	= mkCN( mkN "night");
  position	= mkCN( mkN "position");
	raise = mkCN( mkN "raise");
  school	= mkCN( mkN "school");
  ship	= mkCN( mkN "ship");
  shipyard	= mkCN( mkN "shipyard");
  stuff	= mkNP( mkN "stuff");
  superintendent	= mkCN( mkN "superintendent");
  supervisor	= mkCN( mkN "supervisor");
  thing	= mkCN( mkN "thing");
  time	= mkNP( mkN "time");
  top	= mkCN( mkN "top");
  transformer	= mkCN( mkN "transformer");
  uncle_2	= mkN2 uncle_N part_prep;
  uncle	= mkCN uncle_N;
  way	= mkCN( mkN "way");
  week	= mkCN( mkN "week");
  woman	= mkCN( mkN feminine ( mkN "woman"));
  word	= mkCN( mkN "word");
  work	= mkNP( mkN "work");

	uncle_alf = mkPN (mkCN uncle_N (mkNP alf_PN));
  alf	= alf_PN;
  dee	= mkPN( mkN feminine (mkN "Dee") );
  monday = mkPN( mkN nonhuman (mkN "Monday") );

oper

	get_V	= IrregEng.get_V;
	like_V	= mkV "like";
	look_V	= mkV "look";
	make_V	= IrregEng.make_V;
	need_V	= mkV "need";
	take_V	= IrregEng.take_V;

	little_A = mkA "little";

  father_N	= mkN masculine (mkN "father");
	guy_N	= mkN masculine (mkN "guy");
	husband_N	= mkN masculine (mkN "husband");
	man	= mkN masculine (mkN "man" "men" "man's" "men's");
  uncle_N	= mkN masculine (mkN "Uncle");

  alf_PN	= mkPN( mkN masculine (mkN "Alf") );
}

-- vim: set ts=2 sw=2 noet:

