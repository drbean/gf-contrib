module LogicalForm (module LogicalForm) where

import Data.DRS.DataType hiding (Or,Imp,Neg,Rel)
import Data.DRS.Variables
import Data.List

import Model

data Term = Const Entity | Var String | Struct String [Term]
        deriving (Eq)

data LF = NonProposition
	| Top
	| Bottom
	| Rel String [Term]
	| Neg  LF
	| Imp LF LF
	| And LF LF
	| Or LF LF
	| Forall ([Term] -> LF)
	| Exists ([Term] -> LF)
	| Single ([Term] -> LF)
	| The ([Term] -> LF)
	| Several ([Term] -> LF)
	| Many ([Term] -> LF)
	| Most ([Term] -> LF)
	| WH ([Term] -> LF)
	--      deriving Eq

instance Show Term where
  show (Const name) = show name
  show (Var i)      = 'x': show i
  show (Struct s []) = s
  show (Struct s ts) = s ++ show ts

instance Show LF where
  show = showLForm

showLForm :: LF -> String
showLForm f = '\n' : showFormula f ++ "\n"
  where showFormula :: LF -> String
        showFormula (Exists udrs) = opExists ++ "xyzw" ++ showFormula (udrs
					[Var "x", Var "y", Var "z", Var "w"])
        -- showFormula (ForAll v f1) = opForAll ++ v ++ showFormula f1
        showFormula (And f1 f2)   = "(" ++ showFormula f1 ++ " "  ++ opAnd ++ " "  ++ showFormula f2 ++ ")"
        showFormula (Or f1 f2)    = "(" ++ showFormula f1 ++ ") " ++ opOr  ++ " (" ++ showFormula f2 ++ ")"
        showFormula (Imp f1 f2)   = "(" ++ showFormula f1 ++ ") " ++ opImp ++ " (" ++ showFormula f2 ++ ")"
        showFormula (Neg f1)      = opNeg ++ showFormula f1
        showFormula (Rel r d)     = r ++ "(" ++ intercalate "," (map show d) ++ ")"
        showFormula (Top)         = opTop
        showFormula (Bottom)      = opBottom


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
