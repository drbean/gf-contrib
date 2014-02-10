concrete CandidateEng of Candidate = CatEng **
  open SyntaxEng, ParadigmsEng, IrregEng, Prelude in {

-- lincat Quality, Kind, Phrase = {s : Str} ;
lincat
	Phrase	= Cl;
	-- Item	= NP;
	Quality	= AP;
	Kind	= CN;

lin

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
