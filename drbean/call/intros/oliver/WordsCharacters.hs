	, "feel"
	, "focus"
	, "have"
	, "live"
	, "love"
	, "make"
	, "study"
	, "think"
	, "court"
	, "family"
	, "father"
	, "mother"
	, "name"
	, "older_sister"
	, "people"
	, "person"
	, "sport"
	, "Facebook"
	, "Oliver"
	, "PanYanMin"
	, "PingZhen"
	, "Taipei"
	, "ABC"
	, "as"
	, "in"
	, "on"
module WordsCharacters where 
	, "favorite"
	, "happy"
	, "humorous"
	, "optimistic"
	, "positive"
	, "relaxed"
	, "music"
	, "free_time"
	, "what_wants"

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
	"Chinese"
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
	"when"
	]


det = [
	]

n = cn ++ un

cn = [
	]

un = [
	"basketball"
	]

pn = [
	]

pron = [
	"who"
	, "whom"
	, "whose"
	]

prep = [
	"for"
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

basketball	: N;
Chinese	: A;
Facebook	: PN;
listening_music	: N;
Oliver	: PN;
PanYanMin	: PN;
PingZhen	: PN;
Taipei	: PN;
there
ABC_University	: PN;
when
a
an
and
are
as	: Prep;
born
court	: CN;
family	: CN;
father	: CN;
favorite	: A;
feel	: VA;
focus	: V2;
four _ Det
free_time	: N;
happy	: A;
have	: V2;
he
his
humorous	: A;
in	: Prep;
is
live	: V2;
love	: V2;
make	: V2A;
mother	: CN;
name	: CN;
older_sister	: CN;
on	: Prep;
optimistic	: A;
people	: CN;
person	: CN;
positive	: A;
relaxed	: A;
sport	: CN;
study	: V2;
think	: VA;
was
what_wants	: N;
-}

-- vim: set ts=2 sts=2 sw=2 noet:
