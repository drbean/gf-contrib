module LogicalForm (module LogicalForm, module Candidate) where

import Candidate
import PGF

import Model
import Interpretation
-- import Story_Interpretation
-- import qualified Topic_Interpretation as Topic

import Data.List
import Data.Tuple

entuples :: [(Entity,GPN)]
entuples = [
	(B,Gbarbara)
	, (D,Gdrbean)
	, (E,Geva)
	, (T,Gtadeusz)
	, (F,Gfast_track)
	]

instance Eq GPN where
	(==) Gbarbara Gbarbara = True
	(==) Gdrbean Gdrbean = True
	(==) Geva Geva = True
	(==) Gtadeusz Gtadeusz = True
	(==) Gfast_track Gfast_track = True
	(==) _ _ = False

gent2ent :: GPN -> Entity
gent2ent gent        | Just ent <- lookup gent (map swap entuples) = ent
ent2gent :: Entity -> GPN
ent2gent ent | Just gent <- lookup ent entuples = gent

data Term = Const Entity | Var Int | Struct String [Term]
	deriving (Eq)

data LF = NonProposition
	| Rel String [Term]
        | Eq   Term Term
        | Neg  LF
        | Impl LF LF
        | Equi LF LF
        | Conj [LF]
        | Disj [LF]
        | Forall (Term -> LF)
        | Exists (Term -> LF)
        | Single (Term -> LF)
        | The (Term -> LF)
        | Several (Term -> LF)
        | Many (Term -> LF)
        | Most (Term -> LF)
        | WH (Term -> LF)
--	deriving Eq

instance Show Term where
  show (Const name) = show name
  show (Var i)      = 'x': show i
  show (Struct s []) = s
  show (Struct s ts) = s ++ show ts

instance Show LF where
	show form = ishow form 1
ishow NonProposition i = "NonProposition"
ishow (Rel r args) i  = r ++ show args
ishow (Eq t1 t2) i    = show t1 ++ "==" ++ show t2
ishow (Neg lf) i      = '~': (ishow lf i)
ishow (Impl lf1 lf2) i = "(" ++ ishow lf1 i ++ "==>"
		     ++ ishow lf2 i ++ ")"
ishow (Equi lf1 lf2) i = "(" ++ ishow lf1 i ++ "<=>"
		     ++ ishow lf2 i ++ ")"
ishow (Conj []) i     = "true"
ishow (Conj lfs) i    = "conj" ++ "[" ++ ishowForms lfs i ++ "]"
ishow (Disj []) i     = "false"
ishow (Disj lfs) i    = "disj" ++ "[" ++ ishowForms lfs i ++ "]"
ishow (Forall scope) i = "Forall x" ++ show i ++ (' ' :
			(ishow (scope (Var i)) (i+1)))
ishow (Exists scope) i = "Exists x" ++ show i ++ (' ' :
			(ishow (scope (Var i)) (i+1)))
ishow (Single scope) i = "Single x" ++ show i ++ (' ' :
			(ishow (scope (Var i)) (i+1)))
ishow (The scope) i = "The x" ++ show i ++ (' ' :
			(ishow (scope (Var i)) (i+1)))
ishow (Several scope) i = "Several x" ++ show i ++ (' ' :
			(ishow (scope (Var i)) (i+1)))
ishow (Many scope) i = "Many x" ++ show i ++ (' ' :
			(ishow (scope (Var i)) (i+1)))
ishow (Most scope) i = "Most x" ++ show i ++ (' ' :
			(ishow (scope (Var i)) (i+1)))
ishow (WH scope) i = "WH x" ++ show i ++ (' ' :
			(ishow (scope (Var i)) (i+1)))

ishowForms :: [LF] -> Int -> String
ishowForms [] _ = ""
ishowForms [f] i = ishow f i
ishowForms (f:fs) i = ishow f i ++ "," ++ ishowForms fs i

relname :: LF -> String
relname (Rel name _) = name
relname lf = error ( (show lf) ++ " not a relation" )

-- lin :: Tree -> Maybe String
-- lin tr = Just (showCId (fst tr))

lin :: Gf a => a -> String
lin e = stripApp (unApp (gf e))

stripApp :: Maybe (CId, [Expr]) -> String
stripApp = maybe "Undefined" (\x -> ((showCId . fst) x))

-- e2t :: GPN -> Tree
-- e2t e | (Just tr) <- unApp (gf e) = tr

unmaybe (Just x) = x
-- unmaybe Nothing = I

--transTXT :: Maybe (ParseTree Cat Cat) -> LF
--transTXT (Just Ep) = NonProposition
--transTXT s@(Just (Branch (Cat _ "S" _ _) _) ) = transS s
--transTXT (Just (Branch (Cat _ "YN" _ _) [Leaf (Cat _ "AUX" _ _),s] )) =
--	transS (Just s)
--transTXT (Just (Branch (Cat _ "YN" _ _) [Leaf (Cat _ "COP" _ _),s] )) =
--	transS (Just s)
--transTXT (Just (Branch (Cat _ "TXT" _ _) [s,conj,
--	s2@(Branch (Cat _ "S" _ _) _)])) =
--	    Conj [ transS (Just s), transS (Just s2) ]
--transTXT (Just (Branch (Cat _ "TXT" _ _) [s,conj,
--	s2@(Branch (Cat _ "TXT" _ _) _)])) =
--	    Conj [ transS (Just s), transTXT (Just s2) ]
--
transS :: GUtt -> Maybe LF
--transS (Just Ep) = NonProposition
transS (GQUt (GPosQ (GWH_Pred wh vp))) =
	Just (WH (\x -> Conj [ transW wh x, transVP vp x ]))
transS (GQUt (GPosQ (GWH_ClSlash wh cl))) =
	Just (WH (\x -> Conj [ transW wh x, transClSlash cl ]))
transS (GQUt (GNegQ (GWH_Pred wh vp))) =
	Just (WH (\x -> Conj [ transW wh x, Neg (transVP vp x)]))
transS (GQUt (GPosQ (GYN (GSentence np vp)))) = Just ((transNP np) (transVP vp))
-- transS (GUt (GPosS (GSentence np vp))) = Just ((transNP np) (transVP vp))
transS (GQUt (GNegQ (GYN (GSentence np vp)))) = Just ((transNP np) (transVP vp))
-- transS (GUt (GNegS (GSentence np vp))) = Just ((transNP np) (transVP vp))
transS (GQUt (GPosQ (GTagQ np vp))) = Just ((transNP np) (transVP vp))
transS (GQUt (GNegQ (GTagQ np vp))) = Just ((transNP np) (transVP vp))
transS (GQUt (GPosQ (GTagComp np comp))) = Just ((transNP np) (transCOMP comp))
transS (GQUt (GNegQ (GTagComp np comp))) = Just ((transNP np) (transCOMP comp))
transS _ = Nothing

--transS (Just (Branch (Cat _ "AT" _ _) [np,att])) =
--  (transNP np) (transAT att)
--
--transS (Just (Branch (Cat _ "YN" _ _)
--       [Leaf (Cat "could"    "AUX" _ []),s])) = transS (Just s)
--transS (Just (Branch (Cat _ "YN" _ _)
--       [Leaf (Cat "couldn't" "AUX" _ []),s])) = transS (Just s)
--
--transS (Just (Branch (Cat _ "YN" _ _)
--       [Leaf (Cat _ "AUX" _ []),s])) = transS (Just s)
-- transS _ = Nothing

--transAT :: ParseTree Cat Cat -> Term -> LF
--transAT (Branch (Cat _ "AV" _ _)
--    [Leaf (Cat att "V" _ [_]), Leaf (Cat "to" "TO" [ToInf] []),
--       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj])]) =
--	   case(catLabel (t2c obj)) of
--	"NP" ->
--	    (\subj -> transNP obj
--		( \theme -> Rel (att++"_to_"++act) [subj,subj,theme] ))
--	"PP" ->
--	    (\subj -> transPP obj
--		( \theme -> Rel (att++"_to_"++act) [subj,subj,theme] ))
--
--transAT (Branch (Cat _ "AV" _ _)
--    [Leaf (Cat att "V" _ [_]), Leaf (Cat "to" "TO" [ToInf] []),
--       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj1,obj2])]) =
--    case (catLabel ( t2c obj1 ), catLabel (t2c obj2)) of
--	("NP","NP") ->
--	    (\subj -> transNP obj1
--		(\recipient -> transNP obj2
--		    ( \theme -> Rel (att++"_to_"++act) [subj,subj,theme,recipient] )))
--	("NP","PP") ->
--	    (\subj -> transNP obj1
--		(\theme -> transPP obj2
--		    ( \recipient -> Rel (att++"_to_"++act) [subj,subj,theme,recipient] )))
--
--transAT (Branch (Cat _ "AV" _ _)
--    [Leaf (Cat att "V" _ [_]), obj0, Leaf (Cat "to" "TO" [ToInf] []),
--       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj])]) =
--	   case(catLabel (t2c obj)) of
--	"NP" ->
--	    (\subj -> transNP obj0
--		(\agent -> transNP obj
--		    ( \theme -> Rel (att++"_to_"++act) [subj,agent,theme] )))
--	"PP" ->
--	    (\subj -> transNP obj0
--		(\agent -> transPP obj
--		    ( \theme -> Rel (att++"_to_"++act) [subj,agent,theme] )))
--
--transAT (Branch (Cat _ "AV" _ _)
--    [Leaf (Cat att "V" _ [_]), obj0, Leaf (Cat "to" "TO" [ToInf] []),
--       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj1,obj2])]) =
--    case (catLabel ( t2c obj1 ), catLabel (t2c obj2)) of
--	("NP","NP") ->
--	    (\subj -> transNP obj0
--		(\agent -> transNP obj1
--		    (\recipient -> transNP obj2
--			( \theme -> Rel (att++"_to_"++act) [subj,agent,theme,recipient] ))))
--	("NP","PP") ->
--	    (\subj -> transNP obj0
--		(\agent -> transNP obj1
--		    (\theme -> transPP obj2
--			( \recipient -> Rel (att++"_to_"++act) [subj,agent,theme,recipient] ))))
--transAT _ = \x -> NonProposition
--
--transNPorPP :: ParseTree Cat Cat ->
--                (Term -> LF) -> LF
--transNPorPP obj = case ( catLabel (t2c obj) ) of
--    "NP" -> transNP obj
--    "PP" -> transPP obj
--
transNP :: GNP -> (Term -> LF) -> LF
transNP (GItem det cn) = (transDet det) (transCN cn)
transNP (GEntity name)
--    | name `elem` interrolist = \ p -> NonProposition
    | entity <- (gent2ent name) , entity `elem` entities =
	\ p -> p (Const entity)
    | otherwise = \p -> NonProposition
transNP (GTitular t)	| rel <- lin t =
	\p -> Exists ( \v -> Conj [ p v, Rel rel [v] ] )
transNP thing	| rel <- lin thing =
	\p -> Exists ( \v -> Conj [ p v, Rel rel [v] ] )
		| otherwise = \p -> NonProposition
--transNP (Branch (Cat _ "NP" _ _) [np,Leaf (Cat "'s" "APOS" _ _),cn]) =
--    \p -> Exists (\thing -> Conj [ p thing, transCN cn thing, transNP np (\owner -> (Rel "had" [owner,thing]))])

transDet :: GDet -> (Term -> LF) -> (Term -> LF) -> LF
transDet (GApos owner) =
	\ p q -> Exists (\v -> Conj [ Single p, p v, q v, transNP owner
		(\mod -> Rel "have" [mod, v] )])
transDet (GApos_pl owners) =
	\ p q -> Exists (\v -> Conj [ Several p, p v, q v, transNP owners
		(\mod -> Rel "have" [mod, v] )])
transDet GtheSg_Det =  \ p q -> Exists (\v -> Conj [Single p, p v, q v] )
transDet GthePlural_Det =  \ p q -> Several (\v -> Conj [p v, q v] )
--transDet (Leaf (Cat "every" "DET" _ _)) =
--  \ p q -> Forall (\v -> Impl (p v) (q v) )
--transDet (Leaf (Cat "all" "DET" _ _)) =
--  \ p q -> Forall (\v -> Impl (p v) (q v) )
transDet Gsome_Det = \ p q -> Exists (\v -> Conj [p v, q v] )
transDet Gsome_pl_Det = transDet Gsome_Det
transDet Ga_Det = \ p q -> Exists (\v -> Conj [p v, q v] )
transDet Gzero_Det_pl = \ p q -> Exists (\v -> Conj [p v, q v] )
transDet Ga_few = \ p q -> Several (\v -> Conj [p v, q v] )
transDet Gno_Det = \ p q -> Neg (Exists (\v -> Conj [p v, q v]))
transDet Gno_pl_Det = transDet Gno_Det
--transDet (Leaf (Cat "most" "DET" _ _)) =
--  \ p q -> Most (\v -> Impl (p v) (q v) )
--transDet (Leaf (Cat "many" "DET" _ _)) =
--  \ p q -> Many (\v -> Conj [p v, q v] )
--transDet (Leaf (Cat "few" "DET" _ _)) =
--  \ p q -> Neg $ Many (\v -> Impl (p v) (q v) )
--transDet (Leaf (Cat "which" "DET" _ _)) =
--  \ p q -> WH (\v1 -> Conj
--  		[Forall (\v2 -> Equi (p v2) (Eq v1 v2)),
--		q v1])
transMassDet :: GMassDet -> (Term -> LF) -> (Term -> LF) -> LF
transMassDet Gthe_mass_Det = \ p q -> Exists (\v -> Conj [Single p, p v, q v] )
transMassDet Gzero_Det_sg = \ p q -> Exists (\v -> Conj [p v, q v] )

transN2 :: GN2 -> Term -> LF
transN2 name	= \x -> Rel (lin name) [x]
transCN :: GCN -> Term -> LF
transCN (GKind ap cn) = \x -> Conj [ transCN cn x, Rel (lin ap) [x] ]
transCN (GOfpos cn np) =
    \owner -> Conj [(transN2 cn owner), (transNP np
	(\thing -> Rel "have" [owner, thing]))]
transCN (GModified cn rel) = case (rel) of
	(GSubjRel wh vp) -> \ x -> Conj [transCN cn x, transVP vp x]
	(GObjRel wh (GVPClSlash np (GV2Slash v))) ->
		\x -> Conj [transCN cn x, transNP np (\agent -> Rel (lin v) [agent,x])]
transCN name          = \ x -> Rel (lin name) [x]
--	case (np,vp) of
--	    (_, (Branch (Cat _ "VP" _ _) vp)) -> case (vp) of
--		[Leaf (Cat name "V" _ _),Leaf (Cat "#" "NP" _ _)]->
--		    \x -> Conj [transCN cn x, transNP np (\agent -> Rel name [agent,x])]
--		[Leaf (Cat name "V" _ _),obj1,obj2]-> case (obj1,obj2) of
--		    (Leaf (Cat "#" "NP" _ _),Branch (Cat _ "PP" _ _) _) -> \x -> Conj
--			[transCN cn x, transNP np ( \agent ->
--			    transPP obj2 (\recipient -> Rel name [agent, x, recipient] ) ) ]
--		    (Leaf (Cat "#" "NP" _ _),Branch (Cat _ "NP" _ _) _) -> \x -> Conj
--			[transCN cn x, transNP np ( \agent ->
--			    transNP obj2 (\patient -> Rel name [agent, patient, x] ) ) ]
--		    (Leaf (Cat _ "NP" _ _),Leaf (Cat "#" "NP" _ _)) -> \x -> Conj
--			[transCN cn x, transNP np ( \agent ->
--			    transNP obj1 (\recipient -> Rel name [agent, x, recipient] ) ) ]
--		    (_,Leaf (Cat "#" "NP" _ _)) -> \x -> Conj
--			[transCN cn x, transNP np ( \agent ->
--			    transNP obj2 (\patient -> Rel name [agent, patient, x] ) ) ]
--	    _ -> \x -> Conj [transCN cn x, transVP vp x]
--    (Branch (Cat _ "MOD" _ _) [Branch (Cat _ "S" _ _) [np,vp]]) ->
--	case (vp) of
--	    (Branch (Cat _ "VP" _ _) [Leaf (Cat name "V" _ _),Leaf (Cat "#" "NP" _ _)])
--		-> \x -> Conj [transCN cn x, transNP np (\agent -> Rel name [agent,x])]
--    (Branch (Cat _ "MOD" _ _) [Branch (Cat _ "PP" _ _)
--	[Leaf (Cat "with" "PREP" [With] _),np]]) ->
--	\x -> Conj [transCN cn x, transNP np (\patient -> Rel "had" [x, patient])]
--    (Branch (Cat _ "MOD" _ _) [Branch (Cat _ "PP" _ _)
--	[Leaf (Cat "in" "PREP" [In] _),np]]) ->
--	\x -> Conj [transCN cn x, transNP np (\field -> Rel "kind" [x, field])]
--    _ ->	\ x -> Conj [transCN cn x, transREL rel x]
--
--transREL :: ParseTree Cat Cat -> Term -> LF
--transREL (Branch (Cat _ "MOD" _ _ ) [rel,s]) =
--  \ x -> (transS (Just s))
--transREL (Branch (Cat _ "MOD" _ _ ) [s])     =
--  \ x -> (transS (Just s))

transPlace :: GPlace -> (Term -> LF) -> LF
transPlace (GLocation _ name) | rel <- lin name =
	\p -> Exists ( \v -> Conj [ p v, Rel rel [v] ] )
transPlace place	| rel <- lin place =
	\p -> Exists ( \v -> Conj [ p v, Rel rel [v] ] )

--transPP :: ParseTree Cat Cat -> (Term -> LF) -> LF
--transPP (Leaf   (Cat "#" "PP" _ _)) = \ p -> p (Var 0)
--transPP (Branch (Cat _   "PP" _ _) [prep,np]) = transNP np

transClSlash :: GClSlash -> LF
transClSlash cl = case cl of
	(GVPClSlash np vpslash) -> case vpslash of
		(GV2Slash v) -> WH (\x -> transNP np (\subj->
			Rel (lin v) [subj,x]))
		(GV2VSlash v vp) -> case vp of
			(GLook_bad va a) -> WH (\x -> transNP np (\subj ->
				Rel ((lin v) ++ "_" ++ (lin va)
					++ "_" ++ (lin a)) [subj,x]))
			(GChanging v2 obj) -> WH (\x -> transNP np (\subj ->
				transNP obj (\theme -> Rel ((lin v) ++ "_to_" ++
				(lin v2)) [subj,x,theme])))

transVP :: GVP -> Term -> LF
----transVP (Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ _), obj] ) =
----	\x -> Exists( \agent -> transPP obj (\cond -> Rel part [agent, x, cond] ) )
--transVP (Branch vp@(Cat _ "VP" _ _)
--                [Leaf (Cat "wasn't" label fs subcats),pred]) =
--        \x -> Neg ((transVP (Branch vp [Leaf (Cat "was" label fs subcats),pred])) x)
--transVP (Branch vp@(Cat _ "VP" _ _)
--                [Leaf (Cat "weren't" label fs subcats),pred]) =
--        \x -> Neg ((transVP (Branch vp [Leaf (Cat "were" label fs subcats),pred])) x)
--transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
--    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ _)] ]) =
--	\x -> Exists( \agent -> Rel part [agent, x] )
--transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
--    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ _), obj] ]) =
--	\x -> Exists( \agent -> transPP obj (\cond -> Rel part [agent, x, cond] ) )
--transVP (Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ [_,_]), obj1, obj2] ) =
--	\x -> Exists( \agent -> transPP obj1
--	    (\cond1 -> transPP obj2
--		(\cond2 -> Rel part [agent, x, cond1, cond2] ) ) )
--transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
--    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ [_,_]), obj1, obj2] ])
--	| ( elem By (fs (t2c obj1)) ) =
--	    \x -> transPP obj1
--		    (\agent -> transPP obj2
--			(\cond -> Rel part [agent, x, cond] ) )
--transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
--    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ [_,_]), obj1, obj2] ])
--	| ( elem By (fs (t2c obj2)) ) =
--	    \x -> transPP obj1
--		(\cond -> transPP obj2
--		    (\agent -> Rel part [agent, x, cond] ) )
--transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
--    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ [_,_]), obj1, obj2] ])
--	=
--	    \x -> Exists( \agent -> transPP obj1
--		(\cond1 -> transPP obj2
--		    (\cond2 -> Rel part [agent, x, cond1, cond2] ) ) )
--
--transVP (Branch (Cat _ "VP" _ _)
--                [Leaf (Cat "could" "AUX" _ []),vp]) =
--        transVP vp
--transVP (Branch (Cat _ "VP" _ _)
--                [Leaf (Cat "couldn't" "AUX" _ []),vp]) =
--        \x -> Neg ((transVP vp) x)
--
transVP (GBe_vp comp) = case comp of
    GBe_someone np -> \x -> transNP np (\pred -> Eq pred x)
    GBe_bad ap -> \x -> Rel (lin ap) [x]
transVP (GHappening v) =
        \ t -> ( Rel (lin v) [t] )
transVP (GChanging v obj) = \subj -> transNP obj (\ e -> Rel (lin v) [subj,e])
--transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat name "V" _ [_]),obj1]) =
--	case (catLabel ( t2c obj1 )) of
--		"PP" -> \subj -> transPP obj1 (\adv -> Rel name [subj,adv])
transVP (GPass (GV2Slash v)) =
	\patient -> Rel ("is_" ++ (lin v) ++ "_ed") [patient]

transVP (GTriangulating v obj1 obj2) =
  \ agent   -> transNP obj1
  (\ theme   -> transNP obj2
   (\ recipient -> Rel (lin v) [agent,theme,recipient]))

--transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat name "V" _ [_,_,_]),obj1,obj2,obj3]) =
--    \ agent   -> transNPorPP obj1
--    (\ location   -> transNPorPP obj2
--    (\ theme   -> transNPorPP obj3
--     (\ recipient -> Rel name [agent,location,theme,recipient])))
--
transVP (GIntens v0 vp) = case vp of
	GHappening v ->
		\subj -> Rel ((lin v0) ++"_to_"++ (lin v)) [subj]
	GChanging v obj ->
		(\subj -> transNP obj
		( \theme -> Rel ((lin v0) ++"_to_"++
				(lin v)) [subj,theme] ))
	GWithPlace v (GLocating prep place) ->
		\subj -> transPlace place
		(\name -> Rel  ((lin v0) ++ "_to_" ++ (lin v) ++ "_" ++ (lin prep)) [subj,name])
	GWithFreq vp2 (GFreqAdv count period) -> case vp2 of
		GWithPlace vp (GLocating prep place) -> \subj -> transNP count
				(\times -> transPlace place
				(\name -> Rel ((lin v0) ++ "_to_" ++ (lin vp) ++ "_" ++ (lin prep)) [subj,name,times]))
	GWithStyle vp2 adv -> case vp2 of
		GChanging v obj -> case adv of
		(GComparaAdv cadv a np) -> 
				\subj -> transNP obj
				(\name -> transNP np
				(\norm -> Rel ((lin v0) ++ "_to_" ++ (lin v) ++ "_" ++ (lin a)) [subj, name, norm]))
		(GWithPlace vp (GLocating prep place)) ->
			\subj -> transPlace place
			(\name -> Rel ((lin v0) ++ "_to_" ++ (lin vp)) [subj,name])
	GTriangulating v obj1 obj2 ->
		\ agent   -> transNP obj1
		(\ theme   -> transNP obj2
		 (\ recipient -> Rel ((lin v0) ++ "_to_" ++ lin v) [agent,theme,recipient]))
	_ -> \x -> NonProposition
		-- _ -> \subj -> Rel  ((lin v0) ++ "_to_" ++ "go_2_nights_aweek") [subj]
--transVP (Branch (Cat _ "AT" _ _)
--    [Leaf (Cat att "V" _ _), Leaf (Cat "to" "TO" [ToInf] []),
--       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj])]) =
--	   case(catLabel (t2c obj)) of
--	"PP" ->
--	    (\subj -> transPP obj
--		( \theme -> Rel (att++"_to_"++act) [subj,subj,theme] ))
--transVP (Branch (Cat _ "AT" _ _)
--    [Leaf (Cat att "V" _ [_]), Leaf (Cat "to" "TO" [ToInf] []),
--       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj1,obj2])]) =
--    case (catLabel ( t2c obj1 ), catLabel (t2c obj2)) of
--	("NP","NP") ->
--	    (\subj -> transNP obj1
--		(\recipient -> transNP obj2
--		    ( \theme -> Rel (att++"_to_"++act) [subj,subj,theme,recipient] )))
--	("NP","PP") ->
--	    (\subj -> transNP obj1
--		(\theme -> transPP obj2
--		    ( \recipient -> Rel (att++"_to_"++act) [subj,subj,theme,recipient] )))
transVP (GCausative v0 obj0 vp) = case vp of
	GHappening v ->
		\subj -> transNP obj0
			(\agent -> Rel ((lin v0) ++ "_to_" ++
				(lin v)) [subj,agent])
	GLook_bad v a ->
		\subj -> transNP obj0
		(\agent -> Rel ((lin v0) ++ "_" ++ (lin v) ++
		"_" ++ (lin a)) [subj, agent])
	GChanging v obj1 ->
		(\subj -> transNP obj0
			(\agent -> transNP obj1
				( \theme -> Rel ((lin v0) ++"_to_"++
					(lin v)) [subj,agent,theme] )))
	GCausative v obj1 vp2 ->
		case vp2 of
			GChanging v2 obj2 ->
				(\subj -> transNP obj0
					(\agent1 -> transNP obj1
						(\agent2 -> transNP obj2
							(\theme -> Rel ((lin v0) ++ "_to_" ++
								(lin v) ++ "_to_" ++
									(lin v2)) [subj,agent1,agent2,theme] ))))
	GIntens v vp2 ->
		(\x -> Rel "true" [x])
--transVP (Branch (Cat _ "AT" _ _)
--    [Leaf (Cat att "V" _ [_]), obj0, Leaf (Cat "to" "TO" [ToInf] []),
--       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj])]) =
--	   case(catLabel (t2c obj)) of
--	"PP" ->
--	    (\subj -> transNP obj0
--		(\agent -> transPP obj
--		    ( \theme -> Rel (att++"_to_"++act) [subj,agent,theme] )))
--transVP (Branch (Cat _ "AT" _ _)
--    [Leaf (Cat att "V" _ [_]), obj0, Leaf (Cat "to" "TO" [ToInf] []),
--       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj1,obj2])]) =
--    case (catLabel ( t2c obj1 ), catLabel (t2c obj2)) of
--	("NP","NP") ->
--	    (\subj -> transNP obj0
--		(\agent -> transNP obj1
--		    (\recipient -> transNP obj2
--			( \theme -> Rel (att++"_to_"++act) [subj,agent,theme,recipient] ))))
--	("NP","PP") ->
--	    (\subj -> transNP obj0
--		(\agent -> transNP obj1
--		    (\theme -> transPP obj2
--			( \recipient -> Rel (att++"_to_"++act) [subj,agent,theme,recipient] ))))
transVP (GPositing v0 (GPosS (GSentence np vp))) = case vp of
	(GHappening v) -> (\positer -> transNP np
		(\referent -> Rel ((lin v0) ++ ":is_" ++ (lin v)) [positer, referent]))
	(GBe_vp comp) -> case comp of
		(GBe_bad attribute ) -> case attribute of
			(GAdjModified adj mod) -> case mod of
				(GHappening v) -> \positer -> transNP np
					(\referent -> Rel ((lin v0) ++ ":is_" ++ (lin adj) ++ "_to_" ++ (lin v)) [positer,referent])
				_ -> \x -> undefined
			_ -> (\positer -> transNP np
				(\referent -> Rel ((lin v0) ++ ":is_" ++
				(lin attribute)) [positer,referent]))
		(GBe_someone subjcomp ) -> (\positer -> transNP np
			(\referent -> transNP subjcomp
				(\pred -> Rel ((lin v0) ++ ":is")
					[positer,referent,pred])))
	(GWithPlace v loc) -> (\x -> Rel "true" [x] )
	(GChanging v2 obj) -> (\positer -> transNP np
		(\referent -> transNP obj
			(\theme -> Rel ((lin v0) ++ ":" ++
				(lin v2)) [positer,referent,theme])))
	(GIntens vv vp2) -> case vp2 of
		(GHappening v) -> (\positer -> transNP np
			(\referent -> Rel ((lin v0) ++ ":" ++ (lin vv) ++ "_to_"
				++ (lin v)) [positer, referent] ))
		(GChanging v obj) -> (\positer -> transNP np
			(\referent -> transNP obj (\theme -> Rel ((lin v0) ++
				":" ++ (lin vv) ++ "_to_" ++ (lin v))
					[positer,referent,theme])))
		(GTriangulating v obj1 obj2) -> (\positer -> transNP np
			(\referent -> transNP obj1
			(\theme	-> transNP obj2
			(\recipient -> Rel ((lin v0) ++ ":" ++ (lin vv)
			++ "_" ++ (lin v)) [positer,referent,theme,recipient]))))
	(GTriangulating v obj1 obj2) ->
		(\positer -> transNP np
			(\referent -> transNP obj1
				(\theme	-> transNP obj2
					(\recipient -> Rel ((lin v0) ++ ":" ++ (lin v))
						[positer,referent,theme,recipient]))))
	(GPass (GV2Slash v)) ->
		\positer -> transNP np 
			(\patient -> Rel((lin v0) ++ ":is_" ++ (lin v) ++ "_ed")
				[positer,patient])
	_ -> \x -> NonProposition
transVP (GPositing v0 (GNegS (GSentence np vp))) = case vp of
	(GHappening v) -> (\positer -> transNP np
		(\referent -> Rel ((lin v0) ++ ":doesn't_" ++ (lin v)) [positer, referent]))
	(GBe_vp comp) -> case comp of
		(GBe_bad attribute ) -> case attribute of
			(GAdjModified adj mod) -> case mod of
				(GHappening v) -> \positer -> transNP np
					(\referent -> Rel ((lin v0) ++ ":isn't_" ++ (lin adj) ++ "_to_" ++ (lin v)) [positer,referent])
				_ -> \x -> undefined
			_ -> (\positer -> transNP np
				(\referent -> Rel ((lin v0) ++ ":isn't_" ++
				(lin attribute)) [positer,referent]))
		(GBe_someone subjcomp ) -> (\positer -> transNP np
			(\referent -> transNP subjcomp
				(\pred -> Rel ((lin v0) ++ ":isn't_")
					[positer,referent,pred])))
	(GWithPlace v loc) -> (\x -> Rel "true" [x] )
	(GChanging v2 obj) -> (\positer -> transNP np
		(\referent -> transNP obj
			(\theme -> Rel ((lin v0) ++ ":doesn't_" ++
				(lin v2)) [positer,referent,theme])))
	(GIntens vv vp2) -> case vp2 of
		(GHappening v) -> (\positer -> transNP np
			(\referent -> Rel ((lin v0) ++ ":" ++ (lin vv) ++ "_not_to_"
				++ (lin v)) [positer, referent] ))
		(GChanging v obj) -> (\positer -> transNP np
			(\referent -> transNP obj (\theme -> Rel ((lin v0) ++
				":" ++ (lin vv) ++ "_not_to_" ++ (lin v))
					[positer,referent,theme])))
		(GTriangulating v obj1 obj2) -> (\positer -> transNP np
			(\referent -> transNP obj1
			(\theme	-> transNP obj2
			(\recipient -> Rel ((lin v0) ++ ":" ++ (lin vv)
			++ "_not_to_" ++ (lin v)) [positer,referent,theme,recipient]))))
	(GTriangulating v obj1 obj2) ->
		(\positer -> transNP np
			(\referent -> transNP obj1
				(\theme	-> transNP obj2
					(\recipient -> Rel ((lin v0) ++ ":doesn't_" ++ (lin v)) 
						[positer,referent,theme,recipient]))))
	_ -> \x -> NonProposition
--    GNegS (GCop item comp) ->
--	(\positer -> transNP item
--	    (\subj -> transNP comp (\x -> Rel ((lin v0) ++"_isn't") [positer, subj, x])))
transVP	(GWithPlace vp (GLocating prep destination)) =
	\mover -> transPlace destination
	(\place -> Rel ((lin vp) ++ "_" ++ (lin prep)) [mover,place])
transVP _ = \x -> NonProposition
--
transCOMP :: GComp -> Term -> LF
transCOMP (GBe_someone np) = \x -> transNP np (\pred -> Eq pred x)
transCOMP (GBe_bad ap) = \x -> Rel (lin ap) [x]
--transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "COP" _ _),
--    Branch (Cat "_" "COMP" [] []) [comp]]) = case (catLabel (t2c comp)) of
--	"PP" -> \subj -> transPP comp (\place -> Rel "resident" [subj,place])
--transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "COP" _ _),
--    Branch (Cat "_" "COMP" [] []) [comp1,place]]) = case (catLabel (t2c comp1)) of
--	"NP" ->
--	    case (catLabel (t2c place)) of
--		"PP" -> \subj -> Conj [(transNP comp1 (\pred -> Eq pred subj )),
--		    (transPP place (\place -> Rel "resident" [subj,place]) )]
--	--Leaf (Cat name "NP" _ _ ) -> \t -> (Rel name [t] )
--	--Branch (Cat _ "NP" _ _) [det,cn] -> case (cn) of
--	--    Leaf (Cat name "CN" _ _) -> \t -> Rel name [t]
--	--Branch (Cat _ "NP" _ _) [np,Leaf (Cat _ "APOS" _ _),cn] -> case (cn) of
--	--    Leaf (Cat name "CN" _ _) -> \x -> transNP np
--	--	(\owner -> Conj [Rel name [x], Rel "had" [owner,x] ] )

--transWH :: GUtt -> LF
--transWH (GQUt (GPosQ (GWH_Pred who_WH pred))) = case pred of
--	(GBe_vp comp) -> WH( transCOMP comp )
--	(GHappening v) -> WH (\x -> Rel (lin v) [x])
--	(GChanging v np) -> WH (\x -> transNP np
--		(\agent -> Rel (lin v) [agent,x]))
--	-- WH (\x -> Conj [transW wh x, transNP np (\agent -> Rel v [agent,x])])
--	(GCausative v0 obj0 vp) -> WH (transVP (GCausative v0 obj0 vp))

	-- GBe_someone sb ->
	-- WH (\x -> transNP sb (\obj -> Eq obj x ) )

--transWH (Just (Branch (Cat _ "WH" _ _ )
--	[wh,(Branch (Cat _ "YN" _ _) [_,(Branch
--		(Cat _ "S" _ _) [np,(Branch
--			(Cat _ "VP" _ _) [_,vp@(Branch
--				(Cat _ "VP" _ _) [Leaf (Cat two_ple "V" _ _),obj])])])])])) =
--	case(catLabel (t2c obj)) of
--	    "NP" -> WH (\x -> Conj [transW wh x,
--				transNP np (\agent ->
--					Rel two_ple [agent,x])])
--	    "PP" -> case (fs (t2c vp)) of
--			[Part] -> WH (\x -> Exists (\agent -> Conj [transW wh x, transNP np (\patient -> Rel two_ple [agent, patient, x] ) ] ) )
--			_ -> WH (\x -> Conj [transW wh x,
--				transNP np (\agent ->
--					Rel two_ple [agent,x])])
--
--transWH (Just (Branch (Cat _ "WH" _ _ )
--	[wh,(Branch (Cat _ "YN" _ _) [_,(Branch
--		(Cat _ "S" _ _) [np,(Branch
--			(Cat _ "VP" _ _) [_,vp@(Branch
--				(Cat _ "VP" _ _) [Leaf (Cat three_ple "V" _ _),obj1,obj2]
--						)])])])])) =
--	case (obj1,obj2) of
--		(_,Branch (Cat _ "PP" _ _) [Leaf (Cat _ "PREP" _ _),
--						Leaf (Cat "#" "NP" _ _)]) ->
--			WH (\x -> Conj [transW wh x,
--				transNP np (\agent -> transNP obj1
--					( \patient -> Rel three_ple [agent,patient,x]))])
--		(_,Leaf (Cat "#" "NP" _ _)) ->
--			WH (\x -> Conj [transW wh x,
--				transNP np (\agent -> transNP obj1
--					( \recipient -> Rel three_ple [agent,x,recipient]))])
-- transWH _ = NonProposition

transW :: GIP -> (Term -> LF)
--transW (Branch (Cat _ "NP" fs _) [det,cn]) =
--                            \e -> transCN cn e
transW Gwho_WH	= \e -> Rel "person"    [e]
transW Gwhat_WH	= \e -> Rel "thing"    [e]
--transW (Branch (Cat _ "PP" fs _) [prep,np])
--      | Masc      `elem` fs = \e -> Rel "man"    [e]
--      | Fem       `elem` fs = \e -> Rel "woman"  [e]
--      | MascOrFem `elem` fs = \e -> Rel "person" [e]
--      | otherwise           = \e -> Rel "thing"  [e]
--
--
--lf0 = Rel "worked" [ Const(ents!!17) ]
--lf00 = (Conj [(Rel "person" [Var 0]), (Rel "worked" [Var 0]) ] )
---- lf000 = (Exists (Conj [(Rel "person" [Var 0]), (Rel "worked" [Var 0]) ] )) (Const(ents)!!17)
--
--lf1 = (Equi  (Rel "married" [ Const(ents!!9), Const(ents!!1) ]) (Neg (Rel "married" [ Const(ents!!8), Const(ents!!17)]) ) )
--
--lf2 = (Conj [ (Rel "married" [ Const (ents !! 9), Const       (ents !! 1)]), (Rel "married" [ Const (ents !! 8), Const (ents !!   17)]) ] )
--
--lf3 = Rel "married" [ Const (ents !! 8), Const (ents !! 17)]
--lf4 = (Impl  (Rel "married" [ Const (ents !! 9), Const        (ents !! 1)]) (Rel "married" [ Const (ents !! 8), Const (ents !!    17)])  )
--lf5 = (Conj [ (Rel "married" [ Const (ents !! 9), Const       (ents !! 1)]), (Rel "married" [ Const (ents !! 8), Const (ents !!   17)]) ] )
--lf6 = (Disj [ (Rel "married" [ Const (ents !! 9), Const       (ents !! 1)]), (Rel "married" [ Const (ents !! 8), Const (ents !!   17)]) ] )
--
--lf70 = ( \x -> ( Conj [ (Rel "son" [x]), (Rel "have" [Const (ents !! 8) ,x]) ] ) ) (Const (ents !! 12) )
--lf71 = ( \x -> ( Conj [ (Rel "son" [x]), (Rel "have" [x, Const (ents !! 17)]) ] ) ) (Const (ents !! 12) )
--lf72 = ( \x -> ( Conj [ (Rel "son" [x]), (Rel "have" [x, Const (ents !! 17)]) ] ) ) (Const (ents !! 12) )
--lf73 = \x -> Conj [ (Rel "son" [x]), (Rel "have" [x, Const (ents !! 17)]) ]
--lf74 = ( \x -> ( Conj [ (Rel "daughter" [x]), (Rel "have" [x, Const (ents !! 17)]) ] ) )
--lf75 = \x -> Impl (Rel "son" [x]) (Rel "have" [x, Const (ents !! 17)])
--
---- vim: set ts=2 sts=2 sw=2 noet:
