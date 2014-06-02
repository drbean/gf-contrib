module Tests where

import Control.Monad

import PGF
import Trinka
import LogicalForm
import Evaluation
import Model
import WordsCharacters

import Data.List
import Data.Char

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "TrinkaEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Trinka.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map ( map ( linear transform gr ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ concat y)) zs) )

--trans tests = do
--  gr	<- readPGF ( "./Trinka.pgf" )
--  let ss = map (chomp . lc_first) tests
--  let ps = map ( parses gr ) ss
--  let ls = map id ps
--  let zs = zip (map (++"\t") tests) ps
--  putStrLn (unlines (map (\(x,y) -> x ++ (show (concat y ) ) ) zs) )

logic tests = do
  gr	<- readPGF ( "./Trinka.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (map lf)) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ concat y ) ) zs) )

parses :: PGF -> String -> [[Tree]]
parses gr s = ( parseAll gr (startCat gr) s )

transform :: Tree -> Tree
transform = gf . answer . fg

lf :: Tree -> LF
lf =  transS . fg

answer :: GUtt -> GUtt
-- answer (GUt (GPosQ (GWH_Cop Gwho_WH np)))	= (GUt (GNegQ (GTagQ np (GHappening Glaugh))))
-- answer (GUt (GPosQ (GWH_Pred Gwho_WH (GChanging v np)))) = (GUt (GNegQ (GTagQ np (GHappening Glaugh))))
-- answer (GUt (GPosQ (GWH_Pred Gwho_WH (GHappening vp)))) = Gdee
-- answer (GUt (GPosQ (GYN (GCop np1 np2))))  = np1
answer utt	| (eval . transS) utt == Boolean True = GYes
		| (eval . transS) utt == Boolean False = GNo
		| (eval . transS) utt == NoAnswer = GNoAnswer

linear :: (Tree -> Tree) -> PGF -> [Tree] -> [ String ]
linear tr gr ps = concat $ map ((linearizeAll gr) . tr) ps

lc_first :: String -> String
lc_first str@(s:ss) = case ( or $ map (flip isPrefixOf str) ["Debra Goodman", "Ed Trinka"] ) of
	True  -> (s:ss)
	False -> ((toLower s):ss)

chomp :: String -> String
chomp []                      = []
-- chomp ('\'':'s':xs)           = " 's" ++ chomp xs
-- chomp ('s':'\'':xs)           = "s 's" ++ chomp xs
chomp (x:xs) | x `elem` ".,?" = chomp xs
            | otherwise      =     x:chomp xs

likes_test = [
  "Does Ed Trinka like the job?"
  , "No guys like Ed Trinka, do they?"
  , "No guys like to work with Ed Trinka, do they?"

  ]

needs_test  = [
  "Ed Trinka needs money, doesn't he?"
  , "Ed Trinka needs to slow down, doesn't he?"
  ]

working_test = [

	"Does Ed Trinka work?"
	, "Does Ed Trinka have work?"
	, "Does Ed Trinka have a job?"
	, "Who works?"
	, "Who has work?"
	, "Who has a job?"
	, "Ed Trinka works, doesn't he?"
	, "Ed Trinka has work, doesn't he?"
	, "Ed Trinka has a job, doesn't he?"
	, "Does Ed Trinka work as an doorman?"
	, "Is Ed Trinka an doorman?"
	]

tag_test = [
  "Ed Trinka is an doorman, isn't he?"
  , "Ed Trinka isn't an doorman, is he?"
  ]

test_text = [
	"Ed Trinka's son spoke English.",
	"Ed Trinka's son's brother spoke English.",
	"Ed Trinka's son had a brother and a brother spoke English.",
	"Ed Trinka's son knew English and the interviewer spoke English.",
	"Ed Trinka's son spoke English but the interviewer doesn't speak English.",
	"Ed Trinka's son talked to the interviewer and the interviewer talked to Dee's son's father.",
	"Ed Trinka's son talked to the interviewer and the interviewer talked to Dee's son's father " ++
		"and Ed Trinka's son's father talked to Dee's son.",
	"Ed Trinka's son's brother looked back on Dee's son's upbringing. \
	\Ed Trinka's son talked to the interviewer. \
	\Ed Trinka's son asked the interviewer about Vietnam."
	]

alf_test = [
 "Does the uncle of the father of Ed Trinka have work?"
 , "Is the uncle of the father of Ed Trinka Debra Goodman?"
 ]

test_possessives = [
  "Is Ed Trinka Dee's job?"
  , "Is Ed Trinka's job Dee?"
  , "Ed Trinka's job is good, isn't it?"
  , "Is Ed Trinka's job good?"
  , "Is Ed Trinka's job a job?"
  , "Is Ed Trinka's job the job?"
  , "Is Ed Trinka's job Dee?"
  , "Is Ed Trinka Dee's job"
  , "Is Ed Trinka's lob Dee?"
  , "Is Ed Trinka's job Dee's job?"
  , "Is Ed Trinka's job Dee's father?"
  , "Is Ed Trinka's job Dee's father"
  , "Is Ed Trinka Dee's job"
  , "Is Ed Trinka's job Dee"
  , "Is Ed Trinka's uncle a superintendent?"
  , "Is Ed Trinka's uncle Debra Goodman?"
  , "Is Ed Trinka's father's uncle a superintendent?"
  , "Is the uncle of Ed Trinka's father a superintendent?"
  , "Is the uncle of the father of Ed Trinka a superintendent?"
  , "Is Ed Trinka's father's uncle Debra Goodman?"
  , "Is the uncle of Ed Trinka's father Debra Goodman?"
  , "Is the uncle of the father of Ed Trinka Debra Goodman?"
  , "Is the father of Ed Trinka a man?"
  , "Is Ed Trinka's father a man?"
  , "Does Ed Trinka's father have children?"
	, "Does Ed Trinka's son's father work."
	, "Ed Trinka's son's father works on Dee's son's upbringing, doesn't he."
	, "Does Ed Trinka's son's father work on Dee's son's upbringing?"
	, "Does Ed Trinka's son's brother work on Dee's son's upbringing?"
	, "Does Ed Trinka's son's father speak English?"
	, "Does Ed Trinka's son's brother speak English?"
	, "Does Ed Trinka's son's brother know English?"
	, "Does Ed Trinka's son's mother speak English?"
	, "Does Ed Trinka's son's mother speak English?"
	, "Does the sister of Ed Trinka's son know English?"
	, "Does the father of Ed Trinka's son work on Dee's son's upbringing?"
	, "Does the brother of Ed Trinka's son work on Dee's son's upbringing?"
	, "Does the mother of Ed Trinka's son speak English?"
	, "Does the father of Ed Trinka's son speak English?"
	, "Does the brother of Ed Trinka's son speak English?"
	, "Does the mother of Ed Trinka's son speak English?"
	, "Does the brother of Ed Trinka's son know English?"
	, "Does the sister of Ed Trinka's son know English?"
	]

child_test = [
  "Is Ed Trinka a child?"
  , "Is the interviewer a child?"
  , "Does Ed Trinka have a mother?"
  , "Does Ed Trinka have a son?"
  , "Does Ed Trinka have a daughter?"
  , "Does Ed Trinka's father have children?"
  , "Does the father of Ed Trinka have children?"
  ] 

becoming_test = [
  "Does Ed Trinka become a supervisor?"
  , "Does Ed Trinka become Dee?"
  , "Does Ed Trinka become an doorman?"
  , "Does Ed Trinka become an apprentice?"
  , "Does Ed Trinka become a worker?"
  , "Does Ed Trinka become a superintendent?"
  , "Does Debra Goodman become a superintendent?"
  , "Is Debra Goodman a superintendent?"
  ]

supervisor_test = [
  "Is Ed Trinka a supervisor?"
  , "Does Ed Trinka become a supervisor?"
  , "Is Debra Goodman a supervisor?"
  , "Is the interviewer a supervisor?"
  , "Is the superintendent a supervisor?"
  ]

lifting_test = [
  "Can Ed Trinka lift a transformer?"
  , "Can some guys lift a transformer?"
  , "Can the guys lift a transformer?"
  ]

going_test = [
  "Does Ed Trinka go to the ship?"
  , "Does Ed Trinka go to school?"
  ]

positing_test = [
  "Does the guy think that Ed Trinka is little?"
  , "Does a guy think that Ed Trinka is little?"
  , "Does the interviewer think that Ed Trinka is little?"
  , "Is Ed Trinka little?"
  , "Does the interviewer say that Ed Trinka is little?"
  , "Does the interviewer know that Ed Trinka is little?"
  , "Does the interviewer know that Ed Trinka is the interviewer?"
  , "Does Ed Trinka's father say that Debra Goodman is the superintendent?"
  , "Does the father of Ed Trinka say that Debra Goodman is the superintendent?"
  , "Does Ed Trinka know that Debra Goodman is the superintendent?"
  , "Does the interviewer know that Debra Goodman is the superintendent?"
  , "The guys say that Ed Trinka needs to slow down, don't they?"
  , "The guys say that Ed Trinka needs to laugh, don't they?"
  ]

interview_test = [
  "Does the interviewer interview Ed Trinka?"
  , "Does the interviewer work."
  , "Do the interviewer's children work."
  , "Does the interviewer's family work on Ed Trinka's son's upbringing."
  -- , "the interviewer's daughter work on the interviewer's daughter's upbringing."
  , "the interviewer's daughter appreciated Ed Trinka's son's father."
  , "Ed Trinka's son's father  appreciated the interviewer's daughter."
  , "Does the interviewer have a job?"
  , "The interviewer has a job, doesn't he?"
  , "Does the interviewer have Ed Trinka's son?"
  , "Does the interviewer have a mother?"
  , "Does the interviewer have a son?"
  , "Does the interviewer have a daughter?"
  , "Does the interviewer have ships?"
  , "Does the interviewer have some ships?"
  , "Does the interviewer's daughter have some ships?"
  , "Does the interviewer's daughter have a ship?"
  , "Does the interviewer have money?"
  , "Does the interviewer have a parent?"
  , "Does the interviewer have some parents?"
  , "Does the interviewer have parents?"
  , "Does the interviewer have a boat?"
  , "Does the interviewer leave?"
  , "Does the interviewer look back?"
  , "Does the interviewer work in Cuba?"
  , "Does the interviewer work in the fields?"
  , "the interviewer work on the fields?"
  , "the interviewer work at the fields?"
  , "Does the interviewer work at a motel?"
  , "the interviewer work on a motel?"
  , "the interviewer work in a motel?"
  , "the interviewer work as a doctor."
  , "Does the job disappoint the interviewer?"
  , "the interviewer studied medicine."
  , "Does the interviewer study in the United States?"
  , "the interviewer studied medicine at a motel."
  , "the interviewer studied medicine at vocational school"
  , "Does the interviewer go to vocational school."
  , "Some man raised the interviewer."
  , "Does the interviewer come from Cuba?"
  , "Does the interviewer immigrate to the United States?"
  , "the interviewer told a story."
  , "the interviewer told the job a story."
  , "the interviewer told a story to the job."
  , "the interviewer told a story to Ed Trinka's son"
  , "the interviewer gave some ships to Ed Trinka's son."
  , "Does the interviewer give some ships to Ed Trinka's son."
  , "Does the interviewer give the ships to Ed Trinka's son?"
  , "Does the interviewer give the ships to someone?"
  , "the interviewer gave several ships to Ed Trinka's son."
  , "the interviewer gave Ed Trinka's son some ships."
  , "Does the interviewer give Ed Trinka's son some ships?"
  , "Does the interviewer give Ed Trinka's son the ships?"
  , "Does the interviewer give someone the ships?"
  , "the interviewer gave Ed Trinka's son several ships."
  , "Does the interviewer work at a motel?"
  , "the interviewer does cleaning at a motel."
  ]
  

haves = [
  "Does Ed Trinka have Dee's father?"
  , "Does Ed Trinka's father have money?"
  , "Does Ed Trinka's father's uncle have money?"
  , "Does Ed Trinka have Dee's dad?"
  , "Does Ed Trinka have Dee's uncle?"
  , "Does Ed Trinka's father's uncle have money?"
  , "Does Ed Trinka's father have Dee?"
  , "Does Ed Trinka have Dee's father?"
  , "Does Ed Trinka have Debra Goodman?"
  , "Does Ed Trinka's father have a mother?"
  , "Does Ed Trinka have work?"
  , "Does Ed Trinka have a job?"
  , "Does Ed Trinka have some job?"
  , "Does Ed Trinka have money?"
  , "Does Ed Trinka's father have money?"
  , "Does Debra Goodman have money?"
  , "Does Debra Goodman have a family?"
  , "Does Ed Trinka have a family?"
  , "Does Ed Trinka have a parent?"
  , "Does Ed Trinka have some parents?"
  , "Does Ed Trinka have parents?"
  , "Does Ed Trinka's father have a parent?"
  , "Does Ed Trinka's father have some parents?"
  , "Does Ed Trinka's father have parents?"
  , "Does Ed Trinka's father have an uncle?"
  , "Does Ed Trinka have work?"
  , "Does Debra Goodman have work?"
  , "Does Ed Trinka's father have work?"
  , "Does the job have a mother?"
  , "Does the daughter have some ships?"
  , "Does the daughter have no ships?"
  , "Does the parent have some ships?"
  , "Does the parent have no ships?"
  , "Does the job have money?"
  , "Does Ed Trinka's son have money?"
  , "Does the job have a parent?"
  , "Does the job have some parents?"
  , "Does the job have parents?"
  , "Does Ed Trinka's son have a boat?"
  , "Does the job have a boat?"
  , "Does someone have a boat?"
  ]

ungrammatical = [
	"Does Debra Goodman worked?",
	"Ed Trinka work?",
	"Man worked.",
	"Some man work.",
	"No worked.",
	"No-one work.",
	"Does Debra Goodman teach?",
	"Debra Goodman teach Ed Trinka.",
	"Ed Trinka taught.",
	"Does Ed Trinka's son looked back?",
	"the interviewer look back?",
	"Man looked back.",
	"Some man work.",
	"No looked back.",
	"No-one work.",
	"Does Ed Trinka's son teach?",
	"Ed Trinka's son teach the interviewer.",
	"the interviewer raised."
	]

intransitives = [
	"Does Debra Goodman work?",
	"Does Ed Trinka work?",
	"Does Ed Trinka's father work?",
	"A man work.",
	"Some man work.",
	"No one work.",
	"No-one work.",
	"Everybody work.",
	"Everyone work.",
	-- "Many persons work.",
	"No person work.",
	"Does the man work?",
	"Does some man work?",
	"Does some men work?",
	"Does some woman work?",
	"Does some women work?",
	"Most men work.",
	"Most men doesn't work.",
	"Several men work.",
	"Several men doesn't work.",
	"Many men work.",
	"Many men doesn't work.",
	"All men work.",
	"No man work.",
	"Does Ed Trinka's father work at a farm?",
	"Ed Trinka's father work on a farm?",
	"Ed Trinka's father work in a farm?",
	"Ed Trinka's son got married.",
	"Does Ed Trinka's son leave?",
	"Does Ed Trinka's son's father leave?",
	"A man left.",
	"Some man left.",
	"No one left.",
	"No-one left.",
	"Everybody left.",
	"Everyone left.",
	"Many persons left.",
	"No person left.",
	"Does the man leave?",
	"Does some man leave?",
	"Does some men leave?",
	"Does some woman leave?",
	"Does some women leave?",
	"Most persons left.",
	"Most men left.",
	"Most men doesn't leave.",
	"Several men left.",
	"Several men doesn't leave.",
	"Several persons left.",
	"Several persons doesn't leave.",
	"Does Ed Trinka's son look back?",
	"Does Ed Trinka's son's father look back?",
	"A man looked back.",
	"Some man looked back.",
	"No one looked back.",
	"No-one looked back.",
	"Everybody looked back.",
	"Everyone looked back.",
	"Many persons looked back.",
	"No person looked back.",
	"Does the man look back?",
	"Does the girl look back?",
	"Does some man look back?",
	"Does some men look back?",
	"Does some woman look back?",
	"Does some women look back?",
	"Most men looked back.",
	"Most men doesn't look back.",
	"Several men looked back.",
	"Several men doesn't look back.",
	"Many men looked back.",
	"Many men doesn't work.",
	"All men looked back.",
	"No man looked back."
	]

transitives = [
	"Does Debra Goodman study law?",
	"Debra Goodman studied law.",
	"Ed Trinka studied law.",
	"Ed Trinka studied law at Michigan Law.",
	"Ed Trinka studied law at Colorado College",
	"Does Ed Trinka go to Colorado College.",
	"Some woman went to Colorado College.",
	"Some man went to Colorado College.",
	"Some boy went to Colorado College.",
	"Some man parented Ed Trinka.",
	"A man parented Debra Goodman",
	"Some woman told a story.",
	"Does the job work at a motel?",
	"the job work on a motel?",
	"the job work in a motel?",
	"Does Ed Trinka's son study medicine?",
	"Ed Trinka's son studied medicine.",
	"Some woman went to vocational school.",
	"Some man went to vocational school.",
	"Some boy went to vocational school.",
	"A man raised Ed Trinka's son",
	"Some woman told a story.",
	"Does Ofelia immigrate?",
	"Does Ofelia go to the United States?",
	"Does Ofelia come from Cuba?",
	"Does Ed Trinka's son come to the United States?"
	]

ditransitive_tests = [
	"Ed Trinka told a story.",
	"Ed Trinka told Dee's father a story.",
	"Ed Trinka told a story to Dee's father.",
	"Ed Trinka told a story to Debra Goodman",
	"Ed Trinka gave some job to Debra Goodman.",
	"Does Ed Trinka give some job to Debra Goodman.",
	"Does Ed Trinka give the job to Debra Goodman?",
	"Does Ed Trinka give the job to someone?",
	"Ed Trinka gave several job to Debra Goodman.",
	"Does someone give something to Debra Goodman?",
	"A woman gave the job to Debra Goodman.",
	"A woman gave the job to someone.",
	"A woman gave something to someone.",
	"Someone gave something to someone.",
	"Ed Trinka gave Debra Goodman some job.",
	"Does Ed Trinka give Debra Goodman some job?",
	"Does Ed Trinka give Debra Goodman the job?",
	"Does Ed Trinka give someone the job?",
	"Ed Trinka gave Debra Goodman several job.",
	"Does someone give Debra Goodman something?",
	"A man gave Debra Goodman the job.",
	"A boy gave Debra Goodman the job.",
	"Leroy gave Debra Goodman the shoe.",
	"A man gave someone the job.",
	"A man gave someone something.",
	"Someone gave someone something.",
	"Does someone give something to Ed Trinka's son?",
	"A woman gave the ships to Ed Trinka's son.",
	"A woman gave the ships to someone.",
	"A woman gave something to someone.",
	"Someone gave something to someone.",
	"Does someone give Ed Trinka's son something?",
	"A man gave Ed Trinka's son the ships.",
	"A man gave Ed Trinka's son some ships.",
	"A boy gave Ed Trinka's son the ships.",
	"the job gave Ed Trinka's son the boat.",
	"A man gave someone the ships.",
	"A man gave someone something.",
	"Someone gave someone something.",
	"Does Ed Trinka's son pick tomatoes in the fields?"
	]

wh_questions =[
	"Who worked?",
	"Who does Debra Goodman teach?",
	"Who taught Debra Goodman?",
	"Who gave the job to Debra Goodman?",
	"Who gave some job to Debra Goodman?",
	"Which person worked?",
	"Which person does Debra Goodman teach?",
	"To whom does Ed Trinka give some job?",
	"Who does Ed Trinka give some job to?",
	"Who looked back?",
	"Which man looked back?",
	"Who raised Ed Trinka's son?",
	"Which woman raised Ed Trinka's son?",
	"Who gave the ships to Ed Trinka's son?",
	"Who gave some ships to Ed Trinka's son?",
	"Which person looked back?",
	"Which woman appreciated the interviewer?",
	"Which girl appreciated the interviewer?",
	"Which daughter appreciated the interviewer?",
	"Who does Ed Trinka's son appreciate?",
	"Which person does Ed Trinka's son appreciate?",
	"Which man does Ed Trinka's son appreciate?",
	"Which woman does Ed Trinka's son appreciate?",
	"Which thing does Ed Trinka's son appreciate?",
	"Which boat does Ed Trinka's son appreciate?",
	-- "To whom does the interviewer give some ships?",
	-- "Who does the interviewer give some ships to?",
	"Who had a boat?",
	"What does Ed Trinka's son have?",
	"Who does Ed Trinka's son have?",
	"Who does the job disappoint?",
	"Who does the interviewer's daughter appreciate?",
	"What does the interviewer's daughter appreciate?",
	"Which thing does the interviewer's daughter appreciate?",
	"Which man does the interviewer's daughter appreciate?",
	"Which woman does the interviewer's daughter appreciate?",
	"Which boat does the interviewer's daughter appreciate?",
	"What does someone have?"
	]

relclauses = [
	"A woman who taught Debra Goodman work.",
	"The woman who taught Debra Goodman work.",
	"Did the woman who taught Debra Goodman work?",
	"Did every woman who taught Debra Goodman work?",
	"The woman who gave the job to Debra Goodman work.",
	"Ed Trinka divorced the man that he gave the job to.",
	"Who killed the man that helped the woman " 
	 ++ "that had a boyfriend.",
	"A woman who raised Ed Trinka's son looked back.",
	"The woman who raised Ed Trinka's son looked back.",
	"Did the woman who raised Ed Trinka's son look back?",
	"Did every person who raised Ed Trinka's son look back?",
	"Did some person who raised Ed Trinka's son look back?",
	"The woman who gave the ships to Ed Trinka's son looked back.",
	"Ofelia married the man that gave the ships to Ed Trinka's son.",
	"The man that Ofelia married gave the ships to Ed Trinka's son.",
	"The man Ofelia married gave the ships to Ed Trinka's son.",
	"the job disappointed the man that gave Ed Trinka's son the ships.",
	"The man that the job disappointed left Cuba.",
	"The man the job disappointed left Cuba.",
	"Ed Trinka's son accepted the ships that a man gave Dee's son.",
	"Ed Trinka's son accepted the ships that a man gave to Dee's son.",
	"Who appreciated the man that gave the girl \
	 \that left Cuba a ship?"
	]

--process :: String -> [LF]
--process string = map (\x -> transS $ Just x) (parses string)
--
---- processW :: String -> [ LF ]
---- processW string = map transWH (parses string)
--
--pick ps x = [ ps !! x ]
--
--
--
--
--evals = handler (eval . transS)
--
--forms tests = putStr $ unlines $ map (\(x,y)->x++show y) $ zip (map (++"\t") tests ) ( map process tests )
--
--parentN = length ( mapMaybe ( \y -> bool2Maybe( evl ((\x->Rel "parent" [Const x] ) y)) ) ents) -- 2
--



--lf0 = Rel "worked" [ Const(realents!!17) ]
--lf00 = (Conj [(Rel "person" [Var 0]), (Rel "worked" [Var 0]) ] ) 
---- lf000 = (Exists (Conj [(Rel "person" [Var 0]), (Rel "worked" [Var 0]) ] )) (Const(realents)!!17)
--
--lf1 = (Equi  (Rel "married" [ Const(realents!!9), Const(realents!!1) ]) (Neg (Rel "married" [ Const(realents!!8), Const(realents!!17)]) ) )
--
--lf2 = (Conj [ (Rel "married" [ Const (realents !! 9), Const       (realents !! 1)]), (Rel "married" [ Const (realents !! 8), Const (realents !!   17)]) ] )
--
--lf3 = Rel "married" [ Const (realents !! 8), Const (realents !! 17)]
--lf4 = (Impl  (Rel "married" [ Const (realents !! 9), Const        (realents !! 1)]) (Rel "married" [ Const (realents !! 8), Const (realents !!    17)])  )
--lf5 = (Conj [ (Rel "married" [ Const (realents !! 9), Const       (realents !! 1)]), (Rel "married" [ Const (realents !! 8), Const (realents !!   17)]) ] )
--lf6 = (Disj [ (Rel "married" [ Const (realents !! 9), Const       (realents !! 1)]), (Rel "married" [ Const (realents !! 8), Const (realents !!   17)]) ] )
--
--lf70 = ( \x -> ( Conj [ (Rel "son" [x]), (Rel "have" [x, Const (realents !! 8)]) ] ) ) (Const (realents !! 12) )
--lf71 = ( \x -> ( Conj [ (Rel "son" [x]), (Rel "have" [x, Const (realents !! 17)]) ] ) ) (Const (realents !! 12) )
--lf72 = ( \x -> ( Conj [ (Rel "son" [x]), (Rel "have" [x, Const (realents !! 17)]) ] ) ) (Const (realents !! 12) )
--lf73 = \x -> Conj [ (Rel "son" [x]), (Rel "have" [x, Const (realents !! 17)]) ]
--lf74 = ( \x -> ( Conj [ (Rel "daughter" [x]), (Rel "have" [x, Const (realents !! 17)]) ] ) )
--lf75 = \x -> Impl (Rel "son" [x]) (Rel "have" [x, Const (realents !! 17)])

-- vim: set ts=8 sts=2 sw=2 noet:
