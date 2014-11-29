module LogicalForm (module LogicalForm) where

import Data.DRS.DataType hiding (Or,Imp,Neg,Rel)
import Data.DRS.Variables
import Data.List

data LF = NonProposition
	| ForAll ([DRSRef] -> LF)
	| Exists ([DRSRef] -> LF)
	| And LF LF
	| Or LF LF
	| Imp LF LF
	| Neg LF
	| Rel DRSRel [DRSRef]
	| Top
	| Bottom
--	deriving (Eq)


instance Show LF where
  show = showLForm

showLForm :: LF -> String
showLForm f = '\n' : showFormula f ++ "\n"
  where showFormula :: LF -> String
        -- showFormula (Exists v f1) = opExists ++ v ++ showFormula f1
        -- showFormula (ForAll v f1) = opForAll ++ v ++ showFormula f1
        showFormula (And f1 f2)   = "(" ++ showFormula f1 ++ " "  ++ opAnd ++ " "  ++ showFormula f2 ++ ")"
        showFormula (Or f1 f2)    = "(" ++ showFormula f1 ++ ") " ++ opOr  ++ " (" ++ showFormula f2 ++ ")"
        showFormula (Imp f1 f2)   = "(" ++ showFormula f1 ++ ") " ++ opImp ++ " (" ++ showFormula f2 ++ ")"
        showFormula (Neg f1)      = opNeg ++ showFormula f1
        showFormula (Rel r d)     = (drsRelToString r) ++ "(" ++ intercalate "," (map drsRefToDRSVar d) ++ ")"
        showFormula (Top)         = opTop
        showFormula (Bottom)      = opBottom


relname :: LF -> String
relname (Rel (DRSRel name) _) = name
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
