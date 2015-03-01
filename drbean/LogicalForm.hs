module LogicalForm (module LogicalForm) where

import Data.DRS.DataType hiding (Or,Imp,Neg,Rel)
import Data.DRS.Variables
import Data.List

import Model

data Term = Const Entity | Var String| Struct String [Term]
        deriving (Eq)

data LF = NonProposition
	| Top
	| Bottom
	| Rel String [Term]
	| Neg  LF
	| Imp [LF]
	| Conj [LF]
	| Disj [LF]
	| Forall Term LF
	| Exists Term LF
	| Single ([Term] -> LF)
	| The ([Term] -> LF)
	| Several ([Term] -> LF)
	| Many ([Term] -> LF)
	| Most ([Term] -> LF)
	| WH ([Term] -> LF)
	--      deriving Eq

instance Show Term where
	show (Const name) = show name
	show (Var e)      = e
	show (Struct s []) = s
	show (Struct s ts) = s ++ show ts

instance Show LF where
	show = showLForm 1

showLForm :: Int -> LF -> String
showLForm i f = '\n' : showFormula i f ++ "\n" where
	showFormula :: Int -> LF -> String
	showFormula i (Exists v f)
		| v == Var "p" = opExists ++ "p" ++ " " ++ showFormula i f
		| v == Var "p1" = opExists ++ "p1" ++ " " ++ showFormula i f
		| v == Var "p2" = opExists ++ "p2" ++ " " ++ showFormula i f
		| otherwise = opExists ++ "e" ++ (show i) ++ " " ++ showFormula (i+1) f
	showFormula i (Forall v f) = opForAll ++ "e" ++ (show i) ++ " " ++ showFormula (i+1) f
	showFormula i (Conj [])     = opTop
	showFormula i (Conj lfs)    = "(" ++ intercalate (" " ++ opAnd ++ " ") (map (showFormula i) lfs) ++ ")"
	showFormula i (Disj [f1,f2])    = "(" ++ showFormula i f1 ++ ") " ++ opOr  ++ " (" ++ showFormula i f2 ++ ")"
	showFormula i (Imp [f1, f2])   = "(" ++ showFormula i f1 ++ ") " ++ opImp ++ " (" ++ showFormula i f2 ++ ")"
	showFormula i (Neg f1)      = opNeg ++ showFormula i f1
	showFormula i (Rel r d)     = r ++ "(" ++ intercalate "," (map show d) ++ ")"
	showFormula i (Top)         = opTop
	showFormula i (Bottom)      = opBottom


relname :: LF -> String
relname (Rel name _) = name
-- relname lf = error ( (show lf) ++ " not a relation" )
relname lf = error ( "The formula is " ++ " not a relation" )

-- | Existential quantifier symbol
opExists :: String
opExists = "\x2203"

-- | Universal quantifier symbol
opForAll :: String
opForAll = "\x2200"

-- | Conjunction symbol
opAnd :: String
opAnd    = "\x2227"

-- | Disjunction symbol
opOr :: String
opOr     = "\x2228"

-- | Implication symbol
opImp :: String
opImp    = "\x2192"

-- | Negation symbol
opNeg :: String
opNeg    = "\x00AC"

-- | Top/true constant symbol
opTop:: String
opTop    = "\x22A4"

-- | Bottom/false constant symbol
opBottom :: String
opBottom = "\x22A5"

-- vim: set ts=2 sts=2 sw=2 noet:
