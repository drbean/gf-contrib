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
	"Chinese"
	, "English"
	, "favorite"
	, "happy"
	, "humorous"
	, "optimistic"
	, "positive"
	, "relaxed"
	, "19 years old"
	, "logical"
	, "relaxed"
	]

adv = [
	]

aux = [
	"doesn't"
	, "favorite"
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
	"a"
	, "an"
	, "the"
	, "three"
	, "five"
	, "'s"
	]

n = cn ++ un

cn = [
	"family"
	, "father"
	, "friend"
	, "mother"
	, "name"
	, "older brother"
	, "people"
	, "person"
	, "younger sister"
	, "song"
	, "sport"
	, "subject"
	, "tour guide"
	, "translator"
	]

un = [
	"baseball"
	, "drums"
	, "guitar"
	, "playing guitar"
	, "playing drums"
	]

pn = [
	"Simon"
	, "Ariel"
	, "ChiYuan Tien"
	,  "Minghu Junior High School"
	, "Taipei"
	, "WenHua University"
	]

pron = [
	"who"
	, "whom"
	, "whose"
	]

prep = [
	"as"
	, "for"
	, "in"
	, "on"
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
	"feel, feels"
	, "have, has"
	, "listen, listens"
	, "live, lives"
	, "love, loves"
	, "make, makes"
	, "play, plays"
	, "study, studies"
	]

{-


19	: A;
ariel	: PN;
baseball	: N;
brother	: CN;
chinese	: A;
chiyuantien	: PN;
drums	: N;
english	: PN;
family	: CN;
father	: CN;
favorite	: A;
feel	: VA;
five	: Det;
guitar	: N;
happy	: A;
humorous
like	: V2;
listen	: V2;
listening
live	: V2;
logical	: A;
logically
love	: V2;
make	: V2;
minghu	: PN;
mother	: CN;
name	: CN;
person	: CN;
people	: CN;
play	: V2;
relaxed	: A;
simon	: PN;
sister	: CN;
song	: CN;
sport	: CN;
study	: 0;
subject	: CN;
Taipei	: PN;
three	: Det;
tourguide	: CN;
translator	: CN;
WenHuaUniversity	: PN;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
