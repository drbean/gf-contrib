module Translate
(
	drsToLF
	, term2ref
) where

import Data.List
import Data.DRS.DataType
import Data.DRS.Variables
import qualified LogicalForm as L

type DRSUnresolved = [DRSRef] -> DRS

term2ref :: L.Term -> DRSRef
term2ref (L.Var r) = r
term2ref _ = undefined

isRel :: DRSCon -> Bool
isRel (Rel _ _) = True
isRel _ = False

refs :: DRSCon -> [DRSRef]
refs (Rel _ rs) = rs
refs _ = undefined

rel :: DRSCon -> String
rel (Rel (DRSRel r) _) = r
rel _ = undefined

replace :: [L.Term] -> DRSRef -> L.Term
replace ts (DRSRef "r1") = ts !! 0
replace ts (DRSRef "r2") = ts !! 1
replace ts (DRSRef "r3") = ts !! 2
replace ts (DRSRef "r4") = ts !! 3
replace ts (DRSRef p) | isSuffixOf "_prop" p = ts !! 4
replace _ _ = undefined

singleton :: [a] -> Bool
singleton [x]	= True
singleton _	= False

drsToLF :: DRSUnresolved -> ([L.Term] -> L.LF)
drsToLF ud ts
	| (LambdaDRS _) <- ud rs = error "infelicitous FOL formula"
	| (Merge _ _) <- ud rs = error "infelicitous FOL formula"
	| (DRS _ []) <- ud rs = (\t -> L.Top ) ts
	| (DRS _ cs) <- ud rs
		, all isRel cs = L.Conj [ (L.Rel (rel c) [replace ts r | r <- refs c]) | c <- cs]
	| (DRS _ (Rel (DRSRel name) rs' : cs)) <- ud rs
		, (singleton rs') = L.Exists (\t -> L.Conj [ (L.Rel name [t]) ,
				(drsConsToLF ( \rs'' -> cs) (tail rs)) ]
			 )
	| (DRS _ (Rel (DRSRel name) rs' : cs)) <- ud rs
		= L.Conj [ (L.Rel name (map L.Var rs')),
			(drsConsToLF ( \rs'' -> cs) rs') ]
	| (DRS _ [Neg d]) <- ud rs = (\rs' -> L.Neg (drsToLF (\rs'' -> d) rs') ) ts
	where rs = map term2ref ts

drsConsToLF :: ([DRSRef] -> [DRSCon]) -> ([DRSRef] -> L.LF)
drsConsToLF uc rs = case (uc rs) of
	[] -> L.Top
	[Rel (DRSRel name) rs'] -> case rs' of
		[r] -> L.Exists (\t -> L.Rel name [t])
		_ -> L.Rel name (map L.Var rs')
	[Neg d] -> L.Neg (drsToLF (\rs' -> d) ts)
	[Prop p d] -> L.Conj [ (L.Rel (drsRefToDRSVar p) [head ts]), (drsToLF (\rs' -> d) ts) ]
	(c:cs) -> L.Conj [ (drsConsToLF (\rs'' -> [c]) rs), (drsConsToLF (\rs'' -> cs) rs) ]
	where ts = map L.Var rs

-- vim: set ts=2 sts=2 sw=2 noet:
