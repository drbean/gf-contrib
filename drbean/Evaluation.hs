module Evaluation (readPGF, chomp, lc_first, lf, parses, linear, showExpr, transform) where

import PGF
import LogicalForm
import Interpretation
import Model

import Data.Maybe
import Control.Monad

import Data.List
import Data.Char

--type FInterp = String -> [Entity] -> Entity
--
--fint :: FInterp
--fint name [] =	maybe (entities!!26) id $ lookup name characters

realents :: [Entity]
-- realents = filter ( not . flip elem [Unspec,Someone,Something] ) entities
namedents = map snd characters
realents = entities

--type TVal = Term -> Entity
--
--lift :: FInterp -> TVal
--lift fint (Const a)   = a
--lift fint (Struct str ts) =
--           fint str (map (lift fint) ts)
--lift fint _     = R

terms :: [Term]
terms = map Const entities

term2ent :: Term -> Entity
term2ent (Const a) = a
term2ent _ = R


data Answer = Boolean Bool | Yes | No | NoAnswer
	deriving (Eq)
instance Show Answer where
	show (Boolean bool)	= show bool
	show Yes	= "Yes"
	show No	= "No"
	show NoAnswer	= "NoAnswer"

eval :: LF -> Maybe Answer
eval NonProposition = Nothing
eval (Rel r as)	= Just (Boolean (int r $ reverse (map term2ent as)))
eval (Eq a b)	= Just (Boolean (a == b))
eval (Neg lf)	= eval lf >>= notLF
eval (Impl f1 f2)	= liftM2 implLF (eval f1) (eval f2)
eval (Equi f1 f2)	= liftM2 equiLF (eval f1) (eval f2)
eval (Conj lfs)	= foldM conjLF (Boolean True) (map (fromMaybe NoAnswer . eval ) lfs)
eval (Disj lfs)	= foldM disjLF (Boolean False) (map (fromMaybe NoAnswer . eval ) lfs)
eval (Forall scope)	= eval (Conj (map scope terms))
eval (Exists scope)	= eval (Disj (map scope terms))
eval (Single scope)	= Just (Boolean (singleton (map scope terms)))
eval (Several scope)	= Just (Boolean (smallN (map scope terms)))
eval (Many scope)	= Just (Boolean (bigN (map scope terms)))
-- eval (Most scope)	= length ( mapMaybe bool2Maybe $ testents scope ) >
-- 			length ( mapMaybe bool2Maybe $ testents scope )
-- eval lf = error $ (show lf) ++ " logical formula unknown, not evaluated."

notLF :: Answer -> Maybe Answer
notLF (Boolean b) = Just (Boolean (not b))
notLF _	= Nothing

lifting :: (Bool -> Bool -> Bool) -> Answer -> Answer -> Answer
lifting f (Boolean b1) (Boolean b2) = Boolean (f b1 b2)
lifting _ _ _ = NoAnswer

implLF :: Answer -> Answer -> Answer
implLF = lifting (\b1 b2 -> not (b1 && (not b2)))

equiLF :: Answer -> Answer -> Answer
equiLF = lifting (==)

conjLF :: Answer -> Answer -> Maybe Answer
conjLF (Boolean b1) (Boolean b2) = Just (Boolean (b1 && b2))
conjLF _ _ = Nothing

disjLF :: Answer -> Answer -> Maybe Answer
disjLF (Boolean b1) (Boolean b2) = Just (Boolean (b1 || b2))
disjLF _ _ = Nothing

unJustAnswer :: LF -> Answer
unJustAnswer = \lf -> fromMaybe NoAnswer (eval lf)

bool2Maybe :: Bool -> Maybe Bool
bool2Maybe = \x -> case x of False -> Nothing; True -> Just True

-- testents :: (Term -> LF) -> [Bool]
-- testents scope = map ( \e -> evl (scope (Const e)) ) realents


-- ent2Maybe :: (Term -> LF) -> Entity -> Maybe Entity
-- ent2Maybe scope = \e -> case evl (scope (Const e)) of
-- 	False -> Nothing; True -> Just e

-- evalW :: LF -> Maybe [Entity]
-- evalW (WH scope)	= Just (mapMaybe (ent2Maybe scope) namedents)
-- evalW _ = Nothing

-- ttest :: (Term -> LF) -> Term -> Bool
-- ttest scope (Const a) = evl (scope (Const a))
-- ttest scope _ = evl (scope (Const R))

-- revttest scope = \x -> not $ evl (scope (Const x))

singleton :: [a] -> Bool
singleton [x]	= True
singleton _	= False

smallN :: [a] -> Bool
smallN [_,_]	= True
smallN [_,_,_]	= True
smallN _	= False

bigN :: [a] -> Bool
bigN [] = False
bigN [_] = False
bigN xs = not . smallN $ xs

-- used by both Transfer, Tests

parses :: PGF -> String -> [Tree]
parses gr s = concat ( parseAll gr (startCat gr) s )

transform :: Tree -> Maybe Tree
transform = gfmaybe <=< answer . fg

gfmaybe :: GUtt -> Maybe Tree
gfmaybe (GYes) = Just (gf GYes)
gfmaybe (GNo) = Just (gf GNo)
gfmaybe (GAnswer x) = Just (gf (GAnswer x))
gfmaybe _ = Nothing

lf :: Tree -> Maybe LF
lf x =  (transS . fg) x

answer :: GUtt -> Maybe GUtt
answer	utt@(GQUt (GPosQ (GYN _)))
		| (eval <=< transS) utt == (Just (Boolean True)) = Just GYes
		| (eval <=< transS) utt == (Just (Boolean False)) = Just GNo
		| (eval <=< transS) utt == (Just NoAnswer) = Just GNoAnswer
answer	utt@(GQUt (GNegQ (GYN _)))
		| (eval <=< transS) utt == (Just (Boolean True)) = Just GYes
		| (eval <=< transS) utt == (Just (Boolean False)) = Just GNo
		| (eval <=< transS) utt == (Just NoAnswer) = Just GNoAnswer
answer	utt@(GQUt (GPosQ (GTagQ _ _)))
		| (eval <=< transS) utt == (Just (Boolean True)) = Just GYes
		| (eval <=< transS) utt == (Just (Boolean False)) = Just GNo
		| (eval <=< transS) utt == (Just NoAnswer) = Just GNoAnswer
answer	utt@(GQUt (GNegQ (GTagQ _ _)))
		| (eval <=< transS) utt == (Just (Boolean True)) = Just GYes
		| (eval <=< transS) utt == (Just (Boolean False)) = Just GNo
		| (eval <=< transS) utt == (Just NoAnswer) = Just GNoAnswer
--answer	utt@(GQUt _) = case (evalW <=< transS) utt of
--	(Just []) -> Just (GAnswer Gno_pl_NP)
--	(Just [x]) -> Just (GAnswer (GEntity (ent2gent x)))
--	(Just [x,y]) -> Just (GAnswer (GCloseList Gor_Conj (GList (GEntity (ent2gent x)) (GEntity (ent2gent y)))))
--	(Just [x,y,z]) -> Just (GAnswer (GCloseList Gor_Conj (GAddList (GEntity (ent2gent x)) (GList (GEntity (ent2gent y)) (GEntity (ent2gent z))))))
--	(Just [x,y,z,w]) -> Nothing
--	otherwise	-> Nothing

linear :: PGF -> Tree -> Maybe String
linear gr p = Just (linearize gr (myLanguage gr) p)

myLanguage gr = (head . languages) gr

lc_first :: String -> String
lc_first str@(s:ss) = case ( or $ map (flip isPrefixOf str) ["Dee", "Alf", "Monday"] ) of
	True  -> (s:ss)
	False -> ((toLower s):ss)

chomp :: String -> String
chomp []                      = []
-- chomp ('\'':'s':xs)           = " 's" ++ chomp xs
-- chomp ('s':'\'':xs)           = "s 's" ++ chomp xs
chomp (x:xs) | x `elem` ".,?" = chomp xs
            | otherwise      =     x:chomp xs



-- vim: set ts=2 sts=2 sw=2 noet:
