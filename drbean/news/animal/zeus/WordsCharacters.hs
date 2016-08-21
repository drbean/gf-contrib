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


	]

adv = [


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
	, "would"
	, "should"
	]
	

conj = [


	]


det = [
	"'s"
	, "some"
	, "no"
	, "0, _ or zero"
	, "a"
	, "an"
	, "no"
	, "some"
	, "the"
	, "14"

	]

n = [


	]

pn = [


	]

pron = [
	"who"
	, "that"
	, "what"
	, "which"
	, "you"
	, "how"
	, "she"
	, "her"
	, "he"
	, "his"
	]

prep = [


	]

rel = [


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


	]

{-


14	: Det;
2012	: N;
44	: Det;
a
according to	: Prep;
age	: CN;
amazing	: AP;
and	: Conj;
around	: Prep;
as	: Prep;
at	: Prep;
average	: V2;
because	: Subj;
before	: Prep;
big	: AP;
birthday	: CN;
can	: VV;
cause	: N2;
death	: N;
die	: VA;
dog	: CN;
feet	: PN;
for	: Prep;
four	: Det;
get_into	: V;
Great Dane	: CN;
Great_Dane	: CN;
the Guiness Book of World Records	: PN;
he	: Pron;
hind	: AP;
his	: Pron;
hold	: V2;
hospital	: CN;
in	: Prep;
inch	: CN;
leg	: CN;
life_span	: N2;
like	: Prep;
love	: V2;
miss	: V2;
month	: CN;
of	: Prep;
often	: Adv;
old	: AP;
on	: Prep;
only	: Det;
pass away	: V;
people	: CN;
poodle	: CN;
quicker	: Adv;
recently	: Adv;
record	: N2;
sConjchool	: CN;
seven	: Det;
seven feet four inches	: Adv;
at_the_shoulder	: Adv;
sixth	: AP;
smaller	: AP;
the Smithsonian	: PN;
tall	: AP;
tallest	: AP;
than	: Prep;
therapy_dog	: CN;
they	: Pron;
this	: Pron;
toy	: AP;
two	: Det;
usually	: Adv;
visit	: V2;
world	: CN;
year	: CN;
younger	: AP;
Zeus	: PN;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
