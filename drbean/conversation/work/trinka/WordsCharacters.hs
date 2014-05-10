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
	"bad"
	, "better"
	, "first"
	, "little"
	, "mad"
	, "slow"
	, "hard"

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
	"'s"
	, "a"
	, "an"
	, "my"
	, "no"
	, "some"
	, "that"
	, "theirs"
	, "these"
	, "the"
	]

n = [
	"apprentice"
	, "child"
	, "children"
	, "dad"
	, "electrician"
	, "end"
	, "families"
	, "family"
	, "father"
	, "graduation"
	, "guy"
	, "guys"
	, "interviewer"
	, "job"
	, "jobs"
	, "kind"
	, "knack"
	, "life"
	, "man"
	, "men"
	, "men's"
	, "money"
	, "night"
	, "nights"
	, "position"
	, "raise"
	, "school"
	, "ship"
	, "shipyard"
	, "stuff"
	, "superintendent"
	, "supervisor"
	, "thing"
	, "things"
	, "time"
	, "top"
	, "transformer"
	, "transformers"
	, "uncle"
	, "way"
	, "week"
	, "weeks"
	, "woman"
	, "word"
	, "work"
	]

pn = [
	"Alf"
	, "Dee"
	, "Monday"
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
	"are"
	, "be"
	-- , "been"
	, "become"
	, "can"
	-- , "couldn't"
	, "does"
	, "doesn't"
	-- , "did"
	-- , "didn't"
	, "do"
	-- , "doing"
	-- , "done"
	, "don't"
	, "find"
	-- , "found"
	, "get"
	-- , "getting"
	, "go"
	-- , "got"
	-- , "had"
	, "has"
	, "have"
	, "hire"
	-- , "hired"
	, "interview"
	, "is"
	, "know"
	, "laugh"
	-- , "let"
	, "lift"
	, "like"
	, "look"
	-- , "made"
	, "make"
	-- , "making"
	, "need"
	-- , "needed"
	, "prove"
	-- , "proving"
	, "say"
	-- , "said"
	, "see"
	, "start"
	-- , "started"
	, "take"
	-- , "taking"
	, "think"
	-- , "thought"
	, "tell"
	-- , "told"
	-- , "took"
	-- , "was"
	-- , "went"
	-- , "were"
	-- , "would"
	-- , "wouldn't"
	]






about
ago
all
already
always
anybody
as
asked
at
away
back
barber
be
beautiful
because
being
best
biggest
by
Christmas
coat
come
comes
could
cut
day
Debra
did
do
dollars
done
door
doorman
down
Ed
eight
ever
every
everybody
fact
father
fifty
first
fit
for
friends
from
front
garage
gave
get
give
Jackie Gleason
go
God
good
graduated
great
guest
had
half
happy
hat
have
he
here
high
him
his
Plaza Hotel
hour
hundred
important
in
it
job
just
kit
know
lady
last
life
like
live
locker
make
man
manager
me
meeting
Merry Christmas
morning
nice
eight o'clock
on
one
open
or
out
outside
over
paradise
put
ran
right
say
school
shine
shoes
shoeshine
shop
sick
six-thirty
smiling
somebody
started
story
such
talk
tell
that
there
thing
thirty
this
till
time
tip
to
told
treat
up
very
VIP
walk
was
way
well
what
when
where
which
who
whole
with
work
year
young

-- vim: set ts=8 sts=2 sw=2 noet:
