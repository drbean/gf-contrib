
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
	"big"
	, "beautiful"
	, "good"
	, "great"
	, "happy"
	, "high"
	, "important"
	, "last"
	, "nice"
	, "sick"
	, "young"

	, "shined"


adv = [

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
	"'s"
	, "a"
	, "an"
	, "my"
	, "no"
	, "some"
	, "that"


	, "these"
	, "the"
	]

n = [
	"doorman"
	, "barber"
	, "coat"
	, "day"
	, "dollar"
	, "door"
	, "fact"
	, "father"
	, "friend"
	, "garage"
	, "guest"
	, "hour"
	, "job"
	, "kit"
	, "lady"
	, "life"
	, "locker"
	, "man"
	, "manager"
	, "meeting"
	, "morning"
	, "paradise"
	, "school"
	, "shoe"
	, "shop"
	, "story"
	, "thing"
	, "time"

	, "tip"
	, "way"
	, "VIP"
	, "year"

  ]

pn = [
	"Ed Trinka"
	, "Debra Goodman"
	, "Jackie Gleason"
	, "Christmas"
	, "God"
	, "the Plaza Hotel"
	, "Merry Christmas"

  ]

pron = [
	]

prep = [
	"of"
	-- , "about"
	-- , "at"
	-- , "for"
	-- , "from"
	-- , "like"
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
  , "smile"
  , "ask"
  , "come"
  , "cut"
  , "fit"
  , "get"
  , "give"
  , "graduate"
  , "have"
  , "know"
  , "like"
  , "live"
  , "make"
  , "open"
  , "put"
  , "ran"
  , "say"
  , "shine"
  , "smile"
  , "start"
  , "talk"
  , "tell"
  , "treat"
  , "walk"
  , "work"
	]

about
ago
all
already
always
anybody
as
ask	: V;
at
away
back
barber	: CN;
be
beautiful	: A;
because
being
big	: A;
by
Christmas	: PN;
coat	: CN;
come	: V;
cut	: V;
day	: CN;
Debra Goodman	: PN;
do
dollar	: CN;
done
door	: CN;
doorman	: CN;
down
Ed Trinka	: PN;
eight
ever
every
everybody
fact	: CN;
father	: CN;
fifty
first
fit	: V;
for
friend	: CN;
from
front	: A;
garage	: CN;
get	: V;
give	: V;
Jackie Gleason	: PN;
go
God	: PN;
good	: A;
graduated	: V;
great	: A;
guest	: CN;
half
happy	: A;
hat
have	: V;
he
here
high	: A;
him
his
the Plaza Hotel	: PN;
hour	: CN;
hundred
important	: A;
in
it
job	: CN;
just
kit	: CN;
know	: V;
lady	: CN;
last	: A;
life	: CN;
like	: V;
live	: V;
locker	: CN;
make	: V;
man	: CN;
manager	: CN;
me
meeting	: CN;
Merry Christmas	: PN;
morning	: CN;
nice	: A;
eight o'clock
on
one
open	: V;
or
out
outside
over
paradise	: CN;
put	: V;
ran	: V;
right
say	: V;
school	: CN;
shine	: V;
shined	: A;
shoe	: CN;
shoeshine : CN;
shop	: CN;
sick	: A;
six-thirty
smile	: V;
somebody
start	: V;
story	: CN;
such
talk	: V;
tell	: V;
that
there
thing	: CN;
thirty
this
till
time	: CN;
tip	: CN;
to
treat	: V;
up
very
VIP	: CN;
walk	: V;
was
way	: CN;
well
what
when
where
which
who
whole
with
work	: V;
year	: CN;
young	: A;

-- vim: set ts=8 sts=2 sw=2 noet:
