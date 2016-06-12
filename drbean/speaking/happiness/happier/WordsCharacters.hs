module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/speaking/happiness/happier/Happier.pgf"

cat2funs :: String -> IO [CId]
cat2funs cat = 
	gr >>= \gr' ->
		return (functionsByCat gr' (mkCId cat)) >>= \l ->
			return ( filter ( isLower . head . showCId ) l)

gfWords :: [(String, IO [CId])]
gfWords = [
	("A",a)
	, ("Adv",adv)
	-- , ("Aux",aux)
	, ("Conj",conj)
	, ("Det",det)
	, ("N",n)
	, ("CN",cn)
	, ("PN",pn)
	-- , ("Pron",pron)
	, ("Prep",prep)
	-- , ("Rel",rel)
	-- , ("Tag",tag)
	, ("V",v)
	, ("V2",v2)
	, ("V3",v3)
	, ("VV",vv)
	, ("VS",vs)
	, ("V2A",v2a)
	]

posName :: String -> String
posName "A"	= "Adjective"
posName "Adv"	= "Adverb"
posName "Aux"	= "Auxiliary"
posName "Conj"	= "Conjunction"
posName "Det"	= "Determiner"
posName "N"	= "Uncount Noun"
posName "CN"	= "Count Noun"
posName "PN"	= "Proper Noun"
posName "Pron"	= "Pronoun"
posName "Prep"	= "Preposition"
posName "Rel"	= "Relative Pronoun"
posName "Tag"	= "Question Tag"
posName "V"	= "Verb"
posName "V2"	= "Verb + object"
posName "V3"	= "Verb + obj1 + obj2"
posName "VV"	= "Verb + verb"
posName "VS"	= "Verb + sentence"
posName "V2S"	= "Verb + object + sentence"
posName "V2A"	= "Verb + object + adjective"


a	= cat2funs "AP"
adv	= cat2funs "Adv"
conj	= cat2funs "Conj"
det	= cat2funs "Det"
n	= cat2funs "N"
cn	= cat2funs "CN"
pn	= cat2funs "PN"
prep	= cat2funs "Prep"
v	= cat2funs "V"
v2	= cat2funs "V2"
v3	= cat2funs "V3"
vv	= cat2funs "VV"
vs	= cat2funs "VS"
v2a	= cat2funs "V2A"





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
	


pron = [
	"who"
	, "that"
	, "where"
	, "who"
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
	, "they"
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

{-

a
about	: Prep;
accomplishment	: N2;
achieve	: V2;
achievement	: N2;
active	: A2;
also	: Adv;
and	: Conj;
as	: Prep;
ask	: V2;
assess
at	: Prep;
believe	: V2;
belong	: V2;
big	: AP;
bring	: V2;
but	: Conj;
can	: VV;
community	: N;
concentrate	: V2;
country	: CN;
daily life	: N;
different	: AP;
emotion	: N;
emphasize	: V2;
engagement	: N2;
even when	: Subj;
family	: N;
feel_A	: VA;
feel_N	: V2;
feeling	: CN;
flow state	: CN;
for	: Prep;
forget	: V2;
framework	: N2;
friend	: CN;
give	: V3;
goal	: CN;
happier	: AP;
happiness	: N;
happy	: AP;
have	: V2;
ideology	: N;
important	: A2;
improve	: V2;
in	: Prep;
in the way of	: Prep;
intimacy	: N;
involve	: V2;
just	: Det;
know	: CN;
life	: N;
lots of	: Det;
many	: Det;
meaning	: N;
mean	: V2;
means	: CN;
measure	: V2;
meditation	: N;
mind	: N;
money	: N;
more	: Det;
network	: CN;
never	: Adv;
no	: Det;
nothing	: N;
now	: Adv;
of	: Prep;
often	: Adv;
on	: Prep;
one	: Det;
one_NP	: N;
only	: Adv;
or	: Conj;
other	: AP;
participate	: V2;
person/people	: CN;
person_with	: N2;
philosophy	: N;
physical exercise	: N;
play	: N;
positive	: AP;
presence	: N2;
pursue	: V2;
question	: N2;
relationship	: N2;
religion	: N;
rich	: AP;
school	: N;
seek	: VV;
self	: CN;
sense of achievement	: CN;
serve	: V2;
social	: AP;
social connection	: N;
social group	: CN;
something	: N;
sometimes	: Adv;
state of mind	: CN;
subjective	: AP;
subjectively	: Adv;
Tal Ben-Shahar	: PN;
than	: Prep;
that	: Pron;
they	: Pron;
thing	: CN;
think	: V2;
through	: Prep;
tie	: N2;
to	: Prep;
very	: AdA;
way	: CN;
well-being	: N;
where	: Pron;
who	: Pron;
whole	: CN;
with	: Prep;
work	: N;
you	: Pron;
your	: Pron;




-}

-- vim: set ts=2 sts=2 sw=2 noet:
