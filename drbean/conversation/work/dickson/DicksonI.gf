incomplete concrete DicksonI of Dickson = open Syntax, ParadigmsEng, LexDickson in {

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
	Be_dee np	= mkComp np;
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

	Yes	= LexDickson.yes_Utt;
	No	= LexDickson.no_Utt;
	NoAnswer	= LexDickson.no_answer_Utt;

	Entity pn	= mkNP pn;
	Item det noun	= mkNP det noun;
	Ofpos n2 np	= mkCN n2 np;

	a_Det	= LexDickson.a_Det;
	zero_Det	= LexDickson.zero_Det;
	the_Det	= LexDickson.the_Det;
	thePlural_Det = LexDickson.thePlural_Det;

	who_WH	= LexDickson.who_WH;
	what_WH	= LexDickson.what_WH;

	of_prep	= LexDickson.of_prep;

	become	= become_V2;
	can	= LexDickson.can_VV;
	get_along	= get_along_V2;
	get	= get_V2;
	go	= go_V2;
	have	= LexDickson.have_V2;
	hire	= hire_V2;
	interview	= interview_V2;
	know	= know_V;
	know_VS	= LexDickson.know_VS;
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
	work_V	= LexDicksonEng.work_V;

	bad	= mkAP bad_A;
	better	= mkAP better_A;
	first	= mkAP first_A;
	little	= mkAP little_A;
	mad	= mkAP mad_A;
	hard	= mkAP hard_A;

	apprentice	= mkCN apprentice_N;
	child	= mkCN child_N;
	dad	= mkCN dad_N;
	electrician	= mkCN electrician_N;
	end	= mkCN end_N;
	family	= mkCN family_N;
	graduation	= mkCN graduation_N;
	father_2	= father_N2;
	father	= mkCN father_N2;
	guy	= mkCN guy_N;
	job	= mkCN job_N;
	husband_2	= husband_N2;
	kind	= mkCN kind_N;
	knack	= mkCN knack_N;
	life	= mkCN life_N;
	man	= mkCN man_N;
	money	= mkNP money_N;
	night	= mkCN night_N;
	position	= mkCN position_N;
	school	= mkCN school_N;
	ship	= mkCN ship_N;
	shipyard	= mkCN shipyard_N;
	stuff	= mkNP stuff_N;
	superintendent	= mkCN superintendent_N;
	supervisor	= mkCN supervisor_N;
	thing	= mkCN thing_N;
	time	= mkNP time_N;
	top	= mkCN top_N;
	transformer	= mkCN transformer_N;
	uncle_2	= uncle_N2;
	uncle	= mkCN uncle_N2;
	way	= mkCN way_N;
	week	= mkCN week_N;
	word	= mkCN word_N;
	work	= mkNP work_N;

	alf	= mkPN alf_N;
	dee	= mkPN dee_N;
	monday	= mkPN monday_N;

}

