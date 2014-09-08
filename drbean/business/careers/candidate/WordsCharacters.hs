module WordsCharacters where

import qualified Data.Map as Map

gfWords = Map.fromList [
	("A",a)
	, ("ADV",adv)
	, ("Aux",aux)
	, ("CONJ",conj)
	, ("Det",det)
	, ("N",n)
	, ("PN",pn)
	, ("Pron",pron)
	, ("Prep",prep)
	, ("Rel",rel)
	, ("Tag",tag)
	, ("V",v) ]

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
	"ambitious"
	, "bad"
	, "competitive"
	, "confident"
	, "difficult"
	, "fast"
	, "good"
	, "main"
	, "many"
	, "next"
	, "outgoing"
	, "patient"
	, "possible"
	, "realistic"
	, "successful"
	, "true"
	, "various"

	]

adv = [
	"hard"
	, "really"
	, "slowly"
	, "soon"
	, "well"

	, "in the long term"
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
	"because"
	]


det = [
	"'s"
	, "0, _ or zero"
	, "a"
	, "an"
	, "no"
	, "some"
	, "the"
	, "five"
	, "a few"
	, "any"
	, "a lot of"
	]

n = [

	"ability"
	, "administration of the sales team"
	, "aim"
	, "company"
	, "department"
	, "director"
	, "head"
	, "job"
	, "judgement"
	, "learner"
	, "local business club"
	, "market"
	, "market share"
	, "Fast-Track material"
	, "people"
	, "personality"
	, "Polish"
	, "result"
	, "risk"
	, "safe pair of hands"
	, "sales experience"
	, "sales team"
	, "thing"
	, "time"
	, "top"
	, "training course"
	, "year"

	]

pn = [
	"Barbara"
	, "Tadeusz"
	, "Eva"
	, "Dr Bean"
	, "Fast-Track"
	]

pron = [
	"who"
	, "whom"
	]

prep = [
	"for"
	, "in"
	, "of"
	, "over"
	, "to"
	, "with"
	]

rel = [
	"that"
	, "who"
	]

tag = [
	"doesn't he"
	, "doesn't she"
	, "doesn't it"
	, "don't they"
	, "does he"
	, "does she"
	, "does it"
	, "do they"
	, "isn't he"
	, "isn't she"
	, "isn't it"
	, "aren't they"
	, "is he"
	, "is she"
	, "is it"
	, "are they"
	]

v = [

	"become"
	, "can"
	, "know"

	, "apply"
	, "choose"
	, "do"
	, "enjoy"
	, "expand"
	, "feel"
	, "get to"
	, "get"
	, "have"
	, "help"
	, "improve"
	, "increase"
	, "lead"
	, "like"
	, "motivate"
	, "offer"
	, "organize"
	, "respect"
	, "say"
	, "sell"
	, "start"
	, "take"
	, "tell"
	, "think"
	, "try"
	, "want"
	, "win"
	, "work"
	]

{-

Barbara	: PN;
drbean	: PN;
Eva	: PN;
Fast-Track	: PN;
Polish : A, PN;
Tadeusz	: PN;
ability	: NP;
administration	: NP;
aim	: CN;
ambitious	: A;
any	: Det;
apply	: V;
as	: Prep;
bad	: A;
because	: Subj;
better	: A;
by	: Prep;
can	: V;
choose	: V;
local business club	: CN;
company	: CN;
competitive	: A;
confident	: A;
department	: CN;
difficult	: A;
director	: CN;
do	: V2;
each
enjoy	: V;
expand	: V;
experience	: NP;
fast	: A;
feel	: V;
a few	: Det;
five	: Det;
for	: Prep;
get	: V;
good	: A;

hard	: Adv;
have	: V;
he
head	: CN;
help	: V2;
if
improve	: V;
in	: Prep;
increase	: V;
is
it
job	: CN;
judgement	: NP;
know
lead	: V2;
learner	: CN;
like	: V;
a lot of	: Det;
main	: A;
many	: A;
market	: CN;
market share	: CN;
material	: NP;
may
maybe
motivate	: V;
much
next	: A;
of
offer	: V;
on
organize	: V;
other
outgoing	: A;
over	: Prep;
patient	: A;
people	: CN;
personality	: CN;
possible	: A;
realistic	: A;
really	: Adv;
respect	: V;
result	: CN;
risk	: CN;
safe pair of hands	: CN;
sales experience	: NP;
sales team	: CN;
say	: V;
see
sell	: V2;
set
she
should
slowly	: Adv;
soon	: Adv;
start	: V;
successful	: A;
systems
take	: V;
tell	: V;
in the long term	: Adv;
that
the
thing	: CN;
think	: V;
time	: NP;
to	: Prep;
too
top	: CN;
training course	: CN;
try	: V;
true	: A;
unable
up
various	: A;
very
want	: V;
well
what
win	: V;
with	: Prep;
work	: V;
year	: CN;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
