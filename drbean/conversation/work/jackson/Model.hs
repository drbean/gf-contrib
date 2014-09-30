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
    , (C, "the_State_of_Colorado" )
    , (D, "Queen's_daughter" )
    , (E, "smells" )
    , (F, "" )
    , (G, "gift_bag" )
    , (H, "shelter" )
    , (I, "" )
    , (J, "job" )
    , (K, "market" )
    , (L, "lotion" )
    , (M, "money" )
    , (N, "a man" )
    , (O, "" )
    , (P, "" )
    , (Q, "Queen" )
    , (R, "retiring" )
    , (S, "sign" )
    , (T, "10-dollar bill" )
    , (U, "unemployment" )
    , (V, "" )
    , (W, "" )
    , (X, "Christmas" )
    , (Y, "" )
    , (Z, "" )
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

onePlacers, onePlaceStarters, genonePlacers :: [(String, OnePlacePred)]
onePlaceStarters = [
        ("true",        pred1 entities )
        , ("false",     pred1 [] )
        , ("role",      pred1 [] )

	, ("lonely",	 pred1 [Q] )
	, ("middle-class",	 pred1 [Q] )

	, ("male",	 pred1 [N] )
	, ("female",	 pred1 [Q,D] )
	]

onePlacers = genonePlacers ++ onePlaceStarters

predid1 "sitting_back"	= predid1 "retiring"
predid1 "enjoying_life"	= predid1 "retiring"
predid1 "woman"	= predid1 "female"
predid1 "man"	= predid1 "male"
predid1 "person"	= Just person
predid1 "thing"	= Just thing

predid1 name
       | Just pred <- lookup name onePlacers = Just pred
        -- | otherwise    = Nothing
       | otherwise    = error $ "no '" ++ name ++ "' one-place predicate."

genonePlacers = map (\x -> (snd x, pred1 [fst x])) entity_check

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

possessions	= [(U,E),(B,A),(T,A),(E,A),(D,A),(B,J),(T,J),(E,J),(B,X),(T,X),(E,X),(T,G),(F,S)]
type Judger = Entity
type Judged = Entity
type Content  = String

goal :: [ (Content, [(Case, Entity)]) ]
goal = [
	("great_idea",	[(Agent,Q),(Theme,R)])
	]

act :: [ (Content, [(Case, Entity)]) ]
act = [
	("hand", [(Agent,N),(Theme,M),(Recipient,Q)] )
	, ("hand", [(Agent,N),(Theme,T),(Recipient,Q)] )
	]

idea :: [ (Content, [(Case, Entity)]) ]
idea = [
	("able", [(Agent,T),(Theme,J),(Instrument,W)])
	, ("bad", [(Recipient,D),(Agent,L),(Theme,J) ] )
	, ("achieve", [(Agent,B),(Theme,R),(Feature,N)])
	, ("avoid", [(Agent,T),(Theme,I),(Location,F)])
	, ("benefit", [(Agent,T),(Theme,J),(Recipient,F)])
	, ("difficult", [(Recipient,D),(Theme,O) ] )
	, ("experience", [(Agent,E),(Theme,X) ] )
	, ("experience", [(Agent,T),(Theme,X) ] )
	, ("help", [(Agent,E),(Theme,L),(Recipient,E) ] )
	, ("help", [(Agent,H),(Theme,J),(Recipient,E) ] )
	, ("increase", [(Agent,T),(Theme,S),(Location,F)])
	, ("lead", [(Agent,E),(Theme,L) ] )
	, ("patient", [(Agent,T),(Theme,F)])
	, ("realistic", [(Agent,T),(Theme,F)])
	, ("result", [(Agent,E),(Theme,R),(Recipient,F),(Instrument,L)])
	, ("self_image", [(Agent,T),(Theme,T) ] )
	, ("self_image", [(Agent,E),(Theme,E) ] )
	, ("situate", [(Agent,T),(Theme,F),(Location,K)])
	]

attitude :: [ (Content, [(Case, Entity)]) ]
attitude = [
	("respect", [(Agent,L),(Theme,G),(Recipient,T) ] )
	]

affiliation :: [ (Content, [(Case, Entity)]) ]
affiliation = [
	("employment", [(Agent,C),(Recipient,Q) ] )
	, ("shelter", [(Agent,H),(Recipient,Q) ] )
	]

interest :: [ (Content, [(Case, Entity)]) ]
interest = [
	("organize", [(Agent,E),(Recipient,L) ] )
	, ("tell", [(Agent,E),(Theme,Unspec),(Recipient,L) ] )
	, ("training", [(Agent,E),(Theme,H),(Recipient,H),(Location,J) ] )
	, ("administration", [(Agent,E),(Theme,O) ] )
	, ("administration", [(Agent,D),(Theme,O) ] )
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

have	= pred2 $ possessions
		++ ( map (\x->(recipient x, theme x) ) giving )

knowledge	= [(B,F),(T,F),(E,F),(B,P),(T,P),(E,P)]
acquaintances	= []
help	= pred2 $ supervision

twoPlacers, twoPlaceStarters :: [(String, TwoPlacePred)]
twoPlaceStarters = [
    ("know_V2",    pred2 $ knowledge ++ acquaintances ++ map swap acquaintances)
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

twoPlacers =
	(gentwoPlacer act "can_to_get" "enjoy" Agent Recipient) :
	(gentwoPlacer act "enjoy_ing_to_sell" "enjoy" Recipient Theme) :
	(gentwoPlacer act "get" "achieve" Agent Theme) :
	(gentwoPlacer act "try_hard_to_get" "enjoy" Agent Recipient) :
	(gentwoPlacer act "try_hard_to_motivate" "fail" Agent Recipient) :
	(gentwoPlacer act "try_to_motivate" "fail" Agent Recipient) :
	(gentwoPlacer affiliation "in_prep" "department" Agent Location) :
	(gentwoPlacer attitude "respect" "respect" Agent Recipient) :
	(gentwoPlacer goal "apply" "promote" Recipient Theme) :
	(gentwoPlacer goal "want_sb_to_enjoy_ing_to_work" "enjoy" Agent Recipient) :
	(gentwoPlacer goal "want_to_get_to" "get_to" Agent Theme) :
	(gentwoPlacer goal "want_to_start_to_improve" "improve" Agent Recipient) :
	(gentwoPlacer idea "do" "able" Instrument Theme) :
	(gentwoPlacer idea "think:is_difficult" "difficult" Recipient Theme) :
	(gentwoPlacer idea "think:should_be_patient" "patient" Agent Theme) :
	(gentwoPlacer idea "think:should_be_realistic" "realistic" Agent Theme) :
	(gentwoPlacer interest "enjoy_V2" "administration" Agent Theme) :
	(gentwoPlacer interest "like_ing_to_organize" "organize" Agent Recipient) :
	(gentwoPlacer interest "would_to_enjoy_ing_to_do" "training" Agent Theme) :
	twoPlaceStarters

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
    ("liked", pred3 appreciation )
    , ("work",        pred3 $ [(a,a,c) | (a,p,c) <- working ] )
    , ("studied_subj_at", pred3 $ map (\(_,school,subject,student,_) ->
                    (student,subject,school) ) schooling )
    ]
threePlacers =
	(genthreePlacer act "get_V2V_to_enjoy_ing_sell" "motivate" Agent Recipient Theme) :
	(genthreePlacer goal "think:can_to_become" "become" Agent Agent Theme) :
	(genthreePlacer idea "feel:have" "able" Agent Agent Instrument) :
	(genthreePlacer idea "help_to_do" "help" Agent Recipient Theme) :
	(genthreePlacer idea "say:is_" "self_image" Agent Agent Theme) :
	(genthreePlacer idea "think:can_to_get" "result" Agent Recipient Theme) :
	(genthreePlacer idea "think:can_to_increase" "increase" Agent Location Theme) :
	(genthreePlacer idea "think:can_to_lead" "lead" Agent Agent Theme) :
	(genthreePlacer idea "think:do" "bad" Recipient Agent Theme) :
	(genthreePlacer idea "think:is_" "achieve" Agent Theme Feature) :
	(genthreePlacer idea "think:is_in_prep" "situate" Agent Theme Location) :
	(genthreePlacer idea "think:should_not_to_take" "avoid" Agent Location Theme) :
	(genthreePlacer idea "think:should_to_help_V2" "help" Agent Theme Recipient) :
	(genthreePlacer idea "want_to_do_for" "benefit" Agent Theme Recipient) :
	(genthreePlacer interest "like_ing_to_tell_to_do" "tell" Agent Recipient Theme) :
	(genthreePlacer act "can_to_get_V2V_enjoy_ing_to_sell" "enjoy" Agent Recipient Theme) :
	(genthreePlacer act "try_hard_to_get_V2V_enjoy_ing_to_sell" "enjoy" Agent Recipient Theme) :
	threePlaceStarters

data Case = Agent | Theme | Recipient | Feature | Location | Instrument
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

--(worker,job,site/employer)
working	= [(A,Unspec,C)]
comms	= []
giving	= [ (N,T,Q) ]
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
	(genfourPlacer interest "would_to_enjoy_ing_go_on_help_do" "training" Agent Theme Recipient Location) :
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
