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

	"concerned"
	, "different"
	, "difficult"
	, "good"
	, "respected"
	, "unique"
	]

adv = [

	"just"
	, "out"
	, "really"
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
	"and"
	, "because"
	, "but"
	, "if"
	, "or"
	]


det = [
	"'s"
	, "0, _ or zero"
	, "a"
	, "an"
	, "no"
	, "some"
	, "the"
	, "another"
	, "any"
	, "both"
	, "more"
	, "other"
	, "their"

  ]

n = [

	"everybody"
	, "everyone"
	, "difference"
	, "driver"
	, "eye"
	, "family"
	, "manager"
	, "motivator"
	, "people"
	, "person"
	, "question"
	, "secret"
	, "situation"
	, "thing"
	, "way"
	, "world"
	]

pn = [

	]

pron = [
	"who"
	, "she"
	, "her"
	, "he"
	, "his"
	, "that"
	, "there"
	, "they"
	, "you"
	]

prep = [

	"about"
	, "as"
	, "at"
	, "for"
	, "in"
	, "like"
	, "of"
	, "in order to"
	, "through"
	, "to"
	]

rel = [
	"that"
	, "who"
	, "how"
	, "what"
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
	, "care"
	, "find"
	, "know"
	, "listen"
	, "look"
	, "make"
	, "motivate"
	, "need"
	, "tell"
	, "think"
	, "try"
	, "understand"
	, "want"
	]

{-


about	: Prep;
and	: Conj;
another	: Det;
any	: Det;
as	: Prep;
ask	: V2;
at	: Prep;
both	: Det;
but	: Conj;
care	: V2;
concerned	: A;
difference	: CN;
different	: A;
difficult	: A;
driver	: CN;
everybody	: N;
everyone	: N;
eye	: CN;
family	: CN;
find	: V2;
for	: Prep;
good	: A;
how	: Rel;
in	: Prep;
just	: Adv;
know	: V2;
like	: Prep;
listen	: V2;
look	: V2;
make	: V2;
manager	: CN;
more	: Det;
motivate	: V2;
motivator	: CN;
need	: VV;
not
of	: Prep;
or	: Conj;
in order to	: Prep;
other	: Det;
out	: Adv;
people	: CN;
person	: CN;
question	: CN;
really	: Adv;
respected	: A;
secret	: CN;
situation	: CN;
some	: Det;
tell	: V3;
that	: Pron;
their	: Det;
them	: Pron;
there	: Pron;
they	: Pron;
thing	: CN;
think	: V;
through	: Prep;
to	: Prep;
try	: VV;
understand	: V2;
unique	: A;
want	: VV;
way	: CN;
what	: Rel;
world	: CN;
you	: Pron;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
