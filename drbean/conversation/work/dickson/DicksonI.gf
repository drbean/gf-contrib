incomplete concrete DicksonI of Dickson = open Syntax, LexDickson in {

lincat
	NP	= Syntax.NP;
	AP	= Syntax.AP;
	Cl	= Syntax.Cl;
	S	= Syntax.S;
	SC	= Syntax.SC;
	V	= Syntax.V; 
	VP	= Syntax.VP; 
	V2	= Syntax.V2; 
	V2V	= Syntax.V2V;
	V2S	= Syntax.V2S;
	VV	= Syntax.VV;
	VS	= Syntax.VS;
	Det	= Syntax.Det;
 	CN	= Syntax.CN;

lin
	Is item quality	=	mkCl item quality;
	Cop item1 item2	= mkCl item1 item2;
	Happening action	=	mkVP action;
	Changing action patient	= mkVP action patient;
	Causative causal patient predicate	= mkVP causal patient predicate;
	Intens attitude predicate	= mkVP attitude predicate;
	Positing posit event	= mkVP posit (mkS event);
	Informing posit patient event	= mkVP posit patient (mkSC event);
	UttS subject predicate	= mkCl subject predicate;
	-- Item det noun	= ConstructorsEng.mkNP det noun;
	Item det noun	= mkNP det noun;

	-- An kind	= mkNP aSg_Det kind ;
	-- The kind	= mkNP the_Det kind ;
	-- QCN quality kind	= mkCN quality kind ;
	-- Very quality	= mkAP very_AdA quality ;


	bad	= mkAP bad_A;
	better	= mkAP better_A;
	first	= mkAP first_A;
	little	= mkAP little_A;
	mad	= mkAP mad_A;
	next	= mkAP next_A;
	none	= mkAP none_A;
	several	= mkAP several_A;
	two	= mkAP two_A;
	hard	= mkAP hard_A;
	right	= mkAP right_A;
	same	= mkAP same_A;

	a_Det	= LexDickson.a_Det;
	the_Det	= LexDickson.the_Det;

	apprentice	= mkCN apprentice_N;
	dad	= mkCN dad_N;
	eighty	= mkCN eighty_N;
	end	= mkCN end_N;
	experience	= mkCN experience_N;
	family	= mkCN family_N;
	graduation	= mkCN graduation_N;
	guy	= mkCN guy_N;
	jobs	= mkCN jobs_N;
	kind	= mkCN kind_N;
	knack	= mkCN knack_N;
	life	= mkCN life_N;
	man	= mkCN man_N;
	money	= mkCN money_N;
	nights	= mkCN nights_N;
	position	= mkCN position_N;
	pound	= mkCN pound_N;
	school	= mkCN school_N;
	ship	= mkCN ship_N;
	stuff	= mkCN stuff_N;
	superintendent	= mkCN superintendent_N;
	supervisor	= mkCN supervisor_N;
	things	= mkCN things_N;
	time	= mkCN time_N;
	top	= mkCN top_N;
	transformer	= mkCN transformer_N;
	uncle	= mkCN uncle_N;
	way	= mkCN way_N;
	week	= mkCN week_N;
	word	= mkCN word_N;
	work	= mkCN work_N;

	alf	= mkNP alf_PN;
	dee	= mkNP dee_PN;
	monday	= mkNP monday_PN;

	become	= become_V2;
	can	= LexDickson.can_VV;
	get_along	= get_along_V2;
	get	= get_V2;
	go	= go_V2;
	have	= LexDickson.have_V2;
	hire	= hire_V2;
	interview	= interview_V2;
	know	= know_V;
	know_VS	= know_VS;
	laugh	= laugh_V;
	lift	= lift_V2;
	like	= like_V2;
	look	= look_V2;
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

}

