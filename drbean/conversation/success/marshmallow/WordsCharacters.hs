module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/business/conflict/communication/Marshmallow.pgf"

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


100 percent
ability	: CN;
after	: Subj;
alone	: Adv;
already	: AdV;
and	: Conj;
as soon as	: Subj;
at	: Prep;
bad	: AP;
child	: CN;
close	: V2;
college	: N;
delay	: V2;
door	: CN;
drop out	: V;
eat	: V2;
factor	: N2;
factor_for	: N2;
a few	: CN;
fifteen	: Det;
find	: VS;
follow-up	: AP;
for	: Prep;
four	: AP;
fourteen	: Det;
fourteen-and-a-half	: Det;
get	: V2;
good	: AP;
grade	: CN;
gratification	: N;
great	: AP;
happy	: AP;
have	: V2;
if	: Subj;
important	: AP;
in	: Prep;
kid	: CN;
last	: V2;
later	: Prep;
leave	: V3;
look	: V2;
make_it	: V2;
marshmallow	: CN;
minute	: CN;
most	: AdA;
one	: Det;
or	: Conj;
out of	: Prep;
pants	: CN;
percentage	: N2;
plan	: CN;
play	: V2;
principle	: N2;
professor	: CN;
relationship	: N2;
return	: V;
room	: CN;
school	: PlaceNoun;
self-discipline	: N;
skirt	: CN;
still	: Adv;
student	: CN;
study	: CN;
success	: N;
successful	: AP;
teacher	: CN;
tell	: V2S;
there	: Adv;
three	: Det;
to	: Prep;
in trouble	: Adv;
two	: Det;
understand	: V2;
with	: Prep;
year	: CN;


-}

-- vim: set ts=2 sts=2 sw=2 noet:
