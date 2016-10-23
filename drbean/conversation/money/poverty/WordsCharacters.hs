module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/conversation/money/poverty/Poverty.pgf"

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

400	: Det;
50	: Det;
about	: Prep;
AIDS	: N;
and	: Conj;
before	: Subj;
blessed	: A2;
borrow	: V2;
build	: V2;
business	: N;
but	: Conj;
buy	: V2;
by	: Prep;
child	: CN;
counsel	: V2;
daughter	: CN;
dead	: AP;
definition	: CN;
housing development	: CN;
die	: V;
do	: V2;
doctor	: CN;
dollar	: N2;
dream	: CN;
eighteen	: AP;
everything	: N;
feel	: VA;
first	: AP;
for	: Prep;
frills and ribbons	: N;
get	: VA;
give	: V2;
good	: AP;
ball gown	: CN;
have to	: VV;
hear	: V2;
husband	: CN;
in	: Prep;
into	: Prep;
Jamii Bora	: PN;
Jane	: PN;
leave	: V2;
lend	: V3;
lend_to	: V3;
live in	: V2;
low-cost	: AP;
man	: CN;
many	: Det;
married	: AP;
marry	: V2;
match	: V3;
Mathare Valley	: PN;
Mathare Valley_PLACE	: Place;
mom	: CN;
money	: N;
mortgage	: CN;
move	: V2;
Nairobi	: Place;
no longer	: Adv;
no matter how	: IAdv;
not	: Adv;
old	: AP;
or	: Conj;
organization	: CN;
outside	: Prep;
over	: Prep;
pay	: V2;
patient	: CN;
person	: CN;
percent	: N2;
poor	: AP;
really	: Adv;
rent	: N;
repurpose	: V2;
save	: V2;
savings	: N;
say	: VS;
second	: AP;
sell	: V3;
serve	: V;
sewing machine	: CN;
shanty	: CN;
so	: Adv;
spend	: V2V;
start	: V2;
still	: Adv;
tell	: V2S;
ten	: Det;
then	: Adv;
time	: N;
to	: Prep;
total	: AP;
twenty-one	: N;
two	: Det;
value	: CN;
with	: Prep;
woman	: CN;
year	: CN;


-}

-- vim: set ts=2 sts=2 sw=2 noet:
