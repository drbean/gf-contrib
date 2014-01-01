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
	80_N	= mkN "80";
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
	could	: VV;
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

	become_V2	= mkV2 "become";
	become_V2	= mkV2 (mkV "become");
	can_VV	= SyntaxEng.can_VV;
	could_VV	= SyntaxEng.could_VV;
	get_along_V2	= mkV2 "get" "along_with";
	get_V2	= mkV2 "get";
	go_V2	= mkV2 "go" "to";
	have_V2	= mkV2 "have";
	hire_V2	= mkV2 "hire";
	feel_VS	= mkVS (mkV "feel");
	improve_V2	= mkV2 "improve";
	increase_V2	= mkV2 "increase";
	go_V	= IrregEng.go_V;
	have_V2	= mkV2 (IrregEng.have_V);
	help_V2	= mkV2 "help";
	know_VS	= mkVS know_V;
	lead_V2	= mkV2 "lead";
	must_VV	= SyntaxEng.must_VV;
	think_VS	= mkVS (mkV "think");
	want_VV	= SyntaxEng.want_VV;

	find_V2V	= mkV2V (mkV "find") noPrep to_Prep;
