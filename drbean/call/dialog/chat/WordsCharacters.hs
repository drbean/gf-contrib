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
	"15"
	, "16"
	, "18"
	, "19"
	, "21"
	, "22"
	, "23"
	, "beautiful"
	, "female"
	, "good"
	, "Hispanic"
	, "male"
	, "old"
	, "right"
	, "young"
	]

adv = [
	"from"
	, "in"
	, "like"
	, "on"
	, "or"
	, "to"
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
	"when"
	]


det = [
	"a"
	, "an"
	, "the"
	, "'s"
	]

n = cn ++ un

cn = [
	"age"
	, "girl"
	, "man"
	, "name"
	, "stranger"
	, "student"
	, "woman"
	]

un = [
	]

pn = [
	"Alice"
	, "Ariel"
	, "Ellarose"
	, "Filibee"
	, "Junior"
	, "Mandy"
	, "MUST"
	, "Sabrina"
	, "Taiwan"
	, "Turkey"
	, "USA"
	, "Dora"
	, "Cheney"
	, "Andy"
	, "Cherry2"
	, "Viola1"
	, "Marian"
	, "Lisa1"
	, "YiSian"
	, "Jessie"
	, "Demi"
	, "Maggie"
	, "Annie"
	, "Jack"
	, "Stefan"
	]

pron = [
	"who"
	, "whom"
	, "whose"
	]

prep = [
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
	"ask"
  , "come"
	, "disconnect"
	, "greet"
	, "guess"
	, "say"
	, "talk"
	, "tell"
	, "understand"
	]


{-

15	: A;
16	: A;
18	: A;
19	: A;
21	: A;
22	: A;
23	: A;
a
A
age	: CN;
Alice	: PN;
and
Ariel	: PN;
ask	: V2Q;
beautiful	: A;
can
city	: CN;
come	: V2;
correctly
disconnect	: V;
Ellarose	: PN;
English
ever
Facebook	: PN;
female	: A;
Filibee	: PN;
freshman	: CN;
from	: Prep;
girl	: CN;
good	: A;
greet	: V2;
guess	: CN;
guess	: V2;
he
Hello
her
Hi
him
Hispanic	: A;
how
if
in	: Prep;
is
Junior	: PN;
LA
like	: Prep;
Madison	: PN;
MUST	: PN;
male	: A;
man	: CN;
Mandy	: PN;
name	: CN;
nationality	: CN;
NY	: PN;
not
now
old	: A;
on	: Prep;
or
Paris	: PN;
question	: CN;
right	: A;
Sabrina	: PN;
say	: VS;
she
sophomore	: CN;
speak
stranger	: CN;
student	: CN;
Taiwan	: PN;
talk	: V2;
tell	: V2S;
that
the
The
they
to	: Prep;
Turkey	: PN;
understand	: V;
USA	: PN;
want
when
where
woman	: CN;
young	: A;

Dora	: PN;
Cheney	: PN;
Andy	: PN;
Cherry2	: PN;
Viola1	: PN;
Lisa1	: PN;
Marian	: PN;
YiSian	: PN;
Jessie	: PN;
Demi	: PN;
Maggie	: PN;
Annie	: PN;
Jack	: PN;
Stefan	: PN;


-}

-- vim: set ts=2 sts=2 sw=2 noet:
