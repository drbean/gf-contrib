module WordsCharacters where 

import qualified Data.Map as Map

gfWords = Map.fromList [("A",a),
  -- ("ADV",adv),
  ("Aux",aux),
  -- ("CONJ",conj),
  ("Det",det),
  ("N",n),
  ("PN",pn),
  -- ("Pron",pron),
  ("Prep",prep),
  -- ("Rel",rel),
  ("Tag",tag),
  ("V",v) ]

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
  "and"
  , "if"
  ]


det = [
  "a"
  , "an"
  , "no"
  , "some"
  -- , "that"
  -- , "theirs"
  -- , "these"
  , "the"
  ]

n = [

	]

pn = [


	]

pron = [
	"he"
	, "i"
	, "i'm"
	, "it"
	, "it's"
	, "me"
	, "myself"
	, "they"
	, "us"
	, "we"
	, "you"
	, "you're"
	, "who"
	]

prep = [
	]

rel = [
	"that"
	]

tag = [
	"doesn't he,"
	, "doesn't she,"
	, "doesn't it,"
	, "don't they,"
	, "does he,"
	, "does she,"
	, "does it,"
	, "do they,"
	]

v = [



	]

-- -- vim: set ts=8 sts=2 sw=2 noet:
