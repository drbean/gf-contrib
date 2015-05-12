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
	"beautiful"
	, "best"
	, "big"
	, "biological"
	, "first"
	, "fourth"
	, "happy"
	, "magnificent"
	, "married"
	, "oldest"
	, "pregnant"
	, "seventeen"
	, "three"
	, "ugly"
	]

adv = [
	"always"
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
	, "go"
	, "three"
	, "five"
	, "'s"
	]

n = cn ++ un

cn = [
	"altercation"
	, "bedroom"
	, "boyfriend"
	, "child"
	, "class_ring"
	, "dad"
	, "day"
	, "door"
	, "dresser"
	, "engagement_ring"
	, "father"
	, "finger"
	, "gentleman"
	, "guy"
	, "house"
	, "kid"
	, "knee"
	, "name"
	, "note"
	, "ring_box"
	, "thing"
	, "wedding_ring"
	, "wife"
	, "woman"
	, "year"
	, "back"
	, "son"
	, "whisper"
	]

un = [
	"dinner"
	, "home"
	, "popcorn"
	, "stuff"
	, "true love"
	, "details"
	]

pn = [
	"City Hall"
	, "Frank"
	, "Michigan"
	, "So-and-so"
	, "Rebia"
	, "Rebia and Frank"
	, "Frank and Rebia"
	]

pron = [
	"who"
	, "whom"
	, "whose"
	]

prep = [
	"as"
	, "down on"
	, "down to"
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
	"believe"
	, "burn"
	, "come"
	, "feel"
	, "find"
	, "give"
	, "go"
	, "get"
	, "grab"
	, "have"
	, "hand"
	, "help"
	, "hang"
	, "know"
	, "laugh"
	, "look"
	, "make"
	, "meet"
	, "move"
	, "put"
	, "run"
	, "remember"
	, "see"
	, "say"
	, "separate"
	, "shake"
	, "shoot"
	, "talk"
	, "tell"
	, "try"
	, "walk"
	]

{-

above
all
altercation	: CN;
always	: Adv;
at
back	: CN;
beautiful	: A;
because
bedroom	: CN;
believe	: VS;
best	: A;
big	: A;
biological	: A;
boyfriend	: CN;
burn	: V2;
child	: CN;
City_Hall	: PN;
class_ring	: CN;
come	: V2;
dad	: CN;
day	: CN;
details	: N;
dinner	: N;
door	: CN;
down
dresser	: CN;
engagement_ring	: CN;
exactly
father	: CN;
feel	: VA;
find	: V2;
finger	: CN;
first	: A;
for
fourth	: A;
Frank	: PN;
Frank and Rebia	: PN;
gentleman	: CN;
give	: V3;
go	: V2;
get	: VA;
grab	: V2;
guy	: CN;
have	: V2;
hand	: V3;
happy	: A;
help	: V2;
home	: N;
honestly
house	: CN;
hang	: V;
if
in
into
just
kid	: CN;
kind
knee	: CN;
know_V2	: V2;
know_VS	: VS;
later
laugh	: V;
like
look	: V2;
make	: V2V;
magnificent	: A;
married	: A;
mean
meet	: V2;
Michigan	: PN;
move	: V2;
name	: CN;
never
note	: CN;
of
oldest	: A;
on
one
other
out
over
popcorn	: N;
pregnant	: A;
put	: V3;
Rebia	: PN;
Rebia and Frank	: PN;
ring_box	: CN;
run	: V2;
really
remember_VV	: VV;
remember_V2	: V2;
see_V2	: V2;
see_V2V	: V2V;
say	: VS;
separate	: V;
seventeen	: A;
shake	: V;
shoot_V2	: V2;
shoot_V3	: V3;
So-and-so	: PN;
son	: CN;
still
stuff	: N;
talk	: V2;
tell	: V2S;
there
thing	: CN;
three	: A;
to
towards
try	: VV;
true love	: N;
ugly	: A;
Uh-huh
walk	: V2;
wedding_ring	: CN;
whatever
when
whisper	: CN;
wife	: CN;
woman	: CN;
year	: CN;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
