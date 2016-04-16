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

n = [

	]

pn = [

	]

pron = [
	"who"
	, "she"
	, "her"
	, "he"
	, "his"
	]

prep = [

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


11 o'clock
1938
about
all
announce
any
anyone
anytime
army
around
at
back
because
before
begin
being
big
brake
broadcast
brother
burn
but
call
can
car
Chevrolet automobile
come
confess
convince
country
direction
doctor
Doctor
The Doctor
drama
drive
each
emergency
end
family
famous
few
figure
find
from
get
go
gone
he
hear
himself
his
hoax
home
house
huff
humor
idea
in
into
invading
involve
it
Joe
just
keep
land
later
leave
listen
madder
make
Mars
Martians
man
Mercury Theater
minute
more
never
New Jersey
news
night
no
not
nothing
of
on
one
only
Orson Welles
other
out
over
planet
program
radio
react
recreation
repeat
repent
rubber
say
scent
see
sense
sin
skeptic
smell
so
something
sound
step-grandfather
story
strange
talk
tell
that
their
they
think
this
to
together
turn
uncle
unusual
up
vanguard
wait
walk
way
whatsoever
when
where
who
wife
with
within
without
word
world
yard
young

-}

-- vim: set ts=2 sts=2 sw=2 noet:
