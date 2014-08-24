module Story_Interpretation where 

import Model
import Candidate

import Data.Maybe

unmay1 :: Maybe (Entity -> Bool) -> Entity -> Bool
unmay1 = fromMaybe (\_ -> False)

unmay2 :: Maybe (Entity -> Entity -> Bool) -> Entity -> Entity -> Bool
unmay2 = fromMaybe (\_ _ -> False)

unmay3 :: Maybe (Entity -> Entity -> Entity -> Bool) -> Entity -> Entity -> Entity -> Bool
unmay3 = fromMaybe (\_ _ _ -> False)

unmay4 :: Maybe (Entity -> Entity -> Entity -> Entity -> Bool) -> Entity -> Entity -> Entity -> Entity -> Bool
unmay4 = fromMaybe (\_ _ _ _ -> False)

objects = [

	( "ability",	\[x]	-> predid1 "ability" x	)
	, ( "administration",	\[x]	-> predid1 "administration" x	)
	, ( "aim",	\[x]	-> predid1 "aim" x	)
	, ( "business",	\[x]	-> predid1 "business" x	)
	, ( "club",	\[x]	-> predid1 "club" x	)
	, ( "company",	\[x]	-> predid1 "company" x	)
	, ( "course",	\[x]	-> predid1 "course" x	)
	, ( "department",	\[x]	-> predid1 "department" x	)
	, ( "director",	\[x]	-> predid1 "director" x	)
	, ( "effort",	\[x]	-> predid1 "effort" x	)
	, ( "experience",	\[x]	-> predid1 "experience" x	)
	, ( "hand",	\[x]	-> predid1 "hand" x	)
	, ( "head",	\[x]	-> predid1 "head" x	)
	, ( "job",	\[x]	-> predid1 "job" x	)
	, ( "judgement",	\[x]	-> predid1 "judgement" x	)
	, ( "learner",	\[x]	-> predid1 "learner" x	)
	, ( "lot",	\[x]	-> predid1 "lot" x	)
	, ( "main",	\[x]	-> predid1 "main" x	)
	, ( "market",	\[x]	-> predid1 "market" x	)
	, ( "material",	\[x]	-> predid1 "material" x	)
	, ( "pair",	\[x]	-> predid1 "pair" x	)
	, ( "people",	\[x]	-> predid1 "people" x	)
	, ( "personality",	\[x]	-> predid1 "personality" x	)
	, ( "Polish",	\[x]	-> predid1 "polish" x	)
	, ( "respect",	\[x]	-> predid1 "respect" x	)
	, ( "result",	\[x]	-> predid1 "result" x	)
	, ( "risk",	\[x]	-> predid1 "risk" x	)
	, ( "share",	\[x]	-> predid1 "share" x	)
	, ( "system",	\[x]	-> predid1 "system" x	)
	, ( "team",	\[x]	-> predid1 "team" x	)
	, ( "term",	\[x]	-> predid1 "term" x	)
	, ( "thing",	\[x]	-> predid1 "thing" x	)
	, ( "time",	\[x]	-> predid1 "time" x	)
	, ( "top",	\[x]	-> predid1 "top" x	)
	, ( "training",	\[x]	-> predid1 "training" x	)
	, ( "way",	\[x]	-> predid1 "way" x	)
	, ( "year",	\[x]	-> predid1 "year" x	)




	, ( "woman",	\[x]	-> predid1 "woman" x	)
	, ( "man",	\[x]	-> predid1 "man" x	)

	]

inflections = [
	( "children",	"child")
	, ( "good judgement",	"judgement")
	]

relations = [
	( "bad",	\[x]	-> predid1 "bad" x	)
	, ( "better",	\[x]	-> predid1 "better" x	)
	, ( "first",	\[x]	-> predid1 "first" x	)
	, ( "hard",	\[x]	-> predid1 "hard" x	)
	, ( "little",	\[x]	-> predid1 "little" x	)
	, ( "mad",	\[x]	-> predid1 "mad" x	)

	, ( "ambitious",	\[x]	-> predid1 "ambitious" x	)
	, ( "competitive",	\[x]	-> predid1 "competitive" x	)
	, ( "confident",	\[x]	-> predid1 "confident" x	)
	, ( "difficult",	\[x]	-> predid1 "difficult" x	)
	, ( "experienced",	\[x]	-> predid1 "experienced" x	)
	, ( "judgement",	\[x]	-> predid1 "judgement" x	)


	, ( "fast",	\[x]	-> predid1 "fast" x	)
	, ( "hard",	\[x]	-> predid1 "hard" x	)
	, ( "honest",	\[x]	-> predid1 "honest" x	)
	, ( "local",	\[x]	-> predid1 "local" x	)
	, ( "outgoing",	\[x]	-> predid1 "outgoing" x	)
	, ( "patient",	\[x]	-> predid1 "patient" x	)
	, ( "poor",	\[x]	-> predid1 "poor" x	)
	, ( "realistic",	\[x]	-> predid1 "realistic" x	)
	, ( "successful",	\[x]	-> predid1 "successful" x	)



	, ( "laugh",	\[x] -> predid1 "laugh" x	)
	, ( "know",	\args -> case args of
				[x,y]	-> predid2 "know" y x
				[x]	-> (forgetful2 . predid2) "know" x	)
	, ( "like",	\[x, y]	-> predid2 "like" y x	)
	, ( "look_here",	\[x]	-> predid1 "look_here" x	)
	, ( "slow_down",	\[x]	-> predid1 "slow_down" x	)

	]


