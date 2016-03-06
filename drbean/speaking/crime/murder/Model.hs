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
  (A, "" )
  , (B, "" )
  , (C, "charles" )
  , (D, "" )
  , (E, "eighty" )
  , (F, "" )
  , (G, "" )
  , (H, "hospital" )
  , (I, "" )
  , (J, "" )
  , (K, "" )
  , (L, "" )
  , (M, "" )
  , (N, "" )
  , (O, "" )
  , (P, "" )
  , (Q, "" )
  , (R, "respirator" )
  , (S, "sara" )
  , (T, "" )
  , (U, "" )
  , (V, "" )
  , (W, "" )
  , (X, "cancer" )
  , (Y, "" )
  , (Z, "" )
    ]

ent_ided :: String -> Entity
ent_ided name = head [entity | (entity,string) <- entity_check ,
				name == string
				]

characters :: [(String,Entity)]
characters = map findEnt [C,S]
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

onePlacers, onePlaceStarters, entityonePlacers :: [(String, [Entity])]
onePlaceStarters = [
	("true",        entities )
	, ("false",     [] )
	, ("role",      [] )


	, ("male",	[C] )
	, ("female",	[S] )
	]


onePlacers = 
	genonePlacer affiliation "married" "marriage" Patient :
	genonePlacer condition	"eighty" "age" Pivot :
	genonePlacer condition	"dying" "dying" Pivot :
	genonePlacer condition	"alive" "alive" Pivot :
	genonePlacer affiliation "wife" "marriage" CoPatient :
	genonePlacer affiliation "husband" "marriage" CoPatient :
	entityonePlacers ++ onePlaceStarters

predid1 "people"	= predid1 "person"
predid1 "person"	= Just person
predid1 "thing"	= Just thing
predid1 "hospital_place"	= predid1 "hospital"
predid1 "hospital_name"	= predid1 "hospital"

predid1 name = if name `elem` (map fst onePlacers) then
	Just (pred1 (concat [ oneple | (id, oneple) <- onePlacers
		, id == name] ) ) else
		-- Nothing
		error $ "no '" ++ name ++ "' one-place predicate."

entityonePlacers =
	map (\x -> (snd x, [fst x])) entity_check

genonePlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> 
	(String, [Entity])
genonePlacer area id content role =
	( id, [ r | (co,cs) <- area
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

person, thing, entity :: OnePlacePred
person	= \ x -> (test1 "male" x || test1 "female" x || test1 "role" x || x == Someone)
thing	= \ x -> (x == Something || not ( person x ) )
entity = \ x -> True

pred2 :: [(Entity,Entity)] -> TwoPlacePred
pred3 :: [(Entity,Entity,Entity)] -> ThreePlacePred
pred2 xs	= curry ( `elem` xs )
pred3 xs	= curry3 ( `elem` xs )
pred4 xs	= curry4 ( `elem` xs )

goal :: [ (Content, [(Case, Entity)]) ]
goal = [
	]

site :: [ (Content, [(Case, Entity)]) ]
site = [
	("in", [(Theme,S),(Location,H)])
	, ("to", [(Theme,S),(Destination,H)])
	]

event :: [ (Content, [(Case, Entity)]) ]
event = [
	("shoot", [(Agent,C), (Patient,S)])
	, ("go", [(Theme, C),(Destination,H)])

	]

statement :: [ (Content, [(Case, Entity)]) ]
statement = [
	("say", [(Agent, C), (Recipient,Unspec),(Predicate,P),(Topic,S)])

	]

question :: [ (Content, [(Case, Entity)]) ]
question = [
	("age", [(Predicate, P), (Topic, A), (Pivot, S)])
	, ("sex", [(Predicate, P), (Topic, X), (Pivot, S)])
	, ("student", [(Pivot, E), (Predicate, P), (Topic, O) ] )
	, ("school", [(Topic, O), (Predicate,P), (Pivot, E) ] )

	]

condition :: [ (Content, [(Case, Entity)]) ]
condition = [
	("age", [(Pivot,C), (Attribute,E) ] )
	, ("cancer", [(Experiencer,S),(Stimulus,X)] )
	, ("dying", [(Pivot,S)] )
	, ("alive", [(Pivot,S)] )

	]

idea :: [ (Content, [(Case, Entity)]) ]
idea = [
	]

attitude :: [ (Content, [(Case, Entity)]) ]
attitude = [
	("love", [(Experiencer,C),(Stimulus,S),(Predicate,P)] )
	]

affiliation :: [ (Content, [(Case, Entity)]) ]
affiliation = [
	 ("marriage", [(Patient,C),(CoPatient,S)] )
	 , ("marriage", [(CoPatient,C),(Patient,S)] )
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

twoPlacers, twoPlaceStarters :: [(String, [(Entity,Entity)])]
twoPlaceStarters = [
    ]

twoPlacers =
	gentwoPlacer attitude "love" "love" Experiencer Stimulus :
	gentwoPlacer site "in_prep" "in" Theme Location :
	gentwoPlacer event "go" "go" Theme Destination :
	gentwoPlacer condition "have" "cancer" Experiencer Stimulus :
	gentwoPlacer event "shoot" "shoot" Agent Patient :
	gentwoPlacer statement	"say" "say" Agent Predicate:
	-- gentwoPlacer question "male_or_female" "sex" Predicate Pivot:
	-- gentwoPlacer condition	"fifteen" "fifteen" Predicate Pivot:
	-- gentwoPlacer condition	"sixteen" "sixteen" Predicate Pivot:
	-- gentwoPlacer condition	"nineteen" "nineteen" Predicate Pivot:
	-- gentwoPlacer condition	"twentyone" "twentyone" Predicate Pivot:
	-- gentwoPlacer condition	"twentytwo" "twentytwo" Predicate Pivot:
	-- gentwoPlacer condition	"twentythree" "twentythree" Predicate Pivot:
	-- gentwoPlacer question	"student" "school" Predicate Pivot:
	-- gentwoPlacer event	"greet" "greet" Agent Patient:
	-- gentwoPlacer condition	"taiwan" "taiwan" Predicate Pivot:
	-- gentwoPlacer condition	"turkey" "turkey" Predicate Pivot:
	-- gentwoPlacer condition	"male" "male" Predicate Pivot:
	-- gentwoPlacer condition	"female" "female" Predicate Pivot:
	-- gentwoPlacer condition	"girl" "female" Predicate Pivot:
	-- gentwoPlacer condition	"young" "young" Predicate Pivot:
	-- gentwoPlacer question	"hispanic" "hispanic" Predicate Pivot:
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
    ]
threePlacers =
	(genthreePlacer statement "love" "love" Predicate Experiencer Stimulus) :
	(genthreePlacer event "ask_V2Q" "ask" Agent Recipient Predicate) :
	genthreePlacer event "tell" "state" Agent Recipient Predicate :
	threePlaceStarters

type Content = String
data Case = Actor | Agent | Asset | Attribute | Beneficiary | Cause | CoAgent |
	CoPatient | CoTheme | Destination | Experiencer | Extent | Goal |
	InitialLocation | InitialState | Instrument | Location | Manner | Material | Path | Patient | Pivot |
	Predicate | Product | Recipient | Reflexive | Result | Source |
	Stimulus | Theme | Time | Topic | Trajectory | Value
  deriving Eq

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

fivePlacers = [
        ]


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
