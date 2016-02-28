{-# LANGUAGE GADTs, KindSignatures, DataKinds #-}
module AbsTTR (Tree(..), Text, Jment, Exp, Field, Lambda, Id, johnMajorEq, module ComposOp) where

import ComposOp

import Data.Monoid (mappend)


-- Haskell module generated by the BNF converter

data Tag = Text_ | Jment_ | Exp_ | Field_ | Lambda_ | Id_
type Text = Tree Text_
type Jment = Tree Jment_
type Exp = Tree Exp_
type Field = Tree Field_
type Lambda = Tree Lambda_
type Id = Tree Id_

data Tree :: Tag -> * where
    TJments :: [Jment] -> Tree Text_
    JIn :: Exp -> Exp -> Tree Jment_
    JEq :: Exp -> Exp -> Tree Jment_
    JEqIn :: Exp -> Exp -> Exp -> Tree Jment_
    JSub :: Exp -> Exp -> Tree Jment_
    JSubIn :: Exp -> Exp -> Exp -> Tree Jment_
    EId :: Id -> Tree Exp_
    EStr :: String -> Tree Exp_
    EInt :: Integer -> Tree Exp_
    EFloat :: Double -> Tree Exp_
    ERecTyp :: Tree Exp_
    ERecord :: [Field] -> Tree Exp_
    ESetTy :: Exp -> Tree Exp_
    EListTy :: Exp -> Tree Exp_
    ELamApp :: [Lambda] -> Exp -> [Exp] -> Tree Exp_
    EProj :: Exp -> Id -> Tree Exp_
    EApps :: Exp -> [Exp] -> Tree Exp_
    ECompl :: Exp -> Tree Exp_
    EJoin :: Exp -> Id -> Exp -> Tree Exp_
    EUnion :: Exp -> Exp -> Tree Exp_
    EInters :: Exp -> Exp -> Tree Exp_
    EMerge :: Exp -> Exp -> Tree Exp_
    EConcat :: Exp -> Exp -> Tree Exp_
    ELambs :: [Lambda] -> Exp -> Tree Exp_
    EProd :: Id -> Exp -> Exp -> Tree Exp_
    EFun :: Exp -> Exp -> Tree Exp_
    ECFun :: Exp -> Exp -> Tree Exp_
    ELet :: Id -> Exp -> Exp -> Exp -> Tree Exp_
    EAbs :: Id -> Exp -> Exp -> Tree Exp_
    EApp :: Exp -> Exp -> Tree Exp_
    FIn :: Id -> Exp -> Tree Field_
    FEq :: Id -> Exp -> Tree Field_
    FEqIn :: Id -> Exp -> Exp -> Tree Field_
    LAbs :: Id -> Exp -> Tree Lambda_
    Id :: String -> Tree Id_

instance Compos Tree where
  compos r a f t = case t of
      TJments jments -> r TJments `a` foldr (a . a (r (:)) . f) (r []) jments
      JIn exp0 exp1 -> r JIn `a` f exp0 `a` f exp1
      JEq exp0 exp1 -> r JEq `a` f exp0 `a` f exp1
      JEqIn exp0 exp1 exp2 -> r JEqIn `a` f exp0 `a` f exp1 `a` f exp2
      JSub exp0 exp1 -> r JSub `a` f exp0 `a` f exp1
      JSubIn exp0 exp1 exp2 -> r JSubIn `a` f exp0 `a` f exp1 `a` f exp2
      EId id -> r EId `a` f id
      ERecord fields -> r ERecord `a` foldr (a . a (r (:)) . f) (r []) fields
      ESetTy exp -> r ESetTy `a` f exp
      EListTy exp -> r EListTy `a` f exp
      ELamApp lambdas exp exps -> r ELamApp `a` foldr (a . a (r (:)) . f) (r []) lambdas `a` f exp `a` foldr (a . a (r (:)) . f) (r []) exps
      EProj exp id -> r EProj `a` f exp `a` f id
      EApps exp exps -> r EApps `a` f exp `a` foldr (a . a (r (:)) . f) (r []) exps
      ECompl exp -> r ECompl `a` f exp
      EJoin exp0 id1 exp2 -> r EJoin `a` f exp0 `a` f id1 `a` f exp2
      EUnion exp0 exp1 -> r EUnion `a` f exp0 `a` f exp1
      EInters exp0 exp1 -> r EInters `a` f exp0 `a` f exp1
      EMerge exp0 exp1 -> r EMerge `a` f exp0 `a` f exp1
      EConcat exp0 exp1 -> r EConcat `a` f exp0 `a` f exp1
      ELambs lambdas exp -> r ELambs `a` foldr (a . a (r (:)) . f) (r []) lambdas `a` f exp
      EProd id exp0 exp1 -> r EProd `a` f id `a` f exp0 `a` f exp1
      EFun exp0 exp1 -> r EFun `a` f exp0 `a` f exp1
      ECFun exp0 exp1 -> r ECFun `a` f exp0 `a` f exp1
      ELet id exp0 exp1 exp2 -> r ELet `a` f id `a` f exp0 `a` f exp1 `a` f exp2
      EAbs id exp0 exp1 -> r EAbs `a` f id `a` f exp0 `a` f exp1
      EApp exp0 exp1 -> r EApp `a` f exp0 `a` f exp1
      FIn id exp -> r FIn `a` f id `a` f exp
      FEq id exp -> r FEq `a` f id `a` f exp
      FEqIn id exp0 exp1 -> r FEqIn `a` f id `a` f exp0 `a` f exp1
      LAbs id exp -> r LAbs `a` f id `a` f exp
      _ -> r t

instance Show (Tree c) where
  showsPrec n t = case t of
    TJments jments -> opar n . showString "TJments" . showChar ' ' . showsPrec 1 jments . cpar n
    JIn exp0 exp1 -> opar n . showString "JIn" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    JEq exp0 exp1 -> opar n . showString "JEq" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    JEqIn exp0 exp1 exp2 -> opar n . showString "JEqIn" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . showChar ' ' . showsPrec 1 exp2 . cpar n
    JSub exp0 exp1 -> opar n . showString "JSub" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    JSubIn exp0 exp1 exp2 -> opar n . showString "JSubIn" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . showChar ' ' . showsPrec 1 exp2 . cpar n
    EId id -> opar n . showString "EId" . showChar ' ' . showsPrec 1 id . cpar n
    EStr str -> opar n . showString "EStr" . showChar ' ' . showsPrec 1 str . cpar n
    EInt n -> opar n . showString "EInt" . showChar ' ' . showsPrec 1 n . cpar n
    EFloat d -> opar n . showString "EFloat" . showChar ' ' . showsPrec 1 d . cpar n
    ERecTyp -> showString "ERecTyp"
    ERecord fields -> opar n . showString "ERecord" . showChar ' ' . showsPrec 1 fields . cpar n
    ESetTy exp -> opar n . showString "ESetTy" . showChar ' ' . showsPrec 1 exp . cpar n
    EListTy exp -> opar n . showString "EListTy" . showChar ' ' . showsPrec 1 exp . cpar n
    ELamApp lambdas exp exps -> opar n . showString "ELamApp" . showChar ' ' . showsPrec 1 lambdas . showChar ' ' . showsPrec 1 exp . showChar ' ' . showsPrec 1 exps . cpar n
    EProj exp id -> opar n . showString "EProj" . showChar ' ' . showsPrec 1 exp . showChar ' ' . showsPrec 1 id . cpar n
    EApps exp exps -> opar n . showString "EApps" . showChar ' ' . showsPrec 1 exp . showChar ' ' . showsPrec 1 exps . cpar n
    ECompl exp -> opar n . showString "ECompl" . showChar ' ' . showsPrec 1 exp . cpar n
    EJoin exp0 id1 exp2 -> opar n . showString "EJoin" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 id1 . showChar ' ' . showsPrec 1 exp2 . cpar n
    EUnion exp0 exp1 -> opar n . showString "EUnion" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    EInters exp0 exp1 -> opar n . showString "EInters" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    EMerge exp0 exp1 -> opar n . showString "EMerge" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    EConcat exp0 exp1 -> opar n . showString "EConcat" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    ELambs lambdas exp -> opar n . showString "ELambs" . showChar ' ' . showsPrec 1 lambdas . showChar ' ' . showsPrec 1 exp . cpar n
    EProd id exp0 exp1 -> opar n . showString "EProd" . showChar ' ' . showsPrec 1 id . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    EFun exp0 exp1 -> opar n . showString "EFun" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    ECFun exp0 exp1 -> opar n . showString "ECFun" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    ELet id exp0 exp1 exp2 -> opar n . showString "ELet" . showChar ' ' . showsPrec 1 id . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . showChar ' ' . showsPrec 1 exp2 . cpar n
    EAbs id exp0 exp1 -> opar n . showString "EAbs" . showChar ' ' . showsPrec 1 id . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    EApp exp0 exp1 -> opar n . showString "EApp" . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    FIn id exp -> opar n . showString "FIn" . showChar ' ' . showsPrec 1 id . showChar ' ' . showsPrec 1 exp . cpar n
    FEq id exp -> opar n . showString "FEq" . showChar ' ' . showsPrec 1 id . showChar ' ' . showsPrec 1 exp . cpar n
    FEqIn id exp0 exp1 -> opar n . showString "FEqIn" . showChar ' ' . showsPrec 1 id . showChar ' ' . showsPrec 1 exp0 . showChar ' ' . showsPrec 1 exp1 . cpar n
    LAbs id exp -> opar n . showString "LAbs" . showChar ' ' . showsPrec 1 id . showChar ' ' . showsPrec 1 exp . cpar n
    Id str -> opar n . showString "Id" . showChar ' ' . showsPrec 1 str . cpar n
   where opar n = if n > 0 then showChar '(' else id
         cpar n = if n > 0 then showChar ')' else id

instance Eq (Tree c) where (==) = johnMajorEq

johnMajorEq :: Tree a -> Tree b -> Bool
johnMajorEq (TJments jments) (TJments jments_) = jments == jments_
johnMajorEq (JIn exp0 exp1) (JIn exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (JEq exp0 exp1) (JEq exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (JEqIn exp0 exp1 exp2) (JEqIn exp0_ exp1_ exp2_) = exp0 == exp0_ && exp1 == exp1_ && exp2 == exp2_
johnMajorEq (JSub exp0 exp1) (JSub exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (JSubIn exp0 exp1 exp2) (JSubIn exp0_ exp1_ exp2_) = exp0 == exp0_ && exp1 == exp1_ && exp2 == exp2_
johnMajorEq (EId id) (EId id_) = id == id_
johnMajorEq (EStr str) (EStr str_) = str == str_
johnMajorEq (EInt n) (EInt n_) = n == n_
johnMajorEq (EFloat d) (EFloat d_) = d == d_
johnMajorEq ERecTyp ERecTyp = True
johnMajorEq (ERecord fields) (ERecord fields_) = fields == fields_
johnMajorEq (ESetTy exp) (ESetTy exp_) = exp == exp_
johnMajorEq (EListTy exp) (EListTy exp_) = exp == exp_
johnMajorEq (ELamApp lambdas exp exps) (ELamApp lambdas_ exp_ exps_) = lambdas == lambdas_ && exp == exp_ && exps == exps_
johnMajorEq (EProj exp id) (EProj exp_ id_) = exp == exp_ && id == id_
johnMajorEq (EApps exp exps) (EApps exp_ exps_) = exp == exp_ && exps == exps_
johnMajorEq (ECompl exp) (ECompl exp_) = exp == exp_
johnMajorEq (EJoin exp0 id1 exp2) (EJoin exp0_ id1_ exp2_) = exp0 == exp0_ && id1 == id1_ && exp2 == exp2_
johnMajorEq (EUnion exp0 exp1) (EUnion exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (EInters exp0 exp1) (EInters exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (EMerge exp0 exp1) (EMerge exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (EConcat exp0 exp1) (EConcat exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (ELambs lambdas exp) (ELambs lambdas_ exp_) = lambdas == lambdas_ && exp == exp_
johnMajorEq (EProd id exp0 exp1) (EProd id_ exp0_ exp1_) = id == id_ && exp0 == exp0_ && exp1 == exp1_
johnMajorEq (EFun exp0 exp1) (EFun exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (ECFun exp0 exp1) (ECFun exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (ELet id exp0 exp1 exp2) (ELet id_ exp0_ exp1_ exp2_) = id == id_ && exp0 == exp0_ && exp1 == exp1_ && exp2 == exp2_
johnMajorEq (EAbs id exp0 exp1) (EAbs id_ exp0_ exp1_) = id == id_ && exp0 == exp0_ && exp1 == exp1_
johnMajorEq (EApp exp0 exp1) (EApp exp0_ exp1_) = exp0 == exp0_ && exp1 == exp1_
johnMajorEq (FIn id exp) (FIn id_ exp_) = id == id_ && exp == exp_
johnMajorEq (FEq id exp) (FEq id_ exp_) = id == id_ && exp == exp_
johnMajorEq (FEqIn id exp0 exp1) (FEqIn id_ exp0_ exp1_) = id == id_ && exp0 == exp0_ && exp1 == exp1_
johnMajorEq (LAbs id exp) (LAbs id_ exp_) = id == id_ && exp == exp_
johnMajorEq (Id str) (Id str_) = str == str_
johnMajorEq _ _ = False

instance Ord (Tree c) where
  compare x y = compare (index x) (index y) `mappend` compareSame x y
index :: Tree c -> Int
index (TJments _) = 0
index (JIn _ _) = 1
index (JEq _ _) = 2
index (JEqIn _ _ _) = 3
index (JSub _ _) = 4
index (JSubIn _ _ _) = 5
index (EId _) = 6
index (EStr _) = 7
index (EInt _) = 8
index (EFloat _) = 9
index (ERecTyp ) = 10
index (ERecord _) = 11
index (ESetTy _) = 12
index (EListTy _) = 13
index (ELamApp _ _ _) = 14
index (EProj _ _) = 15
index (EApps _ _) = 16
index (ECompl _) = 17
index (EJoin _ _ _) = 18
index (EUnion _ _) = 19
index (EInters _ _) = 20
index (EMerge _ _) = 21
index (EConcat _ _) = 22
index (ELambs _ _) = 23
index (EProd _ _ _) = 24
index (EFun _ _) = 25
index (ECFun _ _) = 26
index (ELet _ _ _ _) = 27
index (EAbs _ _ _) = 28
index (EApp _ _) = 29
index (FIn _ _) = 30
index (FEq _ _) = 31
index (FEqIn _ _ _) = 32
index (LAbs _ _) = 33
index (Id _) = 34
compareSame :: Tree c -> Tree c -> Ordering
compareSame (TJments jments) (TJments jments_) = compare jments jments_
compareSame (JIn exp0 exp1) (JIn exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (JEq exp0 exp1) (JEq exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (JEqIn exp0 exp1 exp2) (JEqIn exp0_ exp1_ exp2_) = mappend (compare exp0 exp0_) (mappend (compare exp1 exp1_) (compare exp2 exp2_))
compareSame (JSub exp0 exp1) (JSub exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (JSubIn exp0 exp1 exp2) (JSubIn exp0_ exp1_ exp2_) = mappend (compare exp0 exp0_) (mappend (compare exp1 exp1_) (compare exp2 exp2_))
compareSame (EId id) (EId id_) = compare id id_
compareSame (EStr str) (EStr str_) = compare str str_
compareSame (EInt n) (EInt n_) = compare n n_
compareSame (EFloat d) (EFloat d_) = compare d d_
compareSame ERecTyp ERecTyp = EQ
compareSame (ERecord fields) (ERecord fields_) = compare fields fields_
compareSame (ESetTy exp) (ESetTy exp_) = compare exp exp_
compareSame (EListTy exp) (EListTy exp_) = compare exp exp_
compareSame (ELamApp lambdas exp exps) (ELamApp lambdas_ exp_ exps_) = mappend (compare lambdas lambdas_) (mappend (compare exp exp_) (compare exps exps_))
compareSame (EProj exp id) (EProj exp_ id_) = mappend (compare exp exp_) (compare id id_)
compareSame (EApps exp exps) (EApps exp_ exps_) = mappend (compare exp exp_) (compare exps exps_)
compareSame (ECompl exp) (ECompl exp_) = compare exp exp_
compareSame (EJoin exp0 id1 exp2) (EJoin exp0_ id1_ exp2_) = mappend (compare exp0 exp0_) (mappend (compare id1 id1_) (compare exp2 exp2_))
compareSame (EUnion exp0 exp1) (EUnion exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (EInters exp0 exp1) (EInters exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (EMerge exp0 exp1) (EMerge exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (EConcat exp0 exp1) (EConcat exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (ELambs lambdas exp) (ELambs lambdas_ exp_) = mappend (compare lambdas lambdas_) (compare exp exp_)
compareSame (EProd id exp0 exp1) (EProd id_ exp0_ exp1_) = mappend (compare id id_) (mappend (compare exp0 exp0_) (compare exp1 exp1_))
compareSame (EFun exp0 exp1) (EFun exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (ECFun exp0 exp1) (ECFun exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (ELet id exp0 exp1 exp2) (ELet id_ exp0_ exp1_ exp2_) = mappend (compare id id_) (mappend (compare exp0 exp0_) (mappend (compare exp1 exp1_) (compare exp2 exp2_)))
compareSame (EAbs id exp0 exp1) (EAbs id_ exp0_ exp1_) = mappend (compare id id_) (mappend (compare exp0 exp0_) (compare exp1 exp1_))
compareSame (EApp exp0 exp1) (EApp exp0_ exp1_) = mappend (compare exp0 exp0_) (compare exp1 exp1_)
compareSame (FIn id exp) (FIn id_ exp_) = mappend (compare id id_) (compare exp exp_)
compareSame (FEq id exp) (FEq id_ exp_) = mappend (compare id id_) (compare exp exp_)
compareSame (FEqIn id exp0 exp1) (FEqIn id_ exp0_ exp1_) = mappend (compare id id_) (mappend (compare exp0 exp0_) (compare exp1 exp1_))
compareSame (LAbs id exp) (LAbs id_ exp_) = mappend (compare id id_) (compare exp exp_)
compareSame (Id str) (Id str_) = compare str str_
compareSame x y = error "BNFC error:" compareSame
