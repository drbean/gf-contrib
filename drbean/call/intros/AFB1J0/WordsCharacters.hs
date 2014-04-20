
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
  , "difficult"
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
	, "dog"
	, "dogs_and_cats"
	, "dream"
	, "family"
	, "fashion_designer"
	, "father"
	, "friend"
	, "freshman"
	, "graduation"
	, "job"
	, "jobs"
	, "life"
	, "man"
	, "money"
	, "mother"
	, "nephew"
  , "pet"

	, "playing_basketball"
	, "playing_soccer"
	, "dancing"


	, "playing_with_her_nephews"
	, "school"
	, "senior"
	, "sister"
	, "time"
	, "thing"
	, "things"
	, "21"
	, "watching_action_movies"
	, "watching_scary_movies"
	, "way"
	, "woman"
	, "work"
	, "senior"

	]

pn = [
  "Oliver"
  , "Japanese"
  , "Jeremy"
  , "London"
  , "May"
  , "New York"
  , "Tucheng"
  , "Taoyuan"
  , "Taichung"
  , "Minghsin University"
  , "Taiwan"
  , "Hsinchu"
  , "Fast and Furious"
  , "Tucheng"
  , "PingZhen"
  , "Taipei"
  , "London"
  , "New York"
  , "Gucci"
  , "Omo"
  , "Taichung"
  , "YiLan"
  , "Dwyane Wade"

  , "Omo"
  , "Gucci"
  , "Bruce2"
  , "Iris"
  , "Roger"

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
	, "to"
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
	, "call"
	, "can"
	, "come"
	, "go"
	, "have"
	, "like"
	, "live"
	, "say"
	, "study"
	, "think"
	, "want"

	]


-- dog	: N;
-- playing_basketball	: CN;
-- playing_soccer	: N;
-- dancing	: PN;

-- vim: set ts=8 sts=2 sw=2 noet:
