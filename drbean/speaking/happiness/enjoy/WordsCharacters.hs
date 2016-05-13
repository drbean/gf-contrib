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

	"bad"
	, "down in the dumps"
	, "fine"
	, "good"
	, "happy"
	, "happy-go-lucky"
	, "high"
	, "miserable"
	, "positive"
	, "raining"
	, "unfit"
	]

adv = [

	"already"
	, "also"
	, "always"
	, "too"
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
	, "but"
	, "and"
	, "if"
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

	]

n = [

	"country"
	, "everything"
	, "face"
	, "Finland"
	, "food"
	, "happiness"
	, "top"
	, "word"
	, "life"
	, "list"
	, "money"
	, "nation"
	, "news"
	, "nothing"
	, "people"
	, "quality"
	, "situation"
	, "smile"
	, "study"
	, "thing"
	, "wine"
	]

pn = [

	"Canada"
	, "Finn"
	, "Finland"
	, "Rob"
	, "World Happiness Database"
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

	"about"
	, "even in"
	, "for"
	, "in"
	, "like"
	, "of"
	, "on"
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
	, "could"
	, "feel"
	, "look"
	, "make"
	, "might"
	, "put"
	, "say"
	, "sound"
	, "tell"
	, "think"
	, "use"
	, "worry"
	]

{-

about	: Prep;
already	: Adv;
also	: Adv;
always	: Adv;
and	: Conj;
ask	: V2S;
bad	: A;
but	: Conj;
Canada	: PN;
could	: VV;
country	: CN;
down in the dumps	: A;
even in	: Prep;
everything	: N;
face	: CN;
feel	: VA;
fine	: A;
Finland	: PN;
Finn	: PN;
food	: N;
for	: Prep;
good	: A;
happiness	: N;
happy	: A;
happy-go-lucky	: A;
high	: A;
how	: Pron;
in	: Prep;
life	: N;
like	: Prep;
list	: CN;
look	: V2;
make	: V2V;
might	: VV;
miserable	: A;
money	: N;
nation	: CN;
news	: N;
no	: Det;
nothing	: N;
of	Prep;
on	: Prep;
people	: CN;
positive	: A;
put	: V3;
quality	: CN;
raining	: A;
Rob	: PN;
say	: VS;
situation	: CN;
smile	: CN;
some	: Det;
sound	: VA;
study	: CN;
tell	: V2S;
that	: Pron;
thing	: CN;
think	: VS;
to
too	: Adv;
top	: N2;
unfit	: A;
use	: V2;
what	: Pron;
which	: Pron;
wine	: N;
word	: N2;
World Happiness Database	: PN;
worry	: V2;
you	: Pron;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
