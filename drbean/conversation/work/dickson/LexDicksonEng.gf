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
	guys_N	= mkN "guys";
	jobs_N	= mkN "jobs";
	kind_N	= mkN "kind";
	knack_N	= mkN "knack";
	life_N	= mkN "life";
	man_N	= mkN "man";
	men_N	= mkN "men";
	men's_N	= mkN "men";
	monday_N	= mkN "monday";
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
	weeks_N	= mkN "weeks";
	word_N	= mkN "word";
	work_N	= mkN "work";

	alf_PN	= mkPN "alf";
	dee_PN	= mkPN "dee";

	become	: V2;
	can	: VV;
	get	: V2;
	go	: V;
	have	: V2;
	hire	: V2;
	interview	: V2;
	know	: VS;
	laugh	: V;
	-- let	: V2;
	lift	: V2;
	like	: V;
	look	: V;
	-- make	: V2
	need	: VV;
	prove	: V;
	start	: V;
	take	: V;
	tell	: V;
	think	: VS;
	want	: VV;
	-- want_NP_to	: V2V;
	-- want_to	: VV;

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
	need_VV = mkVV "need";
	need_V2 = mkV2 "need";
	prove_V2	= mkV2 "prove";
	start_ing_VV = ingVV (mkV "start" "starts" "started" "started" "starting");
	take_V2V = mkV2V (IrregEng.take_V) noPrep to_Prep;
	tell_V2S = mkV2S (IrregEng.tell_V) noPrep;
	think_VS = mkVS (IrregEng.think_V);

}
