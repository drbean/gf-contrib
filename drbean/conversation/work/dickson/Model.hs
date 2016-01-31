module Model where 

import Data.Tuple
import Data.List
import Data.Maybe

data Entity	= A | B | C | C1 | C2 | D | E | F | GF | GGF | G
            | H | I | J | K | L | M | N 
            | O | P | Q | R | S | T | U 
            | V | W | W1 | W2 | W3 | W4 | W5 | W6 | X | Y | Z | Someone | Something | Unspec
     deriving (Eq,Show,Bounded,Enum,Ord)

entities :: [Entity]
entities	=  [minBound..maxBound] 

entity_check :: [ (Entity, String) ]
entity_check =  [
    (A, "Uncle Alf" )
    , (B, "" )	-- ship
    , (C, "" )
    , (D, "dee" )
    , (E, "" )
    , (F, "" )	-- Dee's father
    , (G, "" )	-- upbringing
    , (H, "" )	-- Dee's ex-husband
    , (I, "" )	-- interviewer
    , (J, "" )	-- job
    , (K, "" )	-- disappointment
    , (L, "" )
    , (M, "" )	-- money
    , (N, "" )	-- construction
    , (O, "" )	-- Monday
    , (P, "" )
    , (Q, "" )
    , (R, "" )	-- electrician job
    , (S, "" )	-- vocational school
    , (T, "" )	-- transformer
    , (U, "" )
    , (V, "" )	-- shipyard
    , (W, "" )	-- Wednesday
    , (X, "" )
    , (Y, "" )	-- way
    , (Z, "" )	-- story
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

	, ("child",	map snd parenting )
	, ("uncle",	[A] )
	, ("superintendent",	 [A] )
	, ("supervisor",	 [D] )
	, ("apprentice",	 [D] )
	, ("husband",	 [H] )
	, ("school",	 [S] )
	, ("night", [O,W] )
	, ("construction",	 [N] )
	, ("electrician",	 [D,W,W1,W2,W3] )
	, ("interviewer",	 [I] )
	, ("transformer",	 [T] )
	, ("ship",	 [B] )
	, ("shipyard",	 [V] )
	, ("at_the_shipyard", [ w | (w,_,s) <- working , s == V ])
	, ("at_the_shipyard_to_work", [w | w <-
		   filter (test1 "at_the_shipyard") entities
			 , w == D])
	, ("money",	 [M] )
	, ("upbringing",	 [G] )
	, ("story",	 [Z] )
	, ("job",	 [J] )
	, ("way",	 [Y] )
	, ("work",	 [J] ++ map agent working )
	, ("worker",	 map agent working )
  , ("superior",	map fst supervision )
  , ("subordinate",	map snd supervision )

  , ("is_hire_ed", [D] )
  , ("need_to_slow_down", [D] )

	, ("little",	 [D] )
	, ("mad",	 [D,H,W1,W2,W3,W4] )
	, ("bad",	 [H,W1,W2,W3,W4] )
	, ("look_bad",	 [H,W1,W2,W3,W4] )

	, ("male",	 [A,F,W1,W2,W3,W4,W5,W6,I,C1,C2, GGF, GF] )
	, ("female",	 [D] )

	, ("laugh", [D] )

	]

onePlacers = 
	entityonePlacers ++ onePlaceStarters

predid1 "people"	= predid1 "person"
predid1 "person"	= Just person
predid1 "thing"	= Just thing
predid1 "same" = predid1 "thing"

predid1 "80-pound"	= predid1 "transformer"
predid1 "boss"	= predid1 "superior"
predid1 "employee"	= predid1 "subordinate"
predid1 "manager"	= predid1 "boss"
predid1 "position"	= predid1 "job"
predid1 "family" = Just (\x -> isParent x || isOffspring x)

predid1 "father"  = Just father
predid1 "dad"  = predid1 "father"
predid1 "guy"  = predid1 "male"
predid1 "woman"  = predid1 "female"
predid1 "man"  = predid1 "male"
 
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

person, thing :: OnePlacePred

person	= \ x -> ((test1 "male") x ||
      (test1 "female") x ||
      (test1 "role") x || x == Someone)
thing	= \ x -> (x == Unspec || x == Something || not ( person x ) )

boy	= \x -> (test1 "male") x &&
      (test1 "child") x
isMan	= \x -> ( not $ boy x ) && (test1 "male") x
isGirl	= \x -> ( (test1 "female") x &&
      (test1 "child") x )
isWoman	= \x -> ( not $ isGirl x ) &&
      (test1 "female") x
isParent	= pred1 $ map fst parenting
isOffspring	= pred1 $ map snd parenting
isMother	= \x -> ( (test1 "female") x &&
	isParent x )
father	= \x -> ( test1 "male" x && isParent x )
daughter	= \x -> ( (test1 "female") x &&
	isOffspring x )
son	= \x -> ( (test1 "male") x && isOffspring x )

pred2 :: [(Entity,Entity)] -> TwoPlacePred
pred3 :: [(Entity,Entity,Entity)] -> ThreePlacePred
pred2 xs	= curry ( `elem` xs )
pred3 xs	= curry3 ( `elem` xs )
pred4 xs	= curry4 ( `elem` xs )

statement:: [ (Content, [(Case, Entity)]) ]
statement= [
	("say", [(Agent, I), (Recipient, D), (Predicate, P), (Topic, D)])
	]

claim = [
	("little", [(Pivot,D), (Predicate,P) ] )
	]

--(parent,child)
parenting	= [ (D,C1),(D,C2),(F,D),(GGF,GF),(GGF,A),(GF,F) ]
uncling	= [ (A,F) ]
marriages	= [ (H,D) ]
--(husband,wife,wedding_location)
weddings	= [ (H,D,Unspec) ]
--(divorcer,divorced)
separations	= [ (H,D) ]
-- divorces	= []
--(boyfriend,girlfriend)
-- unmarried_couples	= []
--(contacter,contactee)
possessions	= [ (A,M),(D,J) ]
type Appreciator = Entity
type Appreciatee = Entity
appreciation :: [(Appreciator, Content, [(Case,Entity)], Appreciatee)]
appreciation	= [
	(D, "is_hire_ed", [(Theme, D)],A)
	, (D, "is_hire_ed", [(Theme, D)],F)
	, (F, "is_hire_ed", [(Theme, D)],A)
	, (A, "is_hire_ed", [(Theme, D)],V)
	] 
conflict	= []
supervision	= [(D,W),(D,W1),(D,W2),(D,W3)]

resentmentments = [
  (I,	"is_hire_ed", [(Theme,D)] )
  , (W1,	"is_hire_ed", [(Theme,D)] )
  , (W2,	"is_hire_ed", [(Theme,D)] )
	]
have	= pred2 $ possessions ++ marriages ++ parenting 
		++ ( map swap $ marriages ++ parenting )
		++ ( map (\x->(recipient x, theme x) ) giving )

knowledge	= []
acquaintances	= []
help	= pred2 $ supervision
becoming  = [(D,R),(D,D)]
lifts = [(W1,T),(W3,T),(W5,T)]
-- needing :: positer, agent, theme
needing = [(D,D,M),(D,D,J)]

twoPlacers, twoPlaceStarters :: [(String, [(Entity,Entity)])]
twoPlaceStarters = [
    ("know",    knowledge ++ acquaintances ++ map swap acquaintances)
    , ("have",  possessions ++ marriages ++ parenting ++
		  ( map swap $ marriages ++ parenting ) ++
		  ( map (\x->(recipient x, theme x) ) giving ) ++
			  [(a,J) | (a,_,_) <- working] ++
			  map (\(_,l,_,r) ->(r,l) ) schooling)
    , ("become",  becoming )
    , ("can_to_lift",  lifts )
    , ("do",  [ (a,j) | a <- filter person entities
	    , (w,j,s) <- working
	    , w == a ] )
    , ("hire",  map (\(a,_,_) -> (V,a)) working)
    , ("interview",  [(I,D)] )
    , ("like",  map (\(a,c,rs,r) -> (a,r)) appreciation)
    , ("work",  [(a,c) | (a,p,c) <- working] )
    , ("kind",  [(student, H) | (_,_,_,student) <- schooling ])
    , ("placing",       [(student, school) | (_,school,_,student) <- schooling ]
                ++ [(worker, place) | (worker,period,place) <- working ])
    , ("studied", foldl (\hs (_,school,subject,student) ->
                    (student,subject): (student,school) : hs) [] schooling )
    , ("go_to",	[ (a,l) | (a,_,l) <- working ++ studying ] )
    , ("need",	[ (a,t) | (p,a,t) <- needing ] )
    , ("make_look_bad",  [ (D,b) | b <-
	filter (test1 "look_bad") entities ])
    , ("think:is_little", [ (s,r) | (s, (pred, r) ,_) <- comms,
					      pred == "is_little" ] )
    , ("say:is_too_little", [ (s,r) | (s, (pred, r) ,_) <- comms,
					      pred == "is_too_little" ] )
    , ("like_that:is_hire_ed", [(D,D),(A,D),(F,D)] )
    , ("say:is_hire_ed", [ (s,r) | (s, (pred, r) ,_) <- comms
			    , pred == "is_hire_ed"
			    , r == D ] )
    , ("say:need_to_slow_down", [ (s,r) | (s, (pred, r), _) <- comms,
					      pred == "need_to_slow_down" ] )
    , ("tell_to_to_slow_down", [ (s,r) | (s, (pred, r), _) <- comms,
			      pred == "need_to_slow_down" ] )
     , ("want_to_work_with", [] )
     , ("like_that:is_hire_ed", [ (a,t) | (a,c,rs,r) <- appreciation
						, Just t <- [lookup Theme rs]
						, c == "is_hire_ed" ] )
     , ("work_with", [ (D,w) | (w,j,s) <- working , s == B ])
     , ("say:is_at_the_shipyard_to_work", [(D,e) | e <- filter
	       (test1 "at_the_shipyard_to_work") entities ])

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

twoPlacers =
	gentwoPlacer statement	"say" "say" Agent Predicate:
	gentwoPlacer claim	"little" "little" Predicate Pivot:
	gentwoPlacer claim	"too_little" "little" Predicate Pivot:
	twoPlaceStarters

predid2 "have_to_go_to"	= predid2 "go_to"

predid2 name = if name `elem` (map fst twoPlacers) then
	Just (pred2 (concat [ twople | (id, twople) <- twoPlacers
		, id == name] ) ) else
		-- Nothing
		error $ "no '" ++ name ++ "' two-place predicate."


curry3 :: ((a,b,c) -> d) -> a -> b -> c -> d
curry3 f x y z	= f (x,y,z)
curry4 f x y z w	= f (x,y,z,w)

threePlacers = [
    ("work",        pred3 $ [(a,a,c) | (a,p,c) <- working ] )
    , ("studied_subj_at", pred3 $ map (\(_,school,subject,student) ->
                    (student,subject,school) ) schooling )
    , ("find_to_do", pred3 [(D,Y,R),(D,Y,J)] )
    , ("have_to_do_different", pred3 [(D,R,W1),(D,J,W1),(D,R,W2),(D,J,W2)] )
    , ("have_to_go_to", pred3 $ [ (a,l,n) |
	    (a,_,l) <- working ++ studying , n <- [O,W] ])
  , ("think:is", pred3 $ [ (s,t,r) | (s, content ,c ,l) <- long_comms
		  , content == "belong_to"
		  , Just t <- [lookup Theme c]
		  , Just r <- [lookup Recipient c] ] )
  , ("think:need_to_have", pred3 needing )
  , ("say:have", pred3 $ [(D,o,p)   | (o,p) <- possessions
          , o == D] )
  , ("say:is", pred3 [ (s,a,t) | (s, content ,c ,l) <- long_comms
				, Just a <- [lookup Agent c]
				, Just t <- [lookup Theme c]
				] )
  , ("say:need", pred3 needing )
  , ( "say:can_not_to_get_along", pred3 $ [ (s,a,t) | (s,content,c,l) <- long_comms
    , Just a <- [lookup Agent c]
    , Just t <- [lookup Theme c]
    ])
	, ("take_to_see", pred3 [ (g,m,d) | (s,g,m,d,o) <- going ] )
    ]

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

--(worker,job,site)
working	= [(A,Unspec,V),(I,Unspec,V),(F,Unspec,Unspec),
-- shipyard
	(D,R,V),(W1,R,V),(W2,R,V),(W3,R,V),(W4,R,V),(W5,R,V),(W6,R,V),
-- ship
	(D,R,B),(W1,R,B),(W2,R,B),(W3,R,B),(W4,R,B),(W5,R,B),(W6,R,B)]

-- (speaker, (content, referent),listener)
comms	= [
  (I, ("is_little",D), D)
  , (I, ("is_too_little",D), D)
  , (I, ("is_hire_ed",D), D)
  ,(W1, ("need_to_slow_down",D), D)
  ,(W2, ("need_to_slow_down",D), D)
  ,(D, ("need_money",D), W1)
  ,(D, ("need_money",D), W2)
	    -- ,(I,Unspec,D),(F,Unspec,D),(F,Unspec,A),(A,Unspec,D),(A,Unspec,I)
	    ]
type Speaker = Entity
type Listener = Entity
-- long_comms : (speaker, (content, agent, theme, recipient), listener)
long_comms :: [(Speaker, Content, [(Case,Entity)], Listener)]
long_comms  = [
  (W1, "take_away",[(Agent,D),(Theme,J),(Recipient,W5)], D)
  , (W2, "take_away",[(Agent,D),(Theme,J),(Recipient,W6)], D)
  , (W1, "take_away",[(Agent,D),(Theme,D),(Recipient,W5)], D) -- supervisor position
  , (W2, "take_away",[(Agent,D),(Theme,D),(Recipient,W6)], D)
  , (W1, "belong_to",[(Theme,D),(Recipient,W5)], D)
  , (W2, "belong_to",[(Theme,D),(Recipient,W6)], D)
  , (F, "is", [(Agent,A),(Theme,A)], D)
  , (F, "can_get_V3", [(Agent,A),(Theme,J),(Recipient,D)], D)
  , (I,  "say:can_not_to_get_along", [(Agent,D),(Theme,W1)], D)
  , (I,  "say:can_not_to_get_along", [(Agent,D),(Theme,W2)], D)
  ]
giving	= [ (V,J,D) ]
--(agent,theme,location)
looking_back	= [(D,C,V),(I,C,V)]
seeing	= []
--(agent,origin,destination)

work_where	= pred2 $ map (\x -> (agent x, location x) ) working
work_as = pred2 $ map (\x -> (agent x, theme x) ) working
look_back	= pred1 $ map agent looking_back
look_back_on	= pred2 $ map (\x->(agent x, theme x) ) looking_back
-- say	= pred2 $ map (\x->(agent x, theme x) ) comms
-- asked	= pred2 $ map (\x->(agent x, recipient x) ) comms
-- ask_about = pred3 $ map (\x->(agent x, recipient x, theme x) ) comms
-- talked	= pred2 $ map (\x->(agent x, recipient x) ) comms
--               ++  map (\(agent,theme,recipient)->(recipient, agent) ) comms
-- talk_about = pred3 $ map (\x->(agent x, recipient x, theme x) ) comms

-- (teacher,school(location),subject,student,degree)
schooling = [(Unspec,S,N,D)]
studying = map ( \x -> (recipient4 x, theme4 x, location4 x) ) schooling
studied_what = pred2 $ map (\x -> (recipient4 x, theme4 x) ) schooling
studied_where = pred2 $ map (\x -> (recipient4 x, location4 x) ) schooling
student = pred1 $ map recipient4 schooling



gave	= pred3 giving
got	= pred2 $ map (\x -> (recipient x, patient x) ) giving
got_from	= pred3 $ map (\x -> (recipient x, patient x, agent x) ) giving

-- told	= pred3 comms

-- recite = pred2 $ map ( \x -> (agent x, theme x) ) comms

fourPlacers = [
    ("say:take_away", pred4 $ [ (s,a,t,r) | (s, content ,c ,l) <- long_comms
				, content == "take_away"
				, Just a <- [lookup Agent c]
				, Just t <- [lookup Theme c]
				, Just r <- [lookup Recipient c]
				] )
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
agent5 (a,_,_,_,_)      = a
theme5 (_,t,_,_,_)      = t
destination5 = theme5
recipient5 (_,_,r,_,_)  = r
provider5       = recipient5
result5 = recipient5
style5  = recipient5
feature5 (_,_,_,f,_)    = f
location5 (_,_,_,_,l)   = l
purpose5        = location5
aim5    = purpose5
vehicle5        = location5

-- going :: sanctioner, guide, goer, destination, occasion
going = [
	(D,Unspec,D,B,O), (D,Unspec,D,B,W)
	, (D,Unspec,D,V,O), (D,Unspec,D,V,W)
	, (V,Unspec,D,S,O),(V,Unspec,D,S,W)
	, (D,F,D,A,Unspec)
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
self p  = \ x -> p x x

-- vim: set ts=2 sts=2 sw=2 noet:
