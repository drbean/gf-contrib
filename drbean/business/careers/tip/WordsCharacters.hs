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

	"at work"
	, "in mind"
	, "just"
	, "today"
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
	, "would"
	, "should"
	]
	

conj = [
	"because"
	, "if"
	]


det = [
	"'s"
	, "0, _ or zero"
	, "a"
	, "an"
	, "no"
	, "some"
	, "the"

	]

n = [

	"something"
	, "day"
	, "month"
	, "plan"
	, "purpose"
	, "schedule"
	, "thing"
	, "weekend"
	, "year"
	]

pn = [

	"Barbara"
	, "Dr Bean"
	, "Eva"
	, "FastTrack"
	, "Tadeusz"

	]

pron = [
	"who"
	, "she"
	, "her"
	, "he"
	, "his"
	, "you"
	, "your"
	]

prep = [

	"about"
	, "according to"
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

	"change"
	, "do"
	, "go"
	, "have"
	, "keep"
	, "know"
	, "look at"
	, "need"
	, "see"
	, "think about"
	, "should"
	]

{-

Barbara	: PN;
Dr Bean	: PN;
Eva	: PN;
FastTrack	: PN;
Tadeusz	: PN;

a
about	: Prep;
according to	: Prep;
and
at work	: Adv;
can
change	: V2;
day	: CN;
do	: V2;
each
go	: V;
have	: V2;
how
if
in mind	: Adv;
it
just	: Adv;
keep	: VA;
know	: V2;
look at	: V2;
month	: CN;
need	: VV;
not
of
or
plan	: CN;
purpose	: CN;
schedule	: CN;
see	: VA;
should	: Aux;
something	: N;
the
then
there
thing	: CN;
think about	: V2;
this
to
today	: Adv;
weekend	: CN;
well	: Adv;
what
when
year	: CN;
you	: Pron;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
