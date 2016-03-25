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
	(T, "tia" )
	, (C, "christine" )
	, (S, "steven" )
	, (V, "rutgers_university" )
	, (P, "mr_payne" )
	, (B, "mr_batchelor" )
	, (F, "finance" )
	, (A, "accounting" )
	, (W, "business_law" )
	]


ent_ided :: String -> Entity
ent_ided name = head [entity | (entity,string) <- entity_check ,
				name == string
				]

characters :: [(String,Entity)]
characters = map findEnt [Q]
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

	]

child	= pred1 [C,S]

boss	= pred1 [B]
company	= pred1 [O]
school	= pred1 [V]
teacher	= pred1 [P]
subject	= pred1 [F,A,W]
money	= pred1 [M]
story	= pred1 [Y]
job	= pred1 [J]
dress	= pred1 [R]
red	= pred1 [R]
offensive	= pred1 [L]
mean	= pred1 [N]
unfair	= pred1 [N]
language	= pred1 [L,N]
request	= pred1 [L,N]
treatment	= pred1 [L,N]
upbringing   = pred1 [G]

names = map swap characters

male, female :: OnePlacePred

male	= pred1 [S,P,B]
female	= pred1 [T,C]

onePlacers = 
	entityonePlacers ++ onePlaceStarters

predid1 "sitting_back"	= predid1 "retiring"
predid1 "enjoying_life"	= predid1 "retiring"
predid1 "child"	= predid1 "daughter"
predid1 "card"	= predid1 "birthday_card"
predid1 "woman"	= predid1 "female"
predid1 "man"	= predid1 "male"
predid1 "person"	= Just person
predid1 "thing"	= Just thing

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

boy	= \x -> male x && child x
isMan	= \x -> ( not $ boy x ) && male x
isGirl	= \x -> ( female x && child x )
isWoman	= \x -> ( not $ isGirl x ) && female x
isParent	= pred1 $ map fst parenting
isOffspring	= pred1 $ map snd parenting
isMother	= \x -> ( female x && isParent x )
father	= \x -> ( male x && isParent x )
daughter	= \x -> ( female x && isOffspring x )
son	= \x -> ( male x && isOffspring x )
interviewee = pred1 $ map patient recruitment
visitor = interviewee

pred2 :: [(Entity,Entity)] -> TwoPlacePred
pred3 :: [(Entity,Entity,Entity)] -> ThreePlacePred
pred2 xs	= curry ( `elem` xs )
pred3 xs	= curry3 ( `elem` xs )
pred4 xs	= curry4 ( `elem` xs )

type Content  = String

--(parent,child)
parenting	= [(T,C),(T,S)]
supervision	= [(B,T)]
marriages	= [(Unspec,T)]
--(husband,wife,wedding_location)
weddings	= []
--(divorcer,divorced)
separations	= []
-- divorces	= []
--(boyfriend,girlfriend)
-- unmarried_couples	= []
--(contacter,contactee)
possessions	= [] ++ clothing
recruitment	= [(B,T,O)]
appreciation	= []

raised_by	= pred2 $ map swap parenting
parented	= pred2 parenting
marry_in	= pred3 $ weddings ++ map (\(x,y,z) -> (y,x,z) ) weddings
married		= forgetful marry_in
separated	= pred2 separations
wedded_in	= pred2 $ map (\x -> (agent x, location x) ) weddings ++
			map (\x -> (patient x, location x) ) weddings
isMarried	= pred1 $ map fst marriages ++ map snd marriages
parentMaybe :: Entity -> (Entity,Entity) -> Maybe Entity
parentMaybe child = \rel -> if child == snd rel then Just (fst rel) else Nothing
parents		= \child -> mapMaybe (parentMaybe child) parenting
isSiblings	= \a b -> (any . flip elem) (parents a) (parents b)
brother	= \x -> any ( \i -> isSiblings x i ) entities

clothing	= [(T,R)]
looking	= [(B,R)]
wore	= pred2 clothing
have	= pred2 $ possessions ++ marriages ++ parenting ++ supervision
		++ ( map swap $ marriages ++ parenting ++ supervision )
		++ ( map (\x->(recipient x, theme x) ) giving )
		++ ( map (\x->(agent x,B) ) working )
		++ ( map (\x->(agent x, patient x) ) recruitment )
		++ ( map (\x->(location x, patient x) ) recruitment )
		++ ( map (\x->(agent x, location x) ) recruitment )
		++ ( map (\x->(agent x, theme x) ) offenses )
knowledge	= [(T,F),(T,A),(T,W)]
acquaintances	= []
know	= pred2 $ knowledge ++ acquaintances ++ map swap acquaintances
appreciate	= pred2 appreciation
visit	= pred2 $ map (\x -> (patient x, recipient x) ) recruitment
interview	= pred2 $ map (\x -> (agent x, patient x) ) recruitment
greet	= interview
look_at	= pred2 $ looking

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
	twoPlaceStarters

predid2 "receive" = predid2 "get"

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
	threePlaceStarters

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

--(worker,job,site)
working	= [(T,Unspec,O),(B,B,O)]
comms	= [ (P,F,T),(P,A,T),(P,W,T),(P,N,T),(B,L,T),(T,Y,C),(T,G,C),(T,L,C),(T,N,C) ]
offenses	= [(P,N,T),(B,L,T)]
giving	= [ (B,J,T) ]
acceptances = []
-- (seller, item, buyer)
selling	= []
--(killer,killed,instrument)
--(putter,theme,location)
--(agent,theme,location)
looking_back	= [(T,Unspec,Unspec)]

worker	= pred1 $ map agent working
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
offend_with	= pred3 offenses
offend	= pred2 $ ( map (\x -> (agent x, recipient x) ) offenses ) ++
		( map (\x -> (theme x, recipient x) ) offenses )
anger = offend


gave	= pred3 giving
got	= pred2 $ map (\x -> (recipient x, patient x) ) giving
got_from	= pred3 $ map (\x -> (recipient x, patient x, agent x) ) giving
sold	= pred2 $ map (\x -> (agent x, theme x) ) selling

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

-- (teacher,school(location),subject,student,degree)
schooling = [(P,V,F,T,Unspec),(P,V,A,T,Unspec),(P,V,W,T,Unspec)]
studied = pred3 $ map ( \x -> (recipient5 x, theme5 x, location5 x) )
				schooling
studied_what = pred2 $ map (\x -> (recipient5 x, theme5 x) ) schooling
studied_where = pred2 $ map (\x -> (recipient5 x, location5 x) ) schooling
teach = pred3 $ map (\x -> (agent5 x, theme5 x, recipient5 x) ) schooling
teach_what = forgetful teach
teach_who = pred2 $ map (\x -> (agent5 x, recipient5 x) ) schooling
student = pred1 $ map recipient5 schooling

forgetful :: ThreePlacePred -> TwoPlacePred
forgetful r u v = or ( map ( r u v ) entities )
passivize :: TwoPlacePred -> OnePlacePred
passivize r	= \ x -> or ( map ( flip  r x ) entities )

passivize3 :: ThreePlacePred -> TwoPlacePred
passivize3 r	= \x y -> or ( map ( \u -> r u x y ) entities )

passivize4 r = \x y z -> or ( map (\u -> r u x y z ) entities )

self ::  (a -> a -> b) -> a -> b
self p	= \ x -> p x x 
