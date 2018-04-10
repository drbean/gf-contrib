module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/conversation/environment/pollution/Pollution.pgf"

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
accelerate	: V2;
acid rain	: N;
against : Prep;
air	: N;
air pollution	: N;
amount	: N2;
and	: Conj;
Andy	: PN;
areas	: CN;
ask	: VQ;
at	: Prep;
Avox	: AP;
Avox Industries	: PN;
bad	: AP;
bird	: CN;
building	: CN;
Carla	: PN;
change	: V2;
chemical	: CN;
company	: CN;
contaminate	: V2;
dead	: AP;
destruction	: N;
do	: V2;
eat up	: V;
environmental	: AP;
environment	: CN;
erode	: V2;
extinction	: N;
factory	: CN;
farm	: CN;
farmland	: N;
fish	: CN;
rain forest	: CN;
get	: V2V;
growth	: N2;
happen	: V;
harm	: V2;
hate	: V2;
health	: N2;
huge	: AP;
if	: Subj;
ignore	: V2;
in	: Prep;
into	: Prep;
kill	: V2;
law	: CN;
livestock farm	: CN;
a lot of	: Det;
management	: N;
marine life	: N;
oil spill	: CN;
on	: Prep;
one	: Det;
other	: AP;
outside	: Prep;
plant	: CN;
pollute	: V2;
pollution	: N;
publicity	: N;
pump	: V3;
river	: CN;
run	: V2;
say	: VS;
see	: V2;
soil	: N;
statue	: CN;
story	: CN;
suburb	: CN;
talk	: V2;
terrible	: AP;
think	: VS;
threaten	: V2;
to	: Prep;
top executive	: CN;
town	: N;
TV station	: CN;
uncle	: CN;
underground	: AP;
urban	: AP;
water	: N;
water pollution	: N;
way	: N2;
wildlife	: N;
work	: V;

-}

-- vim: set ts=2 sts=2 sw=2 noet:
