module Translate
(
	drsToLF
) where

import Data.DRS.DataType
import Data.DRS.Variables
import qualified LogicalForm as L

type DRSUnresolved = [DRSRef] -> DRS

drsToLF :: DRSUnresolved -> ([DRSRef] -> L.LF)
drsToLF ud rs = case (ud rs) of
	(LambdaDRS _) -> error "infelicitous FOL formula"
	(Merge _ _) -> error "infelicitous FOL formula"
	(DRS _ []) -> (\rs' -> L.Top ) rs
	(DRS _ (Rel (DRSRel name) rs' : cs)) -> let ts = map (L.Var . drsRefToDRSVar) rs'
		in L.Exists (\t -> L.Conj [ (L.Rel name ts) ,
		(drsConsToLF ( \rs'' -> cs) rs) ] )
	(DRS _ [Neg d]) -> (\rs' -> L.Neg (drsToLF (\rs'' -> d) rs') ) rs

drsConsToLF :: ([DRSRef] -> [DRSCon]) -> ([DRSRef] -> L.LF)
drsConsToLF uc rs = case (uc rs) of
	[] -> L.Top
	[Rel (DRSRel name) rs'] -> L.Rel name (map (L.Var . drsRefToDRSVar) rs')
	[Neg d] -> L.Neg (drsToLF (\rs' -> d) rs)
	[Prop p d] -> L.Conj [ (L.Rel (drsRefToDRSVar p) ts), (drsToLF (\rs' -> d) rs) ] where ts = map (L.Var . drsRefToDRSVar) rs
	(c:cs) -> L.Conj [ (drsConsToLF (\rs'' -> [c]) rs), (drsConsToLF (\rs'' -> cs) rs) ]

-- vim: set ts=2 sts=2 sw=2 noet:
