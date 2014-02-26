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
	"ambitious"
	, "bad"
	, "competitive"
	, "confident"
	, "difficult"
	, "each"
	, "fast"
	, "few"
	, "five"
	, "good"
	, "hard"
	, "honest"
	, "local"
	, "long"
	, "next"
	, "other"
	, "outgoing"
	, "past"
	, "patient"
	, "Polish"
	, "poor"
	, "possible"
	, "realistic"
	, "safe"
	, "soon"
	, "successful"
	, "true"
	, "unable"
	, "various"


	]

adv = [
	"along"
	, "away"
	, "because"
	, "before"
	, "but"
	, "differently"
	, "down"
	, "ever"
	, "finally"
	, "here"
	, "just"
	, "now"
	, "on"
	, "out"
	, "probably"
	, "so"
	, "then"
	, "there"
	, "too"
	, "well"
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
	"ability"
	, "administration"
	, "aim"
	, "business"
	, "club"
	, "company"
	, "course"
	, "department"
	, "director"
	, "director_2"
	, "effort"
	, "experience"
	, "hand"
	, "head"
	, "job"
	, "judgement"
	, "learner"
	, "lot"
	, "main"
	, "market"
	, "material"
	, "pair"
	, "people"
	, "personality"
	, "polish_N"
	, "respect"
	, "result"
	, "risk"
	, "sales"
	, "share"
	, "system"
	, "team"
	, "term"
	, "thing"
	, "time"
	, "top"
	, "training"
	, "way"
	, "year"

	]

pn = [
	"Barbara"
	, "Tadeusz"
	, "Eva"
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
	"of"
	-- , "about"
	-- , "at"
	-- , "for"
	-- , "from"
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
	]

v = [

	"become"
	, "can"
	, "get"
	, "get_along"
	, "go"
	, "have"
	, "hire"
	, "interview"
	, "know"
	, "laugh"
	, "lift"
	, "like"
	, "look_here"
	, "look"
	, "need"
	, "prove"
	, "say"
	, "see"
	, "slow_down"
	, "start"
	, "take"
	, "tell"
	, "think"
	, "work"

	]

