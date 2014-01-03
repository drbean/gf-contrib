instance LexDicksonEng of LexDickson = open SyntaxEng, ParadigmsEng, Prelude, IrregEng in {

oper

	bad_A	= mkA "bad";
	better_A	= mkA "better";
	first_A	= mkA "first";
	little_A	= mkA "little";
	mad_A	= mkA "mad";
	next_A	= mkA "next";
	none_A	= mkA "none";
	several_A	= mkA "several";
	slow_A	= mkA "slow";
	two_A	= mkA "two";
	hard_A	= mkA "hard";
	right_A	= mkA "right";
	same_A	= mkA "same";

	a_Det	= aSg_Det;
	the_Det	= theSg_Det;

	apprentice_N	=mkN "apprentice";
	dad_N	= mkN "dad";
	eighty_N	= mkN "eighty";
	end_N	= mkN "end";
	experience_N	= mkN "experience";
	family_N	= mkN "family";
	graduation_N	= mkN "graduation";
	guy_N	= mkN "guy";
	jobs_N	= mkN "jobs";
	kind_N	= mkN "kind";
	knack_N	= mkN "knack";
	life_N	= mkN "life";
	man_N	= mkN "man";
	money_N	= mkN "money";
	nights_N	= mkN "nights";
	position_N	= mkN "position";
	pound_N	= mkN "pound";
	school_N	= mkN "school";
	ship_N	= mkN "ship";
	stuff_N	= mkN "stuff";
	superintendent_N	= mkN "superintendent";
	supervisor_N	= mkN "supervisor";
	things_N	= mkN "things";
	time_N	= mkN "time";
	top_N	= mkN "top";
	transformer_N	= mkN "transformer";
	uncle_N	= mkN "uncle";
	way_N	= mkN "way";
	week_N	= mkN "week";
	word_N	= mkN "word";
	work_N	= mkN "work";

	alf_PN	= mkPN "Alf";
	dee_PN	= mkPN "Dee";
	monday_PN = mkPN "Monday";

	become_V2	= mkV2 (IrregEng.become_V);
	can_VV	= SyntaxEng.can_VV;
	get_along_V2	= mkV2 "get" "along_with";
	get_V2	= mkV2 "get";
	go_V2	= mkV2 IrregEng.go_V "to";
	have_V2	= mkV2 (IrregEng.have_V);
	hire_V2	= mkV2 "hire";
	interview_V2	= mkV2 "interview";
	know_V	= IrregEng.know_V;
	laugh_V	= mkV "laugh";
	lift_V2	= mkV2 "lift";
	like_V2	= mkV2 "like";
	look_V2	= mkV2 "look";
	need_VV = mkVV (mkV "need" "needs" "needed" "needed" "needing") ;
	need_V2 = mkV2 (mkV "need" "needs" "needed" "needed" "needing");
	-- prove_V2	= mkV2 "prove";
	-- start_ing_VV = ingVV (mkV "start" "starts" "started" "started" "starting");
	-- take_V2V = mkV2V (IrregEng.take_V) noPrep to_Prep;
	-- tell_V2S = mkV2S (IrregEng.tell_V) noPrep;
	think_VS = mkVS (IrregEng.think_V);

	allow_V2V	= mkV2V (mkV "allow") noPrep to_Prep;
	apply_V2	= mkV2 "apply" "for";
	can_VV	= SyntaxEng.can_VV;
	-- become_V2	= mkV2 (mkV "become");
	choose_V2	= mkV2 "choose";
	enjoy_V2	= mkV2 "enjoy";
	expand_V	= mkV "expand";
	feel_VS	= mkVS (mkV "feel");
	improve_V2	= mkV2 "improve";
	increase_V2	= mkV2 "increase";
	go_V	= IrregEng.go_V;
	-- have_V2	= mkV2 (IrregEng.have_V);
	help_V2	= mkV2 "help";
	know_VS	= mkVS know_V;
	lead_V2	= mkV2 "lead";
	must_VV	= SyntaxEng.must_VV;
	-- think_VS	= mkVS (mkV "think");
	want_VV	= SyntaxEng.want_VV;

}
