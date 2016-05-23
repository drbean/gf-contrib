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

	"afraid"
	, "common"
	, "distributive"
	, "fearful"
	, "first"
	, "important"
	, "long-term"
	, "most"
	, "only"
	, "three"
	, "zero-sum"

	]

adv = [

	"also"
	, "often"
	, "really"
	, "up"
	, "very"

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
	, "and"
	, "or"

	]


det = [
	"'s"
	, "each"
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

	"a lot"
	, "aspect"
	, "bargaining"
	, "conflict"
	, "difficulty"
	, "expert"
	, "goal"
	, "information"
	, "interest"
	, "issue"
	, "management"
	, "mindset"
	, "mistake"
	, "much"
	, "necessity"
	, "negotiation"
	, "opportunity"
	, "other"
	, "people"
	, "pie"
	, "reason"
	, "require"
	, "resolution"
	, "resource"
	, "slice"
	, "teaching"
	, "training"
	, "tension"
	, "value"

	]

pn = [

	"Harvard"
	, "Mnookin"

	]

pron = [
	"who"
	, "he"
	, "how"
	, "it"
	, "there"
	, "they"
	, "this"
	, "what"
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
	]

prep = [

	"about"
	, "at"
	, "between"
	, "in"
	, "into"
	, "of"
	, "part"
	, "through"
	, "to"

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

	"believe"
	, "can"
	, "create"
	, "divide"
	, "expand"
	, "exploit"
	, "fail"
	, "get"
	, "get_passive"
	, "have to"
	, "have"
	, "help"
	, "know"
	, "learn"
	, "eake"
	, "manage"
	, "might"
	, "realize"
	, "resolve"
	, "share"
	, "teach"
	, "think"
	, "trade"
	, "train"
	, "understand"
	, "use"

	]

{-


a lot	: N2;
about	: Prep;
afraid	: A;
also	: Adv;
and	: Conj;
aspect	: N2;
at	: Prep;
bargaining	: N;
because	: Subj;
believe	: VS;
between	: Prep;
can	: VV;
common	: A;
conflict	: N;
create	: V2;
difficulty	: CN;
distributive	: A;
divide	: V;
each	: Det;
expand	: V2;
expert	: N2;
exploit	: V2;
fail	: VV;
fearful	: A;
first	: A;
get	: V2;
get_passive	: V;
goal	: CN;
Harvard	: PN;
have to	: VV;
have	: V2;
he	: Pron;
help	: V2V;
how	: Pron;
important	: A;
in	: Prep;
information	: N;
interest	: CN;
into	: Prep;
issue	: CN;
it	: Pron;
know	: V2;
learn	: VV;
long-term	: A;
eake	: V2;
manage	: V2;
management	: N2;
might	: VV;
mindset	: CN;
mistake	: CN;
Mnookin	: PN;
most	: A;
much	: N2;
necessity	: N2;
negotiation	: N;
of	: Prep;
often	: Adv;
only	: A;
opportunity	: CN;
or	: Conj;
other	: CN;
part	: Prep;
people	: CN;
pie	: CN;
realize	: VS;
really	: Adv;
reason	: CN;
require	: N2;
resolution	: N;
resolve	: V2;
resource	: CN;
share	: V2;
slice	: N2;
teach	: V2V;
teaching	: NP;
tension	: CN;
there	: Pron;
they	: Pron;
think	: VS;
this	: Pron;
three	: A;
through	: Prep;
to	: Prep;
trade	: V2;
train	: V2V;
training	: CN;
understand	: V2;
up	: Adv;
use	: V2V;
value	: N;
very	: Adv;
what	: Pron;
you	: Pron;
your	: Pron;
zero-sum	: A;



-}

-- vim: set ts=2 sts=2 sw=2 noet:
