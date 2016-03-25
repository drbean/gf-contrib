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

	"first"
	, "hard"
	, "impossible"
	, "square"
	, "terrible"
	, "short"
	, "second year"
	, "red"
	, "pink"
	, "old"
	, "miserable"
	]

adv = [

	"home"
	, "a hundred percent"
	, "later"
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

	"beginning"
	, "class"
	, "course"
	, "decision"
	, "desk"
	, "dress"
	, "geometric squares"
	, "guy"
	, "heels"
	, "idea"
	, "accounting"
	, "business law"
	, "college"
	, "everything"
	, "finance"
	, "interview_N"
	, "worker"
	, "woman"
	, "wife"
	, "tights"
	, "thing"
	, "sleeve"
	, "question"
	, "mother"
	, "mini-dress"
	, "man"
	, "letter"
	, "job"
	, "interview_N"
	, "work"
	, "participation"
	, "15 minutes"
	, "life"
	]

pn = [

	"Tia"
	, "Douglass"
	]

pron = [
	"who"
	, "she"
	, "her"
	, "he"
	, "his"
	]

prep = [

	"to"
	, "over"
	, "on"
	]

rel = [
	"that"
	, "who"
	, "how many"
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

	"apply"
	, "go"
	, "grade"
	, "graduate"
	, "have"
	, "write"
	, "used"
	, "think"
	, "take"
	, "study"
	, "stand up"
	, "start"
	, "smile"
	, "say"
	, "own"
	, "make"
	, "love"
	, "like"
	, "lean"
	, "know"
	, "interview_V"
	]

{-

15 minutes	: N;
80
accounting	: N;
after
and
answer
anything
apply	: V2;
at
be
beginning	: CN;
business law	: N;
class	: CN;
college	: N;
course	: CN;
day
decision	: CN;
desk	: CN;
Douglass	: PN;
dress	: CN;
every
everything	: N;
finance	: N;
first	: A;
for
from
geometric squares	: CN;
go in
go	: V2;
grade	: V3;
graduate	: V2;
guy	: CN;
hard	: A;
have	: V2;
heels	: CN;
home	: Adv;
a hundred percent	: Adv;
idea	: CN;
"I don't need this job this much."
"I hope you are prepared, Ms. Casciato, because the most difficult question of the period will be yours."
impossible.	: A;
interview_V	: V2;
interview_N	: CN;
job	: CN;
know	: V2;
later	: Adv;
lean	: V;
letter	: CN;
life	: N;
like	: V2;
love	: V2;
make	: V2;
man	: CN;
mini-dress	: CN;
miserable	: A;
mother	: CN;
"Ms. Casciato, you are the only woman who has ever gotten this far in my class. And I will make sure every day is a living hell for you."
old	: A;
on	: Prep;
one	: Det;
over	: Prep;
own	: V2;
participation	: N;
pink	: A;
question	: CN;
red	: A;
say	: VS;
second year	: A;
short	: A;
sleeve	: CN;
smile	: V;
square	: CN;
"Stand up and turn around."
start	: VV;
"Do you stay home?"
"Do you work?"
"What do you do with your children?"
stand up	: V;
study	: V2;
take	: V2;
terrible	: A;
thing	: CN;
think	: VS;
Tia:	: PN;
tights	: CN;
to	: Prep;
used	: VV;
"What are you talking about?"
wife.	: CN;
woman	: CN;
work	: N;
worker	: CN;
write	: V2;
"You need to stand up and turn around."
"You're hired."

-}

-- vim: set ts=2 sts=2 sw=2 noet:
