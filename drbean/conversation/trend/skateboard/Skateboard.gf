abstract Skateboard = MyAbstract ** {


  flags startcat = Utt ;

fun

-- Adv

	anywhere	: Adv_location;

-- AP

	novel	: AP;
	normal	: AP;
	interesting	: AP;
	electric	: AP;
	different	: AP;

-- Conj

	but	: Conj;
	and	: Conj;

-- Det

	about	: Predet;
	some	: Det;
	fifteen	: Det;
	every	: Det;
	one_thousand	: Det;

-- N

	word_CN	: CN -> CN;
	word_N	: N -> CN;
	vehicle	: CN;
	skateboard	: CN;
	perspective	: CN;
	people	: CN;
	wall_outlet	: CN;
	motorcycle	: CN;
	minute	: CN;
	kilometer	: CN;
	electricity	: N;
	dollar	: Partitive;
	day	: CN;
	concept	: CN;
	car	: CN;
	bicycle	: CN;

-- PN

	sanjay	: PN;

-- Prep

	with_PREP	: Prep;
	on	: ExtentPrep;
	off	: SourcePrep;
	like	: Prep;
	less_than	: Prep;
	in_PREP	: TimePrep;
	from	: Prep;
	for	: TrajectoryPrep;

-- Pron


-- Subj

	when	: Subj;
	if	: Subj;

-- V

	weigh	: V2;
	use	: V2;
	think	: V2;
	run	: V3;
	hear	: V2;
	demonstrate	: V2;
	create	: V2;
	charge	: V2;
	carry	: V3;
	approach	: V3;
}

-- vim: set ts=2 sts=2 sw=2 noet:
