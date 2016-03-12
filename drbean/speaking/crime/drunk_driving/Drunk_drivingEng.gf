--# -path=.:/home/drbean/GF/lib/src/translator:./gf-contrib/drbean/speaking/crime/drunk_driving:/home/drbean/GF/gf-contrib/drbean/speaking/crime/drunk_driving/engine:present

concrete Drunk_drivingEng of Drunk_driving = MyConcrete  **
open ConstructorsEng, ParadigmsEng, StructuralEng, IrregEng, ExtraEng, ConstructX, Prelude in {

oper
	hospital	= mkCN( mkN "hospital");


lin

	drunk	= mkAP( mkA "drunk");
	three_year_old	= mkAP( mkA "3-year-old");
	sorry	= mkAP( mkA "sorry");
	little	= mkAP( mkA "little");

	by	= mkPrep "by";
	to	= mkPrep "to";

	on_february_nine	= mkAdv "on February 9";
	for_eight_months	= mkAdv "for 8 months";
	a_long_time	= mkAdv "a long time";
	in_the_past_ten_years	= mkAdv "in the past 10 years";
	four_times	= mkAdv "4 times";
	on_july_10	= mkAdv "on July 10";
	home	= mkAdv "home";
	from_an_afternoon_party	= mkAdv "from an afternoon party";
	on_a_tricycle	= mkAdv "on a tricycle";
	every_month	= mkAdv "every month";
	never	= mkAdv "never";
	again	= mkAdv "again";

	say	= mkVS( mkV "say");
	arrest	= mkV2 "arrest";
	drive	= mkV2 "drive";
	hit	= mkV2 "hit";
	promise	= mkVV( mkV "promise");
	pay	= mkV3( mkV "pay");
	drink	= mkV "drink";
	die	= mkV "die";

	alcoholic	= mkCN( mkN "alcoholic");
	girl	= mkCN( mkN "girl");
	parents	= mkCN( mkN "parents");

	hospital_name	= hospital;
	hospital_place	= Location zero_Det_sg hospital;
	police	= mkCN( mkN nonExist "police");
	drunk_driving	= mkN "drunk driving";
	money	= mkN "money";

	mrs_tipton	= mkPN( mkN feminine (mkN "Mrs Tipton") );

}

-- vim: set ts=2 sw=2 noet:

