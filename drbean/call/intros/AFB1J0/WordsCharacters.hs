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
	"bad"
	, "better"
	, "first"
	, "little"
	, "mad"
	, "slow"
	, "hard"

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
	"'s"
	, "a"
	, "an"
	, "my"
	, "no"
	, "some"
	, "that"
	, "theirs"
	, "these"
	, "the"
	]

n = [
	"apprentice"
	, "child"
	, "children"
	, "dad"
	, "electrician"
	, "end"
	, "families"
	, "family"
	, "father"
	, "graduation"
	, "guy"
	, "guys"
	, "job"
	, "jobs"
	, "kind"
	, "knack"
	, "life"
	, "man"
	, "men"
	, "men's"
	, "money"
	, "night"
	, "nights"
	, "position"
	, "raise"
	, "school"
	, "ship"
	, "shipyard"
	, "stuff"
	, "superintendent"
	, "supervisor"
	, "thing"
	, "things"
	, "time"
	, "top"
	, "transformer"
	, "transformers"
	, "uncle"
	, "way"
	, "week"
	, "weeks"
	, "woman"
	, "word"
	, "work"
	]

pn = [
	"Alf"
	, "Dee"
	, "Monday"
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
	"are"
	, "be"
	-- , "been"
	, "become"
	, "can"
	-- , "couldn't"
	, "does"
	, "doesn't"
	-- , "did"
	-- , "didn't"
	, "do"
	-- , "doing"
	-- , "done"
	, "don't"
	, "find"
	-- , "found"
	, "get"
	-- , "getting"
	, "go"
	-- , "got"
	-- , "had"
	, "has"
	, "have"
	, "hire"
	-- , "hired"
	, "interview"
	, "is"
	, "know"
	, "laugh"
	-- , "let"
	, "lift"
	, "like"
	, "look"
	-- , "made"
	, "make"
	-- , "making"
	, "need"
	-- , "needed"
	, "prove"
	-- , "proving"
	, "say"
	-- , "said"
	, "see"
	, "start"
	-- , "started"
	, "take"
	-- , "taking"
	, "think"
	-- , "thought"
	, "tell"
	-- , "told"
	-- , "took"
	-- , "was"
	-- , "went"
	-- , "were"
	-- , "would"
	-- , "wouldn't"
	]

