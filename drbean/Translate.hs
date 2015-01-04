module Translate
(
	drsToLF
	, term2ref
	, drsRefs
	, xyzwp
	, var_e
) where

import Data.List
import Data.DRS.DataType
import Data.DRS.Variables
import qualified LogicalForm as L

type DRSUnresolved = [DRSRef] -> DRS

drsRefs = [ DRSRef "r1", DRSRef "r2", DRSRef "r3", DRSRef "r4",
	DRSRef "prop", DRSRef "r1"]

xyzwp = [L.Var "e1", L.Var "e2", L.Var "e3", L.Var "e4", L.Var "p"]
var_e = L.Var "e"

term2ref :: [DRSRef] -> L.Term -> DRSRef
term2ref rs (L.Var "e1") = rs !! 0
term2ref rs (L.Var "e2") = rs !! 1
term2ref rs (L.Var "e3") = rs !! 2
term2ref rs (L.Var "e4") = rs !! 3
term2ref rs (L.Var "p") = rs !! 4
term2ref rs (L.Var "e") = rs !! 5
term2ref rs x = error ("term2ref " ++ (show x) ++ ": undefined")

isRel :: DRSCon -> Bool
isRel (Rel _ _) = True
isRel _ = False

refs :: DRSCon -> [DRSRef]
refs (Rel _ rs) = rs
refs _ = undefined

rel :: DRSCon -> String
rel (Rel (DRSRel r) _) = r
rel _ = undefined

ref2term :: [L.Term] -> DRSRef -> L.Term
ref2term ts (DRSRef "r1") = ts !! 0
ref2term ts (DRSRef "r2") = ts !! 1
ref2term ts (DRSRef "r3") = ts !! 2
ref2term ts (DRSRef "r4") = ts !! 3
ref2term ts (DRSRef p) | isSuffixOf "_prop" p = ts !! 4
ref2term ts _ = undefined

singleton :: [a] -> Bool
singleton [x]	= True
singleton _	= False

drsUnToLF :: DRSUnresolved -> ([L.Term] -> L.LF)
drsUnToLF ud ts = drsToLF d
	where d = ud ( map (term2ref drsRefs) ts )

drsToLF :: DRS -> L.LF
drsToLF (LambdaDRS _) = error "infelicitous FOL formula"
drsToLF (Merge _ _) = error "infelicitous FOL formula"
drsToLF (DRS _ []) = L.Top
drsToLF (DRS rl (Rel (DRSRel name) rs : cs))
	| r : [] <- rs
	, r `elem` rl
	, rl' <- filter (/= r) rl
	, e <- ref2term xyzwp r
	= L.Exists e (L.Conj [ (L.Rel name [e]) ,
			(drsToLF (DRS rl' cs)) ])
drsToLF (DRS rl (Rel (DRSRel name) rs : cs))
	= L.Conj [ (L.Rel name (map (ref2term xyzwp) rs)),
		(drsToLF (DRS rl cs) ) ]
drsToLF (DRS r1 (Or d1 d2 : cs))
	= L.Conj [ L.Disj [ drsToLF d1, drsToLF d2], drsToLF (DRS r1 cs) ]
drsToLF (DRS rl (Neg d: cs))
	= L.Conj [ (L.Neg (drsToLF d)),
		(drsToLF (DRS rl cs)) ]
drsToLF (DRS rl (Prop p d: cs)) = L.Conj [
	(L.Rel (drsRefToDRSVar p) [ref2term xyzwp p]), (drsToLF d)
		, (drsToLF (DRS rl cs)) ]

-- vim: set ts=2 sts=2 sw=2 noet:
