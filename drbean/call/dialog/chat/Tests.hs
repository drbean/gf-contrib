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

  "Does Mandy say Hello."
  , "Does Mandy ask a stranger how old he is."
  , "Does Mandy ask a stranger if he is a man or a woman."
  , "Does a stranger ask Mandy if she is male or female."
  , "Does Mandy tell a stranger she is a man."
  , "Does a stranger disconnect when Mandy tells him she is a man."

  , "Does Alice say, Hi."
  , "Does Ellarose say that she is 16."
  , "Does Alice ask Ellarose if she is a student."
  , "Does Alice ask Ellarose whether she is a student."
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
  , "Does Filibee tell Ariel he doesn't speak English."
  , "Does Filibee tell Ariel that he is from Turkey."
  , "Does Ariel tell Filibee that she is from Taiwan."
  -- , "Does Ariel tell Filibee that he can come to Taiwan."

  , "Does a stranger greet Sabrina."
  , "Does Sabrina greet a stranger."
  , "Does the stranger say he is male."
  , "Does Sabrina say that she is a girl."
  , "Does the stranger say that he is 16."
  , "Does Sabrina say that the stranger is young."
  , "Does the stranger ask how old Sabrina is."
  , "Does Sabrina ask the stranger to guess how old she is."
  , "Does the stranger guess that Sabrina is 18."
  , "Does the stranger guess Sabrina's age correctly."
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

	, "Does a stranger greet Marian?"
	, "Does Marian greet a stranger?"
	, "Does a stranger ask Marian where she is from?"
	, "Does Marian tell a stranger she is from Taiwan?"
	, "Does Marian ask a stranger where she is from?"
	-- , "Does a stranger ask Marian what she likes to do in her free time?"

	, "Does YiSian greet a stranger?"
	, "Does a stranger greet YiSian?"
	, "Does a stranger ask YiSian where she is from?"
	, "Does YiSian say she is from Taiwan?"
	, "Does a stranger say he is from Japan?"

	, "Does Viola1 greet a stranger?"
	, "Does a stranger greet Viola1?"
	, "Does Viola1 say she is 21?"
	, "Does Viola1 say she is female?"
  , "Does Viola1 tell a stranger that she is from Taiwan?"
  , "Does a stranger tell Viola1 that he is 22?"
  , "Does a stranger tell Viola1 that he is male?"
  , "Does a stranger tell Viola1 that he is from the US?"

	, "Does Maggie greet a stranger?"
	, "Doesn't a stranger greet Maggie?"
	, "Does Maggie say she is 19?"
	, "Does Maggie say she is female?"
  , "Does Maggie tell a stranger that she is from Taiwan?"
  , "Does a stranger tell Maggie that he is 19?"
  , "Does a stranger tell Maggie that he is male?"
  , "Does a stranger tell Maggie that he is from the US?"
  , "Does a stranger tell Maggie that his name is Jaycob?"
	, "Does a stranger ask Maggie if she is on Skype?"

	, "Does Dora greet a stranger?"
	, "Does a stranger greet Dora?"
  , "Does Dora tell a stranger that she is from Taiwan?"
  , "Does a stranger tell Dora that he is a student?"
  , "Does a stranger tell Dora that he is from Taiwan?"
	, "Does a stranger ask Dora if she is a student?"
	, "Does a stranger ask Dora if she is in MUST?"
	, "Does Dora ask a stranger if she is a student?"
	, "Does Dora ask a stranger if she is in MUST?"

	, "Does Cherry2 greet a stranger?"
	, "Does a stranger greet Cherry2?"
  , "Does Cherry2 ask a stranger where he is from?"
  , "Does a stranger ask Cherry2 where she is from?"
  , "Does Cherry2 ask a stranger how old he is?"
  , "Does a stranger ask Cherry2 how old she is?"
  , "Does Cherry2 ask a stranger if he is a girl or a boy?"
  , "Does a stranger ask Cherry2 if she is a girl or a boy?"
  , "Does Cherry2 tell a stranger that she is from Taiwan?"
  , "Does a stranger tell Cherry2 that he is a student?"
  , "Doesn't a stranger tell Cherry2 that he is from Taiwan?"
	, "Does a stranger ask Cherry2 if she is a student?"
	, "Doesn't a stranger ask Cherry2 if she is in the class?"
  , "Does a stranger tell Cherry2 that he is 16?"
  , "Does a stranger tell Cherry2 that he is from Romania?"

	, "Does Jessie greet a stranger?"
	, "Does a stranger greet Jessie?"
  , "Does Jessie ask a stranger where he is from?"
  , "Does a stranger ask Jessie where she is from?"
  , "Does Jessie ask a stranger if he is male or female?"
  , "Does a stranger ask Jessie if she is male or female?"
  , "Does Jessie tell a stranger that she is from Taiwan?"
  , "Does a stranger tell Jessie that he is from China?"

	, "Does Demi greet a stranger?"
	, "Does a stranger greet Demi?"
  , "Does Demi ask a stranger where he is from?"
  , "Does a stranger ask Demi where she is from?"
  , "Doesn't Demi ask a stranger how old he is?"
  , "Doesn't a stranger ask Demi how old she is?"
  , "Doesn't Demi ask a stranger if he is male or female?"
  , "Doesn't a stranger ask Demi if she is male or female?"
  , "Does Demi tell a stranger that she is 19?"
  , "Does a stranger tell Demi that he is 18?"
  , "Does Demi tell a stranger that she is female?"
  , "Does a stranger tell Demi that he is male?"
  , "Does Demi tell a stranger that she is from Taiwan?"
  , "Does a stranger tell Demi that he is from the US?"

	, "Doesn't Lisa1 greet a stranger?"
	, "Doesn't a stranger greet Lisa1?"
  , "Doesn't Lisa1 ask a stranger where he is from?"
  , "Doesn't a stranger ask Lisa1 where she is from?"
  , "Doesn't Lisa1 ask a stranger if he is male or female?"
  , "Doesn't a stranger ask Lisa1 if she is male or female?"
  , "Doesn't Lisa1 tell a stranger that she is from Taiwan?"
  , "Doesn't a stranger tell Lisa1 that he is from the US?"

	, "Does Annie greet a stranger?"
	, "Does a stranger greet Annie?"
  , "Does Annie ask a stranger where he is from?"
  , "Does a stranger ask Annie where she is from?"
  , "Does Annie ask a stranger if he is male or female?"
  , "Does a stranger ask Annie if she is male or female?"
  , "Does Annie tell a stranger that she is from Taiwan?"
  , "Does a stranger tell Annie that he is from the US?"
  , "Does a stranger tell Annie that he is from Taiwan?"
  , "Does a stranger ask Annie if she is a student?"
  , "Does a stranger tell Annie that he is a student?"
  , "Does Annie ask a stranger how old he is?"
  , "Does a stranger ask Annie how old she is?"
  , "Does a stranger tell Maggie that he is 19?"
  , "Does Maggie tell a stranger that she is 19?"

	, "Does Cheney greet Jack?"
	, "Does Jack greet Cheney?"
  , "Does Cheney ask Jack where he is from?"
  , "Does Jack ask Cheney where he is from?"
  , "Does Cheney ask Jack if he is male or female?"
  , "Does Jack ask Cheney if he is male or female?"
  , "Does Cheney tell Jack that he is from Taiwan?"
  , "Does Jack tell Cheney that he is from China?"
  , "Does Jack tell Cheney that he is from Taiwan?"
  , "Does Jack ask Cheney if he is a student?"
  , "Does Jack tell Cheney that he is a student?"
  , "Does Cheney ask Jack how old he is?"
  , "Does Jack ask Cheney how old he is?"
  , "Does Jack tell Cheney that he is 22?"
  , "Does Cheney tell Jack that he is 19?"

	, "Does Andy greet Stefan?"
	, "Does Stefan greet Andy?"
  , "Does Andy ask Stefan where he is from?"
  , "Does Stefan ask Andy where he is from?"
  , "Does Andy ask Stefan if he is male or female?"
  , "Does Stefan ask Andy if he is male or female?"
  , "Does Andy tell Stefan that he is from Taiwan?"
  , "Does Stefan tell Andy that he is from Hungary?"
  , "Does Stefan tell Andy that he is from Taiwan?"
  , "Does Stefan ask Andy if he is a student?"
  , "Does Stefan tell Andy that he is a student?"
  , "Does Andy ask Stefan how old he is?"
  , "Does Stefan ask Andy how old he is?"
  , "Does Stefan tell Andy that he is 23?"
  , "Does Andy tell Stefan that he is 19?"

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
