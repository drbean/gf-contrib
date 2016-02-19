{-# LANGUAGE GADTs #-}
module SkelRelAlgebra where

-- Haskell module generated by the BNF converter

import AbsRelAlgebra
import ErrM
type Result = Err String

failure :: Show a => a -> Result
failure x = Bad $ "Undefined case: " ++ show x

transTree :: Tree c -> Result
transTree t = case t of
  RRels rels -> failure t
  RTable i -> failure t
  RSelect cond rel -> failure t
  RProject projections rel -> failure t
  RRename renaming rel -> failure t
  RGroup is aggregations rel -> failure t
  RSort sortexps rel -> failure t
  RDistinct rel -> failure t
  RUnion rel0 rel1 -> failure t
  RCartesian rel0 rel1 -> failure t
  RExcept rel0 rel1 -> failure t
  RNaturalJoin rel0 rel1 -> failure t
  RThetaJoin rel0 cond1 rel2 -> failure t
  RInnerJoin rel0 is1 rel2 -> failure t
  RFullOuterJoin rel0 is1 rel2 -> failure t
  RLeftOuterJoin rel0 is1 rel2 -> failure t
  RRightOuterJoin rel0 is1 rel2 -> failure t
  RIntersect rel0 rel1 -> failure t
  RLet i rel0 rel1 -> failure t
  CEq exp0 exp1 -> failure t
  CNEq exp0 exp1 -> failure t
  CLt exp0 exp1 -> failure t
  CGt exp0 exp1 -> failure t
  CLeq exp0 exp1 -> failure t
  CGeq exp0 exp1 -> failure t
  CLike exp0 exp1 -> failure t
  CNot cond -> failure t
  CAnd cond0 cond1 -> failure t
  COr cond0 cond1 -> failure t
  EIdent i -> failure t
  EQIdent i0 i1 -> failure t
  EString str -> failure t
  EInt n -> failure t
  EFloat d -> failure t
  EAggr function distinct i -> failure t
  EMul exp0 exp1 -> failure t
  EDiv exp0 exp1 -> failure t
  ERem exp0 exp1 -> failure t
  EAdd exp0 exp1 -> failure t
  ESub exp0 exp1 -> failure t
  PExp exp -> failure t
  PRename exp i -> failure t
  RRelation i -> failure t
  RAttributes i is -> failure t
  AApp function distinct i -> failure t
  ARename function distinct i exp -> failure t
  FAvg  -> failure t
  FSum  -> failure t
  FMax  -> failure t
  FMin  -> failure t
  FCount  -> failure t
  DNone  -> failure t
  DDistinct  -> failure t
  SEAsc exp -> failure t
  SEDesc exp -> failure t
  Ident str -> failure t

transRels :: Rels -> Result
transRels t = case t of
  RRels rels -> failure t

transRel :: Rel -> Result
transRel t = case t of
  RTable i -> failure t
  RSelect cond rel -> failure t
  RProject projections rel -> failure t
  RRename renaming rel -> failure t
  RGroup is aggregations rel -> failure t
  RSort sortexps rel -> failure t
  RDistinct rel -> failure t
  RUnion rel0 rel1 -> failure t
  RCartesian rel0 rel1 -> failure t
  RExcept rel0 rel1 -> failure t
  RNaturalJoin rel0 rel1 -> failure t
  RThetaJoin rel0 cond1 rel2 -> failure t
  RInnerJoin rel0 is1 rel2 -> failure t
  RFullOuterJoin rel0 is1 rel2 -> failure t
  RLeftOuterJoin rel0 is1 rel2 -> failure t
  RRightOuterJoin rel0 is1 rel2 -> failure t
  RIntersect rel0 rel1 -> failure t
  RLet i rel0 rel1 -> failure t

transCond :: Cond -> Result
transCond t = case t of
  CEq exp0 exp1 -> failure t
  CNEq exp0 exp1 -> failure t
  CLt exp0 exp1 -> failure t
  CGt exp0 exp1 -> failure t
  CLeq exp0 exp1 -> failure t
  CGeq exp0 exp1 -> failure t
  CLike exp0 exp1 -> failure t
  CNot cond -> failure t
  CAnd cond0 cond1 -> failure t
  COr cond0 cond1 -> failure t

transExp :: Exp -> Result
transExp t = case t of
  EIdent i -> failure t
  EQIdent i0 i1 -> failure t
  EString str -> failure t
  EInt n -> failure t
  EFloat d -> failure t
  EAggr function distinct i -> failure t
  EMul exp0 exp1 -> failure t
  EDiv exp0 exp1 -> failure t
  ERem exp0 exp1 -> failure t
  EAdd exp0 exp1 -> failure t
  ESub exp0 exp1 -> failure t

transProjection :: Projection -> Result
transProjection t = case t of
  PExp exp -> failure t
  PRename exp i -> failure t

transRenaming :: Renaming -> Result
transRenaming t = case t of
  RRelation i -> failure t
  RAttributes i is -> failure t

transAggregation :: Aggregation -> Result
transAggregation t = case t of
  AApp function distinct i -> failure t
  ARename function distinct i exp -> failure t

transFunction :: Function -> Result
transFunction t = case t of
  FAvg  -> failure t
  FSum  -> failure t
  FMax  -> failure t
  FMin  -> failure t
  FCount  -> failure t

transDistinct :: Distinct -> Result
transDistinct t = case t of
  DNone  -> failure t
  DDistinct  -> failure t

transSortExp :: SortExp -> Result
transSortExp t = case t of
  SEAsc exp -> failure t
  SEDesc exp -> failure t

transIdent :: Ident -> Result
transIdent t = case t of
  Ident str -> failure t

