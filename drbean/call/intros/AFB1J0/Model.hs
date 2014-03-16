module Model where

import Data.Tuple
import Data.List
import Data.Maybe

data Entity	=

		  A | B | C | D | E | F | G
		| H | I | J | K | L | M | N
		| O | P | Q | R | S | T | U
		| V | W | X | Y | Z

		| JC | JD | JE | JF | JG
		| JM
		| JS | JT
		| JW | JY

		| MH | MP

		| OF | OM | ON
		| OP | OS | OT

		| Someone | Something | Unspec
		deriving (Eq,Show,Bounded,Enum,Ord)

entities :: [Entity]
entities	=  [minBound..maxBound]

entity_check :: [ (Entity, String) ]
entity_check =  [
    (A, "" )
    , (B, "Dr Bean" )
    , (C, "playing computer games" )
    , (D, "dream" )
    , (E, "English" )
    , (F, "Japanese" )
    , (G, "" )
    , (H, "Minghsin University" )
    , (I, "" )
    , (J, "Jeremy" )
    , (K, "basketball" )
    , (L, "" )
    , (M, "May" )
    , (N, "" )
    , (O, "Oliver" )
    , (P, "" )
    , (Q, "" )
    , (R, "reading" )
    , (S, "going_shopping")
    , (T, "" )
    , (U, "listening_to_music" )
    , (V, "watching_TV")
    , (W, "Taiwan" )
    , (X, "Hsinchu" )
    , (Y, "" )
    , (Z, "" )

-- jeremy
    , (JC, "chatting")
    , (JD, "fashion designer")
    , (JE, "soccer player")
    , (JF, "playing soccer")
    , (JG, "dream")
    , (JM, "Jeremy's mother")
    , (JS, "Jeremy's younger sister")
    , (JT, "Tucheng")
    , (JW, "travel")
    , (JY, "1994")

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

	]

ent_ided :: String -> Entity
ent_ided string = head [entity | (entity,string) <- entity_check,
				string /= ""
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

afld_students    = [J,M,O]
other_students = [JS,OS]
students = afld_students ++ other_students

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
	, ("grandmother", pred1 [] )
	, ("brother", pred1 [] )
	, ("sister", pred1 [JS,OS] )

	, ("male",	pred1 [J,O] )
	, ("female",	pred1 [M] )
	, ("thing",	thing )

	, ("old",	pred1 [B] )
	, ("reserved",	pred1 [] )
	, ("outgoing",	pred1 [] )
	, ("polite",	pred1 [] )
	, ("humorous",	pred1 [O] )
	, ("optimistic",	pred1 [O] )

	]

-- predid1 "sibling"   = or [(pred1 [JS]) (predid1 "brother") (predid1 "sister")]
predid1 "english"	= predid1 "applied_foreign_languages"
predid1 "positive"	= predid1 "optimistic"
predid1 "shy"	= predid1 "reserved"
predid1 "well-behaved"	= predid1 "polite"
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
acquaintances	= []
residents   = [(O,OP)]
family	= [(O,OF),(O,OM),(O,OS),(J,JM),(J,JS)]
dream = [(J,JD),(J,JE),(J,JW)]
-- see births
possessions = family ++ [(J,D)]

twoPlacers :: [(String, TwoPlacePred)]
twoPlacers = [
    ("know",	pred2 $ knowledge ++ acquaintances ++ map swap acquaintances)
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
    , ("studied", pred2 $ foldl (\hs (_,school,subject,student,_) ->
		    (student,subject): (student,school) : hs) [] schooling )
    ]

curry3 :: ((a,b,c) -> d) -> a -> b -> c -> d
curry3 f x y z	= f (x,y,z)
curry4 f x y z w	= f (x,y,z,w)
curry5 f x y z w v	= f (x,y,z,w,v)

-- was (appreciator, performance, actor)
appreciation	= [
  (J,U),(J,JC),(J,JF)
  ,(M,V),(M,R),(M,S),(M,C)
  ,(O,U),(O,B)
  ]
data Period	= Present | Future
		deriving (Eq,Show,Bounded,Enum,Ord)
periods :: [Period]
periods	=  [minBound..maxBound]
-- (agent, status, ie present or future, career)
careers	    = [(O,Future,JE),(J,Future,JD)]

threePlacers = [
    ("wanted_to_become",	pred3 $ [(a,a,c) | (a,p,c) <- careers,
					    p == Future ] )
    , ("studied_subj_at", pred3 $ map (\(_,school,subject,student,_) ->
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

-- (teacher,school(location),subject,student,degree)
schooling   = map (\s -> (B,H,E,s,Unspec) ) afld_students ++
		map (\s -> (Unspec,Unspec,Unspec,s,Unspec) ) other_students

recite = pred2 $ map ( \x -> (agent4 x, theme4 x) ) comms
giving	= map (\(a,t,p,_) -> (a,t,p) ) services
-- (speaker,content,listener,mode)
comms	= []
-- (instigator,act,agent,situation)
directives  = []
-- (planner,situation,achiever,goal)
goals	= []
-- (mother,baby,place,year)
births	= [(JM,J,JT,JY),(Unspec,M,Unspec,Unspec),(OM,O,OT,Unspec)]

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
