module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Chat
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Chat.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF ( "./Chat.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF ( "./Chat.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF ( "./Chat.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF ( "./Chat.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [

  "Mandy says, Hello."
  , "Mandy asks a stranger how old he is."
  , "Mandy asks a stranger if he is a man or a woman."
  , "A stranger asks Mandy if she is male or female."
  , "Mandy tells a stranger she is a man."
  , "A stranger disconnects when Mandy tells him she is a man."

  , "Alice says, Hi."
  , "Ellarose says that she is 16."
  , "Alice asks Ellarose if she is a student."
  , "Ellarose tells Alice that she is a student."
  , "Ellarose greets Alice."
  , "Alice asks Ellarose where she is from."
  , "Ellarose tells Alice that she is from Madison in the USA."
  , "Ellarose tells Alice Madison is a beautiful city, like Paris and NY."
  , "Ellarose asks Alice where she is from."
  , "Alice tells Ellarose that she is from Taiwan."
  , "Alice asks Ellarose if she ever came to Taiwan."
  , "Ellarose tells Alice she is a sophomore."
  , "Alice tells Ellarose she is a student."
  , "Alice tells Ellarose she is a freshman."
  , "Ellarose tells Alice she is 15 or 16."
  , "Ariel greets Filibee."
  , "Filibee tells Ariel she doesn't speak English."
  , "Filibee tells Ariel that she is from Turkey."
  , "Ariel tells Filibee that she is from Taiwan."
  , "Ariel tells Filibee that they can come to Taiwan."

  , "A stranger greets Sabrina."
  , "Sabrina greets a stranger."
  , "The stranger says he is male."
  , "Sabrina says that she is a girl."
  , "The stranger says that he is 16."
  , "Sabrina says that the stranger is young."
  , "The stranger asks how old Sabrina is."
  , "Sabrina asks the stranger to guess how old she is."
  , "The stranger guesses that Sabrina is 18."
  , "The stranger guesses Sabrina's age correctly."
  , "Junior asks if Sabrina wants to talk to him."
  , "Sabrina doesn't understand Junior's question."
  , "Sabrina tells Junior her name."
  , "Sabrina asks Junior where he is from."
  , "Junior tells Sabrina that he is from LA."
  , "Junior asks Sabrina where she is from."
  , "Junior asks Sabrina if she is in Taiwan right now."
  , "Junior asks Sabrina her nationality."
  , "Junior asks Sabrina if she is Hispanic."
  , "Sabrina tells Junior she is from Taiwan."
  , "Sabrina says her English is not good."
  , "Junior asks Sabrina if she is on Facebook."
  , "Junior asks Sabrina if she wants to talk on Facebook."
  , "Sabrina tells Junior that she doesn't often use Facebook."

  ]

yn_dic_test = [

  "Does Mandy say, Hello."
  , "Does Mandy ask a stranger how old he is."
  , "Does Mandy ask a stranger if he is a man or a woman."
  , "Does a stranger ask Mandy if she is male or female."
  , "Does Mandy tell a stranger she is a man."
  , "Does a stranger disconnect when Mandy tells him she is a man."

  , "Does Alice say, Hi."
  , "Does Ellarose say that she is 16."
  , "Does Alice ask Ellarose if she is a student."
  , "Does Ellarose tell Alice that she is a student."
  , "Does Ellarose greet Alice."
  , "Does Alice ask Ellarose where she is from."
  , "Does Ellarose tell Alice that she is from Madison in the USA."
  , "Does Ellarose tell Alice Madison is a beautiful city, like Paris and New York."
  , "Does Ellarose ask Alice where she is from."
  , "Does Alice tell Ellarose that she is from Taiwan."
  , "Does Alice ask Ellarose if she ever came to Taiwan."
  , "Does Ellarose tell Alice she is a sophomore."
  , "Does Alice tell Ellarose she is a student."
  , "Does Alice tell Ellarose she is a freshman."
  , "Does Ellarose tell Alice she is 15 or 16."
  , "Does Ariel greet Filibee."
  , "Does Filibee tell Ariel she doesn't speak English."
  , "Does Filibee tell Ariel that she is from Turkey."
  , "Does Ariel tell Filibee that she is from Taiwan."
  , "Does Ariel tell Filibee that they can come to Taiwan."

  , "Does a stranger greet Sabrina."
  , "Does Sabrina greet a stranger."
  , "Does The stranger say he is male."
  , "Does Sabrina say that she is a girl."
  , "Does The stranger say that he is 16."
  , "Does Sabrina say that the stranger is young."
  , "Does The stranger ask how old Sabrina is."
  , "Does Sabrina ask the stranger to guess how old she is."
  , "Does The stranger guess that Sabrina is 18."
  , "Does The stranger guess Sabrina's age correctly."
  , "Does Junior ask if Sabrina wants to talk to him."
  , "Does Sabrina understand Junior's question."
  , "Does Sabrina tell Junior her name."
  , "Does Sabrina ask Junior where he is from."
  , "Does Junior tell Sabrina that he is from LA."
  , "Does Junior ask Sabrina where she is from."
  , "Does Junior ask Sabrina if she is in Taiwan right now."
  , "Does Junior ask Sabrina her nationality."
  , "Does Junior ask Sabrina if she is Hispanic."
  , "Does Sabrina tell Junior she is from Taiwan."
  , "Does Sabrina say her English is not good."
  , "Does Junior ask Sabrina if she is on Facebook."
  , "Does Junior ask Sabrina if she wants to talk on Facebook."
  , "Does Sabrina tell Junior that she doesn't often use Facebook."

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
