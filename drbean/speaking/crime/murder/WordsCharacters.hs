	, "go"
	, "shoot"
	, "on"
	, "for"
	, "by"
	, "February"
	, "to"
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
	"married"
	, "dying"
	, "8"

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
	]
	

conj = [
	"because"
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
	"Mercer"
	, "Sara"
	]

pron = [
	"who"
	, "whom"
	, "he/him"
	, "she/her"
	]

prep = [
	"in"
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
	]

{-

Mercer	: PN;
his	: Det;
husband	: CN;
wife	: CN;
Sara,	: PN;
married	: A;
cancer	: CN;
dying	: A;
in	: Prep;
hospital	: CN;
for	: Prep;
8	: A;
months	: CN;
and
kept
alive
by	: Prep;
a
respirator	: CN;
on	: Prep;
February_9	: PN;
go	: VA;
to	: Prep;
shoot	: V2;
her	: Det;
he
she
says
'I
love
her
so
much
I
can't
watch
her
suffer
anymore
 -}
 
 -- vim: set ts=2 sts=2 sw=2 noet:
