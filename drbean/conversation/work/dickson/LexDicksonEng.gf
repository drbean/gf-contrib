instance LexDicksonEng of LexDickson = open SyntaxEng, ParadigmsEng, Prelude, IrregEng in {

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

	bad_A	= mkA "bad";
	better_A	= mkA "better";
	first_A	= mkA "first";
	little_A	= mkA "little";
	mad_A	= mkA "mad";
	slow_A	= mkA "slow";
	hard_A	= mkA "hard";

	apprentice_N	= mkN human (mkN "apprentice");
	child_N = mkN human (mkN "child" "children");
	dad_N	= mkN masculine (mkN "dad");
	end_N	= mkN "end";
	family_N	= mkN "family";
	father_N2	= mkN2 (mkN masculine (mkN "father")) of_prep;
	graduation_N	= mkN "graduation";
	guy_N	= mkN masculine (mkN "guy");
	husband_N2	= mkN2 (mkN masculine (mkN "husband")) of_prep;
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

}
