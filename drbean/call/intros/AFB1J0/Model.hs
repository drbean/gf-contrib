module Model where

import Data.Tuple
import Data.List
import Data.Maybe

data Entity	=

		  A | B | C | D | E | F | G
		| H | I | J | K | L | M | N
		| O | P | Q | R | S | T | U
		| V | W | X | Y | Z

		| RK | RL
		| RP | RQ | RU

		| JB | JE | JF | JG
		| JH | JM | JN
		| JS | JT
		| JY

		| AB | AD
		| AH | AJ | AL
		| AS | AT

		| CF
		| CJ | CM
		| CS

		| VD | VE | VF | VG
		| VM
		| VS | VT
		| VW

		| MB | MD | MF | MG
		| MI | MM
		| MP | MS

		| KD | KF
		| KL | KM
		| KS | KT

		| NA | NB | NF
		| NI | NJ | NM | NN
		| NO | NS | NT

		| SC | SF | SG
		| SH | SJ | SM | SN
		| SS | ST

		| DB | DF
		| DK | DM

		| Someone | Something | Unspec
		deriving (Eq,Show,Bounded,Enum,Ord)

entities :: [Entity]
entities	=  [minBound..maxBound]

entity_check :: [ (Entity, String) ]
entity_check =  [
    (A, "alex" )
    , (B, "dr_bean" )
    , (C, "cindy" )
    , (D, "dave" )
    , (E, "applied_foreign_languages" )
    , (F, "japanese" )
    , (G, "" )
    , (H, "minghsin_university" )
    , (I, "reading" )
    , (J, "jeff" )
    , (K, "kelly" )
    , (L, "basketball" )
    , (M, "mindy" )
    , (N, "neil" )
    , (O, "" )
    , (P, "playing_the_piano" )
    , (Q, "" )
    , (R, "rena" )
    , (S, "shane" )
    , (T, "" )
    , (U, "listening_to_music" )
    , (V, "vicky" )
    , (W, "taiwan" )
    , (X, "hsinchu" )
    , (Y, "" )
    , (Z, "" )

-- rena
    , (RK, "hello_kitty")
    , (RL, "avril_lavigne")
    , (RP, "the_color_pink")
    , (RQ, "mi_mi")
    , (RU, "america")

    , (JB, "basketball")
    , (JE, "exercise")
    , (JF, "Jeff's father")
    , (JG, "Jeff's grandmother")
    , (JH, "Huang Che-Yu")
    , (JM, "Jeff's mother")
    , (JN, "April 30th, 1994")
    , (JS, "Jeff's 2 siblings")
    , (JT, "taoyuan")
    , (JY, "1994")

    , (AB, "Alex's brother")
    , (AD, "drawing")
    , (AH, "Alex's hobbies")
    , (AJ, "Alex's job")
    , (AL, "sleeping")
    , (AS, "Alex's sister")
    , (AT, "travel")

    , (CF, "Cindy's father")
    , (CJ, "jiayi")
    , (CM, "Cindy's mom")
    , (CS, "Cindy's sister")

    , (VD, "drug_store")
    , (VE, "exercising")
    , (VF, "Vicky's father")
    , (VG, "shopping")
    , (VM, "Vicky's mother")
    , (VS, "Vicky's first sister")
    , (VT, "Vicky's second sister")
    , (VW, "weekends")
       
    , (MB, "Mindy's younger brother")
    , (MD, "the_tv_program_discovery")
    , (MF, "Mindy's father")
    , (MG, "going_to_the_movies")
    , (MI, "a_japanese_interpreter")
    , (MM, "Mindy's mother")
    , (MP, "pizza")
    , (MS, "the_song,_memory")

    , (KD, "a_dietitian")
    , (KF, "Kelly's father")
    , (KL, "lextar")
    , (KM, "Kelly's mother")
    , (KS, "Kelly's sister")
    , (KT, "watching_tv")

-- neil
    , (NA, "the_military")
    , (NB, "Neil's brother")
    , (NF, "Neil's father")
    , (NI, "swimming")
    , (NJ, "jogging")
    , (NM, "Neil's mother")
    , (NN, "nantou")
    , (NO, "non-commissioned_officer")
    , (NS, "Neil's first sister")
    , (NT, "Neil's second sister")

-- shane
    , (SC, "hsiao_ching-teng")
    , (SF, "Shane's father")
    , (SG, "gemitek")
    , (SH, "hukou")
    , (SJ, "jeremy_lin")
    , (SM, "Shane's mother")
    , (SN, "singing")
    , (SS, "Shane's first sister")
    , (ST, "Shane's second sister")

-- dave
    , (DB, "Dave's brother")
    , (DF, "Dave's father")
    , (DK, "making_friends")
    , (DM, "Dave's mother")
	]

characters :: [ (String, Entity) ]

characters = [(string,entity) | (entity,string) <- entity_check ]

classes :: [String]
classes = []

context :: [Entity]
context = []

namelist :: [String]
namelist = map fst characters
names :: [(Entity, String)]
names = map swap characters

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

afld_students    = [A,C,D,J,K,M,N,R,S,V]
other_students = [JS,VS,VT,DB]
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
	, ("father",	pred1 [JF,CF,VF,MF,KF,NF,SF,DF] )
	, ("mother",	pred1 [ m | (m,_,_,_) <- births,
				    m /= Unspec ] )
	, ("grandmother", pred1 [JG] )
	, ("brother", pred1 [AB,MB,NB,DB] )
	, ("sister", pred1 [AS,CS,VS,VT,KS,NS,NT,SS,ST] )
	, ("sibling", pred1 [JS,AB,CS] )

	, ("male",	pred1 [B,A,D,J,N,S,JF] )
	, ("female",	pred1 [C,K,M,R,V,JM] )
	, ("thing",	thing )
	, ("cat",	pred1 [RQ] )

	, ("old",	pred1 [B] )
	, ("reserved",	pred1 [M,R] )
	, ("outgoing",	pred1 [R,J] )
	, ("polite",	pred1 [R,J] )

	, ("farmer",	pred1 [JG] )
	, ("career_woman",	pred1 [JM] )
	, ("truck_driver",	pred1 [JF] )

	, ("design_assistant",	pred1 [A] )
	, ("applied_foreign_languages",	pred1 [E])

	, ("24",	pred1 [C])

	, ("babysitter",	pred1 [VM])

-- neil
	, ("non-commissioned_officer",	pred1 [N])
	, ("27",	pred1 [N])

--shane
	, ("21",	pred1 [S,D])
	, ("christian", pred1 [S,SJ])

-- dave
	, ("good", pred1 [DF])
	, ("nice", pred1 [DM])
	, ("busy", pred1 [D])
	]

-- predid1 "sibling"   = or [(pred1 [JS]) (predid1 "brother") (predid1 "sister")]
predid1 "english"	= predid1 "applied_foreign_languages"
predid1 "optimistic"	= predid1 "outgoing"
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
residents   = [(A,X),(M,X),(K,X),(S,SH)]
family	= [(R,RQ), (J,JG),(J,JF),(J,JM),(J,JS),(C,CF),(C,CM),(C,CS),(V,VF),(V,VM),(V,VS),(V,VT),(M,MF),(M,MM),(M,MB),(K,KF),(K,KM),(K,KS),(N,NF),(N,NM),(N,B),(N,NS),(N,NT),(S,SF),(S,SM),(S,SS),(S,ST),(D,DF),(D,DM),(D,DB)]
-- see births
possessions = family

twoPlacers :: [(String, TwoPlacePred)]
twoPlacers = [
    ("know",	pred2 $ knowledge ++ acquaintances ++ map swap acquaintances)
    , ("have",	pred2 $ possessions ++ (foldl  (\hs (t,_,_,s,d) -> (t,s): (s,t): (s,d): hs )
			[] schooling )
	)
    , ("like",	pred2 $ map (\(a,t,r) -> (a,r)) appreciation)
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

-- (appreciator, performance, actor)
appreciation	= [
    (R,Unspec,U),(R,Unspec,RP),(R,Unspec,RK),(R,Unspec,RQ),(R,Unspec,RL)
    ,(J,Unspec,JB),(J,Unspec,JE),(J,Unspec,JE)
    , (A,Unspec,AL),(A,Unspec,U),(A,Unspec,AD),(A,Unspec,I),(A,Unspec,AT)
    , (C,Unspec,P),(C,Unspec,I),(C,Unspec,U)
    , (V,Unspec,VG),(V,Unspec,VE),(V,Unspec,I)
    , (M,Unspec,F),(M,Unspec,MG),(M,Unspec,U),(M,Unspec,MP),(M,Unspec,MS),(M,Unspec,MD)
    , (K,Unspec,F),(K,Unspec,KT),(K,Unspec,P)
    , (N,Unspec,NJ),(N,Unspec,NI)
    , (S,Unspec,L),(S,Unspec,SN),(S,Unspec,SJ),(S,Unspec,SC)
    , (D,Unspec,DK)
    ]
data Period	= Present | Future
		deriving (Eq,Show,Bounded,Enum,Ord)
periods :: [Period]
periods	=  [minBound..maxBound]
-- (agent, status, ie present or future, career)
careers	    = [(A,Present,Unspec),(R,Future,RU),(M,Future,MI),(K,Present,KL),(K,Future,KD),(N,Present,NA),(S,Present,SG)]

threePlacers = [
    ("liked", pred3 appreciation )
    , ("wanted_to_work",	pred3 $ [(a,a,c) | (a,p,c) <- careers,
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
		[(VM,Unspec,Unspec,Unspec,Unspec)] ++
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
births	= [(Unspec,A,X,Unspec),(JM,J,JT,JY),(Unspec,K,X,Unspec),(MM,M,X,Unspec),(CM,C,CJ,Unspec),(VM,V,Unspec,Unspec),(MM,M,X,Unspec),(KM,K,X,Unspec),(NM,N,NN,Unspec),(SM,S,Unspec,Unspec),(DM,D,Unspec,Unspec)]

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

-- vim: set ts=8 sts=4 sw=4 noet:
