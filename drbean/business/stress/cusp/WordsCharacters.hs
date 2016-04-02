module WordsCharacters where 

import qualified Data.Map as Map

gfWords = Map.fromList [("A",a),
  -- ("ADV",adv),
  ("Aux",aux),
  -- ("CONJ",conj),
  ("Det",det),
  ("N",n),
  ("PN",pn),
  -- ("Pron",pron),
  ("Prep",prep),
  -- ("Rel",rel),
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

	, "characteristic"
	, "critically important"
	, "good"
	, "high"
	, "little"
	, "particular"
	, "psychological"
	, "really"
	, "simple"
	, "stressful"
	, "unsupported"
	, "useful"
	, "very"
	, "wrong"

	]

adv = [

	, "largely"
	, "often"
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

	, "control"
	, "experience"
	, "happening"
	, "health"
	, "stress"
	, "support"
	, "uncertainty"
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

	, "C"
	, "Control"
	, "CUSP"
	, "Dot"
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
	, "i"
	, "i'm"
	, "it"
	, "it's"
	, "me"
	, "myself"
	, "they"
	, "us"
	, "we"
	, "you"
	, "you're"
	, "who"
	]

prep = [

	]

rel = [
	"that"
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

	, "base"
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
	, "work"


	]

{-

base	: V2;
be
boosting
both
brief_overview	: CN;
by
C	: PN;
call	: V3;
can
characteristic	: A;
control	: N;
Control	: PN;
critically important	: A;
CUSP	: PN;
Dot	: PN;
experience	: N;
feel	: V2;
for
framework	: CN;
from
good	: A;
happening	: N;
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
offering
often	: Adv;
on
one
ones
or
over
P	: PN;
particular	: A;
Pressure	: PN;
prevent	: V2V;
provide	: V2;
psychological	: A;
really	: A;
receive	: V2;
reduce	: V2;
risk	: CN;
S	: PN;
sense	: CN;
simple	: A;
situation	: CN;
stand for	: Particle;
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
very	: A;
way	: CN;
we
what
when
where
work
worker	: CN;
working_climate	: CN;
work	: V;
wrong	: A;

-}

-- -- vim: set ts=8 sts=2 sw=2 noet:
