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
	(DRS _ (Rel r d : [])) -> (\rs' -> (mkLF rs' (L.Rel r rs') )) d
	(DRS _ _) -> (\rs' -> (mkLF rs' (L.Rel (DRSRel "queen") rs') )) [DRSRef "x"]

mkLF :: [DRSRef] -> L.LF -> L.LF
mkLF _ (L.Rel r rs) = L.Rel r rs
