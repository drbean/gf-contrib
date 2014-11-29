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
    (A, "apartment" )
    , (B, "birthday_card" )
    , (C, "colorado" )
    , (D, "daughter" )
    , (E, "rent" )
    , (F, "" )
    , (G, "bag" )
    , (H, "shelter" )
    , (I, "idea" )
    , (J, "job" )
    , (K, "week" )
    , (L, "lotion" )
    , (M, "money" )
    , (N, "a man" )
    , (O, "month" )
    , (P, "" )
    , (Q, "queen" )
    , (R, "retiring" )
    , (S, "sign" )
    , (T, "ten_dollar_bill" )
    , (U, "unemployment" )
    , (V, "bottle" )
    , (W, "joy" )
    , (X, "christmas" )
    , (Y, "cooking" )
    , (Z, "smell_N2" )
    ]

ent_ided :: String -> Entity
ent_ided name = head [entity | (entity,string) <- entity_check ,
				name == string
				]

characters :: [(String,Entity)]
characters = map findEnt [Q,D]
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

        , ("great",     pred1 [I] )

	, ("little",	pred1 [L] )

	, ("male",	pred1 [N] )
	, ("female",	pred1 [Q,D] )
	]

onePlacers = 
	(genonePlacer event "is_lay_off_ed" "lay_off" Patient) :
	(genonePlacer event "go_out" "go_out" Agent) :
	(genonePlacer condition "middle_class" "middle_class" Patient) :
	(genonePlacer condition "look_middle_class" "middle_class" Patient) :
	(genonePlacer condition "lonely" "lonely" Patient) :
	(genonePlacer condition "feel_lonely" "lonely" Patient) :
	(genonePlacer event "cry" "cry" Patient) :
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

pred2 :: [(Entity,Entity)] -> TwoPlacePred
pred3 :: [(Entity,Entity,Entity)] -> ThreePlacePred
pred2 xs	= curry ( `elem` xs )
pred3 xs	= curry3 ( `elem` xs )
pred4 xs	= curry4 ( `elem` xs )

type Judger = Entity
type Judged = Entity
type Content  = String

goal :: [ (Content, [(Case, Entity)]) ]
goal = [
	("great_idea",	[(Agent,Q),(Theme,R)])
	]

event :: [ (Content, [(Case, Entity)]) ]
event = [
	("lay_off", [(Agent,C),(Patient,Q)] )
	, ("turn", [(Agent,K),(Theme,O)] )
	, ("oust", [(Agent,Unspec),(Theme,A),(Patient,Q)] )
	, ("go_out", [(Agent,Q),(Instrument,S),(Theme,M)] )
	, ("hand", [(Agent,N),(Theme,M),(Recipient,Q)] )
	, ("hand", [(Agent,N),(Theme,T),(Recipient,Q)] )
	, ("give", [(Agent,N),(Theme,M),(Recipient,Q)] )
	, ("give", [(Agent,N),(Theme,T),(Recipient,Q)] )
	, ("thank", [(Agent,Q),(Recipient,N)] )
	, ("buy", [(Agent,Q),(Recipient,D),(Theme,B)] )
	, ("give", [(Agent,Q),(Recipient,D),(Theme,B)] )
	, ("give", [(Agent,H),(Recipient,Q),(Theme,G)] )
	, ("give", [(Agent,H),(Recipient,Q),(Theme,L)] )
	, ("open", [(Agent,Q),(Patient,L)] )
	, ("smell", [(Agent,Q),(Patient,L) ] )
	, ("cry", [(Patient,Q) ] )

	]

condition :: [ (Content, [(Case, Entity)]) ]
condition = [
	("cover", [(Agent,U),(Theme,E)] )
	, ("have", [(Agent,X),(Theme,W)] )
	, ("have", [(Agent,Y),(Theme,Z)] )
	, ("feel", [(Patient,Q),(Theme,P)] )
	, ("in_form_of", [(Patient,L),(Instrument,V)] )
	, ("lonely", [(Patient,Q)] )
	, ("look", [(Patient,Q),(Theme,P)] )
	, ("middle_class", [(Patient,Q)] )
	, ("savings", [(Patient,Q),(Instrument,M),(Theme,Unspec)] )
	]

idea :: [ (Content, [(Case, Entity)]) ]
idea = [
	("another_job", [(Agent,Q),(Theme,J)] )
	, ("move_in", [(Agent,D),(Patient,Q)] )
	, ("care", [(Agent,Q),(Patient,D)] )
	, ("remember", [(Agent,Q),(Theme,X)] )
	, ("think", [(Agent,Q),(Theme,P)] )
	]

attitude :: [ (Content, [(Case, Entity)]) ]
attitude = [
	("no_big_deal", [(Agent,Q),(Theme,U)] )
	]

affiliation :: [ (Content, [(Case, Entity)]) ]
affiliation = [
	("employment", [(Agent,C),(Patient,Q) ] )
	, ("shelter", [(Agent,H),(Patient,Q) ] )
	, ("mother", [(Agent,Q),(Patient,D) ] )
	]

gentwoPlacer :: [ (Content, [(Case,Entity)]) ] ->
	String -> String -> Case -> Case ->
	(String, TwoPlacePred)
gentwoPlacer area id content role1 role2 =
	( id, pred2 [ (r1,r2) | (co,cs) <- area
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

twoPlacers, twoPlaceStarters :: [(String, TwoPlacePred)]
twoPlaceStarters = [
    ("know_V2",    pred2 $ knowledge ++ acquaintances ++ map swap acquaintances)
    , ("kind",  pred2 $ [(student, H) | (_,_,_,student,_) <- schooling ])
    , ("placing",       pred2 $ [(student, school) | (_,school,_,student,_) <- schooling ]
                )
    , ("studied", pred2 $ foldl (\hs (_,school,subject,student,_) ->
                    (student,subject): (student,school) : hs) [] schooling )
    ]

twoPlacers =
	(gentwoPlacer event "buy_V2" "buy" Agent Theme) :
	(gentwoPlacer condition "cover" "cover" Agent Theme) :
	(gentwoPlacer condition "feel" "feel" Patient Theme) :
	(gentwoPlacer event "get" "give" Recipient Theme) :
	(gentwoPlacer affiliation "have" "mother" Agent Patient) :
	(gentwoPlacer condition "in_form_of" "in_form_of" Patient Instrument) :
	(gentwoPlacer affiliation "in_prep" "shelter" Patient Agent) :
	(gentwoPlacer condition "look" "look" Patient Theme) :
	(gentwoPlacer event "lose" "oust" Patient Theme) :
	(gentwoPlacer event "Open" "open" Agent Patient) :
	(gentwoPlacer idea "remember" "remember" Agent Theme) :
	(gentwoPlacer event "smell_V2" "smell" Agent Patient) :
	(gentwoPlacer event "thank" "thank" Agent Recipient) :
	(gentwoPlacer idea "think" "think" Agent Theme) :
	(gentwoPlacer event "turn" "turn" Agent Theme) :
	(gentwoPlacer idea "want_to_move_in" "move_in" Agent Patient) :
	(gentwoPlacer affiliation "work" "employment" Patient Agent) :
	twoPlaceStarters

predid2 "receive" = predid2 "get"

predid2 name
       | Just pred <- lookup name twoPlacers = Just pred
        -- | otherwise    = Nothing
        | otherwise    = error $ "no '" ++ name ++ "' two-place predicate."

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
	(genthreePlacer idea "think:can_to_get" "another_job" Agent Agent Theme) :
	(genthreePlacer idea "think:should_not_to_take_care" "care" Agent Patient Patient) :
	(genthreePlacer idea "think:should_to_take_care" "care" Agent Agent Patient) :
	(genthreePlacer event "hand" "hand" Agent Recipient Theme) :
	(genthreePlacer event "give" "give" Agent Recipient Theme) :
	(genthreePlacer condition "have_V2V_to_buy_V2" "have" Patient Instrument Theme) :
	(genthreePlacer event "buy" "buy" Agent Recipient Theme) :
	threePlaceStarters

data Case = Agent | Theme | Patient | Recipient | Feature | Location | Instrument
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
giving	= [ (N,T,Q) ]
--(agent,theme,location)
looking_back	= [(D,C,V),(I,C,V)]
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
schooling = [(Unspec,Unspec,Unspec,Q,Unspec)]
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
