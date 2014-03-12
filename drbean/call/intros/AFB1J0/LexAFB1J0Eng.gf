instance LexAFB1J0Eng of LexAFB1J0 = open SyntaxEng, ParadigmsEng, Prelude, IrregEng in {

oper

	a_Det	= aSg_Det;
	zero_Det	= aPl_Det;
	the_Det	= theSg_Det;
	thePlural_Det	= thePl_Det;

	who_WH	= whoSg_IP;
	what_WH	= whatSg_IP;

	of_prep	=  possess_Prep;
	in_prep	=  in_Prep;
	from_prep	=  from_Prep;

	yes_Utt	= SyntaxEng.yes_Utt;
	no_Utt	= SyntaxEng.no_Utt;
	no_answer_Utt = ss "No answer";

	become_V2	= mkV2 (IrregEng.become_V);
	can_VV	= SyntaxEng.can_VV;
	come_V	= IrregEng.come_V;
	graduate_V2	= mkV2 "graduate" "from";
	have_V2	= mkV2 (IrregEng.have_V);
	like_V2	= mkV2 "like";
	want_VV	= mkVV (mkV "want");

	child_N = mkN human (mkN "child" "children");
	family_N	= mkN "family";
	fashion_designer_N  = mkN "fashion designer";
	father_N2	= mkN2 (mkN masculine (mkN "father")) of_prep;
	graduation_N	= mkN "graduation";
	job_N	= mkN "job";
	life_N	= mkN "life" "lives";
	man_N	= mkN masculine (mkN "man" "men");
	money_N	= mkN "money";
	school_N	= mkN "school";
	thing_N	= mkN "thing";
	time_N	= mkN "time";
	way_N	= mkN "way";
	woman_N	= mkN feminine (mkN "woman" "women");
	work_N	= mkN "work";

	oliver_N	= mkN masculine (mkN "Oliver");
	jeremy_N	= mkN masculine (mkN "Jeremy");
	may_N = mkN feminine (mkN "May");
	taoyuan_N	= mkN nonhuman (mkN "Taoyuan");

}

-- vim: set ts=8 sts=2 sw=2 noet:
