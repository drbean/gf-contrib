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

	"big"
	, "cultural"
	, "different"
	, "difficult"
	, "important"
	, "other"
	, "real"
	, "same"
	, "true"
	, "unique"
	]

adv = [

	"differently"
	, "even"
	, "just"
	, "normally"
	, "of course"
	, "very"
	, "actually"
	, "all"
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
	, "just because"
	, "when"
	, "and"
	, "but"
	, "or"
	, "if"
	, "although"
	]


det = [
	"'s"
	, "all"
	, "0, _ or zero"
	, "a"
	, "an"
	, "no"
	, "some"
	, "the"
	]

n = [

	"country"
	, "culture"
	, "difference"
	, "everyone"
	, "group"
	, "individual"
	, "people"
	, "same"
	, "thing"
	, "understanding"
	, "way"
	]

pn = [

	"India"
	, "Africa"
	]

pron = [
	"who"
	, "she"
	, "her"
	, "he"
	, "his"
	, "we"
	, "us"
	, "they"
	, "you"
	, "your"
	]

prep = [

	"as"
	, "between"
	, "from"
	, "in"
	, "of"
	, "to"
	, "with"
	, "about"
	, "according to"
	]

rel = [
	"that"
	, "who"
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

	"assume"
	, "can"
	, "look"
	, "mean"
	, "need"
	, "realize"
	, "remember"
	, "remember"
	, "think"
	, "treat"
	, "work"
	]

{-

about	: Prep;
according to	: Prep;
Africa	: PN;
actually	: Adv;
all	: PreDet;
although	: Subj;
and	: Conj;
as	: Prep;
assume	: VS;
because	: Subj;
between	: Prep;
big	: A;
but	: Conj;
can	: VV;
country	: PlaceNoun;
cultural	: A;
culture	: PlaceNoun;
difference	: CN;
different	: A;
differently	: Adv;
difficult	: A;
even	: Adv;
everyone	: N;
from	: Prep;
group	: CN;
important	: A;
in	: Prep;
India	: PN;
individual	: CN;
just	: Adv;
just because	: Subj;
look	: V2;
mean	: VS;
need	: VV;
normally	: Adv;
not
of	: Prep;
of course	: Adv;
or	: Conj;
other	: A;
people	: CN;
real	: A;
realize	: VS;
remember	: V2;
remember	: VS;
same	: A;
same	: CN;
same	: N2;
they	: Pron;
thing	: CN;
thing	: N2;
think	: V;
think	: V2;
think about	: V2;
think	: VS;
to	: Prep;
treat	: V3;
true	: A;
understanding	: CN;
unique	: A;
us	: Pron
very	: AdA;
way	: CN;
we	: Pron
what	: Rel;
when	: Subj;
with	: Prep;
work		: V2;
you	: Pron
your	: Pron

-}

-- vim: set ts=2 sts=2 sw=2 noet:
