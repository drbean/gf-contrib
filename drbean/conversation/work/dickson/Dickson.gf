abstract Dickson = Cat ** {


  flags startcat = Utt ;

--cat
--	NP; AP; Cl; V; VP; V2; V2V; VV; VS; Det; CN;

fun
	Is	: NP -> AP -> Cl;
	Cop		: NP -> NP -> Cl;
	Happening	: V -> VP ;
	Changing	: V2 -> NP -> VP;
	Causative:	V2V -> NP -> VP -> VP;
	Intens:	VV -> VP -> VP;
	Positing:	VS -> S -> VP;
	Informing:	V2S -> NP -> S -> VP;
	Cl2S	: Cl -> S;
	YNCl2QS	: Cl -> QS;
	WH_Cop	: IP -> NP -> QCl;
	WHCl2QS	: QCl -> QS;
	S2Utt	: S -> Utt;
	QS2Utt	: QS -> Utt;
	UttS	: NP -> VP -> Cl;
	Sentencing	: Cl -> S;
	-- PN2NP:	PN -> NP;
	-- Str2PN:	Str -> PN_;

	Item	: Det -> CN -> NP;
	-- An	: CN -> NP;
	-- The	: CN -> NP;
	-- QCN	: AP -> CN -> CN;
	-- Very	: AP -> AP;

	bad	: AP;
	better	: AP;
	first	: AP;
	little	: AP;
	mad	: AP;
	next	: AP;
	none	: AP;
	several	: AP;
	two	: AP;
	hard	: AP;
	right	: AP;
	same	: AP;

	a_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	zero_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	the_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	thePlural_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));

	who_WH	: IP;

	apprentice	: CN;
	dad	: CN;
	eighty	: CN;
	end	: CN;
	experience	: CN;
	family	: CN;
	graduation	: CN;
	guy	: CN;
	job	: CN;
	kind	: CN;
	knack	: CN;
	life	: CN;
	man	: CN;
	money	: CN;
	night	: CN;
	position	: CN;
	pound	: CN;
	school	: CN;
	ship	: CN;
	stuff	: CN;
	superintendent	: CN;
	supervisor	: CN;
	thing	: CN;
	time	: CN;
	top	: CN;
	transformer	: CN;
	uncle	: CN;
	way	: CN;
	week	: CN;
	word	: CN;
	work	: CN;

	alf	: NP;
	dee	: NP;
	monday	: NP;

	become	: V2;
	can	: VV;
	get	: V2;
	get_along	: V2;
	go	: V2;
	have	: V2;
	hire	: V2;
	interview	: V2;
	know	: V;
	know_VS	: VS;
	laugh	: V;
	-- let	: V2;
	lift	: V2;
	like	: V2;
	look	: V2;
	-- make	: V2
	need	: VV;
	prove	: V2;
	say	: VS;
	see	: V2;
	slow_down	: V;
	start	: VV;
	take	: V2V;
	tell	: V2S;
	think	: VS;

}
