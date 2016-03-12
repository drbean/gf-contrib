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
	"drunk"
	, "3-year-old"
	, "sorry"
	, "little"
	]

adv = [
	"a long time"
	, "in the past 10 years"
	, "4 times"
	, "on July 10"
	, "home"
	, "from an afternoon party"
	, "on a tricycle"
	, "every month"
	, "never"
	, "again"
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
	, "because"
	]


det = [
	"'s"
	, "a"
	, "an"
	, "the"
	, "his"
	, "her"
	]

n = [
	"police"
	, "drunk driving"
	, "money"
	, "alcoholic"
	, "hospital"
	, "girl"
	, "parents"
	]

pn = [
	"Mrs Tipton"
	]

pron = [
	"who"
	, "he/him"
	, "she/her"
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
	"arrest"
	, "drive"
	, "hit"
	, "promise"
	, "pay"
	, "drink"
	, "die"
	]


{-

Mrs Tipton	: PN;
alcoholic	: CN;
hospital	: CN;
a long time	: Adv;
because
in the past 10 years	: Adv;
police	: N;
arrest	: V2;
4 times	: Adv;
for
drunk driving	: N;
on July 10	: Adv;
drive	: V2;
home	: Adv;
from an afternoon party	: Adv;
drunk	: A;
hit	: V2;
a
3-year-old	: A;
on a tricycle	: Adv;
girl	: CN;
die	: V;
say	: V2S;
sorry	: A;
promise	: VV;
pay	: V3;
the
little	: A;
girls
parents	: CN;
some
money	: N;
every month	: Adv;
I
will
never	: Adv;
drink	: V;
again	: Adv;

-}
 
 -- vim: set ts=2 sts=2 sw=2 noet:
