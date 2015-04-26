module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Siar
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Siar.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF ( "./Siar.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF ( "./Siar.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF ( "./Siar.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF ( "./Siar.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [
	"Rebia is pregnant."
	, "Frank sees Rebia."
	, "Frank walks over to Rebia"
	, "Frank says to Rebia, You're going to be my wife."
	, "Frank and Rebia go down to City Hall."
	, "Frank and Rebia get married."
	, "Frank and Rebia don't have rings."
	, "Frank tries to give Rebia his class ring."
	, "The ring is big and ugly."
	, "Frank tries to put the ring on Rebia's finger."
	, "Rebia is like, Uh-huh."
	, "Rebia remembers coming home one day."
	, "Frank isn't there."
	, "There is a note on the back of the door."
	, "The note says, Go in the bedroom and look on the dresser."
	, "Rebia goes in the bedroom."
	, "Rebia looks on the dresser."
	, "The ring box is on the dresser."
	, "A beautiful wedding ring is in the ring box."
	, "A beautiful engagement ring is in the ring box."
	, "Rebia grabs the rings."
	, "Rebia doesn't put the rings on."
	, "Rebia runs out of the house, because she knows where he hangs out at."
	, "Frank says, Did you find the rings, when he sees Rebia coming."
	, "Rebia says, Yes."
	, "Rebia is shaking, like she has just met him."
	, "Rebia hands Frank the rings."
	, "Frank gets down on one knee."
	, "Frank says, Will you be my wife?"
	, "Frank comes home."
	, "Frank says, What's for dinner?"
	, "Rebia tells him what dinner is going to be."
	, "Frank makes Rebia feel like the dinner is magnificent."
	, "If Rebia burns popcorn, it is the best."
	, "Rebia is married to Frank for seventeen years."
	, "Frank and Rebia separate."
	, "Frank moves to Michigan."
	, "Frank gets into a fight."
	, "Frank helps a woman."
	, "The woman's boyfriend shoots Frank in the back."
	, "Rebia has her fourth child with Frank."
	, "Frank's son is exactly like his father."
	, "Frank's son never talks above a whisper."
	, "Frank's son is always happy."
	, "Frank's son always laughs."
	, "Frank's son is a gentleman."
	, "Rebia's other three sons are like that."
	, "Rebia's oldest son says, My biological father's name is So-and-so, but my dad's name is Frank."
	, "Rebia still remembers Frank."
	, "Rebia believes that Frank is her first true love."
  ]

yn_dic_test = [
	"Is Rebia pregnant."
	, "Does Frank see Rebia."
	, "Does Frank walk over to Rebia"
	, "Does Frank say to Rebia, You're going to be my wife."
	, "Does Frank and Rebia go down to City Hall."
	, "Does Frank and Rebia get married."
	, "Does Frank and Rebia have rings."
	, "Does Frank try to give Rebia his class ring."
	, "Is The ring big and ugly."
	, "Does Frank try to put the ring on Rebia's finger."
	, "Is Rebia like, Uh-huh."
	, "Does Rebia remember coming home one day."
	, "Is Frank there."
	, "Is There a note on the back of the door."
	, "Does The note say, Go in the bedroom and look on the dresser."
	, "Does Rebia go in the bedroom."
	, "Does Rebia loos on the dresser."
	, "Is The ring box on the dresser."
	, "Is A beautiful wedding ring in the ring box."
	, "Is A beautiful engagement ring in the ring box."
	, "Does Rebia gras the rings."
	, "Does Rebia put the rings on."
	, "Does Rebia run out of the house, because she knows where he hangs out at."
	, "Does Frank say, Did you find the rings, when he sees Rebia coming."
	, "Does Rebia say, Yes."
	, "Is Rebia shaking, like she has just met him."
	, "Does Rebia hand Frank the rings."
	, "Does Frank get down on one knee."
	, "Does Frank say, Will you be my wife?"
	, "Does Frank come home."
	, "Does Frank say, What's for dinner?"
	, "Does Rebia tell him what dinner is going to be."
	, "Does Frank make Rebia feel like the dinner is magnificent."
	, "If Rebia burns popcorn, is it the best."
	, "Is Rebia married to Frank for seventeen years."
	, "Does Frank and Rebia separate."
	, "Does Frank move to Michigan."
	, "Does Frank get into a fight."
	, "Does Frank help a woman."
	, "Does The woman's boyfriend shoot Frank in the back."
	, "Does Rebia have her fourth child with Frank."
	, "Is Frank's son exactly like his father."
	, "Does Frank's son never talk above a whisper."
	, "Is Frank's son always happy."
	, "Does Frank's son always laugh."
	, "Is Frank's son a gentleman."
	, "Is Rebia's other three sons are like that."
	, "Does Rebia's oldest son say, My biological father's name is So-and-so, but my dad's name is Frank."
	, "Does Rebia still remember Frank."
	, "Does Rebia believe that Frank is her first true love."
  ]

wh_dic_test = [
	"Whose name is Simon?"
	, "Whose name is Ariel?"
	, "Whose Chinese name is ChiYuan Tien?"
	, "Who is 19 years old?"
	, "Who has a father?"
	, "Who has a mother?"
	, "Who has an older brother?"
	, "Who lives in Taipei?"
	, "Whose older brother studies in WenHua University?"
	, "Who has a younger sister?"
	, "Whose younger sister studies in Minghu Junior High School?"
	, "Who likes to make friends?"
	, "Who likes to play guitar?"
	, "Who likes to play drums?"
	, "Playing drums makes who feel relaxed?"
	, "Who likes listening to English songs?"
	, "Whose favorite subject is English?"
	, "Who thinks logically?"
	, "Who is a logical person?"
	, "Who is a humorous person?"
	, "Who wants to be a translator?"
	, "Who wants to be a tour guide?"
  ]

tag_dic_test = [
	"Simon's name is Simon, isn't it."
	, "Ariel's name is Ariel, isn'it."
	, "Ariel's Chinese name is ChiYuan Tien, isn't it."
	, "Ariel is 19 years old, isn't she."
	, "There are three people in Ariel's family, aren't there."
	, "There are five people in Simon's family, aren't there."
	, "Ariel has a father, doesn't he."
	, "Ariel has a mother, doesn't he."
	, "Simon has a father, doesn't he."
	, "Simon has a mother, doesn't he."
	, "Simon has an older brother, doesn't he."
	, "Simon lives in Taipei, doesn't he."
	, "Simon's older brother studies in WenHua University, doesn't he."
	, "Simon has a younger sister, doesn't he."
	, "Simon's younger sister studies in Minghu Junior High School, doesn't she."
	, "Ariel likes to make friends, doesn't she."
	, "Simon likes to play guitar, doesn't he."
	, "Simon likes to play drums, doesn't he."
	, "Playing guitar makes Simon feel happy, doesn't it."
	, "Playing guitar makes Simon feel relaxed, doesn't it."
	, "Playing drums makes Simon feel happy, doesn't it."
	, "Playing drums makes Simon feel relaxed, doesn't it."
	, "Baseball is Simon's favorite sport, isn't it"
	, "Ariel likes listening to English songs, doesn't she."
	, "Ariel's favorite subject is English, isn't it"
	, "Simon thinks logically, doesn't he."
	, "Simon is a logical person, isn't he."
	, "Simon is a humorous person, isn't he."
	, "Ariel wants to be a translator, doesn't she."
	, "Ariel wants to be a tour guide, doesn't she."
	]

student_test = [
	]

-- vim: set ts=2 sts=2 sw=2 noet:
