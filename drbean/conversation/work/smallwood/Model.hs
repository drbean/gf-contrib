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


--alice, rex, kelley, judy, rock
--                                                :: Entity

characters :: [ (String, Entity) ]

characters = [
	( "tia",	T ),
	( "christine",	C ),
	( "steven",	S ),
	( "rutgers_university",	V ),
	( "mr_payne",	P ),
	( "mr_batchelor",	B ),
	( "finance",	F ),
	( "accounting",	A ),
	( "business_law",	W )

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

namelist = map fst characters

names = map swap characters

male, female :: OnePlacePred

male	= pred1 [S,P,B]
female	= pred1 [T,C]

type OnePlacePred	= Entity -> Bool
type TwoPlacePred	= Entity -> Entity -> Bool
type ThreePlacePred	= Entity -> Entity -> Entity -> Bool

list2OnePlacePred :: [Entity] -> OnePlacePred
list2OnePlacePred xs	= \ x -> elem x xs

pred1 :: [Entity] -> OnePlacePred
pred1	= flip elem

people, things :: OnePlacePred

people	= \ x -> (male x || female x || x == Unspec)
things	= \ x -> (x == Unspec || not ( people x ) )

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

curry3 :: ((a,b,c) -> d) -> a -> b -> c -> d
curry3 f x y z	= f (x,y,z)
curry4 f x y z w	= f (x,y,z,w)

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

agent4, theme4, recipient4, location4 :: (Entity,Entity,Entity,Entity) -> Entity
agent4 (a,_,_,_) = a
location4 (_,l,_,_) = l
theme4 (_,_,t,_) = t
recipient4 (_,_,_,r) = r

-- (teacher,school(location),subject,student)
schooling = [(P,V,F,T),(P,V,A,T),(P,V,W,T)]
studied = pred3 $ map ( \x -> (recipient4 x, theme4 x, location4 x) )
				schooling
studied_what = pred2 $ map (\x -> (recipient4 x, theme4 x) ) schooling
studied_where = pred2 $ map (\x -> (recipient4 x, location4 x) ) schooling
teach = pred3 $ map (\x -> (agent4 x, theme4 x, recipient4 x) ) schooling
teach_what = forgetful teach
teach_who = pred2 $ map (\x -> (agent4 x, recipient4 x) ) schooling
student = pred1 $ map recipient4 schooling

forgetful :: ThreePlacePred -> TwoPlacePred
forgetful r u v = or ( map ( r u v ) entities )
passivize :: TwoPlacePred -> OnePlacePred
passivize r	= \ x -> or ( map ( flip  r x ) entities )

passivize3 :: ThreePlacePred -> TwoPlacePred
passivize3 r	= \x y -> or ( map ( \u -> r u x y ) entities )

passivize4 r = \x y z -> or ( map (\u -> r u x y z ) entities )

self ::  (a -> a -> b) -> a -> b
self p	= \ x -> p x x 
