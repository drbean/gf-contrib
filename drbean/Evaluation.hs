module Evaluation (readPGF, chomp, lc_first, rep, parses, linear, showExpr, transform) where

import PGF
import Data.DRS hiding (Or,Neg,Imp,Rel)
import Representation hiding ((==))
import Translate
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

ref2ent :: DRSRef -> Entity
ref2ent (DRSRef "x") = Q
ref2ent (DRSRef "y") = C
ref2ent (DRSRef "z") = D
ref2ent (DRSRef "w") = M

eval :: LF -> Maybe Answer
eval (Exists _) = Just (Boolean True)
eval (ForAll _) = Just (Boolean True)
eval (And f1 f2) = Just (conjLF (eval f1) (eval f2))
eval (Or f1 f2) = Just (disjLF (eval f1) (eval f2))
eval (Neg form) = eval form >>= notLF
eval (Imp f1 f2) = liftM2 implLF (eval f1) (eval f2)
eval (Rel (DRSRel r) rs) = int r (map ref2ent rs)
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

unJustAnswer :: LF -> Answer
unJustAnswer = \lf -> fromMaybe NoAnswer (eval lf)

bool2Maybe :: Bool -> Maybe Bool
bool2Maybe = \x -> case x of False -> Nothing; True -> Just True

--evalW :: LF -> Maybe [Entity]
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

rep :: Tree -> Maybe ([DRSRef] -> DRS)
rep x =  (repS . fg) x

answer :: GUtt -> Maybe GUtt
answer	utt@(GQUt (GPosQ (GYN _)))
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Just (Boolean True) = Just GYes
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Just (Boolean False) = Just GNo
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Nothing = Just GNoAnswer
answer	utt@(GQUt (GNegQ (GYN _)))
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Just (Boolean True) = Just GYes
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Just (Boolean False) = Just GNo
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Nothing = Just GNoAnswer
answer	utt@(GQUt (GPosQ (GTagQ _ _)))
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Just (Boolean True) = Just GYes
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Just (Boolean False) = Just GNo
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Nothing = Just GNoAnswer
answer	utt@(GQUt (GNegQ (GTagQ _ _)))
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Just (Boolean True) = Just GYes
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Just (Boolean False) = Just GNo
		| eval (resolveDrsToLF ((unmaybe . repS) utt) xyzw) == Nothing = Just GNoAnswer
----answer	utt@(GQUt _) = case (evalW . drsToFOL . unmaybe . repS) utt of
----	(Just []) -> Just (GAnswer Gno_pl_NP)
----	(Just [x]) -> Just (GAnswer (GEntity (ent2gent x)))
----	(Just [x,y]) -> Just (GAnswer (GCloseList Gor_Conj (GList (GEntity (ent2gent x)) (GEntity (ent2gent y)))))
----	(Just [x,y,z]) -> Just (GAnswer (GCloseList Gor_Conj (GAddList (GEntity (ent2gent x)) (GList (GEntity (ent2gent y)) (GEntity (ent2gent z))))))
----	(Just [x,y,z,w]) -> Nothing
----	otherwise	-> Nothing

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
