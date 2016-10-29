module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/news/event/dinner/Dinner.pgf"

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

ago	: Adv;
Al Smith	: PN;
all	: Det;
and	: Conj;
at	: Prep;
before	: Prep;
believe	: VS;
candidate	: CN;
Cardinal Dolan	: PN;
Catholic	: CN;
change	: V2;
charitable	: AP;
clear	: AP;
Clinton	: PN;
despise	: V2;
different	: AP;
dinner	: CN;
dollar	: CN;
each other	: N;
election	: CN;
embarrass	: V2;
event	: CN;
every	: Det;
family	: CN;
for	: Prep;
four	: Det;
go	: V2;
hair	: N;
harsh	: AP;
hate	: V2;
how to	: Prep;
in	: Prep;
keynote speaker	: CN;
last	: AP;
level	: CN;
light-hearted	: AP;
little	: AP;
lose	: V2;
meet	: V;
more than	: Predet;
nasty	: AP;
national	: AP;
national politics	: NP;
need	: VV;
night	: CN;
not to	: Prep;
Obama	: PN;
policy	: CN;
politics	: N;
presidential	: AP;
pretend	: VV;
private	: AP;
public	: AP;
put	: V2A;
raise	: V2;
rarely	: Adv;
redistribute	: V2;
ribbing	: N;
Romney	: PN;
say	: VS;
see	: V2;
shopping	: N;
six million	: Det;
so	: AdA;
some	: Det;
Statue of Liberty	: PN;
store	: CN;
suppose	: V2V;
think	: VS;
time	: CN;
to	: Prep;
together	: AP;
too	: AdA;
torch	: CN;
totally	: AdA;
Trump	: PN;
understand	: V2;
vital	: AP;
wealth	: N;
which
wonder	: VQ;
year	: CN;


-}

-- vim: set ts=2 sts=2 sw=2 noet:
