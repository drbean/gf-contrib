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
  "assertive"
  , "bad"
  , "best"
  , "best-placed"
  , "better"
  , "brief"
  , "common"
  , "critically"
  , "day"
  , "difficult"
  , "effective"
  , "face"
  , "good"
  , "helpless"
  , "high"
  , "latter"
  , "little"
  , "main"
  , "more"
  , "most"
  , "other"
  , "own"
  , "particular"
  , "poor"
  , "practical"
  , "severe"
  , "simple"
  , "social"
  , "stressful"
  , "structured"
  , "three"
  , "timely"
  , "two"
  , "unsupported"
  , "useful"
  , "vulnerable"
  , "wrong"


	]

adv = [
	"along"
	, "away"
	, "because"
	, "before"
	, "but"
	, "differently"
	, "down"
	, "ever"
	, "finally"
	, "here"
	, "just"
	, "now"
	, "on"
	, "out"
	, "probably"
	, "so"
	, "then"
	, "there"
	, "too"
	, "well"
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
	"ability"
	, "administration"
	, "aim"
	, "business"
	, "club"
	, "company"
	, "course"
	, "department"
	, "director"
	, "director_2"
	, "effort"
	, "experience"
	, "hand"
	, "head"
	, "job"
	, "judgement"
	, "learner"
	, "lot"
	, "main"
	, "market"
	, "material"
	, "pair"
	, "people"
	, "personality"
	, "polish_N"
	, "respect"
	, "result"
	, "risk"
	, "sales department"
	, "sales experience"
	, "share"
	, "system"
	, "team"
	, "term"
	, "thing"
	, "time"
	, "top"
	, "training"
	, "way"
	, "work"
	, "year"

	, "action"
	, "approachability"
	, "areas"
	, "assessment"
	, "awareness"
	, "business"
	, "cause"
	, "characteristics"
	, "climate"
	, "combination"
	, "comments"
	, "communication"
	, "companies"
	, "consultation"
	, "control"
	, "delegation"
	, "depression"
	, "difference"
	, "difficulties"
	, "elements"
	, "example"
	, "experience"
	, "flexibility"
	, "framework"
	, "groups"
	, "health"
	, "hotspots"
	, "idea"
	, "individuals"
	, "key"
	, "kind"
	, "level"
	, "luck"
	, "management"
	, "manager"
	, "managers"
	, "meetings"
	, "message"
	, "mind"
	, "minutes"
	, "model"
	, "one"
	, "options"
	, "openness"
	, "overview"
	, "people"
	, "performance"
	, "placement"
	, "plan"
	, "position"
	, "problem"
	, "responsibility"
	, "risk"
	, "sense"
	, "situation"
	, "skills"
	, "staff"
	, "strategies"
	, "etudies"
	, "things"
	, "time"
	, "truth"
	, "way"
	, "work"
	, "workload"

	]

pn = [

  "Bradshaw"
  , "C"
  , "Control"
  , "CUSP"
  , "Gourlay"
  , "In Equilibrium"
  , "men"
  , "P"
  , "Pressure"
  , "S"
  , "Support"
  , "U"
  , "Uncertainty"
  , "women"

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
	"of"
	-- , "about"
	-- , "at"
	-- , "for"
	-- , "from"
	-- , "like"
	, "in"
	-- , "than"
	-- , "to"
	-- , "with"
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

	"become"
	, "can"
	, "get"
	, "go"
	, "have"
	, "know"
	, "need"
	, "say"
	, "take"
	, "tell"
	, "think"
	, "work"
  , "abdicate"
  , "agree"
  , "allow"
  , "appear"
  , "base"
  , "boost"
  , "call"
  , "cause"
  , "consider"
  , "consult"
  , "cope"
  , "deal"
  , "enable"
  , "encourage"
  , "feel"
  , "find"
  , "get"
  , "give"
  , "happen"
  , "have"
  , "help"
  , "identify"
  , "investigate"
  , "know"
	, "listen"
	, "look"
	, "make"
	, "need"
	, "occur"
	, "offer"
	, "pick"
	, "prevent"
	, "provide"
	, "raise"
	, "receive"
	, "reduce"
	, "report"
  , "suggest"
  , "take"
  , "talk"
  , "tend"
  , "think"
  , "train"
  , "used"
  , "work"


	]
yiw'aA	, "0"ma''DI                                  -- 0	: CN;yy:brewind'bPomb:5bn
abdicate	: V*;
about
                                  -- action	: CN;
agree	: V*;
all
allow	: V*;
also
always
an
and
any
anything
appear	: V*;
                                  -- approachability	: CN;
are
                                  -- areas	: CN;
as
ask
assertive	: AP;
                                  -- assessment	: CN;
at
                                  -- awareness	: CN;
bad	: AP;
base	: V*;
be
best	: AP;
best-placed	: AP;
better	: AP;
boost	: V*;
both
Bradshaw	: PN;
brief	: AP;
                                  -- business	: CN;
but
by
C	: PN;
call	: V*;
can
carefully
cause	: V*;
                                  -- cause	: CN;
                                  -- characteristics	: CN;
                                  -- climate	: CN;
                                  -- combination	: CN;
combinations
                                  -- comments	: CN;
common : AP;
                                  -- communication	: CN;
                                  -- companies	: CN;
consider	: V*;
                                  -- consultation	: CN;
consult	: V*;
                                  -- control	: CN;
Control	: PN;
cope	: V*;
coping
critically-important	: AP;
cusp
CUSP	: PN;
day-to-day	: AP;
deal	: V*;
                                  -- delegation	: CN;
                                  -- depression	: CN;
                                  -- difference	: CN;
differently
difficult	: AP;
                                  -- difficulties	: CN;
directly
effective	: AP;
either
                                  -- elements	: CN;
elsewhere
enable	: V*;
encourage	: V*;
especially
                                  -- example	: CN;
                                  -- experience	: CN;
face-to-face	: AP;
facilitate
feel	: V*;
feeling
find	: V*;
firstly
                                  -- flexibility	: CN;
for
                                  -- framework	: CN;
from
get	: V*;
give	: V*;
good	: AP;
Gourlay	: PN;
                                  -- groups	: CN;
happen	: V*;
have	: V*;
                                  -- health	: CN;
help	: V*;
helpless : AP;
Hence
high	: AP;
                                  -- hotspots	: CN;
How
I
                                  -- idea	: CN;
identify	: V*;
if
impacting
in
                                  -- individuals	: CN;
In Equilibrium	: PN;
investigate	: V*;
is
it
its
                                  -- key	: CN;
                                  -- kind	: CN;
know	: V*;
largely
latter	: AP;
less
                                  -- level	: CN;
like
listen	: V*;
little	: AP;
look	: V*;
lot
                                  -- luck	: CN;
main	: AP;
make	: V*;
                                  -- management	: CN;
                                  -- manager	: CN;
managerial	: AP;
men
                                  -- meetings	: CN;
men	: PN;
                                  -- message	: CN;
                                  -- mind	: CN;
                                  -- minutes	: CN;
                                  -- model	: CN;
more	: AP;
most	: AP;
my
need	: V*;
next
no
not
nothing
occur	: V*;
of
offer	: V*;
often
on
one
                                  -- one	: CN;
                                  -- openness	: CN;
                                  -- options	: CN;
or
other	: AP;
others
over
                                  -- overview	: CN;
own	: AP;
P	: PN;
particular	: AP;
                                  -- people	: CN;
                                  -- performance	: CN;
pick	: V*;
                                  -- placement	: CN;
                                  -- plan	: CN;
poor	: AP;
                                  -- position	: CN;
practical	: AP;
pressure
Pressure	: PN;
prevent	: V*;
                                  -- problem	: CN;
provide	: V*;
psychological	: AP;
raise	: V*;
rather
really
receive	: V*;
reduce	: V*;
report	: V*;
                                  -- responsibility	: CN;
                                  -- risk	: CN;
S	: PN;
secondly
                                  -- sense	: CN;
severe	: AP;
simple	: AP;
                                  -- situation	: CN;
                                  -- skills	: CN;
social	: AP;
some
someone
                                  -- staff	: CN;
stands
                                  -- strategies	: CN;
stress
stressful	: AP;
structured	: AP;
                                  -- studies	: CN;
suggest	: V*;
Support	: PN;
take	: V*;
talk	: V*;
team
tend	: V*;
than
that
the
their
them
then
these
they
                                  -- things	: CN;
think	: V*;
this
those
thousands
three	: AP;
through
                                  -- time	: CN;
timely	: AP;
to
train	: V*;
                                  -- truth	: CN;
two
two-way	: AP;
U	: PN;
Uncertainty	: PN;
under
unique
unsupported	: AP;
up
used	: V*;
useful	: AP;
usually
very
vulnerable	: AP;
                                  -- way	: CN;
we
well
what
when
where
will
with
within
women	: PN;
work	: V*;
                                  -- work	: CN;
working
                                  -- workload	: CN;
worse
would
wrong  : AP;
yes
you
your

-- vim: set ts=8 sts=2 sw=2 noet:
