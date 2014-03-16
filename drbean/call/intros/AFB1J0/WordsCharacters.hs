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
  "cute"
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
	"'s"
	, "a"
	, "an"
	, "no"
	, "some"
	, "that"
	, "the"
	]

n = [
	"child"
	, "children"
	, "brother"
	, "dream"
	, "family"
	, "fashion_designer"
	, "father"
	, "graduation"
	, "job"
	, "jobs"
	, "life"
	, "man"
	, "money"
	, "mother"
	, "nephew"
	, "school"
	, "sister"
	, "time"
	, "thing"
	, "things"
	, "way"
	, "woman"
	, "work"

	]

pn = [
	"Oliver"
	, "Jeremy"
	, "May"
	]

pron = [
	]

prep = [
	"of"
	-- , "about"
	-- , "at"
	-- , "for"
	, "from"
	-- , "like"
	-- , "than"
	-- , "to"
	-- , "with"
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
	, "isn't he,"
	, "isn't she,"
	, "isn't it,"
	, "aren't they,"
	, "is he,"
	, "is she,"
	, "is it,"
	, "are they,"
	]

v = [
	"are"
	, "be"
	, "become"
	, "can"
	, "come"
	, "comes"
	, "has"
	, "have"
	, "like"
	, "likes"
	, "want"
	, "wants"

	]

-- vim: set ts=8 sts=2 sw=2 noet:
