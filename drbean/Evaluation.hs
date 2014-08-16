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
--
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
eval :: LF ->  Maybe Answer

eval (Rel r as)	= Just (Boolean (evl (Rel r as)))
eval (Eq a b)	= Just (Boolean (evl (Eq a b)))
eval (Neg lf)	= Just (Boolean (evl (Neg lf)))
eval (Impl f1 f2)	= Just (Boolean (evl (Impl f1 f2)))
eval (Equi f1 f2)	= Just (Boolean (evl (Equi f1 f2)))
eval (Conj lfs)	= Just (Boolean (evl (Conj lfs)))
eval (Disj lfs)	= Just (Boolean (evl (Disj lfs)))
eval (Forall scope)	= Just (Boolean (evl (Forall scope)))
eval (Exists scope)	= Just (Boolean (evl (Exists scope)))
eval (Single scope)	= Just (Boolean (evl (Single scope)))
eval (Several scope)	= Just (Boolean (evl (Several scope)))
eval (Many scope)	= Just (Boolean (evl (Many scope)))
eval (Most scope)	= Just (Boolean (evl (Most scope)))
eval NonProposition = Nothing
eval _ = Nothing

evl :: LF -> Bool
evl (Rel r as)	= int r $ reverse (map term2ent as)
evl (Eq a b)	= a == b
evl (Neg lf)	= not $ evl lf
evl (Impl f1 f2)	= not ( evl f1 && ( not $ evl f2 ) )
evl (Equi f1 f2)	= evl f1 == evl f2
evl (Conj lfs)	= and ( map ( evl ) lfs )
evl (Disj lfs)	= or ( map ( evl ) lfs )
evl (Forall scope)	= and $ testents scope
evl (Exists scope)	= or $ testents scope
evl (Single scope)	= singleton ( mapMaybe bool2Maybe $ testents scope )
evl (Several scope)	= smallN ( mapMaybe bool2Maybe $ testents scope )
evl (Many scope)	= bigN ( mapMaybe bool2Maybe $ testents scope )
evl (Most scope)	= length ( mapMaybe bool2Maybe $ testents scope ) >
			length ( mapMaybe bool2Maybe $ testents scope )
evl _ = False

bool2Maybe :: Bool -> Maybe Bool
bool2Maybe = \x -> case x of False -> Nothing; True -> Just True

testents :: (Term -> LF) -> [Bool]
testents scope = map ( \e -> evl (scope (Const e)) ) realents

ent2Maybe :: (Term -> LF) -> Entity -> Maybe Entity
ent2Maybe scope = \e -> case evl (scope (Const e)) of
	False -> Nothing; True -> Just e

evalW :: LF -> Maybe [Entity]
evalW (WH scope)	= Just (mapMaybe (ent2Maybe scope) namedents)
evalW _ = Nothing

ttest :: (Term -> LF) -> Term -> Bool
ttest scope (Const a) = evl (scope (Const a))
ttest scope _ = evl (scope (Const R))

revttest scope = \x -> not $ evl (scope (Const x))

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
answer	utt@(GQUt _) = case (evalW <=< transS) utt of
	(Just []) -> Just (GAnswer Gno_pl_NP)
	(Just [x]) -> Just (GAnswer (GEntity (ent2gent x)))
	(Just [x,y]) -> Just (GAnswer (GCloseList Gor_Conj (GList (GEntity (ent2gent x)) (GEntity (ent2gent y)))))
	(Just [x,y,z]) -> Just (GAnswer (GCloseList Gor_Conj (GAddList (GEntity (ent2gent x)) (GList (GEntity (ent2gent y)) (GEntity (ent2gent z))))))
	(Just [x,y,z,w]) -> Nothing
	otherwise	-> Nothing

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
