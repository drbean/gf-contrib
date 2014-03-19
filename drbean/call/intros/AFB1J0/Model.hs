module Model where

import Data.Tuple
import Data.List
import Data.Maybe

data Entity	=

		  A | B | C | D | E | F | G
		| H | I | J | K | L | M | N
		| O | P | Q | R | S | T | U
		| V | W | X | Y | Z

		| BA | BB | BC
		| BE | BM | BN
		| BO | BP | BS
		| BU | BY

		| IF | IM | IP
		| IT | IY

		| JC | JD | JP
		| JF | JG | JM
		| JS | JT | JW
		| JY

		| MH | MP

		| OF | OM | ON
		| OP | OS | OT

		| QB | QF | QI | QM
		| QS | QW | QY

		| SD | SE | SF | SG
		| SM | SO | ST

		| TD | TF | TJ
		| TL | TM | TN

		| UF | UM
		| UT | UY


		| Someone | Something | Unspec
		deriving (Eq,Show,Bounded,Enum,Ord)

entities :: [Entity]
entities	=  [minBound..maxBound]

entity_check :: [ (Entity, String) ]
entity_check =  [
    (A, "" )
    , (B, "Betty" )
    , (C, "playing computer games" )
    , (D, "dream" )
    , (E, "English" )
    , (F, "Japanese" )
    , (G, "Dr Bean" )
    , (H, "Minghsin University" )
    , (I, "Iris" )
    , (J, "Jeremy" )
    , (K, "basketball" )
    , (L, "listening_to_music" )
    , (M, "May" )
    , (N, "" )
    , (O, "Oliver" )
    , (P, "going_shopping" )
    , (Q, "Roger" )
    , (R, "reading" )
    , (S, "Silvi")
    , (T, "Emily2" )
    , (U, "Bruce2" )
    , (V, "watching_TV")
    , (W, "Taiwan" )
    , (X, "Hsinchu" )
    , (Y, "exercising" )
    , (Z, "watching movies" )

-- betty
    , (BA, "watching action movies")
    , (BB, "Betty's brother")
    , (BC, "watching scary movies")
    , (BE, "dogs_and_cats")
    , (BM, "Betty's mother")
    , (BN, "Betty's first nephew")
    , (BO, "Betty's second nephew")
    , (BP, "playing_with_her_nephews")
    , (BS, "senior")
    , (BU, "Fast and Furious")
    , (BY, "21")

-- bruce2
    , (UF, "going fishing")
    , (UM, "Bruce2's mother")
    , (UT, "English teacher")
    , (UY, "19")

-- emily2
    , (TF, "friend")
    , (TL, "London")
    , (TM, "freshman")
    , (TN, "new_york")

-- iris
    , (IF, "Iris's father")
    , (IM, "Iris's mother")
    , (IP, "playing piano")
    , (IT, "Taoyuan")
    , (IY, "18")

-- jeremy
    , (JC, "chatting")
    , (JD, "fashion designer")
    , (JP, "soccer player")
    , (JF, "playing soccer")
    , (JM, "Jeremy's mother")
    , (JS, "Jeremy's younger sister")
    , (JT, "Tucheng")
    , (JW, "travel")
    , (JY, "19")

-- may
    , (MH, "XinXing High School")
    , (MP, "playing_computer_games")

-- oliver
    , (OF, "Oliver's father")
    , (OM, "Oliver's mother")
    , (ON, "Pan YanMin")
    , (OP, "PingZhen")
    , (OS, "Oliver's older sister")
    , (OT, "Taipei")

-- roger
    , (QB, "Roger's older brother")
    , (QF, "Roger's father")
    , (QI, "YiLan")
    , (QM, "Roger's mother")
    , (QS, "business man")
    , (QW, "Dwyane Wade")
    , (QY, "18")

-- silvi
    , (SD, "dancing")
    , (SF, "Silvi's father")
    , (SG, "Gucci")
    , (SM, "Silvi's mother")
    , (SO, "Omo")
    , (ST, "Taichung")

	]

ent_ided :: String -> Entity
ent_ided name = head [entity | (entity,string) <- entity_check ,
				name == string
				]

characters :: [(String,Entity)]
characters = [(string,entity) | (entity,string) <- entity_check,
				string /= ""
				]
namelist :: [String]
namelist = [string | (entity,string) <- entity_check, string /= "" ]

predid1 :: String -> OnePlacePred
predid2 :: String -> TwoPlacePred
predid3 :: String -> ThreePlacePred
predid4 :: String -> FourPlacePred

predid2 name = lookup2 name twoPlacers where
	lookup2 n []	= error $ "no '" ++ name ++ "' two-place predicate."
	lookup2 n ((name,pred):is) | n == name	= pred
	lookup2 n (i:is) = lookup2 name is
predid3 name = lookupPred name threePlacers where
	lookupPred n []	= error $ "no '" ++ name ++ "' three-place predicate."
	lookupPred n ((name,pred):is) | n == name      = pred
	lookupPred n (i:is) = lookupPred name is
predid4 name = lookupPred name fourPlacers where
	lookupPred n []	= error $ "no '" ++ name ++ "' four-place predicate."
	lookupPred n ((name,pred):is) | n == name     = pred
	lookupPred n (i:is) = lookupPred name is
predid5 name = lookupPred name fivePlacers where
	lookupPred n []	= error $ "no '" ++ name ++ "' five-place predicate."
	lookupPred n ((name,pred):is) | n == name	= pred
	lookupPred n (i:is) = lookupPred name is

afld_freshman    = [J,M,O,T]
afld_senior    = [B]
other_students = [JS,OS,QB]
students = afld_freshman ++ afld_senior ++ other_students

onePlacers :: [(String, OnePlacePred)]
onePlacers = [
	("true",	pred1 entities )
	, ("false",	pred1 [] )
	, ("role",	pred1 [] )
	, ("teacher",	pred1 [ t | (t,_,_,_,_) <- schooling,
				    t /= Unspec ] ) 
	, ("student",	pred1 students )
	, ("worker",	pred1 [ w | (w,period,_) <- careers,
				    period == Present ] )
	, ("father",	pred1 [OF] )
	, ("mother",	pred1 [ m | (m,_,_,_) <- births,
				    m /= Unspec ] )
	, ("dream", pred1 [D] )
	, ("brother", pred1 [BB] )
	, ("sister", pred1 [JS,OS] )

	, ("male",	pred1 [J,O] )
	, ("female",	pred1 [M] )
	, ("thing",	thing )

	, ("humorous",	pred1 [O] )
	, ("optimistic",	pred1 [O,Q] )

	, ("18",	pred1 [I,Q] )
	, ("19",	pred1 [J,U] )
	, ("21",	pred1 [B] )
-- betty
	, ("cute",	pred1 [BN,BO] )
	, ("study",	pred1 [T] )

-- emily2
	, ("friend", pred1 [TF] )

	, ("difficult",	pred1 [J,E])

-- silvi
  , ("pet", pred1 [SO,SG])

	]

-- predid1 "sibling"   = or [(pred1 [JS]) (predid1 "brother") (predid1 "sister")]
predid1 "dogs_and_cats"	= predid1 "pet"
predid1 "english"	= predid1 "applied_foreign_languages"
predid1 "positive"	= predid1 "optimistic"
predid1 name = lookup1 name onePlacers where
	lookup1 name []	= error $ "no '" ++ name ++ "' one-place predicate."
	lookup1 name ((n,p):_) | n == name	= p
	lookup1 name (i:is) = lookup1 name is

type OnePlacePred	= Entity -> Bool
type TwoPlacePred	= Entity -> Entity -> Bool
type ThreePlacePred	= Entity -> Entity -> Entity -> Bool
type FourPlacePred	= Entity -> Entity -> Entity -> Entity -> Bool
type FivePlacePred	= Entity -> Entity -> Entity -> Entity -> Entity -> Bool

list2OnePlacePred :: [Entity] -> OnePlacePred
list2OnePlacePred xs	= \ x -> elem x xs

pred1 :: [Entity] -> OnePlacePred
pred1	= flip elem

person, thing :: OnePlacePred
person	= \ x -> (predid1 "male" x || predid1 "female" x || predid1 "role" x || x == Someone)
thing	= \ x -> (x == Unspec || x == Something || not ( person x ) )

pred2 :: [(Entity,Entity)] -> TwoPlacePred
pred3 :: [(Entity,Entity,Entity)] -> ThreePlacePred
pred2 xs	= curry ( `elem` xs )
pred3 xs	= curry3 ( `elem` xs )
pred4 xs	= curry4 ( `elem` xs )
pred5 xs	= curry5 ( `elem` xs )

-- (agent,theme,result,aim)
features	= []
services    = []

knowledge	= []
acquaintances	= [(T,TF)]
residents   = [(O,OP),(B,X),(I,IT),(Q,QI)]
family	= [
  (B,BB),(B,BM),(B,BN),(B,BO)
  ,(O,OF),(O,OM),(O,OS)
  ,(J,JM),(J,JS)
  ,(I,IF),(I,IM)
  ,(Q,QB),(Q,QF),(Q,QM)
  ,(S,SO),(S,SG)

  ]
-- (planner,situation,achiever,goal)
goals	= []
dream = [
  (J,Future,JD),(J,Future,JP),(J,Future,JW)
  ,(T,Future,TL),(T,Future,TN)
  ,(U,Future,UT)
  ]
-- see births
possessions = family ++ acquaintances ++ [ (e,D) | (e,_,_) <- dream]

twoPlacers :: [(String, TwoPlacePred)]
twoPlacers = [
    ("know",	pred2 $ knowledge ++ acquaintances ++ map swap acquaintances)
    , ("come",	pred2 $ [ (p,o) | (_,p,o,_) <- births ])
    , ("have",	pred2 $ possessions ++ (foldl  (\hs (t,_,_,s,d) -> (t,s): (s,t): (s,d): hs )
			[] schooling )
	)
    , ("like",	pred2 appreciation)
    , ("live",	pred2 residents )
    , ("work",	pred2 $ [(a,c) | (a,p,c) <- careers, p == Present ] )
    , ("kind",	pred2 $ [(student, H) | (_,_,_,student,_) <- schooling ])
    , ("placing",	pred2 $ [(student, school) | (_,school,_,student,_) <- schooling ]
		++ [(worker, place) | (worker,period,place) <- careers,
						    period == Present ]
		++ residents )
    , ("study", pred2 $ foldl (\hs (_,school,subject,student,_) ->
		    (student,subject): (student,school) : hs) [] schooling )
    , ("want_to_become",	pred2 $ [(a,c) | (a,p,c) <- dream,
					    p == Future ] )
    ]

curry3 :: ((a,b,c) -> d) -> a -> b -> c -> d
curry3 f x y z	= f (x,y,z)
curry4 f x y z w	= f (x,y,z,w)
curry5 f x y z w v	= f (x,y,z,w,v)

-- was (appreciator, performance, actor)
appreciation	= [
  (B,BA),(B,BC),(B,BE),(B,BP),(B,BU)
  ,(J,U),(J,JC),(J,JF)
  ,(M,V),(M,R),(M,P),(M,C)
  ,(O,U),(O,B)
  ,(U,E),(U,UF),(U,P),(U,Y)
  ,(I,E),(I,IP),(I,P)
  ,(Q,L),(Q,QW)
  ]
data Period	= Present | Future
		deriving (Eq,Show,Bounded,Enum,Ord)
periods :: [Period]
periods	=  [minBound..maxBound]
-- (agent, status, ie present or future, career)
careers	    = [(J,Future,JP),(J,Future,JD),(QF,Present,QM)]

threePlacers = [
    ("study_subj_at", pred3 $ map (\(_,school,subject,student,_) ->
		    (student,subject,school) ) schooling )
    ]

agent, theme, recipient, location, instrument ::
	(Entity,Entity,Entity) -> Entity
agent (a,_,_) = a
theme (_,t,_) = t
recipient (_,_,r) = r
patient = theme
mode = theme
location = recipient
source	= recipient
instrument = recipient
origin	= theme
destination = recipient

acceptances = []
-- (seller, item, buyer)
selling	= []

said	= pred2 $ map (\x->(agent4 x, theme4 x) ) comms
asked	= pred2 $ map (\x->(agent4 x, recipient4 x) ) comms
ask_about = pred3 $ map (\x->(agent4 x, recipient4 x, theme4 x) ) comms
talked	= pred2 $ map (\x->(agent4 x, recipient4 x) ) comms
              ++  map (\(agent,theme,recipient,_)->(recipient, agent) ) comms
talk_about = pred3 $ map (\x->(agent4 x, recipient4 x, theme4 x) ) comms

-- (teacher,school(location),subject,student,year)
schooling   = [(Unspec,H,TJ,T,TM)]
  ++ map (\s -> (Unspec,H,E,s,TM) ) afld_freshman
  ++ map (\s -> (Unspec,H,E,s,BS) ) afld_senior
  ++ map (\s -> (Unspec,Unspec,Unspec,s,Unspec) ) other_students

recite = pred2 $ map ( \x -> (agent4 x, theme4 x) ) comms
giving	= map (\(a,t,p,_) -> (a,t,p) ) services
-- (speaker,(predicate,referent),listener)
comms	= []
-- (instigator,act,agent,situation)
directives  = []
-- (mother,baby,place,age)
births	= [
  (BM,B,T,BY)
  ,(Unspec,F,Unspec,Unspec)
  ,(JM,J,JT,JY)
  ,(Unspec,M,Unspec,Unspec)
  ,(OM,O,OT,Unspec)
  ,(SM,S,ST,Unspec)
  ,(UM,U,Unspec,UY)
  ,(IM,I,Unspec,IY)
  ,(QM,Q,QI,QY)
  ]

fourPlacers = [
    ("born",	pred4 $ foldl (\cc (a,r,l,t) -> (a,r,l,t): (a,r,t,l): cc) [] births)
    , ("held", pred4 $ map (\(_,school,subject,student,degree) ->
				(student,degree,subject,school) ) schooling )

	]

agent4, theme4, recipient4, location4 :: (Entity,Entity,Entity,Entity) -> Entity
agent4 (a,_,_,_)	= a
theme4 (_,t,_,_)	= t
recipient4 (_,_,r,_)	= r
provider4	= recipient4
location4 (_,_,_,l)	= l
mode4	= location4
purpose4	= location4
aim4	= purpose4
result4	= recipient4


fivePlacers = [
	]


agent5, theme5, recipient5, location5 :: (Entity,Entity,Entity,Entity,Entity) -> Entity
agent5 (a,_,_,_,_)	= a
theme5 (_,t,_,_,_)	= t
destination5 = theme5
recipient5 (_,_,r,_,_)	= r
provider5	= recipient5
result5	= recipient5
style5	= recipient5
feature5 (_,_,_,f,_)	= f
location5 (_,_,_,_,l)	= l
purpose5	= location5
aim5	= purpose5
vehicle5	= location5

forgetful5 :: FivePlacePred -> FourPlacePred
forgetful5 r u v w t = or ( map ( r u v w t ) entities )

forgetful4 :: FourPlacePred -> ThreePlacePred
forgetful4 r u v w = or ( map ( r u v w ) entities )

forgetful3 :: ThreePlacePred -> TwoPlacePred
forgetful3 r u v = or ( map ( r u v ) entities )

forgetful2 :: TwoPlacePred -> OnePlacePred
forgetful2 r u = or ( map ( r u ) entities )

passivize :: TwoPlacePred -> OnePlacePred
passivize r	= \ x -> or ( map ( flip  r x ) entities )

passivize3 :: ThreePlacePred -> TwoPlacePred
passivize3 r	= \x y -> or ( map ( \u -> r u x y ) entities )

passivize4 r = \x y z -> or ( map (\u -> r u x y z ) entities )

self ::  (a -> a -> b) -> a -> b
self p	= \ x -> p x x

-- vim: set ts=8 sts=2 sw=2 noet:
