module Translate
(
  resolveDrsToLF
) where

import Data.DRS.DataType
import Data.DRS.Variables
import qualified LogicalForm as L

type DRSUnresolved = [DRSRef] -> DRS

resolveDrsToLF :: DRSUnresolved -> [DRSRef] -> L.LF
resolveDrsToLF ud rs | (DRS _ cs) <- (ud rs) = drsConsToLF cs

drsToLF :: DRS -> L.LF
drsToLF (LambdaDRS _)  = error "infelicitous LF formula"
drsToLF (Merge _ _)    = error "infelicitous LF formula"
drsToLF (DRS _ cs) = drsConsToLF cs
-- drsToLF (DRS _ cs) (r:rs) = (L.Exists r (drsToLF (DRS rs cs)) ) rs

drsConsToLF :: [DRSCon] -> L.LF
drsConsToLF [] = L.Top
drsConsToLF (Rel r d:[]) = L.Rel r d
drsConsToLF (Neg d1:[]) = L.Neg (drsToLF d1)
drsConsToLF (Imp d1 d2:[]) = quantifyForAll d1 where
	quantifyForAll :: DRS -> L.LF
	quantifyForAll (LambdaDRS _)  = error "infelicitous LF formula"
	quantifyForAll (Merge _ _)    = error "infelicitous LF formula"
	quantifyForAll (DRS [] c)     = L.Imp    (drsConsToLF c) (drsToLF d2)
	-- quantifyForAll (DRS (r:rs) c) = L.ForAll (drsRefToDRSVar r)  (quantifyForAll (DRS rs c))
drsConsToLF (Or d1 d2:[]) = L.Or (drsToLF d1) (drsToLF d2)
-- drsConsToLF (Prop r d1:[]) = (drsToLF d1 (drsRefToDRSVar r))
drsConsToLF (Diamond d1:[]) = error "infelicitous LF formula"
drsConsToLF (Box d1:[]) = error "infelicitous LF formula"
drsConsToLF (c:cs) = L.And (drsConsToLF [c]) (drsConsToLF cs)
