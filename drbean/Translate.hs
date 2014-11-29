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
	(DRS _ (Rel name rs' : cs)) -> L.Exists (\rs'' -> L.And (L.Rel name rs') (drsConsToLF ( \rs'' -> cs) rs) )

drsConsToLF :: ([DRSRef] -> [DRSCon]) -> ([DRSRef] -> L.LF)
drsConsToLF uc rs = case (uc rs) of
	([]) -> L.Top
	([Rel r rs']) -> L.Rel r rs'
	(Prop r d: []) -> L.And (L.Rel (DRSRel (drsRefToDRSVar r)) rs) (drsToLF (\rs' -> d) rs)
	(c:cs) -> L.And (drsConsToLF (\rs'' -> [c]) rs) (drsConsToLF (\rs'' -> cs) rs)
