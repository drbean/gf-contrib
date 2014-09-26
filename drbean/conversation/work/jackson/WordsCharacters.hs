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
	]
	

conj = [
	"because"
	]


det = [
	"'s"
	, "a"
	, "about"
	, "an"
	, "no"
	, "some"
	, "the"
	, "five"
	]

n = [
	]

pn = [
	]

pron = [
	"who"
	, "whom"
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

10-dollar
30s
40s
60
And
But
Christmas
Colorado
I
I'll
I'm
It
Jackson
My
Not
One
Queen
That
Therefore
Well
Whatever
Work
You
a
age
all
and
another
apartment
as
at
back
badly
bag
be
beautiful
because
becoming
big
bill
birthday
bottle
bought
budget
bullet
buy
can
card
care
children
class
coming
cooking
could
covering
crying
daughter
daughters
deal
didn't
don't
dressed
dummy
enjoying
ever
felt
first
five
for
forget
fragrance
generation
get
gift
girls
go
going
gonna
got
great
had
handed
happen
have
her
here
him
homeless
ideas
in
interview
into
it
job
joy
just
know
laid
laugh
life
lifted
like
little
lonely
looking
lost
lotion
man
me
meant
middle
money
month
months
most
move
much
my
myself
never
no
nobody
not
of
off
one
opened
or
out
pretty
received
remember
remembering
rent
retiring
savings
see
she
shelter
sign
sitting
smelled
smells
so
some
spirits
started
state
strained
take
thanked
that
the
these
this
thought
to
told
turned
um
unemployment
up
very
wants
was
way
week
were
when
which
with
women
working
you
you're
you
your

-- vim: set ts=2 sts=2 sw=2 noet:
