module WordsCharacters where 

import qualified Data.Map as Map

gfWords = Map.fromList [
	("A",a)
	, ("ADV",adv)
	, ("Aux",aux)
	, ("CONJ",conj)
	, ("Det",det)
	, ("N",n)
	, ("PN",pn)
	, ("Pron",pron)
	, ("Prep",prep)
	, ("Rel",rel)
	, ("Tag",tag)
	, ("V",v) ]

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
	"80-pound"
	, "at the shipyard"
	, "bad"
	, "good, better"
	, "hard"
	, "little"
	, "mad"
	, "same"
	, "slow"
	, "too little"

	]

adv = [
	"a little"
	, "a week"
	, "at the shipyard"
	, "differently"
	, "ever"
	, "on time"
	, "right"
	, "the next Monday"
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
	"because"
	]


det = [
	"'s"
	, "a"
	, "about"
	, "an"
	, "no"
	, "some"
	, "several"
	, "the"
	, "the first"
	, "two"
	]

n = [
	"apprentice"
	, "electrician"
	, "family, families"
	, "father"
	, "graduation"
	, "guy, guys"
	, "interviewer"
	, "job, jobs"
	-- , "knack"
	, "life"
	, "man, men, man's"
	, "money"
	, "night, nights"
	, "position"
	, "raise"
	, "school"
	, "ship"
	, "shipyard"
	, "stuff"
	, "superintendent"
	, "supervisor"
	, "thing, things"
	, "time"
	, "transformer"
	, "uncle"
	, "way"
	, "week, weeks"
	, "woman"
	, "work"
	]

pn = [
	"Uncle Alf"
	, "Dee"
	]

pron = [
	"who"
	, "whom"
	, "she"
	, "her"
	, "herself"
	]

prep = [
	"along with"
	, "as"
	-- , "at"
	, "before"
	, "for"
	, "from"
	, "of"
	, "than"
	, "to"
	, "with"
	]

rel = [
	"that"
	, "who"
	]

tag = [
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

v = [
	"be, is, are"
	, "become, becomes"
	, "can, can't, cannot"
	-- , "couldn't"
	, "do, does, done"
	, "find, finds"
	, "get, gets, gotten"
	, "go, goes"
	, "has, have"
	, "hire, hires, hired"
	, "interview, interviews, interviewed"
	, "know, knows, known"
	, "laugh, laughs"
	, "let, lets"
	, "lift, lifts, lifted"
	, "like, likes, liked"
	, "look bad, looks bad"
	, "make, makes, made"
	, "need, needs, needed"
	, "prove, proves, proving"
	, "say, says"
	, "see, sees"
	, "start, starts"
	, "take, takes, taken"
	, "think, thinks"
	, "tell, tells, told"
	, "want, wants"
	, "work, works"
	]

-- vim: set ts=2 sts=2 sw=2 noet:
