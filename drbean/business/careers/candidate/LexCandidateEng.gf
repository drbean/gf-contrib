instance LexCandidateEng of LexCandidate = open SyntaxEng, ParadigmsEng, Prelude, IrregEng in {

oper
	a_Det	= aSg_Det;
	zero_Det	= aPl_Det;
	the_Det	= theSg_Det;
	thePlural_Det	= thePl_Det;

	who_WH	= whoSg_IP;
	what_WH	= whatSg_IP;

	of_prep	=  possess_Prep;

	yes_Utt	= SyntaxEng.yes_Utt;
	no_Utt	= SyntaxEng.no_Utt;
	no_answer_Utt = ss "No answer";

	become_V2	= mkV2 (IrregEng.become_V);
	can_VV	= SyntaxEng.can_VV;
	get_along_V2	= mkV2 "get" "along_with";
	get_V2	= mkV2 "get";
	go_V2	= mkV2 IrregEng.go_V "to";
	have_V2	= mkV2 (IrregEng.have_V);
	hire_V2	= mkV2 "hire";
	interview_V2	= mkV2 "interview";
	know_V	= IrregEng.know_V;
	know_VS	= mkVS know_V;
	laugh_V	= mkV "laugh";
	lift_V2	= mkV2 "lift";
	like_V2	= mkV2 "like";
	look_V	= mkV "look";
	look_VA	= mkVA look_V;
	need_VV = mkVV (mkV "need" "needs" "needed" "needed" "needing") ;
	need_V2 = mkV2 (mkV "need" "needs" "needed" "needed" "needing");
	prove_V2	= mkV2 "prove";
	say_VS	= mkVS IrregEng.say_V;
	see_V2	= mkV2 IrregEng.see_V;
	slow_down_V	= partV (mkV "slow") "down";
	start_ing_VV = ingVV (mkV "start");
	take_V2V = mkV2V (IrregEng.take_V) noPrep to_Prep;
	tell_V2S = mkV2S IrregEng.tell_V noPrep;
	think_VS = mkVS (IrregEng.think_V);
	work_V	 = mkV "work";

	allow_V = mkV "allow"
	apply_V = mkV "apply"
	choose_V = mkV "choose"
	could_V = mkV "could"
	couldn't_V = mkV "couldn"
	enjoy_V = mkV "enjoy"
	expand_V = mkV "expand"
	feel_V = mkV "feel"
	help_V = mkV "help"
	improve_V = mkV "improve"
	increase_V = mkV "increase"
	lead_V = mkV "lead"
	motivate_V = mkV "motivate"
	offer_V = mkV "offer"
	organize_V = mkV "organize"
	sell_V = mkV "sell"
	set_V = mkV "set"
	try_V = mkV "try"
	want_V = mkV "want"
	win_V = mkV "win"

	ambitious_A	= mkA "ambitious";
	bad_A	= mkA "bad";
	competitive_A	= mkA "competitive";
	confident_A	= mkA "confident";
	difficult_A	= mkA "difficult";
	each_A	= mkA "each";
	fast_A	= mkA "fast";
	few_A	= mkA "few";
	five_A	= mkA "five";
	good_A	= mkA "good";
	hard_A	= mkA "hard";
	honest_A	= mkA "honest";
	local_A	= mkA "local";
	long_A	= mkA "long";
	next_A	= mkA "next";
	other_A	= mkA "other";
	outgoing_A	= mkA "outgoing";
	past_A	= mkA "past";
	patient_A	= mkA "patient";
	Polish_A	= mkA "Polish";
	poor_A	= mkA "poor";
	possible_A	= mkA "possible";
	realistic_A	= mkA "realistic";
	safe_A	= mkA "safe";
	soon_A	= mkA "soon";
	successful_A	= mkA "successful";
	true_A	= mkA "true";
	unable_A	= mkA "unable";
	various_A	= mkA "various";

	ability_N	= mkN "ability";
	administration_N	= mkN "administration";
	aim_N	= mkN "aim";
	business_N	= mkN "business";
	club_N	= mkN "club";
	company_N	= mkN "company";
	course_N	= mkN "course";
	department_N	= mkN "department";
	director_N	= mkN "director";
	effort_N	= mkN "effort";
	experience_N	= mkN "experience";
	hand_N	= mkN "hand";
	head_N	= mkN "head";
	job_N	= mkN "job";
	judgement_N	= mkN "judgement";
	learner_N	= mkN "learner";
	lot_N	= mkN "lot";
	main_N	= mkN "main";
	market_N	= mkN "market";
	material_N	= mkN "material";
	pair_N	= mkN "pair";
	people_N	= mkN "people";
	personality_N	= mkN "personality";
	respect_N	= mkN "respect";
	result_N	= mkN "result";
	risk_N	= mkN "risk";
	sales_N	= mkN "sales";
	share_N	= mkN "share";
	system_N	= mkN "system";
	team_N	= mkN "team";
	term_N	= mkN "term";
	thing_N	= mkN "thing";
	time_N	= mkN "time";
	top_N	= mkN "top";
	training_N	= mkN "training";
	way_N	= mkN "way";
	year_N	= mkN "year";

	barbara_N = mkN feminine (mkN "Barbara");
	dr_bean_N = mkN masculine (mkN "Dr Bean");
	eva_N = mkN feminine (mkN "Eva");
	fast-track_N = mkN nonhuman (mkN "Fast-track");
	tadeusz_N = mkN masculine (mkN "Tadeusz");

	--although_Adv = mkAdv "although";
	--always_AdV = mkAdv "always";
	--especially_Adv = mkAdv "especially";
	--frankly_Adv = mkAdv "frankly";
	--really_AdV = mkAdv "really";
	--slowly_Adv = mkAdv "slowly";
	--too_Adv = mkAdv "too";
	--very_AdA = mkAdA "very";
	--well_AdA = mkAdA "well";
	--wherever_Adv = mkAdv "wherever";

}

--
---- -- and
---- -- any
---- -- as
---- -- be
---- -- because
---- -- but
---- -- But
---- -- by
---- -- did
---- -- do
---- -- don't
---- -- during
---- -- enjoyed
---- -- Everyone
---- -- for
---- -- I
---- -- I'd
---- -- if
---- -- If
---- -- I'll
---- -- I'm
---- -- in
---- -- it
---- -- it's
---- -- I've
---- -- like
---- -- many
---- -- Maybe
---- -- me
---- -- much
---- -- must
---- -- my
---- -- myself
---- -- not
---- -- of
---- -- on
---- -- or
---- -- Or
---- -- our
---- -- over
---- -- People
---- -- perhaps
---- -- should
---- -- so
---- -- That
---- -- that's
---- -- the
---- -- their
---- -- them
---- -- they
---- -- this
---- -- to
---- -- up
---- -- was
---- -- we
---- -- we'll
---- -- were
---- -- We're
---- -- what
---- -- What's
---- -- why
---- -- with
---- -- won't
---- -- worked
---- -- working
---- -- would
---- -- years
---- -- you
