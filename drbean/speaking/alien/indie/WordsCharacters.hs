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

	"atmospheric"
	, "alien"
	, "enormous"
	, "gigantic"
	, "major"
	, "mysterious"
	, "strange"
	]

adv = [

	"back"
	, "out"
	, "worldwide"
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
	, "and"
	]


det = [
	"'s"
	, "a number of"
	, "0, _ or zero"
	, "a"
	, "an"
	, "no"
	, "some"
	, "the"

	]

n = [

	"alien"
	, "collision course with the Earth"
	, "convoy"
	, "day"
	, "globe"
	, "government"
	, "military"
	, "object"
	, "plan"
	, "point"
	, "spacecraft"
	, "species"
	, "survivor"
	, "communications system"
	, "testing ground"
	, "July 2nd"
	, "July 3rd"
	, "July 4th"
	, "chaos"
	, "freedom"
	, "humanity"
	, "interference"
	, "Independence Day"
	]

pn = [

	"Area 51"
	, "Los Angeles"
	, "the Earth"
	, "Houston"
	, "Levinson"
	, "London"
	, "Moscow"
	, "New York"
	, "Paris"
	, "Washington"
	, "Independence Day"
	]

pron = [
	"who"
	, "she"
	, "her"
	, "he"
	, "his"
	, "they"
	]

prep = [

	"against"
	, "around"
	, "by"
	, "for"
	, "in"
	, "into"
	, "on"
	, "to"
	, "toward"
	, "with"
	]

rel = [
	"that"
	, "who"
	, "where"
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
	, "believe"
	, "capture"
	, "devise"
	, "discover"
	, "enslave"
	, "fight back"
	, "fight"
	, "intend"
	, "learn"
	, "obliterate"
	, "pilot"
	, "reveal"
	, "send"
	, "set out"
	, "attack"
	, "paralyze"
	]

{-


July 2nd	: N;
July 3rd	: N;
July 4th	: N;
Area 51	: PN;
against	: Prep;
alien	: CN;
alien_adj	: A;
a number of	: Det;
Los Angeles	: PN;
around	: Prep;
atmospheric	: A;
attack	: V2;
back	: Adv;
become	: V2S;
believe	: VS;
by	: Prep;
capture	: V2;
chaos	: N;
collision course	: CN;
communications system	: CN;
convoy	: CN;
day	: CN;
devise	: V2V;
discover	: VS;
the Earth	: PN;
enormous	: A;
enslave	: V2;
fight	: V2;
fight back	: V;
for	: Prep;
freedom	: N;
gigantic	: A;
globe	: CN;
government	: CN;
Houston	: PN;
humanity	: N;
in	: Prep;
intend	: VV;
interference	: N;
into	: Prep;
learn	: VS;
Levinson	: PN;
London	: PN;
major	: A;
military	: CN;
Moscow	: PN;
mysterious	: A;
New York	: PN;
object	: CN;
obliterate	: V2;
on	: Prep;
out	: Adv;
paralyze	: V2;
Paris	: PN;
pilot	: V2;
plan	: CN;
point	: N2;
reveal	: V2V;
send	: V3;
set out	: V;
spacecraft	: CN;
species	: CN;
strange	: A;
survivor	: CN;
testing ground	: CN;
to	: Prep;
toward	: Prep;
Washington	: PN;
where	: RP;
worldwide	: Adv;
Independence Day	: N;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
