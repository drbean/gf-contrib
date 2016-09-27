module WordsCharacters where

import Data.Char

import PGF
import System.Environment.FindBin

-- path = getProgPath
-- file = path >>= \p -> return ( (++) p "/Happier.pgf")
-- gr = file >>= \f -> return ( readPGF f )
gr = readPGF "/home/drbean/GF/gf-contrib/drbean/conversation/trend/movement/Movement.pgf"

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
actually	: Adv;
all	: Det;
and	: Conj;
as	: Prep;
because	: Conj;
but	: Conj;
care	: V2;
Derek Sivers	: PN;
courage	: N;
credit	: N;
crowd	: CN;
crucial	: AP;
do	: V2;
easy	: A2;
embrace	: V2;
emulate	: V2;
equal	: CN;
everyone	: Pron;
fence	: CN;
find	: V2V;
first	: AP;
five	: Det;
follow	: V;
follower	: CN;
for	: Prep;
get	: V2;
great	: AP;
guts	: CN;
guy	: CN;
how	: Pron;
hurry	: V;
if	: Conj;
important	: AP;
in-crowd	: CN;
into	: Prep;
join in	: V;
just	: Det;
leader	: CN;
less	: Adv;
lone	: AP;
momentum	: N;
more	: AP;
movement	: CN;
must	: VV;
need	: V2V;
new	: AP;
news	: N;
no	: Det;
not	: Predet;
not to	: Prep;
now	: Adv;
nut	: CN;
on	: Prep;
other	: CN;
part	: N2;
people	: CN;
prefer	: V2;
public	: AP;
reason	: N2;
ridicule	: V2;
risky	: AP;
role	: CN;
second	: AP;
shirtless	: AP;
should	: VV;
show	: V3;
show	: V2;
sit	: V2;
something	: Pron;
stand out	: V;
stand up	: V;
start	: V2;
stick	: V2;
talk	: V2;
take	: V2V;
those	: Pron;
three	: Det;
three	: N;
tipping point	: CN;
to	: Prep;
transform	: V3;
two	: Det;
with	: Prep;


-}

-- vim: set ts=2 sts=2 sw=2 noet:
