incomplete concrete CuspI of Cusp = open Syntax, ParadigmsEng, ExtraEng, LexCusp in {

lincat
	Utt	= Syntax.Utt;
	PN	= Syntax.PN;
	NP	= Syntax.NP;
	AP	= Syntax.AP;
	Comp	= Syntax.Comp;
	Cl	= Syntax.Cl;
	QCl	= Syntax.QCl;
	S	= Syntax.S;
	QS	= Syntax.QS;
	SC	= Syntax.SC;
	V	= Syntax.V; 
	VP	= Syntax.VP; 
	V2	= Syntax.V2; 
	V2V	= Syntax.V2V;
	V2S	= Syntax.V2S;
	VV	= Syntax.VV;
	VS	= Syntax.VS;
	VA	= Syntax.VA;
	Det	= Syntax.Det;
 	CN	= Syntax.CN;
 	N2	= Syntax.N2;
	IP	= Syntax.IP;
	Prep	= Syntax.Prep;

lin
	-- Is item quality	=	mkCl item quality;
	-- Cop item1 item2	= mkCl item1 item2;
	Be_bad ap	= mkComp ap;
	Be_someone np	= mkComp np;
	Be_vp comp	= mkVP comp;
	Look_bad verb adj	= mkVP verb adj;
	Happening action	=	mkVP action;
	Changing action patient	= mkVP action patient;
	Causative causal patient predicate	= mkVP causal patient predicate;
	Intens attitude predicate	= mkVP attitude predicate;
	Positing posit event	= mkVP posit event;
	Informing posit patient event	= mkVP posit patient event;
	YN cl	= mkQCl cl;
	-- WH_Cop ip comp	= mkQCl ip comp;
	WH_NP ip np	= mkQCl ip np;
	WH_AP ip ap	= mkQCl ip ap;
	WH_Pred ip vp	= mkQCl ip vp;
	PosQ qcl	= mkQS qcl;
	NegQ qcl	= mkQS negativePol qcl;
	PosS cl	= mkS cl;
	NegS cl	= mkS negativePol cl;
	Ut q	= mkUtt q;
	Sentence subject predicate	= mkCl subject predicate;

	Yes	= LexCusp.yes_Utt;
	No	= LexCusp.no_Utt;
	NoAnswer	= LexCusp.no_answer_Utt;

	Entity pn	= mkNP pn;
	Kind ap cn	= mkCN ap cn;
	Ofpos n2 np	= mkCN n2 np;
	Apos np	= mkDet (GenNP np);
	Item det noun	= mkNP det noun;

	a_Det	= LexCusp.a_Det;
	zero_Det	= LexCusp.zero_Det;
	the_Det	= LexCusp.the_Det;
	thePlural_Det = LexCusp.thePlural_Det;

	who_WH	= LexCusp.who_WH;
	what_WH	= LexCusp.what_WH;

	of_prep	= LexCusp.of_prep;

	become	= become_V2;
	can	= LexCusp.can_VV;
	get_along	= get_along_V2;
	get	= get_V2;
	go	= go_V2;
	have	= LexCusp.have_V2;
	hire	= hire_V2;
	interview	= interview_V2;
	know	= know_V;
	know_V2	= LexCusp.know_V2;
	know_VS	= LexCusp.know_VS;
	laugh	= laugh_V;
	lift	= lift_V2;
	like	= like_V2;
	look_here	= look_V;
	look	= look_VA;
	need	= need_VV;
	-- need	= need_V2;
	prove	= prove_V2;
	say	= say_VS;
	see	= see_V2;
	slow_down	= slow_down_V;
	start	= start_ing_VV;
	take	= take_V2V;
	tell	= tell_V2S;
	think	= think_VS;
	work_V	= LexCuspEng.work_V;
	work_in	= work_in_V;

	ambitious	= mkAP ambitious_A;
	bad	= mkAP bad_A;
	competitive	= mkAP competitive_A;
	confident	= mkAP confident_A;
	difficult	= mkAP difficult_A;
	each	= mkAP each_A;
	experienced	= mkAP experienced_A;
	fast	= mkAP fast_A;
	few	= mkAP few_A;
	five	= mkAP five_A;
	good	= mkAP good_A;
	hard	= mkAP hard_A;
	honest	= mkAP honest_A;
	local	= mkAP local_A;
	long	= mkAP long_A;
	next	= mkAP next_A;
	other	= mkAP other_A;
	outgoing	= mkAP outgoing_A;
	past	= mkAP past_A;
	patient	= mkAP patient_A;
	polish	= mkAP polish_A;
	poor	= mkAP poor_A;
	possible	= mkAP possible_A;
	realistic	= mkAP realistic_A;
	safe	= mkAP safe_A;
	soon	= mkAP soon_A;
	successful	= mkAP successful_A;
	true	= mkAP true_A;
	unable	= mkAP unable_A;
	various	= mkAP various_A;

	assertive	= mkAP assertive_AP;
	bad	= mkAP bad_A;
	best	= mkAP best_AP;
	best-placed	= mkAP best-placed_AP;
	better	= mkAP better_AP;
	brief	= mkAP brief_AP;
	common	= mkAP common_AP;
	critically-important	= mkAP critically-important_AP;
	day-to-day	= mkAP day-to-day_AP;
	difficult	= mkAP difficult_AP;
	effective	= mkAP effective_AP;
	face-to-face	= mkAP face-to-face_AP;
	good	= mkAP good_AP;
	helpless	= mkAP helpless_AP;
	high	= mkAP high_AP;
	latter	= mkAP latter_AP;
	little	= mkAP little_AP;
	main	= mkAP main_AP;
	more	= mkAP more_AP;
	most	= mkAP most_AP;
	other	= mkAP other_AP;
	own	= mkAP own_AP;
	particular	= mkAP particular_AP;
	poor	= mkAP poor_AP;
	practical	= mkAP practical_AP;
	psychological	= mkAP psychological_AP;
	severe	= mkAP severe_AP;
	simple	= mkAP simple_AP;
	social	= mkAP social_AP;
	stressful	= mkAP stressful_AP;
	structured	= mkAP structured_AP;
	three	= mkAP three_AP;
	timely	= mkAP timely_AP;
	two-way	= mkAP two-way_AP;
	unsupported	= mkAP unsupported_AP;
	useful	= mkAP useful_AP;
	vulnerable	= mkAP vulnerable_AP;
	wrong	= mkAP wrong_AP;

	ability	= mkCN ability_N;
	administration	= mkCN administration_N;
	aim	= mkCN aim_N;
	club	= mkCN club_N;
	company	= mkCN company_N;
	course	= mkCN course_N;
	department	= mkCN department_N;
	director	= mkCN director_N;
	director_2	= director_N2;
	effort	= mkCN effort_N;
	experience	= mkNP experience_N;
	hand	= mkCN hand_N;
	head	= mkCN head_N;
	head_2	= head_N2;
	job	= mkCN job_N;
	good_judgement	= mkNP (mkCN good_A judgement_N);
	learner	= mkCN learner_N;
	lot	= mkCN lot_N;
	main	= mkCN main_N;
	man	= mkCN man_N;
	market	= mkCN market_N;
	material	= mkCN material_N;
	pair	= mkCN pair_N;
	people	= mkCN people_N;
	personality	= mkCN personality_N;
	polish_N	= mkCN LexCusp.polish_N;
	respect	= mkCN respect_N;
	result	= mkCN result_N;
	risk	= mkCN risk_N;
	sales_department	= mkCN sales_A department;
	sales_experience	= mkNP (mkCN sales_A experience_N);
	share	= mkCN share_N;
	system	= mkCN system_N;
	team	= mkCN team_N;
	term	= mkCN term_N;
	thing	= mkCN thing_N;
	time	= mkCN time_N;
	top	= mkCN top_N;
	training	= mkCN training_N;
	way	= mkCN way_N;
	woman	= mkCN woman_N;
	work	= mkNP work_N;
	year	= mkCN year_N;

	barbara	= mkPN barbara_N;
	tadeusz	= mkPN tadeusz_N;
	eva	= mkPN eva_N;
	fast_track	= mkPN fast_track_N;
	dr_bean	= mkPN dr_bean_N;

}

