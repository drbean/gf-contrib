module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/conversation/improvement/personal/Personal.pgf"

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


about	: Prep;
activity	: CN;
anxiety	: N;
best	: AP;
bad	: AP;
before	: Prep;
birthday	: CN;
bite	: V2;
book	: CN;
busy	: AP;
but	: Conj;
cause	: V2;
club	: CN;
consultant	: CN;
day	: CN;
device	: CN;
different	: AP;
do	: V2;
electronic	: AP;
everything	: N;
expensive	: AP;
feel	: VS;
few	: AP;
find	: V2;
find out	: V;
fingernail	: CN;
finger	: CN;
first	: AP;
for	: Prep;
from	: Prep;
get	: V2;
get_done	: V2V;
go	: VV;
good	: AP;
habit	: CN;
help	: V2V;
help	: N;
hour	: CN;
idea	: CN;
in	: Prep;
into	: Prep;
investment	: N2;
join	: V2;
like	: Prep;
list	: CN;
life	: CN;
make_V2	: V2;
make_V2V	: V2V;
make_V2A	: V2A;
man	: CN;
meet	: V2;
might	: VV;
nail	: CN;
nailbiter	: CN;
nail polish	: N;
need	: VV;
nervous	: AP;
on	: Prep;
one	: Det;
only	: AP;
organize	: V2;
polish	: N;
prioritize	: V2;
problem	: CN;
professional	: AP;
program	: V2;
quit	: V2;
red	: AP;
remember	: V2;
reminder	: CN;
say	: VS;
schedule	: CN;
second	: AP;
self-help	: N;
send	: V2;
should	: VV;
shy	: AP;
sign	: N2;
sister	: CN;
something else	: N;
start	: VV;
stress out	: V;
suggestion	: CN;
talk	: V2;
tap	: V2;
thing	: N2;
think_VS	: VS;
think	: V2V;
time management	: N;
to	: Prep;
too	: Adv;
transfer	: V3;
try	: V2;
use	: V2;
way	: CN;
wear	: V2;
what
what's
when
where
which
who
woman	: CN;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
