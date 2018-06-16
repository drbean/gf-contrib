module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/conversation/identity/trigger/Trigger.pgf"

cat2funs :: String -> IO [CId]
cat2funs cat = do
	gr' <- gr
	let fs = functionsByCat gr' (mkCId cat)
	let ws = filter (isLower . head . showCId) fs
	let is = map (reverse . dropWhile (\x ->  (==) x '_' || isUpper x || isNumber x) . reverse .showCId ) ws
	return (map mkCId is )

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
	, ("Pron",pron)
	, ("Prep",prep)
	-- , ("Rel",rel)
	, ("Tag",tag)
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
pron	= cat2funs "NP"
v	= cat2funs "V"
v2	= cat2funs "V2"
v3	= cat2funs "V3"
vv	= cat2funs "VV"
vs	= cat2funs "VS"
v2a	= cat2funs "V2A"
tag = return ( map mkCId tags )





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
	

rel = [


	]

tags = [
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


18	: AP;
about	: Prep;
actually	: AdA;
after	: Prep;
Alex	: PN;
all	: Predet;
always	: Adv;
amazing	: AP;
another	: Det;
at	: Prep;
backpacking	: N;
became	: VA;
both	: Predet;
breakthrough	: AP;
bring	: V2;
brother	: CN;
by	: Prep;
capable	: A2;
choice	: CN;
close	: AP;
college	: N;
college	: CN;
communicate	: V2;
confident	: AP;
cope	: V;
could	: VV;
Debbie	: PN;
determined	: A2;
diet	: V;
different	: AP;
differently	: Adv;
difficult	: AP;
discover	: VS;
dumbest	: AP;
eat	: V2;
envious	: AP;
Europe	: PN;
ever	: AdV;
exercise	: V;
experience	: N;
few	: AP;
first	: AP;
for_THEMEPREP	: ThemePrep;
for_TIMEPREP	: TimePrep;
for_STIMULUSPREP	: StimulusPrep;
forever	: Adv;
find	: VS;
friends	: CN;
get_A	: VA;
get_NP	: V2;
go	: V;
good	: AP;
graduate	: V;
guess	: VS;
guitar	: CN;
gym	: CN;
healthy	: AP;
Henry	: PN;
herself
in_LOCPREP	: LocPrep;
in_TIMEPREP	: TimePrep;
independent
Jacob	: PN;
job	: CN;
join	: V2;
junk food	: N;
just	: AdV;
kid	: CN;
language	: CN;
last	: AP;
learn	: VV;
look	: V2;
look	: V2;
lose	: V2;
a lot 	: AdV;
love	: V2;
make	: V2V;
more	: AdA;
not even with_RECIPIENTPREP	: RecipientPrep;
now	: Adv_time;
on own
out
outgoing
parents
party
people
piano
play
playing
point
pretty
prize
proud
quit
reached
realized
really
regrets
right away
Sally
school
share
she
She
should
shy
sing
some
songs
Spanish
speak
sports
stage--when
started
stopped
student
study
suddenly
summer
that
That
the
their
they
thin
thing
things
think
thinks
thought
three
time
to
together
too much
top
treating
trying
turning
twin
unforgettable
up to_STIMULUSPREP	: StimulusPrep;
very
was
way
weeks
weight
went
Whe
when
When
who
wishes
with
without
working
would
year and a half
YiYun


-}

-- vim: set ts=2 sts=2 sw=2 noet:
