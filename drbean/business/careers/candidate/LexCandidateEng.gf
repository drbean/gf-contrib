instance LexCandidateEng of LexCandidate = open SyntaxEng, ParadigmsEng, Prelude, IrregEng in {

oper

	Is quality kind = ss ( quality.s ++ kind.s );

	ambitious =	mkAP (mkA "ambitious");
	bad =	mkAP (mkA "bad");
	competitive =	mkAP (mkA "competitive");
	confident =	mkAP (mkA "confident");
	difficult =	mkAP (mkA "difficult");
	each =	mkAP (mkA "each");
	fast =	mkAP (mkA "fast");
	few =	mkAP (mkA "few");
	five =	mkAP (mkA "five");
	good =	mkAP (mkA "good");
	hard =	mkAP (mkA "hard");
	honest =	mkAP (mkA "honest");
	local =	mkAP (mkA "local");
	long =	mkAP (mkA "long");
	next =	mkAP (mkA "next");
	other =	mkAP (mkA "other");
	outgoing =	mkAP (mkA "outgoing");
	past =	mkAP (mkA "past");
	patient =	mkAP (mkA "patient");
	Polish =	mkAP (mkA "Polish");
	poor =	mkAP (mkA "poor");
	possible =	mkAP (mkA "possible");
	realistic =	mkAP (mkA "realistic");
	safe =	mkAP (mkA "safe");
	soon =	mkAP (mkA "soon");
	successful =	mkAP (mkA "successful");
	true =	mkAP (mkA "true");
	unable =	mkAP (mkA "unable");
	various =	mkAP (mkA "various");

	ability =	mkCN (mkN "ability");
	administration =	mkCN (mkN "administration");
	aim =	mkCN (mkN "aim");
	business =	mkCN (mkN "business");
	club =	mkCN (mkN "club");
	company =	mkCN (mkN "company");
	course =	mkCN (mkN "course");
	department =	mkCN (mkN "department");
	director =	mkCN (mkN "director");
	effort =	mkCN (mkN "effort");
	experience =	mkCN (mkN "experience");
	hand =	mkCN (mkN "hand");
	head =	mkCN (mkN "head");
	job =	mkCN (mkN "job");
	judgement =	mkCN (mkN "judgement");
	learner =	mkCN (mkN "learner");
	lot =	mkCN (mkN "lot");
	main =	mkCN (mkN "main");
	market =	mkCN (mkN "market");
	material =	mkCN (mkN "material");
	pair =	mkCN (mkN "pair");
	people =	mkCN (mkN "people");
	personality =	mkCN (mkN "personality");
	respect =	mkCN (mkN "respect");
	result =	mkCN (mkN "result");
	risk =	mkCN (mkN "risk");
	sales =	mkCN (mkN "sales");
	share =	mkCN (mkN "share");
	system =	mkCN (mkN "system");
	team =	mkCN (mkN "team");
	term =	mkCN (mkN "term");
	thing =	mkCN (mkN "thing");
	time =	mkCN (mkN "time");
	top =	mkCN (mkN "top");
	training =	mkCN (mkN "training");
	way =	mkCN (mkN "way");
	year =	mkCN (mkN "year");

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
--barbara_PN = mkPN "barbara"
--dr_bean_PN = mkPN "dr_bean"
--eva_PN = mkPN "eva"
--fast-track_PN = mkPN "fast-track"
--tadeusz_PN = mkPN "tadeusz"

--allow_V = mkV "allow"
--apply_V = mkV "apply"
--become_V = mkV "become"
--been_V = mkV "been"
--can_V = mkV "can"
--choose_V = mkV "choose"
--could_V = mkV "could"
--couldn't_V = mkV "couldn"
--enjoy_V = mkV "enjoy"
--expand_V = mkV "expand"
--feel_V = mkV "feel"
--get_V = mkV "get"
--go_V = mkV "go"
--have_V = mkV "have"
--help_V = mkV "help"
--improve_V = mkV "improve"
--increase_V = mkV "increase"
--know_V = mkV "know"
--lead_V = mkV "lead"
--motivate_V = mkV "motivate"
--offer_V = mkV "offer"
--organize_V = mkV "organize"
--say_V = mkV "say"
--see_V = mkV "see"
--sell_V = mkV "sell"
--set_V = mkV "set"
--start_V = mkV "start"
--take_V = mkV "take"
--tell_V = mkV "tell"
--think_V = mkV "think"
--try_V = mkV "try"
--want_V = mkV "want"
--win_V = mkV "win"
--work_V = mkV "work"
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
--# -path=.:./gf-contrib/drbean/conversation/work/dickson:present

	bad_A	= mkA "bad";
	better_A	= mkA "better";
	first_A	= mkA "first";
	little_A	= mkA "little";
	mad_A	= mkA "mad";
	slow_A	= mkA "slow";
	hard_A	= mkA "hard";

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

	apprentice_N	= mkN human (mkN "apprentice");
	child_N = mkN human (mkN "child" "children");
	dad_N	= mkN masculine (mkN "dad");
	end_N	= mkN "end";
	family_N	= mkN "family";
	father_N2	= mkN2 (mkN masculine (mkN "father")) of_prep;
	graduation_N	= mkN "graduation";
	guy_N	= mkN masculine (mkN "guy");
	job_N	= mkN "job";
	kind_N	= mkN "kind";
	knack_N	= mkN "knack" nonExist;
	life_N	= mkN "life" "lives";
	man_N	= mkN masculine (mkN "man" "men");
	money_N	= mkN "money";
	night_N	= mkN "night";
	position_N	= mkN "position";
	school_N	= mkN "school";
	ship_N	= mkN "ship";
	stuff_N	= mkN "stuff";
	superintendent_N	= mkN human (mkN "superintendent");
	supervisor_N	= mkN human (mkN "supervisor");
	thing_N	= mkN "thing";
	time_N	= mkN "time";
	top_N	= mkN "top";
	transformer_N	= mkN "transformer";
	uncle_N2	= mkN2 (mkN masculine (mkN "uncle")) of_prep;
	way_N	= mkN "way";
	week_N	= mkN "week";
	word_N	= mkN "word";
	work_N	= mkN "work";

	alf_N	= mkN masculine (mkN "Alf");
	dee_N	= mkN feminine (mkN "Dee");
	monday_N = mkN nonhuman (mkN "Monday");

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

}
---- adv
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
--
--
--barbara_PN = mkPN "barbara"
--dr_bean_PN = mkPN "dr_bean"
--eva_PN = mkPN "eva"
--fast-track_PN = mkPN "fast-track"
--tadeusz_PN = mkPN "tadeusz"
--
---- noun
--ability_N = mkN "ability"
--administration_N = mkN "administration"
--aim_N = mkN "aim"
--business_N = mkN "business"
--club_N = mkN "club"
--company_N = mkN "company"
--course_N = mkN "course"
--department_N = mkN "department"
--director_N = mkN "director"
--effort_N = mkN "effort"
--experience_N = mkN "experience"
--hand_N = mkN "hand"
--head_N = mkN "head"
--job_N = mkN "job"
--judgement_N = mkN "judgement"
--learner_N = mkN "learner"
--lot_N = mkN "lot"
--main_N = mkN "main"
--market_N = mkN "market"
--material_N = mkN "material"
--pair_N = mkN "pair"
--people_N = mkN "people"
--personality_N = mkN "personality"
--respect_N = mkN "respect"
--result_N = mkN "result"
--risk_N = mkN "risk"
--sales_N = mkN "sales"
--share_N = mkN "share"
--system_N = mkN "system"
--team_N = mkN "team"
--term_N = mkN "term"
--thing_N = mkN "thing"
--time_N = mkN "time"
--top_N = mkN "top"
--training_N = mkN "training"
--way_N = mkN "way"
--year_N = mkN "year"
--
--allow_V = mkV "allow"
--apply_V = mkV "apply"
--become_V = mkV "become"
--been_V = mkV "been"
--can_V = mkV "can"
--choose_V = mkV "choose"
--could_V = mkV "could"
--couldn't_V = mkV "couldn"
--enjoy_V = mkV "enjoy"
--expand_V = mkV "expand"
--feel_V = mkV "feel"
--get_V = mkV "get"
--go_V = mkV "go"
--have_V = mkV "have"
--help_V = mkV "help"
--improve_V = mkV "improve"
--increase_V = mkV "increase"
--know_V = mkV "know"
--lead_V = mkV "lead"
--motivate_V = mkV "motivate"
--offer_V = mkV "offer"
--organize_V = mkV "organize"
--say_V = mkV "say"
--see_V = mkV "see"
--sell_V = mkV "sell"
--set_V = mkV "set"
--start_V = mkV "start"
--take_V = mkV "take"
--tell_V = mkV "tell"
--think_V = mkV "think"
--try_V = mkV "try"
--want_V = mkV "want"
--win_V = mkV "win"
--work_V = mkV "work"
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
