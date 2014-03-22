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
    (A, "" )	-- aim
    , (B, "Barbara" )
    , (C, "Dr Bean" )
    , (D, "degree" )
    , (E, "Eva" )
    , (F, "Fast-Track" )
    , (G, "judgement" )
    , (H, "high_school" )
    , (I, "" )
    , (J, "job" )
    , (K, "" )
    , (L, "" )
    , (M, "marketing" )
    , (N, "engineering" )
    , (O, "" )
    , (P, "diploma" )
    , (Q, "" )
    , (R, "" )
    , (S, "history" )
    , (T, "Tadeusz" )
    , (U, "college" )
    , (V, "" )
    , (W, "" )
    , (X, "experience" )
    , (Y, "interview" )
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

	, ("high_school",	 pred1 [U] )
	, ("college",	 pred1 [U] )
	, ("diploma",	 pred1 [P] )
	, ("degree",	 pred1 [D] )
	, ("aim",	 pred1 [A] )
	, ("company",	 pred1 [F] )
	, ("department",	 pred1 [F] )
	, ("story",	 pred1 [Y] )
	, ("job",	 pred1 [J] )
	, ("work",	 pred1 $ [J] ++ map agent working )
	, ("worker",	 pred1 $ map agent working )
	, ("learner",	 pred1 $ map recipient5 schooling )

	, ("ambitious",	 pred1 [B] )
	, ("competitive",	 pred1 [B] )
	, ("confident",	 pred1 [B] )
	, ("outgoing",	 pred1 [B] )
	, ("difficult",	 pred1 [B] )
	, ("experienced",	 pred1 [B,T,E] )
	, ("polish",	 pred1 [B,T] )
	, ("successful",	 pred1 [B,T,E] )

	, ("realistic",	 pred1 [T,E] )
	, ("judgement",	 pred1 [G] )
	, ("experience",	 pred1 [X] )
	, ("head",	 pred1 [] )

	, ("fast",	 pred1 [B,E] )
	, ("good",	 pred1 [T,E] )

	, ("male",	 pred1 [T] )
	, ("female",	 pred1 [B,E] )
	]

predid1 "woman"  = predid1 "female"
predid1 "man"  = predid1 "male"

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
have	= pred2 $ possessions
		++ ( map (\x->(recipient x, theme x) ) giving )

knowledge	= [(B,F),(T,F),(E,F)]
acquaintances	= []
help	= pred2 $ supervision

twoPlacers :: [(String, TwoPlacePred)]
twoPlacers = [
    ("know",    pred2 $ knowledge ++ acquaintances ++ map swap acquaintances)
    , ("have",  pred2 $ possessions ++ qualities ++
					map (\(_,l,_,r,_) ->(r,l) ) schooling)
    , ("like",  pred2 $ map (\(a,t,r) -> (a,r)) appreciation)
    , ("work",  pred2 $ [(a,c) | (a,p,c) <- working] )
    , ("kind",  pred2 $ [(student, H) | (_,_,_,student,_) <- schooling ])
    , ("placing",       pred2 $ [(student, school) | (_,school,_,student,_) <- schooling ]
                ++ [(worker, place) | (worker,period,place) <- working ])
    , ("studied", pred2 $ foldl (\hs (_,school,subject,student,_) ->
                    (student,subject): (student,school) : hs) [] schooling )
    ]

curry3 :: ((a,b,c) -> d) -> a -> b -> c -> d
curry3 f x y z	= f (x,y,z)
curry4 f x y z w	= f (x,y,z,w)

threePlacers = [
    ("liked", pred3 appreciation )
    , ("work",        pred3 $ [(a,a,c) | (a,p,c) <- working ] )
    , ("studied_subj_at", pred3 $ map (\(_,school,subject,student,_) ->
                    (student,subject,school) ) schooling )
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
working	= [(B,Unspec,F),(T,Unspec,F),(E,Unspec,F)]
comms	= [ (I,Unspec,D),(F,Unspec,D),(F,Unspec,A),(A,Unspec,D),(A,Unspec,I) ]
giving	= [ (I,J,D) ]
--(agent,theme,location)
looking_back	= [(D,C,V),(I,C,V)]
seeing	= []
--(agent,origin,destination)

work_where	= pred2 $ map (\x -> (agent x, location x) ) working
work_as = pred2 $ map (\x -> (agent x, theme x) ) working
look_back	= pred1 $ map agent looking_back
look_back_on	= pred2 $ map (\x->(agent x, theme x) ) looking_back
said	= pred2 $ map (\x->(agent x, theme x) ) comms
asked	= pred2 $ map (\x->(agent x, recipient x) ) comms
ask_about = pred3 $ map (\x->(agent x, recipient x, theme x) ) comms
talked	= pred2 $ map (\x->(agent x, recipient x) ) comms
              ++  map (\(agent,theme,recipient)->(recipient, agent) ) comms
talk_about = pred3 $ map (\x->(agent x, recipient x, theme x) ) comms
go_to	= pred2 $ map (\x->(recipient5 x,location5 x) ) schooling

-- (teacher,school(location),subject,student,degree)
schooling = [(Unspec,S,M,B,P),(Unspec,U,N,T,D),(Unspec,U,S,E,D)]
--(person,school)
education	= [ (B,H), (T,U), (E,U) ]
--(person,subject)
subjects	= [ (B,M), (T,N), (E,S) ]

studied = pred3 $ map ( \x -> (recipient5 x, theme5 x, location5 x) )
				schooling
studied_what = pred2 $ map (\x -> (recipient5 x, theme5 x) ) schooling
studied_where = pred2 $ map (\x -> (recipient5 x, location5 x) ) schooling
student = pred1 $ map recipient5 schooling
-- graduated_from ::  TwoPlacePred




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
