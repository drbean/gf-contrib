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

	"active"
	, "big"
	, "different"
	, "happier"
	, "happy"
	, "important"
	, "other"
	, "positive"
	, "rich"
	, "subjective"

	]

adv = [

	"also"
	, "more"
	, "never"
	, "now"
	, "often"
	, "only"
	, "sometimes"
	, "subjectively"

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

	"even when"
	, "and"
	, "but"
	, "or"

	]


det = [
	"'s"
	, "just"
	, "lots of"
	, "many"
	, "no"
	, "not"
	, "one"
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

	"community"
	, "country"
	, "daily life"
	, "emotion"
	, "engagement"
	, "engagement"
	, "family"
	, "feeling"
	, "flow"
	, "framework"
	, "friend"
	, "goal"
	, "happiness"
	, "ideology"
	, "intimacy"
	, "know"
	, "life"
	, "meaning"
	, "means"
	, "meditation"
	, "money"
	, "network"
	, "nothing"
	, "one_NP"
	, "person/people"
	, "philosophy"
	, "physical exercise"
	, "play"
	, "presence"
	, "question"
	, "relationship"
	, "religion"
	, "school"
	, "self"
	, "sense"
	, "social connection"
	, "social group"
	, "something"
	, "state of mind"
	, "thing"
	, "tie"
	, "way"
	, "well-being"
	, "whole"
	, "work"

	, "accomplishment"
	, "achievement"
	]

pn = [


	]

pron = [
	"who"
	, "that"
	, "where"
	, "who"
	, "you"
	, "your"
	, "that"
	, "what"
	, "which"
	, "you"
	, "how"
	, "she"
	, "her"
	, "he"
	, "his"
	, "they"
	]

prep = [

	"about"
	, "as"
	, "at"
	, "for"
	, "in"
	, "of"
	, "on"
	, "than"
	, "through"
	, "to"
	, "very"
	, "in the way of"
	, "with"

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

	"ask"
	, "assess"
	, "believe"
	, "belong"
	, "bring"
	, "can"
	, "concentrate"
	, "emphasize"
	, "feel_A"
	, "feel_N"
	, "forget"
	, "give"
	, "give"
	, "give"

	, "have"
	, "improve"
	, "involve"
	, "involve"
	, "mean"
	, "measure"
	, "participate"
	, "pursue"
	, "seek"
	, "serve"
	, "think"
	, "achieve"
	]

{-

a
about	: Prep;
accomplishment	: N2;
achieve	: V2;
achievement	: N;
active	: A2;
also	: Adv;
and	: Conj;
as	: Prep;
ask	: V2;
assess
at	: Prep;
believe	: V2;
belong	: V2;
big	: AP;
bring	: V2;
but	: Conj;
can	: VV;
community	: N;
concentrate	: V2;
country	: CN;
daily life	: N;
different	: AP;
emotion	: N;
emphasize	: V2;
engagement	: N2;
even when	: Subj;
family	: N;
feel_A	: VA;
feel_N	: V2;
feeling	: CN;
flow	: N;
for	: Prep;
forget	: V2;
framework	: N2;
friend	: CN;
give	: V3;
goal	: CN;
happier	: AP;
happiness	: N;
happy	: AP;
have	: V2;
ideology	: N;
important	: A2;
improve	: V2;
in	: Prep;
in the way of	: Prep;
intimacy	: N;
involve	: V2;
just	: Det;
know	: CN;
life	: N;
lots of	: Det;
many	: Det;
meaning	: N;
mean	: V2;
means	: CN;
measure	: V2;
meditation	: N;
mind	: N;
money	: N;
more	: Adv;
network	: CN;
never	: Adv;
no	: Det;
not	: Det;
nothing	: N;
now	: Adv;
of	: Prep;
often	: Adv;
on	: Prep;
one	: Det;
one_NP	: N;
only	: Adv;
or	: Conj;
other	: AP;
participate	: V2;
person/people	: CN;
philosophy	: N;
physical exercise	: N;
play	: N;
positive	: AP;
presence	: N2;
pursue	: V2;
question	: N2;
relationship	: N2;
religion	: N;
rich	: AP;
school	: N;
seek	: VV;
self	: CN;
sense	: N2;
serve	: V2;
social connection	: N;
social group	: CN;
something	: N;
sometimes	: Adv;
state of mind	: CN;
subjective	: AP;
subjectively	: Adv;
than	: Prep;
that	: Pron;
they	: Pron;
thing	: CN;
think	: V2;
through	: Prep;
tie	: N2;
to	: Prep;
very	: Prep;
way	: CN;
well-being	: N;
where	: Pron;
who	: Pron;
whole	: CN;
with	: Prep;
work	: N;
you	: Pron;
your	: Pron;




-}

-- vim: set ts=2 sts=2 sw=2 noet:
