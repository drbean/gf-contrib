module WordsCharacters where 

import qualified Data.Map as Map

gfWords = Map.fromList [("A",a),
  ("ADV",adv),
  ("Aux",aux),
  ("CONJ",conj),
  ("Det",det),
  ("N",n),
  ("PN",pn),
  ("Pron",pron),
  ("Prep",prep),
  ("Rel",rel),
  ("Tag",tag),
  ("V",v) ]

wordlist = concat ( map (gfWords Map.!) (Map.keys gfWords) )

posMap = Map.fromList [
  ("A","Adjective")
  , ("ADV","Adverb")
  , ("Aux","Auxiliary")
  , ("CONJ","Conjunction")
  , ("Det","Determiner")
  , ("N","Noun")
  , ("PN","Proper Noun")
  , ("Pron","Pronoun")
  , ("Prep","Preposition")
  , ("Rel","Relative Pronoun")
  , ("Tag","Question Tag")
  , ("V","Verb")
  ]

a = [

	"critically important"
	, "good"
	, "high"
	, "little"
	, "particular"
	, "psychological"
	, "simple"
	, "stressful"
	, "unsupported"
	, "useful"
	, "wrong"
	, "work"

	]

adv = [

	"largely"
	, "often"
	, "very"
  ]

aux = [
  "doesn't"
  , "don't"
  , "does"
  , "do"
  , "is"
  , "are"
  , "isn't"
  , "aren't"
  ]
  

conj = [
  "and"
  , "if"
	, "when"
  ]


det = [
  "a"
  , "an"
  , "no"
  , "some"
  -- , "that"
  -- , "theirs"
  -- , "these"
  , "the"
  ]

n = [

	"characteristic"
	, "control"
	, "experience"
	, "health"
	, "stress"
	, "support"
	, "uncertainty"
	, "work"
	, "brief_overview"
	, "framework"
	, "individual"
	, "kind"
	, "level"
	, "manager"
	, "model"
	, "risk"
	, "sense"
	, "situation"
	, "studies"
	, "way"
	, "worker"
	, "working_climate"
	]

pn = [

	"C"
	, "Control"
	, "CUSP"
	, "Gourlay"
	, "In_Equilibrium"
	, "P"
	, "Pressure"
	, "S"
	, "Support"
	, "U"
	, "Uncertainty"

	]

pron = [
	"he"
	, "she"
	, "they"
	, "you"
	]

prep = [

	"by"
	, "over"
	, "on"
	]

rel = [
	"that"
	, "who"
	, "what"
	]

tag = [
	"doesn't he,"
	, "doesn't she,"
	, "doesn't it,"
	, "don't they,"
	, "does he,"
	, "does she,"
	, "does it,"
	, "do they,"
	]

v = [

	"base"
	, "call"
	, "feel"
	, "have"
	, "know"
	, "occur"
	, "prevent"
	, "provide"
	, "receive"
	, "reduce"
	, "stand for"
	, "suggest"
	, "tend"
	, "use"
	, "stand for"
	, "boost"
	, "happen"
	, "work"


	]

{-

base	: V2;
be
boost	: V2;
both
brief_overview	: CN;
by
C	: PN;
call	: V3;
can
characteristic	: CN;
control	: N;
Control	: PN;
critically important	: A;
CUSP	: PN;
experience	: N;
feel	: V2;
for
framework	: CN;
from
good	: A;
Gourlay	: PN;
happen	: V;
health	: N;
high	: A;
in
individual	: CN;
In_Equilibrium	: PN;
kind	: CN;
know	: V2;
largely	: Adv;
level	: CN;
little	: A;
manager	: CN;
model	: CN;
occur	: V;
of
offer	: V;
often	: Adv;
on	: Prep;
one
ones
or
over	: Prep;
P	: PN;
particular	: A;
Pressure	: PN;
prevent	: V2V;
provide	: V2;
psychological	: A;
really	: AdV;
receive	: V2;
reduce	: V2;
risk	: CN;
S	: PN;
sense	: CN;
simple	: A;
situation	: CN;
stand for	: V2;
stress	: N;
stressful	: A;
studies	: CN;
suggest	: VS;
support	: N;
Support	: PN;
tend	: VV;
that
the
they
thousands
to
U	: PN;
uncertainty	: N;
Uncertainty	: PN;
unsupported	: A;
use	: V2V;
useful	: A;
very	: AdA;
way	: CN;
we
what	: Pron:
when	: Subj;
where
worker	: CN;
working_climate	: CN;
work	: A;
work	: N;
work	: V;
wrong	: A;

-}

-- -- vim: set ts=2 sts=2 sw=2 noet:
