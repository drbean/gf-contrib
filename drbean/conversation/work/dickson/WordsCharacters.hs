module WordsCharacters where 

import qualified Data.Map as Map

gfWords = Map.fromList [("A",a), ("ADV",adv), ("CONJ",conj), ("Det",det), ("N",n), ("PN",pn), ("Pron",pron), ("Prep",prep), ("Rel",rel), ("V",v) ]
wordlist = concat ( map (gfWords Map.!) (Map.keys gfWords) )
posMap = Map.fromList [
	("A","Adjective")
	, ("ADV","Adverb")
	, ("CONJ","Conjunction")
	, ("Det","Determiner")
	, ("N","Noun")
	, ("PN","Proper Noun")
	, ("Pron","Pronoun")
	, ("Prep","Preposition")
	, ("Rel","Relative Pronoun")
	, ("V","Verb")
	]

a = [
	"bad",
	, "better"
	, "first"
	, "little"
	, "mad"
	, "next"
	, "none"
	, "several"
	, "slow"
	, "two"
	, "hard"
	, "right"
	, "same"

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

conj = [
	"and"
	, "if"


det = [
	"a",
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
	, "dad"
	, "80"
	, "end"
	, "families."
	, "family"
	, "graduation"
	, "guy"
	, "guys"
	, "jobs"
	, "kind"
	, "knack"
	, "life"
	, "man"
	, "men"
	, "men's"
	, "monday"
	, "money"
	, "nights"
	, "position"
	, "pound"
	, "raise"
	, "school"
	, "ship"
	, "stuff"
	, "superintendent"
	, "supervisor"
	, "things"
	, "time"
	, "top"
	, "transformer"
	, "uncle"
	, "way"
	, "week"
	, "weeks"
	, "word"
	, "work"
	]

pn = [
	"alf"
	, "dee"
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

prep = [
	"about"
	, "at"
	, "for"
	, "from"
	, "like"
	, "of"
	, "than"
	, "to"
	, "with"
]

rel = [
	"that"
	]

v = [
	"are"
	, "be"
	, "been"
	, "become"
	, "can"
	, "couldn't"
	, "did"
	, "didn't"
	, "do"
	, "doing"
	, "done"
	, "don't"
	, "found"
	, "get"
	, "getting"
	, "go"
	, "got"
	, "had"
	, "have"
	, "hired."
	, "interviewing"
	, "is"
	, "know"
	, "laughs"
	, "let"
	, "lift"
	, "like"
	, "look"
	, "made"
	, "make"
	, "making"
	, "need"
	, "needed"
	, "proving"
	, "said"
	, "see"
	, "started"
	, "take"
	, "taking"
	, "think"
	, "thought"
	, "told"
	, "took"
	, "was"
	, "went"
	, "were"
	, "would"
	, "wouldn't"
	]

