instance LexTrinkaEng of LexTrinka = open SyntaxEng, ParadigmsEng, Prelude, IrregEng in {

oper

	a_Det	= aSg_Det;
	zero_Det	= aPl_Det;
	the_Det	= theSg_Det;
	thePlural_Det	= thePl_Det;

	who_WH	= whoSg_IP;
	what_WH	= whatSg_IP;

  about_prep = mkPrep "about";
  at_prep = mkPrep "at";
  by_prep = mkPrep "by";
  from_prep = from_Prep;
  of_prep	= possess_Prep;
  part_prep	= part_Prep;
  for_prep = for_Prep;
  in_prep = in_Prep;
  like_prep  = mkPrep "like";
  on_prep = mkPrep "on";
  over_prep = mkPrep "over";
  to_prep = mkPrep "to";
  up_prep = mkPrep "up";
  with_prep = mkPrep "with";

	of_prep	=  possess_Prep;

	-- yes_Utt	= SyntaxEng.yes_Utt;
	-- no_Utt	= SyntaxEng.no_Utt;
	-- no_answer_Utt = ss "No answer";

	become_V = IrregEng.become_V;
	smile_V	= mkV "smile";
	ask_V	= mkV "ask";
	come_V	= mkV "come";
	cut_V	= mkV "cut";
	fit_V	= mkV "fit";
	get_V	= IrregEng.get_V;
	give_V	= IrregEng.give_V;
	graduate_V	= mkV "graduate";
	have_V	= mkV "have";
	know_V	= mkV "know";
	like_V	= mkV "like";
	live_V	= mkV "live";
	make_V	= IrregEng.make_V;
	put_V	= IrregEng.put_V;
	run_V	= IrregEng.run_V;
	say_V	= IrregEng.say_V;
	shine_V	= mkV "shine";
	start_V	= mkV "start";
	talk_V	= mkV "talk";
	tell_V	= mkV "tell";
	treat_V	= mkV "treat";
	walk_V	= mkV "walk";
	work_V	= mkV "work";

	big_A	= mkA "big";
	beautiful_A	= mkA "beautiful";
	front_A	= mkA "front";
	good_A	= mkA "good";
	great_A	= mkA "great";
	happy_A	= mkA "happy";
	important_A	= mkA "important";
	last_A	= mkA "last";
	nice_A	= mkA "nice";
	open_A	= mkA "open";
	sick_A	= mkA "sick";
	young_A	= mkA "young";
	shined_A	= mkA "shined";

	doorman_N	= mkN "doorman";
	barber_N	= mkN "barber";
	coat_N	= mkN "coat";
	day_N	= mkN "day";

	dollar_N	= mkN "dollar";
	door_N	= mkN "door";
	fact_N	= mkN "fact";
	father_N	= mkN "father";
	friend_N	= mkN "friend";
	garage_N	= mkN "garage";
	guest_N	= mkN "guest";
	hour_N	= mkN "hour";
	job_N	= mkN "job";
	kit_N	= mkN "shoeshine" (mkN "kit");
	lady_N	= mkN "lady";
	life_N	= mkN "life";
	locker_N	= mkN "locker";
	man_N	= mkN "man";
	manager_N	= mkN "manager";
	meeting_N	= mkN "meeting";
	morning_N	= mkN "morning";
	paradise_N	= mkN "paradise";
	school_N	= mkN "high" (mkN "school");
	shoe_N	= mkN "shoe";
	barber_shop_N	= mkN "barber" (mkN "shop");
	story_N	= mkN nonhuman (mkN "story");
	thing_N	= mkN "thing";
	time_N	= mkN "time";
	tip_N	= mkN "tip";
	way_N	= mkN "way";
	work_N	= mkN "work";
	year_N	= mkN "year";

	ed_N	= mkN masculine (mkN "Ed Trinka");
	debra_N	= mkN feminine (mkN "Debra Goodman");
	jackie_N	= mkN masculine (mkN "Jackie Gleason");
	christmas_N	= mkN nonhuman (mkN "Christmas");
	god_N	= mkN masculine (mkN "God");
	plaza_N	= mkN nonhuman (mkN "the Plaza Hotel");
	merry_xmas_N	= mkN nonhuman (mkN "Merry Christmas");
	vip_N	= mkN "VIP";
}

-- vim: set ts=8 sts=2 sw=2 noet:
