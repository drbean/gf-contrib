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
    (A, "ariel" )
    , (B, "baseball" )
    , (C, "chiyuantien" )
    , (D, "" )
    , (E, "english" )
    , (F, "father" )
    , (G, "" )
    , (H, "" )
    , (I, "" )
    , (J, "" )
    , (K, "" )
    , (L, "" )
    , (M, "mother" )
    , (N, "name" )
    , (O, "brother" )
    , (P, "" )
    , (Q, "" )
    , (R, "" )
    , (S, "simon" )
    , (T, "guitar" )
    , (U, "drums" )
    , (V, "minghu" )
    , (W, "wenhua" )
    , (X, "taipei" )
    , (Y, "sister" )
    , (Z, "" )
    ]

ent_ided :: String -> Entity
ent_ided name = head [entity | (entity,string) <- entity_check ,
				name == string
				]

characters :: [(String,Entity)]
characters = map findEnt [O]
	where findEnt e
		| Just name <- lookup e entity_check
			= (name,e)
		| otherwise = error ("No " ++ (show e))

stringEntity :: [(String,Entity)]
stringEntity = map swap entity_check

namelist :: [String]
namelist = [string | (entity,string) <- entity_check, string /= "" ]

predid1 :: String -> Maybe OnePlacePred
predid2 :: String -> Maybe TwoPlacePred
predid3 :: String -> Maybe ThreePlacePred
predid4 :: String -> Maybe FourPlacePred

predid3 name
       | Just pred <- lookup name threePlacers = Just pred
        -- | otherwise    = Nothing
        | otherwise    = error $ "no '" ++ name ++ "' three-place predicate."
predid4 name
       | Just pred <- lookup name fourPlacers = Just pred
        -- | otherwise    = Nothing
        | otherwise    = error $ "no '" ++ name ++ "' four-place predicate."
predid5 name
       | Just pred <- lookup name fivePlacers = Just pred
        -- | otherwise    = Nothing
        | otherwise    = error $ "no '" ++ name ++ "' five-place predicate."

onePlacers, onePlaceStarters, entityonePlacers :: [(String, OnePlacePred)]
onePlaceStarters = [
        ("true",        pred1 entities )
        , ("false",     pred1 [] )
        , ("role",      pred1 [] )


	, ("study",	pred1 [] )
	, ("male",	pred1 [S] )
	, ("female",	pred1 [A] )
	, ("chinese",	pred1 [N] )
	]


onePlacers = 
	(genonePlacer affiliation "name" "name" Result) :
	(genonePlacer affiliation "mother" "mother" Pivot) :
	-- (genonePlacer affiliation "father" "father" Pivot) :
	-- (genonePlacer affiliation "older_sister" "older_sister" Pivot) :
	(genonePlacer attitude "sport" "basketball" Stimulus) :
	(genonePlacer attitude "favorite" "basketball" Stimulus) :
	entityonePlacers ++ onePlaceStarters

predid1 "person"	= Just person
predid1 "thing"	= Just thing

predid1 "humorous" = predid1 "simon"
predid1 "happy" = predid1 "simon"
predid1 "nineteen" = predid1 "ariel"

predid1 name
       | Just pred <- lookup name onePlacers = Just pred
        -- | otherwise    = Nothing
       | otherwise    = error $ "no '" ++ name ++ "' one-place predicate."

entityonePlacers =
	map (\x -> (snd x, pred1 [fst x])) entity_check

genonePlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> 
	(String, OnePlacePred)
genonePlacer area id content role =
	( id, pred1 [ r | (co,cs) <- area
		, co == content
		, Just r <-[lookup role cs]
		] )

type OnePlacePred	= Entity -> Bool
type TwoPlacePred	= Entity -> Entity -> Bool
type ThreePlacePred	= Entity -> Entity -> Entity -> Bool
type FourPlacePred      = Entity -> Entity -> Entity -> Entity -> Bool
type FivePlacePred      = Entity -> Entity -> Entity -> Entity -> Entity ->  Bool

list2OnePlacePred :: [Entity] -> OnePlacePred
list2OnePlacePred xs	= \ x -> elem x xs

pred1 :: [Entity] -> OnePlacePred
pred1	= flip elem

test1 :: String -> OnePlacePred
test1 p = fromMaybe (\_ -> False) (predid1 p)

person, thing :: OnePlacePred
person	= \ x -> (test1 "male" x || test1 "female" x || test1 "role" x || x == Someone)
thing	= \ x -> (x == Unspec || x == Something || not ( person x ) )

pred2 :: [(Entity,Entity)] -> TwoPlacePred
pred3 :: [(Entity,Entity,Entity)] -> ThreePlacePred
pred2 xs	= curry ( `elem` xs )
pred3 xs	= curry3 ( `elem` xs )
pred4 xs	= curry4 ( `elem` xs )

goal :: [ (Content, [(Case, Entity)]) ]
goal = [
	]

event :: [ (Content, [(Case, Entity)]) ]
event = [
	("make", [(Agent,C),(Patient,O),(Result,R)] )
	, ("make", [(Agent,C),(Predicate,P)] )

	]

condition :: [ (Content, [(Case, Entity)]) ]
condition = [
	("feel", [(Patient,O),(Predicate,P)] )
	, ("happy", [(Predicate,P),(Patient,O)] )
	, ("relaxed", [(Predicate,P),(Patient,O)] )
	, ("happy", [(Result,R),(Patient,O)] )
	, ("relaxed", [(Result,R),(Patient,O)] )
	, ("positive", [(Predicate,P),(Patient,O)] )
	]

idea :: [ (Content, [(Case, Entity)]) ]
idea = [
	("say", [(Agent,O),(Predicate,P)] )
	, ("think", [(Agent,O),(Predicate,P)] )
	]

attitude :: [ (Content, [(Case, Entity)]) ]
attitude = [
	("music", [(Experiencer,O),(Stimulus,C)] )
	, ("basketball", [(Experiencer,O),(Stimulus,B)] )
	]

affiliation :: [ (Content, [(Case, Entity)]) ]
affiliation = [
	("resident", [(Theme,S),(Location,X) ] )
	, ("mother", [(Pivot,M),(Theme,S) ] )
	, ("father", [(Pivot,F),(Theme,S) ] )
	, ("sister", [(Pivot,Y),(Theme,S) ] )
	, ("brother", [(Pivot,O),(Theme,S) ] )
	, ("mother", [(Pivot,M),(Theme,A) ] )
	, ("father", [(Pivot,F),(Theme,A) ] )
	, ("student", [(Agent,Y),(Location,U) ] )
	, ("name", [(Theme,A),(Result,A) ] )
	, ("name", [(Theme,A),(Result,C) ] )
	]

gentwoPlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> Case ->
	(String, [(Entity,Entity)] )
gentwoPlacer area id content role1 role2 =
	( id, [ (r1,r2) | (co,cs) <- area
		, co == content
		, Just r1 <-[lookup role1 cs]
		, Just r2 <- [lookup role2 cs]
		] )

conflict	= []
supervision	= [(D,L)]
isBoss	= pred1 $ map fst supervision
isWorker	= pred1 $ map snd supervision

supervisor	= pred1 $ map fst supervision
boss	= supervisor
subordinate	= pred1 $ map snd supervision
employee	= subordinate
manager = boss

knowledge	= [(B,F),(T,F),(E,F),(B,P),(T,P),(E,P)]
acquaintances	= []
help	= pred2 $ supervision

twoPlacers, twoPlaceStarters :: [(String, [(Entity,Entity)])]
twoPlaceStarters = [
    ("know_V2",    knowledge ++ acquaintances ++ map swap acquaintances)
    , ("kind",  [(student, H) | (_,_,_,student,_) <- schooling ])
    , ("placing",       [(student, school) | (_,school,_,student,_) <- schooling ]
                )
    , ("studied", foldl (\hs (_,school,subject,student,_) ->
                    (student,subject): (student,school) : hs) [] schooling )
    ]

twoPlacers =
	(gentwoPlacer affiliation "have" "name" Theme Result) :
	(gentwoPlacer affiliation "have" "father" Theme Pivot) :
	(gentwoPlacer affiliation "have" "mother" Theme Pivot) :
	(gentwoPlacer affiliation "have" "brother" Theme Pivot) :
	(gentwoPlacer affiliation "have" "sister" Theme Pivot) :
	(gentwoPlacer affiliation "live" "resident" Theme Location) :
	(gentwoPlacer affiliation "study" "student" Agent Location) :
	(gentwoPlacer affiliation "in_prep" "student" Agent Location) :
	(gentwoPlacer attitude "have" "basketball" Experiencer Stimulus) :
	(gentwoPlacer attitude "love" "basketball" Experiencer Stimulus) :
	(gentwoPlacer attitude "love" "music" Experiencer Stimulus) :
	(gentwoPlacer condition "feel" "feel" Patient Predicate) :
	(gentwoPlacer condition "happy" "happy" Predicate Patient) :
	(gentwoPlacer condition "in_form_of" "in_form_of" Patient Instrument) :
	(gentwoPlacer condition "make" "make" Agent Predicate) :
	(gentwoPlacer condition "relaxed" "relaxed" Predicate Patient) :
	(gentwoPlacer event "get" "give" Recipient Theme) :
	(gentwoPlacer idea "say" "say" Agent Predicate) :
	(gentwoPlacer idea "think" "think" Agent Predicate) :
	(gentwoPlacer condition "positive" "positive" Predicate Patient) :
	twoPlaceStarters

predid2 name = if name `elem` (map fst twoPlacers) then
	Just (pred2 (concat [ twople | (id, twople) <- twoPlacers
		, id == name] ) ) else
		-- Nothing
		error $ "no '" ++ name ++ "' two-place predicate."

curry3 :: ((a,b,c) -> d) -> a -> b -> c -> d
curry3 f x y z	= f (x,y,z)
curry4 f x y z w	= f (x,y,z,w)

genthreePlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> Case -> Case ->
	(String, ThreePlacePred)
genthreePlacer area id content role1 role2 role3 =
	( id, pred3 [ (r1,r2,r3) | (co,cs) <- area
		, co == content
		, Just r1 <-[lookup role1 cs]
		, Just r2 <- [lookup role2 cs]
		, Just r3 <- [lookup role3 cs]
		] )

threePlacers, threePlaceStarters :: [(String, ThreePlacePred)]
threePlaceStarters = [
    ("studied_subj_at", pred3 $ map (\(_,school,subject,student,_) ->
                    (student,subject,school) ) schooling )
    ]
threePlacers =
	(genthreePlacer idea "take_care" "care" Topic Agent Patient) :
	(genthreePlacer idea "take_care" "care" Topic Agent Theme) :
	(genthreePlacer idea "think:can_to_get" "another_job" Agent Agent Theme) :
	(genthreePlacer event "hand" "hand" Agent Recipient Theme) :
	(genthreePlacer event "give" "give" Agent Recipient Theme) :
	(genthreePlacer condition "have_V2V_to_buy_V2" "have" Patient Instrument Theme) :
	(genthreePlacer event "buy" "buy" Agent Recipient Theme) :
	threePlaceStarters

type Content = String
data Case = Agent | Asset | Attribute | Beneficiary | Cause | CoAgent |
	CoPatient | CoTheme | Destination | Experiencer | Extent | Goal |
	InitialLocation | Instrument | Location | Material | Patient | Pivot |
	Predicate | Product | Recipient | Reflexive | Result | Source |
	Stimulus | Theme | Time | Topic | Trajectory | Value
  deriving Eq

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

comms	= []
giving	= []
--(agent,theme,location)
looking_back	= []
seeing	= []
--(agent,origin,destination)

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
schooling = []
--(person,school)
education	= []
--(person,subject)
subjects	= []

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

genfourPlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> Case -> Case ->
	Case -> (String, FourPlacePred)
genfourPlacer area id content role1 role2 role3 role4 =
	( id, pred4 [ (r1,r2,r3,r4) | (co,cs) <- area
		, co == content
		, Just r1 <-[lookup role1 cs]
		, Just r2 <- [lookup role2 cs]
		, Just r3 <- [lookup role3 cs]
		, Just r4 <- [lookup role4 cs]
		] )

fourPlacers, fourPlaceStarters :: [(String, FourPlacePred)]
fourPlaceStarters = [
        ]

fourPlacers =
	fourPlaceStarters

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

-- vim: set ts=2 sts=2 sw=2 noet:
