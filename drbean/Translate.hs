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
	(DRS _ (Rel name rs' : [])) -> (\rs'' -> (L.Rel name rs'') ) rs'
	(DRS _ (Rel name rs' : cs)) -> L.Exists (\rs'' -> L.And (L.Rel name rs') (drsToLF ( \rs'' -> DRS rs'' cs) rs) )
	(DRS _ _) -> (\rs' -> (mkLF rs' (L.Rel (DRSRel "queen") rs') )) [DRSRef "x"]

mkLF :: [DRSRef] -> L.LF -> L.LF
mkLF _ (L.Rel r rs) = L.Rel r rs
