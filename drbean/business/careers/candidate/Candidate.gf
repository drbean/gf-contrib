abstract Candidate = Cat ** {

  cat
    Quality ;
    Kind;
    Phrase;

  flags startcat = Quality ;

fun
	Is : Quality -> Kind -> Phrase ;

	ambitious :	Quality;
	bad :	Quality;
	competitive :	Quality;
	confident :	Quality;
	difficult :	Quality;
	each :	Quality;
	fast :	Quality;
	few :	Quality;
	five :	Quality;
	good :	Quality;
	hard :	Quality;
	honest :	Quality;
	local :	Quality;
	long :	Quality;
	next :	Quality;
	other :	Quality;
	outgoing :	Quality;
	past :	Quality;
	patient :	Quality;
	Polish :	Quality;
	poor :	Quality;
	possible :	Quality;
	realistic :	Quality;
	safe :	Quality;
	soon :	Quality;
	successful :	Quality;
	true :	Quality;
	unable :	Quality;
	various :	Quality;

	ability :	Kind;
	administration :	Kind;
	aim :	Kind;
	business :	Kind;
	club :	Kind;
	company :	Kind;
	course :	Kind;
	department :	Kind;
	director :	Kind;
	effort :	Kind;
	experience :	Kind;
	hand :	Kind;
	head :	Kind;
	job :	Kind;
	judgement :	Kind;
	learner :	Kind;
	lot :	Kind;
	main :	Kind;
	market :	Kind;
	material :	Kind;
	pair :	Kind;
	people :	Kind;
	personality :	Kind;
	respect :	Kind;
	result :	Kind;
	risk :	Kind;
	sales :	Kind;
	share :	Kind;
	system :	Kind;
	team :	Kind;
	term :	Kind;
	thing :	Kind;
	time :	Kind;
	top :	Kind;
	training :	Kind;
	way :	Kind;
	year :	Kind;

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
