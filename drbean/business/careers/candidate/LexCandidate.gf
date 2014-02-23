interface LexCandidate = open Syntax in {
oper

	a_Det	: Det;
	zero_Det	: Det;
	the_Det	: Det;
	thePlural_Det	: Det;

	who_WH	: IP;
	what_WH	: IP;

	of_prep	: Prep;

	yes_Utt	: Utt;
	no_Utt	: Utt;
	no_answer_Utt	: Utt;

	become_V2	: V2;
	can_VV	: VV;
	get_along_V2	: V2;
	get_V2	: V2;
	go_V2	: V2;
	have_V2	: V2;
	hire_V2	: V2;
	interview_V2	: V2;
	know_V	: V;
	know_VS	: VS;
	laugh_V	: V;
	lift_V2	: V2;
	like_V2	: V2;
	look_V	: V;
	look_VA	: VA;
	need_VV	: VV;
	need_V2	: V2;
	prove_V2	: V2;
	say_VS	: VS;
	see_V2	: V2;
	slow_down_V	: V;
	start_ing_VV	: VV;
	take_V2V	: V2V;
	tell_V2S	: V2S;
	think_VS	: VS;
	work_V	: V;

	ambitious	= mkAP ambitious_A;
	bad_A	:	A;
	competitive_A	:	A;
	confident_A	:	A;
	difficult_A	:	A;
	each_A	:	A;
	fast_A	:	A;
	few_A	:	A;
	five_A	:	A;
	good_A	:	A;
	hard_A	:	A;
	honest_A	:	A;
	local_A	:	A;
	long_A	:	A;
	next_A	:	A;
	other_A	:	A;
	outgoing_A	:	A;
	past_A	:	A;
	patient_A	:	A;
	Polish_A	:	A;
	poor_A	:	A;
	possible_A	:	A;
	realistic_A	:	A;
	safe_A	:	A;
	soon_A	:	A;
	successful_A	:	A;
	true_A	:	A;
	unable_A	:	A;
	various_A	:	A;

	apprentice_N	: N;
	child_N	: N;
	dad_N	: N;
	end_N	: N;
	family_N	: N;
	graduation_N	: N;
	father_N2	: N2;
	guy_N	: N;
	job_N	: N;
	kind_N	: N;
	knack_N	: N;
	life_N	: N;
	man_N	: N;
	money_N	: N;
	night_N	: N;
	position_N	: N;
	school_N	: N;
	ship_N	: N;
	stuff_N	: N;
	superintendent_N	: N;
	supervisor_N	: N;
	-- things_N	: N;
	time_N	: N;
	top_N	: N;
	transformer_N	: N;
	uncle_N2	: N2;
	way_N	: N;
	week_N	: N;
	word_N	: N;
	work_N	: N;

	barbara_N	: N;
	tadeusz_N	: N;
	eva_N	: N;
	fast-track_N	: N;
	dr_bean_N	: N;

}
