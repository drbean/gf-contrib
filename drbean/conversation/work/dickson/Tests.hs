module Tests where

import Control.Monad

import PGF
import Dickson
import LogicalForm
import Evaluation
import Model
import WordsCharacters

import Data.List
import Data.Char

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Dickson.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map ( map ( linear transform gr ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ concat y)) zs) )

--trans tests = do
--  gr	<- readPGF ( "./Dickson.pgf" )
--  let ss = map (chomp . lc_first) tests
--  let ps = map ( parses gr ) ss
--  let ls = map id ps
--  let zs = zip (map (++"\t") tests) ps
--  putStrLn (unlines (map (\(x,y) -> x ++ (show (concat y ) ) ) zs) )

logic tests = do
  gr	<- readPGF ( "./Dickson.pgf" )
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
lc_first str@(s:ss) = case ( or $ map (flip isPrefixOf str) ["Alf", "Dee"] ) of
	True  -> (s:ss)
	False -> ((toLower s):ss)

chomp :: String -> String
chomp []                      = []
-- chomp ('\'':'s':xs)           = " 's" ++ chomp xs
-- chomp ('s':'\'':xs)           = "s 's" ++ chomp xs
chomp (x:xs) | x `elem` ".,?" = chomp xs
            | otherwise      =     x:chomp xs

working_test = [

	"Does Dee work?"
	, "Does Dee have work?"
	, "Does Dee have a job?"
	, "Who works?"
	, "Who has work?"
	, "Who has a job?"
	, "Dee works, doesn't she?"
	, "Dee has work, doesn't she?"
	, "Dee has a job, doesn't she?"
	]

test_text = [
	"Dee's son spoke English.",
	"Dee's son's brother spoke English.",
	"Dee's son had a brother and a brother spoke English.",
	"Dee's son knew English and the interviewer spoke English.",
	"Dee's son spoke English but the interviewer didn't speak English.",
	"Dee's son talked to the interviewer and the interviewer talked to Dee's son's father.",
	"Dee's son talked to the interviewer and the interviewer talked to Dee's son's father " ++
		"and Dee's son's father talked to Dee's son.",
	"Dee's son's brother looked back on Dee's son's upbringing. \
	\Dee's son talked to the interviewer. \
	\Dee's son asked the interviewer about Vietnam."
	]

alf_test = [
 "Does the uncle of the father of Dee have work?"
 , "Is the uncle of the father of Dee Alf?"
 ]

test_possessives = [
  "Is Dee Dee's job?"
  , "Is Dee's job Dee?"
  , "Dee's job is good, isn't it?"
  , "Is Dee's job good?"
  , "Is Dee's job a job?"
  , "Is Dee's job Dee?"
  , "Is Dee Dee's job"
  , "Is Dee's lob Dee?"
  , "Is Dee's job Dee's job?"
  , "Is Dee's job Dee's father?"
  , "Is Dee's job Dee's father"
  , "Is Dee Dee's job"
  , "Is Dee's job Dee"

	, "Does the interviewer work."
	, "Do the interviewer's children work."
	, "Does Dee's son's father work."
	, "Does the interviewer's family work on Dee's son's upbringing."
	-- , "the interviewer's daughter work on the interviewer's daughter's upbringing."
	, "Dee's son's father works on Dee's son's upbringing, doesn't he."
	, "Does Dee's son's father work on Dee's son's upbringing?"
	, "Does Dee's son's brother work on Dee's son's upbringing?"
	, "Does Dee's son's father speak English?"
	, "Does Dee's son's brother speak English?"
	, "Does Dee's son's brother know English?"
	, "Does Dee's son's mother speak English?"
	, "Does Dee's son's mother speak English?"
	, "the interviewer's daughter appreciated Dee's son's father."
	, "Dee's son's father  appreciated the interviewer's daughter."
	, "Does the sister of Dee's son know English?"
	, "Does the father of Dee's son work on Dee's son's upbringing?"
	, "Does the brother of Dee's son work on Dee's son's upbringing?"
	, "Does the mother of Dee's son speak English?"
	, "Does the father of Dee's son speak English?"
	, "Does the brother of Dee's son speak English?"
	, "Does the mother of Dee's son speak English?"
	, "Does the brother of Dee's son know English?"
	, "Does the sister of Dee's son know English?"
	]

haves = [
  "Does Dee have Dee's father?"
  , "Does Dee's father have money?"
  , "Does Dee's father's uncle have money?"
  , "Does Dee have Dee's dad?"
  , "Does Dee have Dee's uncle?"
  , "Does Dee's father's uncle have money?"
  , "Does Dee's father have Dee?"
  , "Does Dee have Dee's father?"
  , "Does Dee have Alf?"
  , "Does Dee have a mother?"
  , "Does Dee have a son?"
  , "Does Dee have a daughter?"
  , "Does Dee's father have a mother?"
  , "Does Dee have work?"
  , "Does Dee have a job?"
  , "Does Dee have some job?"
  , "Does Dee have money?"
  , "Does Dee's father have money?"
  , "Does Alf have money?"
  , "Does Dee have a parent?"
  , "Does Dee have some parents?"
  , "Does Dee have parents?"
  , "Does Dee's father have a parent?"
  , "Does Dee's father have some parents?"
  , "Does Dee's father have parents?"
  , "Does Dee's father have an uncle?"
  , "Does Dee have work?"
  , "Does Alf have work?"
  , "Does Dee's father have work?"
  , "Does the interviewer have the job?"
  , "Does the interviewer have Dee's son?"
  , "Does the interviewer have a mother?"
  , "Does the interviewer have a son?"
  , "Does the interviewer have a daughter?"
  , "Does the job have a mother?"
  , "Does the interviewer have ships?"
  , "Does the interviewer have some ships?"
  , "Does the interviewer's daughter have some ships?"
  , "Does the interviewer's daughter have a ship?"
  , "Does the daughter have some ships?"
  , "Does the daughter have no ships?"
  , "Does the parent have some ships?"
  , "Does the parent have no ships?"
  , "Does the interviewer have money?"
  , "Does the job have money?"
  , "Does Dee's son have money?"
  , "Does the interviewer have a parent?"
  , "Does the interviewer have some parents?"
  , "Does the interviewer have parents?"
  , "Does the job have a parent?"
  , "Does the job have some parents?"
  , "Does the job have parents?"
  , "Does the interviewer have a boat?"
  , "Does Dee's son have a boat?"
  , "Does the job have a boat?"
  , "Does someone have a boat?"
  ]

ungrammatical = [
	"Does Alf worked?",
	"Dee work?",
	"Man worked.",
	"Some man work.",
	"No worked.",
	"No-one work.",
	"Does Alf teach?",
	"Alf teach Dee.",
	"Dee taught.",
	"Does Dee's son looked back?",
	"the interviewer look back?",
	"Man looked back.",
	"Some man work.",
	"No looked back.",
	"No-one work.",
	"Does Dee's son teach?",
	"Dee's son teach the interviewer.",
	"the interviewer raised."
	]

intransitives = [
	"Does Alf work?",
	"Does Dee work?",
	"Does Dee's father work?",
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
	"Most men didn't work.",
	"Several men work.",
	"Several men didn't work.",
	"Many men work.",
	"Many men didn't work.",
	"All men work.",
	"No man work.",
	"Does Dee's father work at a farm?",
	"Dee's father work on a farm?",
	"Dee's father work in a farm?",
	"Dee's son got married.",
	"Does Dee's son leave?",
	"Does the interviewer leave?",
	"Does Dee's son's father leave?",
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
	"Most men didn't leave.",
	"Several men left.",
	"Several men didn't leave.",
	"Several persons left.",
	"Several persons didn't leave.",
	"Does Dee's son look back?",
	"Does the interviewer look back?",
	"Does Dee's son's father look back?",
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
	"Most men didn't look back.",
	"Several men looked back.",
	"Several men didn't look back.",
	"Many men looked back.",
	"Many men didn't work.",
	"All men looked back.",
	"No man looked back."
	]

transitives = [
	"Does Alf study law?",
	"Alf studied law.",
	"Dee studied law.",
	"Dee studied law at Michigan Law.",
	"Dee studied law at Colorado College",
	"Does Dee go to Colorado College.",
	"Some woman went to Colorado College.",
	"Some man went to Colorado College.",
	"Some boy went to Colorado College.",
	"Some man parented Dee.",
	"A man parented Alf",
	"Some woman told a story.",
	"Does the interviewer work in Cuba?",
	"Does the interviewer work in the fields?",
	"the interviewer work on the fields?",
	"the interviewer work at the fields?",
	"Does the interviewer work at a motel?",
	"the interviewer work on a motel?",
	"the interviewer work in a motel?",
	"the interviewer work as a doctor.",
	"Does the job work at a motel?",
	"the job work on a motel?",
	"the job work in a motel?",
	"Does the job disappoint the interviewer?",
	"Does Dee's son study medicine?",
	"Dee's son studied medicine.",
	"the interviewer studied medicine.",
	"Does the interviewer study in the United States?",
	"the interviewer studied medicine at a motel.",
	"the interviewer studied medicine at vocational school",
	"Does the interviewer go to vocational school.",
	"Some woman went to vocational school.",
	"Some man went to vocational school.",
	"Some boy went to vocational school.",
	"Some man raised the interviewer.",
	"A man raised Dee's son",
	"Some woman told a story.",
	"Does the interviewer come from Cuba?",
	"Does Ofelia immigrate?",
	"Does the interviewer immigrate to the United States?",
	"Does Ofelia go to the United States?",
	"Does Ofelia come from Cuba?",
	"Does Dee's son come to the United States?"
	]

ditransitive_tests = [
	"Dee told a story.",
	"Dee told Dee's father a story.",
	"Dee told a story to Dee's father.",
	"Dee told a story to Alf",
	"Dee gave some job to Alf.",
	"Does Dee give some job to Alf.",
	"Does Dee give the job to Alf?",
	"Does Dee give the job to someone?",
	"Dee gave several job to Alf.",
	"Does someone give something to Alf?",
	"A woman gave the job to Alf.",
	"A woman gave the job to someone.",
	"A woman gave something to someone.",
	"Someone gave something to someone.",
	"Dee gave Alf some job.",
	"Does Dee give Alf some job?",
	"Does Dee give Alf the job?",
	"Does Dee give someone the job?",
	"Dee gave Alf several job.",
	"Does someone give Alf something?",
	"A man gave Alf the job.",
	"A boy gave Alf the job.",
	"Leroy gave Alf the shoe.",
	"A man gave someone the job.",
	"A man gave someone something.",
	"Someone gave someone something.",
	"the interviewer told a story.",
	"the interviewer told the job a story.",
	"the interviewer told a story to the job.",
	"the interviewer told a story to Dee's son",
	"the interviewer gave some ships to Dee's son.",
	"Does the interviewer give some ships to Dee's son.",
	"Does the interviewer give the ships to Dee's son?",
	"Does the interviewer give the ships to someone?",
	"the interviewer gave several ships to Dee's son.",
	"Does someone give something to Dee's son?",
	"A woman gave the ships to Dee's son.",
	"A woman gave the ships to someone.",
	"A woman gave something to someone.",
	"Someone gave something to someone.",
	"the interviewer gave Dee's son some ships.",
	"Does the interviewer give Dee's son some ships?",
	"Does the interviewer give Dee's son the ships?",
	"Does the interviewer give someone the ships?",
	"the interviewer gave Dee's son several ships.",
	"Does someone give Dee's son something?",
	"A man gave Dee's son the ships.",
	"A man gave Dee's son some ships.",
	"A boy gave Dee's son the ships.",
	"the job gave Dee's son the boat.",
	"A man gave someone the ships.",
	"A man gave someone something.",
	"Someone gave someone something.",
	"Does the interviewer work at a motel?",
	"the interviewer did cleaning at a motel.",
	"Does Dee's son pick tomatoes in the fields?"
	]

wh_questions =[
	"Who worked?",
	"Who did Alf teach?",
	"Who taught Alf?",
	"Who gave the job to Alf?",
	"Who gave some job to Alf?",
	"Which person worked?",
	"Which person did Alf teach?",
	"To whom did Dee give some job?",
	"Who did Dee give some job to?",
	"Who looked back?",
	"Which man looked back?",
	"Who raised Dee's son?",
	"Which woman raised Dee's son?",
	"Who gave the ships to Dee's son?",
	"Who gave some ships to Dee's son?",
	"Which person looked back?",
	"Which woman appreciated the interviewer?",
	"Which girl appreciated the interviewer?",
	"Which daughter appreciated the interviewer?",
	"Who did Dee's son appreciate?",
	"Which person did Dee's son appreciate?",
	"Which man did Dee's son appreciate?",
	"Which woman did Dee's son appreciate?",
	"Which thing did Dee's son appreciate?",
	"Which boat did Dee's son appreciate?",
	-- "To whom did the interviewer give some ships?",
	-- "Who did the interviewer give some ships to?",
	"Who had a boat?",
	"What did Dee's son have?",
	"Who did Dee's son have?",
	"Who did the job disappoint?",
	"Who did the interviewer's daughter appreciate?",
	"What did the interviewer's daughter appreciate?",
	"Which thing did the interviewer's daughter appreciate?",
	"Which man did the interviewer's daughter appreciate?",
	"Which woman did the interviewer's daughter appreciate?",
	"Which boat did the interviewer's daughter appreciate?",
	"What did someone have?"
	]

relclauses = [
	"A woman who taught Alf work.",
	"The woman who taught Alf work.",
	"Did the woman who taught Alf work?",
	"Did every woman who taught Alf work?",
	"The woman who gave the job to Alf work.",
	"Dee divorced the man that she gave the job to.",
	"Who killed the man that helped the woman " 
	 ++ "that had a boyfriend.",
	"A woman who raised Dee's son looked back.",
	"The woman who raised Dee's son looked back.",
	"Did the woman who raised Dee's son look back?",
	"Did every person who raised Dee's son look back?",
	"Did some person who raised Dee's son look back?",
	"The woman who gave the ships to Dee's son looked back.",
	"Ofelia married the man that gave the ships to Dee's son.",
	"The man that Ofelia married gave the ships to Dee's son.",
	"The man Ofelia married gave the ships to Dee's son.",
	"the job disappointed the man that gave Dee's son the ships.",
	"The man that the job disappointed left Cuba.",
	"The man the job disappointed left Cuba.",
	"Dee's son accepted the ships that a man gave Dee's son.",
	"Dee's son accepted the ships that a man gave to Dee's son.",
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
