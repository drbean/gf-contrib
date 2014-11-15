module Evaluation (readPGF, chomp, lc_first, rep, parses, linear, showExpr, transform) where

import PGF
import Data.DRS
import Data.FOL.Formula
import Representation hiding ((==))
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

termed :: Entity -> Term
termed = Const

terms :: [Term]
terms = map Const entities

nameterms :: [Term]
nameterms = map termed namedents

term2ent :: Term -> Entity
term2ent (Const a) = a
term2ent _ = R


eval :: FOLForm -> Maybe Answer
eval (Exists _ _) = Just (Boolean True)
eval (ForAll _ _) = Just (Boolean True)
eval (And f1 f2) = Just (conjLF (eval f1) (eval f2))
eval (Data.FOL.Formula.Or f1 f2) = Just (disjLF (eval f1) (eval f2))
eval (Data.FOL.Formula.Neg form) = eval form >>= notLF
eval (Data.FOL.Formula.Imp f1 f2) = liftM2 implLF (eval f1) (eval f2)
eval (Data.FOL.Formula.Rel _ _) = Just (Boolean True)
eval Top = Just (Boolean True)
eval Bottom = Just (Boolean False)

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

conjLF :: Maybe Answer -> Maybe Answer -> Answer
conjLF (Just b1) (Just b2) = lifting (\x y -> x && y) b1 b2
conjLF _ _ = NoAnswer

disjLF :: Maybe Answer -> Maybe Answer -> Answer
disjLF (Just b1) (Just b2) = lifting (\x y -> (x || y)) b1 b2
disjLF _ _ = NoAnswer

unJustAnswer :: FOLForm -> Answer
unJustAnswer = \lf -> fromMaybe NoAnswer (eval lf)

bool2Maybe :: Bool -> Maybe Bool
bool2Maybe = \x -> case x of False -> Nothing; True -> Just True

-- testents :: (Term -> LF) -> [Bool]
-- testents scope = map ( \e -> evl (scope (Const e)) ) realents


-- ent2Maybe :: (Term -> LF) -> Entity -> Maybe Entity
-- ent2Maybe scope = \e -> case evl (scope (Const e)) of
-- 	False -> Nothing; True -> Just e

--evalW :: FOLForm -> Maybe [Entity]
--evalW (scope)	= Just [ e | e <- namedents
--				, t <- [termed e]
--				, a <- [(eval.scope) t]
--				, a == Just (Boolean True)
--							]
--evalW _ = Nothing

notNull :: [Entity] -> Maybe Answer
notNull [] = Just (Boolean False )
notNull [_] = Just (Boolean True )
notNull [_,_] = Just (Boolean True )
notNull [_,_,_] = Just (Boolean True )
notNull [_,_,_,_] = Just (Boolean True )
notNull [_,_,_,_,_] = Just (Boolean True )
notNull _ = Nothing

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

rep :: Tree -> Maybe DRS
rep x =  (repS . fg) x

answer :: GUtt -> Maybe GUtt
answer	utt@(GQUt (GPosQ (GYN _)))
		| (eval . drsToFOL . unmaybe . repS) utt == (Just (Boolean True)) = Just GYes
		| (eval . drsToFOL . unmaybe . repS) utt == (Just (Boolean False)) = Just GNo
		| (eval . drsToFOL . unmaybe . repS) utt == Nothing = Just GNoAnswer
answer	utt@(GQUt (GNegQ (GYN _)))
		| (eval . drsToFOL . unmaybe . repS) utt == (Just (Boolean True)) = Just GYes
		| (eval . drsToFOL . unmaybe . repS) utt == (Just (Boolean False)) = Just GNo
		| (eval . drsToFOL . unmaybe . repS) utt == Nothing = Just GNoAnswer
answer	utt@(GQUt (GPosQ (GTagQ _ _)))
		| (eval . drsToFOL . unmaybe . repS) utt == (Just (Boolean True)) = Just GYes
		| (eval . drsToFOL . unmaybe . repS) utt == (Just (Boolean False)) = Just GNo
		| (eval . drsToFOL . unmaybe . repS) utt == Nothing = Just GNoAnswer
answer	utt@(GQUt (GNegQ (GTagQ _ _)))
		| (eval . drsToFOL . unmaybe . repS) utt == (Just (Boolean True)) = Just GYes
		| (eval . drsToFOL . unmaybe . repS) utt == (Just (Boolean False)) = Just GNo
		| (eval . drsToFOL . unmaybe . repS) utt == Nothing = Just GNoAnswer
--answer	utt@(GQUt _) = case (evalW . drsToFOL . unmaybe . repS) utt of
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
lc_first str@(s:ss) = case ( or $ map (flip isPrefixOf str) ["Barbara", "Tadeusz", "Eva", "Dr Bean", "Fast-Track"] ) of
	True  -> (s:ss)
	False -> ((toLower s):ss)

chomp :: String -> String
chomp []                      = []
-- chomp ('\'':'s':xs)           = " 's" ++ chomp xs
-- chomp ('s':'\'':xs)           = "s 's" ++ chomp xs
chomp (x:xs) | x `elem` ".,?" = chomp xs
            | otherwise      =     x:chomp xs



-- vim: set ts=2 sts=2 sw=2 noet:
