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
  come_V2	= mkV2 IrregEng.come_V "from";
  graduate_V2	= mkV2 "graduate" "from";
  have_V2	= mkV2 (IrregEng.have_V);
  like_V2	= mkV2 "like";
  want_VV	= mkVV (mkV "want");

  brother_N2	= mkN2 (mkN masculine (mkN "brother")) of_prep;
  child_N = mkN human (mkN "child" "children");
  family_N	= mkN "family";
  dream_N	= mkN "dream";
  fashion_designer_N  = mkN "fashion designer";
  father_N2	= mkN2 (mkN masculine (mkN "father")) of_prep;
  graduation_N	= mkN "graduation";
  job_N	= mkN "job";
  life_N	= mkN "life" "lives";
  man_N	= mkN masculine (mkN "man" "men");
  money_N	= mkN "money";
  mother_N2	= mkN2 (mkN feminine (mkN "mother")) of_prep;
  school_N	= mkN "school";
  sister_N2	= mkN2 (mkN feminine (mkN "sister")) of_prep;
  thing_N	= mkN "thing";
  time_N	= mkN "time";
  way_N	= mkN "way";
  woman_N	= mkN feminine (mkN "woman" "women");
  work_N	= mkN "work";
-- betty
  watching_action_movies_N  = mkN "watching action movies";
  watching_scary_movies_N	= mkN "watching scary movies";
  dogs_and_cats_N = mkN "dogs and cats";
  playing_with_her_nephews_N  = mkN "playing_with_her_nephews";
  Fast_and_Furious_N  = mkN "Fast_and_Furious";
  21_N	= mkN "21";
  nephew_N  = mkN masculine (mkN "nephew");
  cute_A  = mkA "cute";
  senior_N  = mkN "senior";

-- emily2
  difficult_A = mkA "difficult";
  friend_N = mkN "friend";
  london_N  = mkN "London";
  freshman_N  = mkN "freshman";
  new_york_N  = mkN "New York";

  oliver_N	= mkN masculine (mkN "Oliver");
  jeremy_N	= mkN masculine (mkN "Jeremy");
  may_N = mkN feminine (mkN "May");
  betty_N = mkN feminine (mkN "Betty");
  emily2_N  = mkN "Emily2";
  taoyuan_N	= mkN nonhuman (mkN "Taoyuan");

}

-- vim: set ts=8 sts=2 sw=2 noet:
