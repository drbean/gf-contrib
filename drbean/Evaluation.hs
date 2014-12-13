module Evaluation (readPGF, chomp, lc_first, term2ref, xyzw, unmaybe, rep, parses, drsToLF, linear, showExpr, transform) where

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

ref2ent :: Entity -> DRSRef -> Entity
ref2ent e x = e

ent2ref :: Entity -> DRSRef
ent2ref e = let [ref] = [ r | r <- [DRSRef "x", DRSRef "y", DRSRef "z", DRSRef "w", DRSRef "p"]
			, ref2ent e r == e ] in ref

term2ent :: Term -> Entity
term2ent (Const e) = e
term2ent _ = Something

terms :: [Term]
terms = map Const entities

xyzw = [Var (DRSRef "x1"), Var (DRSRef "x2"), Var (DRSRef "x3"), Var (DRSRef "x4")]


eval :: LF -> Maybe Answer
eval (Exists scope)     = eval (Disj (map scope terms))
-- eval (Forall scope)     = eval (Conj (map scope terms))
eval (Conj lfs) = foldM conjLF (Boolean True) (map (fromMaybe NoAnswer . eval ) lfs)
eval (Disj lfs) = foldM disjLF (Boolean False) (map (fromMaybe NoAnswer . eval ) lfs)
eval (Neg form) = eval form >>= notLF
eval (Imp f1 f2) = liftM2 implLF (eval f1) (eval f2)
eval (Rel name ts) = int name (map term2ent ts)
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

conjLF :: Answer -> Answer -> Maybe Answer
conjLF (Boolean b1) (Boolean b2) = Just (Boolean ( b1 && b2 ) )
conjLF _ _ = Nothing

disjLF :: Answer -> Answer -> Maybe Answer
disjLF (Boolean b1) (Boolean b2) = Just (Boolean ( b1 || b2 ) )
disjLF _ _ = Nothing

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
	| eval lf == Just (Boolean True) = Just GYes
	| eval lf == Just (Boolean False) = Just GNo
	| eval lf == Nothing = Just GNoAnswer
	where
		drs = (unmaybe . repS) utt
		d2l = drsToLF drs
		lf = d2l xyzw
answer	utt@(GQUt (GNegQ (GYN _)))
	| eval lf == Just (Boolean True) = Just GYes
	| eval lf == Just (Boolean False) = Just GNo
	| eval lf == Nothing = Just GNoAnswer
	where lf = drsToLF ((unmaybe . repS) utt) xyzw
answer	utt@(GQUt (GPosQ (GTagQ _ _)))
	| eval lf == Just (Boolean True) = Just GYes
	| eval lf == Just (Boolean False) = Just GNo
	| eval lf == Nothing = Just GNoAnswer
	where lf = drsToLF ((unmaybe . repS) utt) xyzw
answer	utt@(GQUt (GNegQ (GTagQ _ _)))
	| eval lf == Just (Boolean True) = Just GYes
	| eval lf == Just (Boolean False) = Just GNo
	| eval lf == Nothing = Just GNoAnswer
	where lf = drsToLF ((unmaybe . repS) utt) xyzw
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
