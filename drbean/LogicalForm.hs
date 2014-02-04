module LogicalForm where

import Model
import Interpretation
import qualified Story_Interpretation as Story
import qualified Topic_Interpretation as Topic
import Parsing
import Cats
import qualified Story_Cats as Story
import qualified Topic_Cats as Topic

import Data.Maybe
import Data.List
import Data.Tuple

lexicon :: String -> [Cat]

lexicon lexeme = maybe unknownWord id $
	find (\x -> phon (head x) == lexeme ) $
	Story.names ++ Story.nouns ++ Story.verbs ++ Story.aux ++ Story.adjs ++
	    Story.advs ++
	Topic.nouns ++ Topic.intransitives ++ Topic.transitives ++
	class_names ++ interrogatives ++
	cops ++ aux ++
	transitives ++ ditransitives ++ -- intransitives ++
	possessives ++ preps ++ determiners ++ conjuncts
	++ prons ++ reflexives
	where unknownWord = [Cat "" "" [] []]

parses :: String -> [ParseTree Cat Cat]
parses str = let ws = lexer str 
             in  [ s | catlist   <- collectCats lexicon ws, 
                       (s,[],[]) <- prsWH [] catlist  
                                 ++ prsYN  [] catlist   
                                 ++ prsTXT  [] catlist   
                                 ++ prsTAG  [] catlist
				 ]

type Interp a	= String -> [a] -> Bool

inttuples = objects ++ relations ++ Story.objects ++ Story.relations
			    ++ Topic.objects ++ Topic.relations
infltuples = inflections ++ Topic.inflections ++ Story.inflections 

int :: Interp Entity

int word = int' word inttuples infltuples where 
	int' w [] []	= error $ "'" ++ w ++ "'" ++ " has no interpretation"
	int' w [] ((infl,word):infls) | w == infl	=  int' word inttuples [] 
	int' w [] (i:is)	= int' w [] is
	int' w ((word,interpretation):is) infls | w == word	= interpretation
	int' w (i:is) infls	= int' w is infls

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

transTXT :: Maybe (ParseTree Cat Cat) -> LF
transTXT (Just Ep) = NonProposition
transTXT s@(Just (Branch (Cat _ "S" _ _) _) ) = transS s
transTXT (Just (Branch (Cat _ "YN" _ _) [Leaf (Cat _ "AUX" _ _),s] )) =
	transS (Just s)
transTXT (Just (Branch (Cat _ "YN" _ _) [Leaf (Cat _ "COP" _ _),s] )) =
	transS (Just s)
transTXT (Just (Branch (Cat _ "TXT" _ _) [s,conj,
	s2@(Branch (Cat _ "S" _ _) _)])) =
	    Conj [ transS (Just s), transS (Just s2) ]
transTXT (Just (Branch (Cat _ "TXT" _ _) [s,conj,
	s2@(Branch (Cat _ "TXT" _ _) _)])) =
	    Conj [ transS (Just s), transTXT (Just s2) ]

transTAG :: Maybe (ParseTree Cat Cat) -> LF
transTAG (Just t) | isNg t = Neg (transS (Just (subtree t [0])))
transTAG (Just t) = transS (Just (subtree t [0]))

transS :: Maybe (ParseTree Cat Cat) -> LF
transS (Just Ep) = NonProposition
transS (Just (Branch (Cat _ "S" _ _) [np,vp])) =
  (transNP np) (transVP vp)

transS (Just (Branch (Cat _ "AT" _ _) [np,att])) =
  (transNP np) (transAT att)

transS (Just (Branch (Cat _ "YN" _ _) 
       [Leaf (Cat "could"    "AUX" _ []),s])) = transS (Just s)
transS (Just (Branch (Cat _ "YN" _ _) 
       [Leaf (Cat "couldn't" "AUX" _ []),s])) = transS (Just s)

transS (Just (Branch (Cat _ "YN" _ _) 
       [Leaf (Cat _ "AUX" _ []),s])) = transS (Just s)

transS (Just (Branch (Cat _ "YN" _ _) 
       [Leaf (Cat _ "COP" _ _),s])) = transS (Just s)

transS _ = NonProposition

transAT :: ParseTree Cat Cat -> Term -> LF
transAT (Branch (Cat _ "AV" _ _)
    [Leaf (Cat att "V" _ [_]), Leaf (Cat "to" "TO" [ToInf] []),
       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj])]) =
	   case(catLabel (t2c obj)) of
	"NP" ->
	    (\subj -> transNP obj
		( \theme -> Rel (att++"_to_"++act) [subj,subj,theme] ))
	"PP" ->
	    (\subj -> transPP obj
		( \theme -> Rel (att++"_to_"++act) [subj,subj,theme] ))

transAT (Branch (Cat _ "AV" _ _)
    [Leaf (Cat att "V" _ [_]), Leaf (Cat "to" "TO" [ToInf] []),
       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj1,obj2])]) =
    case (catLabel ( t2c obj1 ), catLabel (t2c obj2)) of
	("NP","NP") ->
	    (\subj -> transNP obj1
		(\recipient -> transNP obj2
		    ( \theme -> Rel (att++"_to_"++act) [subj,subj,theme,recipient] )))
	("NP","PP") ->
	    (\subj -> transNP obj1
		(\theme -> transPP obj2
		    ( \recipient -> Rel (att++"_to_"++act) [subj,subj,theme,recipient] )))

transAT (Branch (Cat _ "AV" _ _)
    [Leaf (Cat att "V" _ [_]), obj0, Leaf (Cat "to" "TO" [ToInf] []),
       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj])]) =
	   case(catLabel (t2c obj)) of
	"NP" ->
	    (\subj -> transNP obj0
		(\agent -> transNP obj
		    ( \theme -> Rel (att++"_to_"++act) [subj,agent,theme] )))
	"PP" ->
	    (\subj -> transNP obj0
		(\agent -> transPP obj
		    ( \theme -> Rel (att++"_to_"++act) [subj,agent,theme] )))

transAT (Branch (Cat _ "AV" _ _)
    [Leaf (Cat att "V" _ [_]), obj0, Leaf (Cat "to" "TO" [ToInf] []),
       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj1,obj2])]) =
    case (catLabel ( t2c obj1 ), catLabel (t2c obj2)) of
	("NP","NP") ->
	    (\subj -> transNP obj0
		(\agent -> transNP obj1
		    (\recipient -> transNP obj2
			( \theme -> Rel (att++"_to_"++act) [subj,agent,theme,recipient] ))))
	("NP","PP") ->
	    (\subj -> transNP obj0
		(\agent -> transNP obj1
		    (\theme -> transPP obj2
			( \recipient -> Rel (att++"_to_"++act) [subj,agent,theme,recipient] ))))
transAT _ = \x -> NonProposition

transNPorPP :: ParseTree Cat Cat -> 
                (Term -> LF) -> LF
transNPorPP obj = case ( catLabel (t2c obj) ) of
    "NP" -> transNP obj
    "PP" -> transPP obj

transNP :: ParseTree Cat Cat -> 
                (Term -> LF) -> LF
transNP (Leaf (Cat "#"  "NP" _ _)) = \ p -> p (Var 0)
transNP (Leaf (Cat name "NP" _ _))
    | name `elem` interrolist = \ p -> NonProposition
    | name `elem` namelist = \ p -> p (Const (ided name))
    | otherwise = \p -> Exists ( \v -> Conj [ p v, Rel name [v] ] )
transNP (Branch (Cat _ "NP" _ _) [det,cn]) = (transDET det) (transCN cn) 
transNP (Branch (Cat _ "NP" _ _) [np,Leaf (Cat "'s" "APOS" _ _),cn]) =
    \p -> Exists (\thing -> Conj [ p thing, transCN cn thing, transNP np (\owner -> (Rel "had" [owner,thing]))])
transNP (Branch (Cat _ "NP" _ _) [det,Leaf (Cat a "ADJ" _ _),cn]) = 
    (transDET det) (\n -> Conj [transCN cn n, Rel a [n]])
transNP _ = \x -> NonProposition

transDET :: ParseTree Cat Cat -> (Term -> LF)
                              -> (Term -> LF)
                              -> LF
transDET (Branch (Cat _ "DET" _ _) [np,Leaf (Cat "'s" "APOS" _ _) ]) =
    \ p q -> Exists (\v -> Conj [ Single p, p v, q v, transNP np
	(\mod -> Rel "had" [mod, v] )])
transDET (Leaf (Cat "the" "DET" _ _)) = 
  \ p q -> Exists (\v -> Conj [Single p, p v, q v] )
transDET (Leaf (Cat "every" "DET" _ _)) = 
  \ p q -> Forall (\v -> Impl (p v) (q v) )
transDET (Leaf (Cat "all" "DET" _ _)) = 
  \ p q -> Forall (\v -> Impl (p v) (q v) )
transDET (Leaf (Cat "some" "DET" _ _)) = 
  \ p q -> Exists (\v -> Conj [p v, q v] )
transDET (Leaf (Cat "a" "DET" _ _)) = 
  \ p q -> Exists (\v -> Conj [p v, q v] )
transDET (Leaf (Cat "zero" "DET" _ _)) = 
  \ p q -> Exists (\v -> Conj [p v, q v] )
transDET (Leaf (Cat "several" "DET" _ _)) = 
  \ p q -> Several (\v -> Conj [p v, q v] )
transDET (Leaf (Cat "no" "DET" _ _)) = 
  \ p q -> Neg (Exists (\v -> Conj [p v, q v]))
transDET (Leaf (Cat "most" "DET" _ _)) = 
  \ p q -> Most (\v -> Impl (p v) (q v) )
transDET (Leaf (Cat "many" "DET" _ _)) = 
  \ p q -> Many (\v -> Conj [p v, q v] )
transDET (Leaf (Cat "few" "DET" _ _)) = 
  \ p q -> Neg $ Many (\v -> Impl (p v) (q v) )
transDET (Leaf (Cat "which" "DET" _ _)) = 
  \ p q -> WH (\v1 -> Conj
  		[Forall (\v2 -> Equi (p v2) (Eq v1 v2)),
		q v1])

transCN :: ParseTree Cat Cat -> Term -> LF
transCN (Leaf   (Cat name "CN" _ _))          = \ x -> Rel name [x]
transCN (Branch (Cat _    "RCN" _ _) [cn,ofpos,np]) =
    \owner -> Conj [(transCN cn owner), (transNP np (\thing -> Rel "had" [owner, thing]))]
transCN (Branch (Cat _    "RCN" _ _) [cn,rel]) = case (rel) of
    (Branch (Cat _ "MOD" _ _) [Leaf (Cat _ "REL"  _ _), Branch (Cat _ "S" _ _) [np,vp]]) ->
	case (np,vp) of
	    (Leaf (Cat "#" "NP" _ _), _) -> \x -> Conj [transCN cn x, transVP vp x]
	    (_, (Branch (Cat _ "VP" _ _) vp)) -> case (vp) of
		[Leaf (Cat name "V" _ _),Leaf (Cat "#" "NP" _ _)]->
		    \x -> Conj [transCN cn x, transNP np (\agent -> Rel name [agent,x])]
		[Leaf (Cat name "V" _ _),obj1,obj2]-> case (obj1,obj2) of
		    (Leaf (Cat "#" "NP" _ _),Branch (Cat _ "PP" _ _) _) -> \x -> Conj
			[transCN cn x, transNP np ( \agent ->
			    transPP obj2 (\recipient -> Rel name [agent, x, recipient] ) ) ]
		    (Leaf (Cat "#" "NP" _ _),Branch (Cat _ "NP" _ _) _) -> \x -> Conj
			[transCN cn x, transNP np ( \agent ->
			    transNP obj2 (\patient -> Rel name [agent, patient, x] ) ) ]
		    (Leaf (Cat _ "NP" _ _),Leaf (Cat "#" "NP" _ _)) -> \x -> Conj
			[transCN cn x, transNP np ( \agent ->
			    transNP obj1 (\recipient -> Rel name [agent, x, recipient] ) ) ]
		    (_,Leaf (Cat "#" "NP" _ _)) -> \x -> Conj
			[transCN cn x, transNP np ( \agent ->
			    transNP obj2 (\patient -> Rel name [agent, patient, x] ) ) ]
	    _ -> \x -> Conj [transCN cn x, transVP vp x]
    (Branch (Cat _ "MOD" _ _) [Branch (Cat _ "S" _ _) [np,vp]]) ->
	case (vp) of
	    (Branch (Cat _ "VP" _ _) [Leaf (Cat name "V" _ _),Leaf (Cat "#" "NP" _ _)])
		-> \x -> Conj [transCN cn x, transNP np (\agent -> Rel name [agent,x])]
    (Branch (Cat _ "MOD" _ _) [Branch (Cat _ "PP" _ _)
	[Leaf (Cat "with" "PREP" [With] _),np]]) -> 
	\x -> Conj [transCN cn x, transNP np (\patient -> Rel "had" [x, patient])]
    (Branch (Cat _ "MOD" _ _) [Branch (Cat _ "PP" _ _)
	[Leaf (Cat "in" "PREP" [In] _),np]]) -> 
	\x -> Conj [transCN cn x, transNP np (\field -> Rel "kind" [x, field])]
    _ ->	\ x -> Conj [transCN cn x, transREL rel x]

transREL :: ParseTree Cat Cat -> Term -> LF
transREL (Branch (Cat _ "MOD" _ _ ) [rel,s]) = 
  \ x -> (transS (Just s))
transREL (Branch (Cat _ "MOD" _ _ ) [s])     = 
  \ x -> (transS (Just s))

transPP :: ParseTree Cat Cat -> (Term -> LF) -> LF
transPP (Leaf   (Cat "#" "PP" _ _)) = \ p -> p (Var 0)
transPP (Branch (Cat _   "PP" _ _) [prep,np]) = transNP np

transVP :: ParseTree Cat Cat -> Term -> LF
--transVP (Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ _), obj] ) =
--	\x -> Exists( \agent -> transPP obj (\cond -> Rel part [agent, x, cond] ) )
transVP (Branch vp@(Cat _ "VP" _ _) 
                [Leaf (Cat "wasn't" label fs subcats),pred]) = 
        \x -> Neg ((transVP (Branch vp [Leaf (Cat "was" label fs subcats),pred])) x)
transVP (Branch vp@(Cat _ "VP" _ _) 
                [Leaf (Cat "weren't" label fs subcats),pred]) = 
        \x -> Neg ((transVP (Branch vp [Leaf (Cat "were" label fs subcats),pred])) x)
transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ _)] ]) =
	\x -> Exists( \agent -> Rel part [agent, x] )
transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ _), obj] ]) =
	\x -> Exists( \agent -> transPP obj (\cond -> Rel part [agent, x, cond] ) )
transVP (Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ [_,_]), obj1, obj2] ) =
	\x -> Exists( \agent -> transPP obj1 
	    (\cond1 -> transPP obj2 
		(\cond2 -> Rel part [agent, x, cond1, cond2] ) ) )
transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ [_,_]), obj1, obj2] ])
	| ( elem By (fs (t2c obj1)) ) =
	    \x -> transPP obj1 
		    (\agent -> transPP obj2 
			(\cond -> Rel part [agent, x, cond] ) )
transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ [_,_]), obj1, obj2] ])
	| ( elem By (fs (t2c obj2)) ) =
	    \x -> transPP obj1
		(\cond -> transPP obj2
		    (\agent -> Rel part [agent, x, cond] ) )
transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "AUX" _ _),
    Branch (Cat "_" "VP" [Part] _) [Leaf (Cat part "V" _ [_,_]), obj1, obj2] ])
	=
	    \x -> Exists( \agent -> transPP obj1
		(\cond1 -> transPP obj2
		    (\cond2 -> Rel part [agent, x, cond1, cond2] ) ) )

transVP (Branch (Cat _ "VP" _ _) 
                [Leaf (Cat "could" "AUX" _ []),vp]) = 
        transVP vp 
transVP (Branch (Cat _ "VP" _ _) 
                [Leaf (Cat "couldn't" "AUX" _ []),vp]) = 
        \x -> Neg ((transVP vp) x)
transVP (Branch (Cat _ "VP" _ _) 
                [Leaf (Cat "did" "AUX" _ []),vp]) = 
        transVP vp 
transVP (Branch (Cat _ "VP" _ _) 
                [Leaf (Cat "didn't" "AUX" _ []),vp]) = 
        \x -> Neg ((transVP vp) x)
transVP (Branch (Cat _ "VP" _ _) 
                [Leaf (Cat "#" "AUX" _ []),vp]) = 
        transVP vp 

transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat name "V" _ [])]) = 
        \ t -> ( Rel name [t] )
transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "COP" _ _),
    Branch (Cat "_" "COMP" [] []) [comp]]) = case (catLabel (t2c comp)) of
	"ADJ" -> \subj -> (Rel (phon (t2c comp)) [subj] )
	"NP" -> \subj -> (transNP comp (\pred -> Eq pred subj ))
	"PP" -> \subj -> transPP comp (\place -> Rel "resident" [subj,place])
transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat _ "COP" _ _),
    Branch (Cat "_" "COMP" [] []) [comp1,place]]) = case (catLabel (t2c comp1)) of
	"NP" ->
	    case (catLabel (t2c place)) of
		"PP" -> \subj -> Conj [(transNP comp1 (\pred -> Eq pred subj )),
		    (transPP place (\place -> Rel "resident" [subj,place]) )]
	--Leaf (Cat name "NP" _ _ ) -> \t -> (Rel name [t] )
	--Branch (Cat _ "NP" _ _) [det,cn] -> case (cn) of
	--    Leaf (Cat name "CN" _ _) -> \t -> Rel name [t]
	--Branch (Cat _ "NP" _ _) [np,Leaf (Cat _ "APOS" _ _),cn] -> case (cn) of
	--    Leaf (Cat name "CN" _ _) -> \x -> transNP np
	--	(\owner -> Conj [Rel name [x], Rel "had" [owner,x] ] )
	--Branch (Cat _ "NP" _ _) [det,Leaf (Cat qual "ADJ" _ _),cn] -> \subj
	--    -> Conj [ transCN cn subj, Rel qual [subj] ]
transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat name "V" _ [_]),obj1]) = 
	case (catLabel ( t2c obj1 )) of
		"PP" -> \subj -> transPP obj1 (\adv -> Rel name [subj,adv])
		"NP" -> \subj -> transNP obj1 (\ obj -> Rel name [subj,obj])

transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat name "V" _ [_,_]),obj1,obj2]) = 
    case (catLabel ( t2c obj1 )) of
	"NP" ->
	    case (catLabel ( t2c obj2 )) of
		"PP" ->
		    \ agent   -> transNP obj1 
		    (\ theme   -> transPP obj2
		     (\ recipient -> Rel name [agent,theme,recipient]))
		"NP" ->
		    \ agent   -> transNP obj1
		    (\ recipient   -> transNP obj2
		     (\ theme -> Rel name [agent,theme,recipient]))
	"PP" -> \agent -> transPP obj1 (\theme -> transPP obj2 (\instrument
		-> Rel name [agent,theme,instrument]))
	_ -> undefined
transVP (Branch (Cat _ "VP" _ _) [Leaf (Cat name "V" _ [_,_,_]),obj1,obj2,obj3]) = 
    \ agent   -> transNPorPP obj1 
    (\ location   -> transNPorPP obj2
    (\ theme   -> transNPorPP obj3
     (\ recipient -> Rel name [agent,location,theme,recipient])))

transVP (Branch (Cat _ "AT" _ _)
    [Leaf (Cat att "V" _ _), Leaf (Cat "to" "TO" [ToInf] []),
       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _)])]) =
	    (\subj -> Rel (att++"_to_"++act) [subj,subj] )
transVP (Branch (Cat _ "AT" _ _)
    [Leaf (Cat att "V" _ _), Leaf (Cat "to" "TO" [ToInf] []),
       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj])]) =
	   case(catLabel (t2c obj)) of
	"NP" ->
	    (\subj -> transNP obj
		( \theme -> Rel (att++"_to_"++act) [subj,subj,theme] ))
	"PP" ->
	    (\subj -> transPP obj
		( \theme -> Rel (att++"_to_"++act) [subj,subj,theme] ))
transVP (Branch (Cat _ "AT" _ _)
    [Leaf (Cat att "V" _ [_]), Leaf (Cat "to" "TO" [ToInf] []),
       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj1,obj2])]) =
    case (catLabel ( t2c obj1 ), catLabel (t2c obj2)) of
	("NP","NP") ->
	    (\subj -> transNP obj1
		(\recipient -> transNP obj2
		    ( \theme -> Rel (att++"_to_"++act) [subj,subj,theme,recipient] )))
	("NP","PP") ->
	    (\subj -> transNP obj1
		(\theme -> transPP obj2
		    ( \recipient -> Rel (att++"_to_"++act) [subj,subj,theme,recipient] )))
transVP (Branch (Cat _ "AT" _ _)
    [Leaf (Cat att "V" _ [_]), obj0, Leaf (Cat "to" "TO" [ToInf] []),
       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj])]) =
	   case(catLabel (t2c obj)) of
	"NP" ->
	    (\subj -> transNP obj0
		(\agent -> transNP obj
		    ( \theme -> Rel (att++"_to_"++act) [subj,agent,theme] )))
	"PP" ->
	    (\subj -> transNP obj0
		(\agent -> transPP obj
		    ( \theme -> Rel (att++"_to_"++act) [subj,agent,theme] )))
transVP (Branch (Cat _ "AT" _ _)
    [Leaf (Cat att "V" _ [_]), obj0, Leaf (Cat "to" "TO" [ToInf] []),
       (Branch (Cat _ "VP" _ _) [Leaf (Cat act "V" _ _),obj1,obj2])]) =
    case (catLabel ( t2c obj1 ), catLabel (t2c obj2)) of
	("NP","NP") ->
	    (\subj -> transNP obj0
		(\agent -> transNP obj1
		    (\recipient -> transNP obj2
			( \theme -> Rel (att++"_to_"++act) [subj,agent,theme,recipient] ))))
	("NP","PP") ->
	    (\subj -> transNP obj0
		(\agent -> transNP obj1
		    (\theme -> transPP obj2
			( \recipient -> Rel (att++"_to_"++act) [subj,agent,theme,recipient] ))))
transVP _ = \x -> NonProposition

transWH :: Maybe (ParseTree Cat Cat) -> LF
transWH (Just (Branch (Cat _ "WH" _ _ ) [wh,Branch (Cat _ "S" _ _)
	[Leaf (Cat "#" "NP" _ _),vp]])) =
	WH (\x -> Conj [ transW wh x, transVP vp x ])

transWH (Just (Branch (Cat _ "WH" _ _ )
	[wh,(Branch (Cat _ "YN" _ _) [_,(Branch
		(Cat _ "S" _ _) [np,(Branch
			(Cat _ "VP" _ _) [Leaf (Cat "#" "COP" _ _),(Branch
				(Cat _ "COMP" _ _) [Leaf (Cat "#" "NP" _ _)])])])])])) =
	WH (\x -> transNP np (\obj -> Eq obj x ) )

transWH (Just (Branch (Cat _ "WH" _ _ )
	[wh,(Branch (Cat _ "YN" _ _) [_,(Branch
		(Cat _ "S" _ _) [np,(Branch
			(Cat _ "VP" _ _) [_,vp@(Branch
				(Cat _ "VP" _ _) [Leaf (Cat two_ple "V" _ _),obj])])])])])) =
	case(catLabel (t2c obj)) of
	    "NP" -> WH (\x -> Conj [transW wh x,
				transNP np (\agent ->
					Rel two_ple [agent,x])])
	    "PP" -> case (fs (t2c vp)) of 
			[Part] -> WH (\x -> Exists (\agent -> Conj [transW wh x, transNP np (\patient -> Rel two_ple [agent, patient, x] ) ] ) )
			_ -> WH (\x -> Conj [transW wh x,
				transNP np (\agent ->
					Rel two_ple [agent,x])])

transWH (Just (Branch (Cat _ "WH" _ _ )
	[wh,(Branch (Cat _ "YN" _ _) [_,(Branch
		(Cat _ "S" _ _) [np,(Branch
			(Cat _ "VP" _ _) [_,vp@(Branch
				(Cat _ "VP" _ _) [Leaf (Cat three_ple "V" _ _),obj1,obj2]
						)])])])])) =
	case (obj1,obj2) of 
		(_,Branch (Cat _ "PP" _ _) [Leaf (Cat _ "PREP" _ _),
						Leaf (Cat "#" "NP" _ _)]) ->
			WH (\x -> Conj [transW wh x,
				transNP np (\agent -> transNP obj1
					( \patient -> Rel three_ple [agent,patient,x]))])
		(_,Leaf (Cat "#" "NP" _ _)) ->
			WH (\x -> Conj [transW wh x,
				transNP np (\agent -> transNP obj1
					( \recipient -> Rel three_ple [agent,x,recipient]))])
transWH _ = NonProposition

transW :: ParseTree Cat Cat -> (Term -> LF)
transW (Branch (Cat _ "NP" fs _) [det,cn]) = 
                            \e -> transCN cn e
transW (Leaf (Cat _ "NP" fs _))
      | Masc      `elem` fs = \e -> Rel "man"    [e]
      | Fem       `elem` fs = \e -> Rel "woman"  [e]
      | MascOrFem `elem` fs = \e -> Rel "person" [e]
      | otherwise           = \e -> Rel "thing"  [e]

transW (Branch (Cat _ "PP" fs _) [prep,np])
      | Masc      `elem` fs = \e -> Rel "man"    [e]
      | Fem       `elem` fs = \e -> Rel "woman"  [e]
      | MascOrFem `elem` fs = \e -> Rel "person" [e]
      | otherwise           = \e -> Rel "thing"  [e]


process :: String -> [LF]
process string = map (\x -> transS $ Just x) (parses string)

-- processW :: String -> [ LF ]
-- processW string = map transWH (parses string)

pick ps x = [ ps !! x ]


type FInterp = String -> [Entity] -> Entity

fint :: FInterp
fint name [] =	maybe (entities!!26) id $ lookup name characters

ents = entities
-- realents = filter ( not . flip elem [Unspec,Someone,Something] ) ents
realents = ents

ided :: String -> Entity
ided name = maybe undefined id $ lookup name characters
named entity = maybe "NoName" id $ lookup entity $ map swap characters

type TVal = Term -> Entity

lift :: FInterp -> TVal
lift fint (Const a)   = a
lift fint (Struct str ts) =
           fint str (map (lift fint) ts)
lift fint _     = R

term2ent :: Term -> Entity
term2ent (Const a) = a
term2ent _ = R

data Answer = Boolean Bool | Yes | No | NoAnswer
	deriving (Eq)
instance Show Answer where
	show (Boolean bool)	= show bool
	show Yes	= "Yes"
	show No	= "No"
	show NoAnswer	= "NoAnswer"
eval :: LF ->  Answer

eval NonProposition = NoAnswer
eval lf = Boolean $ evl lf


evl (Rel r as)	= int r $ reverse (map term2ent as)
evl (Eq a b)	= a == b
evl (Neg lf)	= not $ evl lf
evl (Impl f1 f2)	= not ( evl f1 && ( not $ evl f2 ) )
evl (Equi f1 f2)	= evl f1 == evl f2
evl (Conj lfs)	= and ( map ( evl ) lfs )
evl (Disj lfs)	= or ( map ( evl ) lfs )
evl (Forall scope)	= and $ testents scope
evl (Exists scope)	= or $ testents scope
evl (Single scope)	= singleton ( mapMaybe bool2Maybe $ testents scope )
evl (Several scope)	= smallN ( mapMaybe bool2Maybe $ testents scope )
evl (Many scope)	= bigN ( mapMaybe bool2Maybe $ testents scope )
evl (Most scope)	= length ( mapMaybe bool2Maybe $ testents scope ) >
			length ( mapMaybe bool2Maybe $ testents scope )
evl _ = False

bool2Maybe :: Bool -> Maybe Bool
bool2Maybe = \x -> case x of False -> Nothing; True -> Just True 
testents :: (Term -> LF) -> [Bool]
testents scope = map ( \e -> evl (scope (Const e)) ) realents 

ent2Maybe :: (Term -> LF) -> Entity -> Maybe Entity
ent2Maybe scope = \e -> case evl (scope (Const e)) of
	False -> Nothing; True -> Just e
evalW :: LF -> [Entity]
evalW (WH scope)	= mapMaybe (ent2Maybe scope) realents
evalW NonProposition	= []

ttest :: (Term -> LF) -> Term -> Bool
ttest scope (Const a) = evl (scope (Const a))
ttest scope _ = evl (scope (Const R))

revttest scope = \x -> not $ evl (scope (Const x))

singleton :: [a] -> Bool
singleton [x]	= True
singleton _	= False

smallN :: [a] -> Bool
smallN [_,_]	= True
smallN [_,_,_]	= True
smallN _	= False

bigN :: [a] -> Bool
bigN [] = False
bigN [_] = False
bigN xs = not . smallN $ xs

handler core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( Just x) ) (parses string)) tests )

evals = handler (eval . transS)

forms tests = putStr $ unlines $ map (\(x,y)->x++show y) $ zip (map (++"\t") tests ) ( map process tests )

parentN = length ( mapMaybe ( \y -> bool2Maybe( evl ((\x->Rel "parent" [Const x] ) y)) ) ents) -- 2

lf0 = Rel "worked" [ Const(ents!!17) ]
lf00 = (Conj [(Rel "person" [Var 0]), (Rel "worked" [Var 0]) ] ) 
-- lf000 = (Exists (Conj [(Rel "person" [Var 0]), (Rel "worked" [Var 0]) ] )) (Const(ents)!!17)

lf1 = (Equi  (Rel "married" [ Const(ents!!9), Const(ents!!1) ]) (Neg (Rel "married" [ Const(ents!!8), Const(ents!!17)]) ) )

lf2 = (Conj [ (Rel "married" [ Const (ents !! 9), Const       (ents !! 1)]), (Rel "married" [ Const (ents !! 8), Const (ents !!   17)]) ] )

lf3 = Rel "married" [ Const (ents !! 8), Const (ents !! 17)]
lf4 = (Impl  (Rel "married" [ Const (ents !! 9), Const        (ents !! 1)]) (Rel "married" [ Const (ents !! 8), Const (ents !!    17)])  )
lf5 = (Conj [ (Rel "married" [ Const (ents !! 9), Const       (ents !! 1)]), (Rel "married" [ Const (ents !! 8), Const (ents !!   17)]) ] )
lf6 = (Disj [ (Rel "married" [ Const (ents !! 9), Const       (ents !! 1)]), (Rel "married" [ Const (ents !! 8), Const (ents !!   17)]) ] )

lf70 = ( \x -> ( Conj [ (Rel "son" [x]), (Rel "have" [Const (ents !! 8) ,x]) ] ) ) (Const (ents !! 12) )
lf71 = ( \x -> ( Conj [ (Rel "son" [x]), (Rel "have" [x, Const (ents !! 17)]) ] ) ) (Const (ents !! 12) )
lf72 = ( \x -> ( Conj [ (Rel "son" [x]), (Rel "have" [x, Const (ents !! 17)]) ] ) ) (Const (ents !! 12) )
lf73 = \x -> Conj [ (Rel "son" [x]), (Rel "have" [x, Const (ents !! 17)]) ]
lf74 = ( \x -> ( Conj [ (Rel "daughter" [x]), (Rel "have" [x, Const (ents !! 17)]) ] ) )
lf75 = \x -> Impl (Rel "son" [x]) (Rel "have" [x, Const (ents !! 17)])

-- vim: set ts=8 sts=4 sw=4 noet:
