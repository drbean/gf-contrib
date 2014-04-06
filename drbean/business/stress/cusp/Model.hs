module Model where 

import Data.Tuple
import Data.List
import Data.Maybe
data Entity	= A | B | C | D | E | F | G
            | H | I | J | K | L | M | N 
            | O | P | Q | R | S | T | U 
            | V | W | X | Y | Z | Someone | Something | Unspec
     deriving (Eq,Show,Bounded,Enum,Ord)

entities :: [Entity]
entities	=  [minBound..maxBound] 

entity_check :: [ (Entity, String) ]
entity_check =  [
    (A, "CUSP" )
    , (B, "Bradshaw" )
    , (C, "C" )
    , (D, "control" )
    , (E, "" )		-- manager
    , (F, "" )		-- manager
    , (G, "Gourlay" )
    , (H, "" )		-- help
    , (I, "In Equilibrium" )
    , (J, "" )
    , (K, "" )
    , (L, "" )
    , (M, "men" )
    , (N, "" )		-- lack of control
    , (O, "" )		-- lack of support
    , (P, "P" )
    , (Q, "pressure" )
    , (R, "" )		-- performance
    , (S, "S" )
    , (T, "support" )
    , (U, "U" )
    , (V, "uncertainty" )
    , (W, "women" )
    , (X, "stress" )
    , (Y, "" )		-- level of stress
    , (Z, "" )
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

predid2 name
       | Just pred <- lookup name twoPlacers = pred
        | otherwise    = error $ "no '" ++ name ++ "' two-place predicate."
predid3 name
       | Just pred <- lookup name threePlacers = pred
        | otherwise    = error $ "no '" ++ name ++ "' three-place predicate."
predid4 name
       | Just pred <- lookup name fourPlacers = pred
        | otherwise    = error $ "no '" ++ name ++ "' four-place predicate."
predid5 name
       | Just pred <- lookup name fivePlacers = pred
        | otherwise    = error $ "no '" ++ name ++ "' five-place predicate."

onePlacers :: [(String, OnePlacePred)]
onePlacers = [
        ("true",        pred1 entities )
        , ("false",     pred1 [] )
        , ("role",      pred1 [] )

	, ("manager",	 pred1 [E,F] )
	, ("individual",	 pred1 [E,F,B,G] )
	, ("people",	 pred1 [E,F,B,G,M,W] )
	, ("framework",	 pred1 [C] )
	, ("company",	 pred1 [I] )
	, ("work",	 pred1 $ [J] ++ map agent working )
	, ("worker",	 pred1 $ map agent working )

	, ("assertive",	 pred1 [] )
	, ("bad",	 pred1 [N,Q,O,V,X,Y] )
	, ("best_placed",	 pred1 [E,F] )

	, ("cause_of",	 pred1 [N,O,P,V] )
	, ("characteristic",	 pred1 [D,R,T,V] )
	, ("common",	 pred1 [X,Y,N,O,V,Q] )
	, ("critically_important",	 pred1 [A,D,T] )
	, ("day_to_day",	 pred1 [R] )
	, ("difficult",	 pred1 [] )
	, ("effective",	 pred1 [A] )
	, ("good",	 pred1 [T,E] )
	, ("helpless",	 pred1 [M,W] )
	, ("unsupported",	 pred1 [M,W] )
	, ("high",	 pred1 [Y] )
	, ("little",	 pred1 [D,T] )

	, ("stressful",	 pred1 [N,O,Q,V] )
	, ("male",	 pred1 [B,M,E] )
	, ("female",	 pred1 [G,W,F] )
	]

predid1 "women"  = predid1 "female"
predid1 "men"  = predid1 "male"

predid1 name
       | Just pred <- lookup name onePlacers = pred
       | otherwise    = error $ "no '" ++ name ++ "' one-place predicate."

type OnePlacePred	= Entity -> Bool
type TwoPlacePred	= Entity -> Entity -> Bool
type ThreePlacePred	= Entity -> Entity -> Entity -> Bool
type FourPlacePred      = Entity -> Entity -> Entity -> Entity -> Bool
type FivePlacePred      = Entity -> Entity -> Entity -> Entity -> Entity ->  Bool

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

possessions	= [(B,J),(T,J),(E,J),(B,X),(T,X),(E,X),(T,G)]
appreciation	= [ (E,Unspec,J) ]
qualities	= [ (B,A),(T,G),(B,X),(T,X),(E,X) ]
conflict	= []
supervision	= []
isBoss	= pred1 $ map fst supervision
isWorker	= pred1 $ map snd supervision

supervisor	= pred1 $ map fst supervision
boss	= supervisor
subordinate	= pred1 $ map snd supervision
employee	= subordinate
manager = boss

disappointments = []
disappoint	= pred2 $ disappointments
resent	= pred2 $ map swap disappointments

knowledge	= [(B,I),(G,I),(E,I)]
acquaintances	= []
help	= pred2 $ supervision

twoPlacers :: [(String, TwoPlacePred)]
twoPlacers = [
    ("face_to_face",  pred2 $ [(E,M),(E,W),(F,M),(F,W)])
    , ("know_V2",    pred2 $ knowledge ++ acquaintances ++ map swap acquaintances)
    , ("have",  pred2 $ possessions ++ qualities ++
					map (\(_,t,r) -> (r,t)) giving )
    , ("stand", pred2[(C,D),(P,Q),(S,T),(U,V)])
    , ("lack", pred2 [(N,D),(O,T)])
    , ("level", pred2 [(Y,X)])
    , ("more_vulnerable", pred2 [(M,W)])
    , ("more_high", pred2 [])
    , ("like",  pred2 $ map (\(a,t,r) -> (a,r)) appreciation)
    , ("work",  pred2 $ [(a,c) | (a,p,c) <- working] )
	, ("placing", pred2 [(worker, place) | (worker,_,place) <- working ])
    ]

curry3 :: ((a,b,c) -> d) -> a -> b -> c -> d
curry3 f x y z	= f (x,y,z)
curry4 f x y z w	= f (x,y,z,w)

threePlacers = [
    ("liked", pred3 appreciation )
    , ("work",        pred3 $ [(a,a,c) | (a,p,c) <- working ] )
    ]


agent, theme, recipient, location, instrument ::
	(Entity,Entity,Entity) -> Entity
agent (a,_,_) = a
theme (_,t,_) = t
recipient (_,_,r) = r
patient = theme
location = recipient
instrument = recipient
origin	= theme
destination = recipient

--(worker,job,site)
working	= [(B,Unspec,I),(G,Unspec,I),(E,Unspec,Unspec),(F,Unspec,Unspec)]
comms	= [ (W,X,E),(W,X,F) ]
giving	= [ (B,H,E),(I,H,E),(G,H,F),(F,M,T) ]
--(agent,theme,location)
seeing	= []
--(agent,origin,destination)

work_where	= pred2 $ map (\x -> (agent x, location x) ) working
work_as = pred2 $ map (\x -> (agent x, theme x) ) working
said	= pred2 $ map (\x->(agent x, theme x) ) comms
asked	= pred2 $ map (\x->(agent x, recipient x) ) comms
ask_about = pred3 $ map (\x->(agent x, recipient x, theme x) ) comms
talked	= pred2 $ map (\x->(agent x, recipient x) ) comms
              ++  map (\(agent,theme,recipient)->(recipient, agent) ) comms
talk_about = pred3 $ map (\x->(agent x, recipient x, theme x) ) comms

-- (teacher,school(location),subject,student,degree)
--(person,subject)


gave	= pred3 giving
got	= pred2 $ map (\x -> (recipient x, patient x) ) giving
got_from	= pred3 $ map (\x -> (recipient x, patient x, agent x) ) giving

told	= pred3 comms

recite = pred2 $ map ( \x -> (agent x, theme x) ) comms

fourPlacers = [
        ]


agent4, theme4, recipient4, location4 :: (Entity,Entity,Entity,Entity) -> Entity
agent4 (a,_,_,_) = a
location4 (_,l,_,_) = l
theme4 (_,_,t,_) = t
recipient4 (_,_,_,r) = r
provider4       = recipient4
location4' (_,_,_,l)     = l
mode4   = location4'
purpose4        = location4'
aim4    = purpose4
result4 = recipient4

fivePlacers = [
        ]


agent5, theme5, recipient5, location5 :: (Entity,Entity,Entity,Entity, Entity) -> Entity
-- for schooling
agent5		(a,_,_,_,_) = a
location5	(_,l,_,_,_) = l
theme5		(_,_,t,_,_) = t
destination5 = theme5
recipient5	(_,_,_,r,_) = r
feature5	(_,_,_,_,f) = f
provider5       = location5
result5 = feature5
style5  = recipient5
purpose5        = feature5
aim5    = purpose5
vehicle5        = location5

forgetful5 :: FivePlacePred -> FourPlacePred
forgetful5 r u v w t = or ( map ( r u v w t ) entities )

forgetful4 :: FourPlacePred -> ThreePlacePred
forgetful4 r u v w = or ( map ( r u v w ) entities )

forgetful3 :: ThreePlacePred -> TwoPlacePred
forgetful3 r u v = or ( map ( r u v ) entities )

forgetful2 :: TwoPlacePred -> OnePlacePred
forgetful2 r u = or ( map ( r u ) entities )

passivize :: TwoPlacePred -> OnePlacePred
passivize r     = \ x -> or ( map ( flip  r x ) entities )

passivize3 :: ThreePlacePred -> TwoPlacePred
passivize3 r    = \x y -> or ( map ( \u -> r u x y ) entities )

passivize4 r = \x y z -> or ( map (\u -> r u x y z ) entities )

self ::  (a -> a -> b) -> a -> b
self p	= \ x -> p x x 
