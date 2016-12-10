module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/conversation/shopping/marketing/Marketing.pgf"

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


airline	: CN;
album	: CN;
altruistic	: AP;
and	: Conj;
Anthon Berg	: PN;
ask	: V2V;
base	: V3;
Brazilian	: AP;
build	: V2;
buy	: V2;
can	: VV;
chocolate	: AP;
chocolate_N	: N;
clothing	: AP;
collaborate	: V2;
company	: CN;
complete	: V2;
connect	: V2;
consumer	: CN;
control	: N2;
creation	: N2;
customer	: CN;
day	: CN;
good deed	: N2;
design	: CN;
design	: AP;
destination	: CN;
Dutch	: AP;
each other	: Pron;
employee	: CN;
en route to	: Prep;
even	: Det;
fast	: Adv;
frog	: PN;
get	: VV;
gift	: CN;
give	: V3;
hand out	: V;
have	: V2V;
help	: V2V;
hold	: V2;
idea	: CN;
increase	: V2;
internal	: AP;
jacket	: CN;
KLM	: PN;
know	: V2;
last	: AP;
less	: Det;
let	: V2V;
long-term	: AP;
loved one	: CN;
loyalty	: N;
moment	: CN;
more	: Det;
new	: AP;
Nextpedition	: PN;
occasional	: AP;
old	: AP;
on	: Prep;
or	: Conj;
over	: Prep;
overall	: AP;
own	: AP;
Patagonia	: PN;
pricing	: N2;
productivity	: N;
product	: CN;
promise	: N2;
purchase	: V2;
Radiohead	: PN;
randomly	: AdV;
recent	: AP;
salary	: CN;
work schedule	: CN;
Semco Group	: PN;
sense	: N2;
service	: N2;
session	: CN;
set	: V2;
shared	: AP;
small	: AP;
speed-meet	: AP;
study	: CN;
suggest	: VS;
task	: CN;
tell	: V3;
throughout	: Prep;
to	: Prep;
towards	: Prep;
travel	: AP;
traveler	: CN;
until	: Prep;
value	: CN;
with	: Prep;



-}

-- vim: set ts=2 sts=2 sw=2 noet:
