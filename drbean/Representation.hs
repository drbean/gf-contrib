module Representation (module Representation, module Jackson) where

import Data.DRS

import Jackson
import PGF

import Model
import Interpretation
-- import Story_Interpretation
-- import qualified Topic_Interpretation as Topic

import Data.List
import Data.Tuple

entuples :: [(Entity,GPN)]
entuples = [
	(Q,Gqueen)
	, (C,Gcolorado)
	, (X, Gchristmas)
	]

instance Eq GPN where
	(==) Gqueen Gqueen = True
	(==) Gcolorado Gcolorado = True
	(==) Gchristmas Gchristmas = True
	(==) _ _ = False

gent2ent :: GPN -> Entity
gent2ent gent        | Just ent <- lookup gent (map swap entuples) = ent
ent2gent :: Entity -> GPN
ent2gent ent | Just gent <- lookup ent entuples = gent

lin :: Gf a => a -> String
lin e = stripApp (unApp (gf e))

stripApp :: Maybe (CId, [Expr]) -> String
stripApp = maybe "Undefined" (\x -> ((showCId . fst) x))

linNP :: GNP -> String
linNP (GEntity name) = lin name
linNP (GItem _ (GKind _ (GOfpos noun _))) = lin noun
linNP (GItem _ (GKind _ noun)) = lin noun
linNP (GItem _ noun) = lin noun
linNP (GMassItem _ noun) = lin noun

linIP :: GIP -> String
linIP who_WH = "person"
linIP what_WH = "thing"

-- e2t :: GPN -> Tree
-- e2t e | (Just tr) <- unApp (gf e) = tr

unmaybe (Just x) = x
-- unmaybe Nothing = I

data DRSRefTuple = OneRef DRSRef | TwoRef (DRSRef,DRSRef) |
       ThreeRef (DRSRef,DRSRef,DRSRef) | FourRef (DRSRef,DRSRef,DRSRef,DRSRef)

first :: DRSRefTuple -> DRSRef
first (OneRef one) = one
first (TwoRef (one,two)) = one

second :: DRSRefTuple -> DRSRef
second (TwoRef (one,two)) = two

drsCons :: DRS -> [DRSCon]
drsCons (DRS _ cs) = cs

repS :: GUtt -> Maybe ([DRSRef] -> DRS)
repS (GQUt (GPosQ (GYN (GSentence np vp)))) = Just (repNP np (repVP vp))

newR :: DRSRef -> DRSRef
newR r = let
	es = [r]
	rs = newDRSRefs [r] es
	r' = head rs in r'

repNP :: GNP -> ([DRSRef] -> DRS) -> ([DRSRef] -> DRS)
repNP (GEntity name) p
	| entity <- (gent2ent name) , entity `elem` entities =
	\rs -> case (p rs) of
		(DRS rs' conds) -> (DRS rs' ((Rel (DRSRel (lin name)) [(head . reverse) rs]) : conds))


repVP :: GVP -> [DRSRef] -> DRS
repVP (GWithCl vp _) = repVP vp
repVP (GWithPlace vp _) = repVP vp
repVP (GWithStyle vp _) = repVP vp
repVP (GWithTime vp _) = repVP vp
repVP (GHappening v) = \r -> let
	conds =  [Rel (DRSRel (lin v)) r]
	in DRS r conds
repVP (GChanging v obj) = \[x,agent] -> repNP obj
	(\[patient] -> DRS [patient, agent] [Rel (DRSRel (lin v)) [agent, patient]] ) [x]
