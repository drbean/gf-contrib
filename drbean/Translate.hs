module Translate
(
	drsToLF
	, term2ref
) where

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

replace :: DRSRef -> L.Term
replace (DRSRef "r1") = L.Var (DRSRef "e1")
replace (DRSRef "r2") = L.Var (DRSRef "e2")
replace (DRSRef "r3") = L.Var (DRSRef "e3")
replace (DRSRef "r4") = L.Var (DRSRef "e4")

drsToLF :: DRSUnresolved -> ([L.Term] -> L.LF)
drsToLF ud ts = case (ud rs) of
	(LambdaDRS _) -> error "infelicitous FOL formula"
	(Merge _ _) -> error "infelicitous FOL formula"
	(DRS _ []) -> (\t -> L.Top ) ts
	(DRS _ cs) -> case (all isRel cs) of
			True -> L.Conj [ (L.Rel (rel c) [replace r | r <- refs c]) | c <- cs]
			_ -> undefined
	(DRS _ (Rel (DRSRel name) rs' : cs)) -> case rs' of
		[r] -> L.Exists (\t -> L.Conj [ (L.Rel name [t]) ,
				(drsConsToLF ( \rs'' -> cs) (tail rs)) ]
			 )
		_ -> L.Conj [ (L.Rel name (map L.Var rs')),
			(drsConsToLF ( \rs'' -> cs) rs') ]
	(DRS _ [Neg d]) -> (\rs' -> L.Neg (drsToLF (\rs'' -> d) rs') ) ts
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
