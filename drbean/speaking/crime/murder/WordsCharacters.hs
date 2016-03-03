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
	"eighty"
	, "married"
	, "dying"
	, "alive"

	]

adv = [
	"so much"
	, "anymore"
	, "on February 9"
	, "for 8 months"
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
	"wife"
	, "cancer"
	, "husband"
	, "hospital"
	, "months"
	, "respirator"
	]

pn = [
	"Charles"
	, "Sara"
	]

pron = [
	"who"
	, "he/him"
	, "she/her"
	]

prep = [
	"in"
	, "by"
	, "to"
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
	"go"
	, "keep"
	, "shoot"
	, "say"
	, "love"
	, "watch"
	, "suffer"
	]

{-

Charles	: PN;
his	: Det;
husband	: CN;
wife	: CN;
Sara	: PN;
married	: A;
cancer	: CN;
dying	: A;
in	: Prep;
hospital	: CN;
for	: Prep;
for 8 months	: Adv;
keep	: V2A;
alive	: A;
by	: Prep;
respirator	: CN;
on	: Prep;
on February 9	: Adv;
go	: VA;
to	: Prep;
shoot	: V2;
her	: Det;
he	: Pron;
she
say	: VS;
'I
love	: V2;
so much	: Adv;
I
can't
watch	: V2S;
suffer	: V;
anymore	: Adv;
 -}
 
 -- vim: set ts=2 sts=2 sw=2 noet:
