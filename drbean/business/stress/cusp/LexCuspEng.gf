instance LexCuspEng of LexCusp = open SyntaxEng, ParadigmsEng, Prelude, IrregEng in {

oper
	a_Det	= aSg_Det;
	zero_Det	= aPl_Det;
	the_Det	= theSg_Det;
	thePlural_Det	= thePl_Det;

	who_WH	= whoSg_IP;
	what_WH	= whatSg_IP;

	of_prep	= possess_Prep;
	in_prep = in_Prep;

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
	know_V2	= mkV2 know_V;
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
	work_in_V	 = mkV2 work_V in_prep;

	allow_V = mkV "allow";
	apply_V = mkV "apply";
	choose_V = mkV "choose";
	could_V = mkV "could";
	couldn't_V = mkV "couldn";
	enjoy_V = mkV "enjoy";
	expand_V = mkV "expand";
	feel_V = mkV "feel";
	help_V = mkV "help";
	improve_V = mkV "improve";
	increase_V = mkV "increase";
	lead_V = mkV "lead";
	motivate_V = mkV "motivate";
	offer_V = mkV "offer";
	organize_V = mkV "organize";
	sell_V = mkV "sell";
	set_V = mkV "set";
	try_V = mkV "try";
	want_V = mkV "want";
	win_V = mkV "win";

	ambitious_A	= mkA "ambitious";
	bad_A	= mkA "bad";
	competitive_A	= mkA "competitive";
	confident_A	= mkA "confident";
	difficult_A	= mkA "difficult";
	each_A	= mkA "each";
	experienced_A	= mkA "experienced";
	fast_A	= mkA "fast";
	few_A	= mkA "few";
	five_A	= mkA "five";
	good_A	= mkA "good" "better" "best" "well";
	hard_A	= mkA "hard";
	honest_A	= mkA "honest";
	local_A	= mkA "local";
	long_A	= mkA "long";
	next_A	= mkA "next";
	other_A	= mkA "other";
	outgoing_A	= mkA "outgoing";
	past_A	= mkA "past";
	patient_A	= mkA "patient";
	polish_A	= mkA "Polish";
	poor_A	= mkA "poor";
	possible_A	= mkA "possible";
	realistic_A	= mkA "realistic";
	safe_A	= mkA "safe";
	sales_A	= mkA "sales";
	soon_A	= mkA "soon";
	successful_A	= mkA "successful";
	true_A	= mkA "true";
	unable_A	= mkA "unable";
	various_A	= mkA "various";

	assertive_AP	= mkAP "assertive";
	bad_AP	= mkAP "bad";
	best_AP	= mkAP "best";
	best-placed_AP	= mkAP "best-placed";
	better_AP	= mkAP "better";
	brief_AP	= mkAP "brief";
	common_AP	= mkAP "common";
	critically-important_AP	= mkAP "critically-important";
	day-to-day_AP	= mkAP "day-to-day";
	difficult_AP	= mkAP "difficult";
	effective_AP	= mkAP "effective";
	face-to-face_AP	= mkAP "face-to-face";
	good_AP	= mkAP "good";
	helpless_AP	= mkAP "helpless";
	high_AP	= mkAP "high";
	latter_AP	= mkAP "latter";
	little_AP	= mkAP "little";
	managerial_AP	= mkAP "managerial";
	main_AP	= mkAP "main";
	more_AP	= mkAP "more";
	most_AP	= mkAP "most";
	other_AP	= mkAP "other";
	own_AP	= mkAP "own";
	particular_AP	= mkAP "particular";
	poor_AP	= mkAP "poor";
	practical_AP	= mkAP "practical";
	psychological_AP	= mkAP "psychological";
	severe_AP	= mkAP "severe";
	simple_AP	= mkAP "simple";
	social_AP	= mkAP "social";
	stressful_AP	= mkAP "stressful";
	structured_AP	= mkAP "structured";
	three_AP	= mkAP "three";
	timely_AP	= mkAP "timely";
	two-way_AP	= mkAP "two-way";
	unsupported_AP	= mkAP "unsupported";
	useful_AP	= mkAP "useful";
	vulnerable_AP	= mkAP "vulnerable";
	wrong_AP	= mkAP "wrong";


	ability_N	= mkN "ability";
	administration_N	= mkN "administration";
	aim_N	= mkN "aim";
	club_N	= mkN "club";
	company_N	= mkN "company";
	course_N	= mkN "course";
	department_N	= mkN "department";
	director_N	= mkN "director";
	director_N2	= mkN2 (mkN human (mkN "director")) of_prep;
	effort_N	= mkN "effort";
	experience_N	= mkN "experience";
	hand_N	= mkN "hand";
	head_N	= mkN "head";
	head_N2	= mkN2 (mkN human (mkN "head")) of_prep;
	job_N	= mkN "job";
	judgement_N	= mkN "judgement";
	learner_N	= mkN "learner";
	lot_N	= mkN "lot";
	main_N	= mkN "main";
	man_N	= mkN "man" "men";
	market_N	= mkN "market";
	material_N	= mkN "material";
	pair_N	= mkN "pair";
	people_N	= mkN "people";
	personality_N	= mkN "personality";
	polish_N	= mkN "Polish";
	respect_N	= mkN "respect";
	result_N	= mkN "result";
	risk_N	= mkN "risk";
	share_N	= mkN "share";
	system_N	= mkN "system";
	team_N	= mkN "team";
	term_N	= mkN "term";
	thing_N	= mkN "thing";
	time_N	= mkN "time";
	top_N	= mkN "top";
	training_N	= mkN "training";
	way_N	= mkN "way";
	woman_N	= mkN "woman" "women";
	work_N	= mkN "work";
	year_N	= mkN "year";

	action_CN	= mkCN "action";
	approachability_CN	= mkCN "approachability";
	areas_CN	= mkCN "areas";
	assessment_CN	= mkCN "assessment";
	awareness_CN	= mkCN "awareness";
	business_CN	= mkCN "business";
	cause_CN	= mkCN "cause";
	characteristics_CN	= mkCN "characteristics";
	climate_CN	= mkCN "climate";
	combination_CN	= mkCN "combination";
	comments_CN	= mkCN "comments";
	communication_CN	= mkCN "communication";
	companies_CN	= mkCN "companies";
	consultation_CN	= mkCN "consultation";
	control_CN	= mkCN "control";
	delegation_CN	= mkCN "delegation";
	depression_CN	= mkCN "depression";
	difference_CN	= mkCN "difference";
	difficulties_CN	= mkCN "difficulties";
	elements_CN	= mkCN "elements";
	example_CN	= mkCN "example";
	experience_CN	= mkCN "experience";
	flexibility_CN	= mkCN "flexibility";
	framework_CN	= mkCN "framework";
	groups_CN	= mkCN "groups";
	health_CN	= mkCN "health";
	hotspots_CN	= mkCN "hotspots";
	idea_CN	= mkCN "idea";
	individuals_CN	= mkCN "individuals";
	key_CN	= mkCN "key";
	kind_CN	= mkCN "kind";
	level_CN	= mkCN "level";
	luck_CN	= mkCN "luck";
	management_CN	= mkCN "management";
	manager_CN	= mkCN "manager";
	meetings_CN	= mkCN "meetings";
	message_CN	= mkCN "message";
	mind_CN	= mkCN "mind";
	minutes_CN	= mkCN "minutes";
	model_CN	= mkCN "model";
	one_CN	= mkCN "one";
	openness_CN	= mkCN "openness";
	options_CN	= mkCN "options";
	overview_CN	= mkCN "overview";
	people_CN	= mkCN "people";
	performance_CN	= mkCN "performance";
	placement_CN	= mkCN "placement";
	plan_CN	= mkCN "plan";
	position_CN	= mkCN "position";
	problem_CN	= mkCN "problem";
	responsibility_CN	= mkCN "responsibility";
	risk_CN	= mkCN "risk";
	sense_0	= mk0 "sense";
	situation_CN	= mkCN "situation";
	skills_CN	= mkCN "skills";
	staff_CN	= mkCN "staff";
	strategies_CN	= mkCN "strategies";
	studies_CN	= mkCN "studies";
	things_CN	= mkCN "things";
	time_CN	= mkCN "time";
	truth_CN	= mkCN "truth";
	way_CN	= mkCN "way";
	work_CN	= mkCN "work";
	workload_CN	= mkCN "workload";


	barbara_N = mkN feminine (mkN "Barbara");
	dr_bean_N = mkN masculine (mkN "Dr Bean");
	eva_N = mkN feminine (mkN "Eva");
	fast_track_N = mkN nonhuman (mkN "Fast-Track");
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
