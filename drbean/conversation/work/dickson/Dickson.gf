abstract Dickson = Cat ** {


  flags startcat = Cl ;

--cat
--	NP; AP; Cl; V; VP; V2; V2V; VV; VS; Det; CN;

fun
	Is	: NP -> AP -> Cl;
	Cop		: NP -> NP -> Cl;
	Happening	: V -> VP ;
	Changing	: V2 -> NP -> VP;
	Causative:	V2V -> NP -> VP -> VP;
	Intens:	VV -> VP -> VP;
	Positing:	VS -> Cl -> VP;
	UttS	: NP -> VP -> Cl;
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
	slow	: AP;
	two	: AP;
	hard	: AP;
	right	: AP;
	same	: AP;

	a_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	the_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));
	-- thePlural_Det : Det; -- (\d,f -> exists (\x -> and (d x) (f x)));

	apprentice	: CN;
	dad	: CN;
	eighty	: CN;
	end	: CN;
	experience	: CN;
	family	: CN;
	graduation	: CN;
	guy	: CN;
	jobs	: CN;
	kind	: CN;
	knack	: CN;
	life	: CN;
	man	: CN;
	money	: CN;
	nights	: CN;
	position	: CN;
	pound	: CN;
	school	: CN;
	ship	: CN;
	stuff	: CN;
	superintendent	: CN;
	supervisor	: CN;
	things	: CN;
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
	go	: V;
	have	: V2;
	hire	: V2;
	interview	: V2;
	know	: V;
	laugh	: V;
	-- let	: V2;
	lift	: V2;
	like	: V;
	look	: V;
	-- make	: V2
	need	: VV;
	prove	: V2;
	start	: VV;
	take	: V2V;
	-- tell	: V;
	think	: VS;

	allow	: V2V;
	apply	: V2;
	become	: V2;
	can	: VV;
	choose	: V2;
	enjoy	: V2;
	expand	: V;
	go	: V;
	feel	: VS;
	-- have	: V2;
	help	: V2;
	improve	: V2;
	increase	: V2;
	lead	: V2;
	-- know	: VS;
	must	: VV;
	think	: VS;
	want	: VV;
	-- want_NP_to	: V2V;
	-- want_to	: VV;

}
