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
repNP (GItem det cn) p = (repDet det) (repCN cn) p
repNP (GMassItem det n) p = (repMassDet det) (repN n) p
repNP (GEntity name) p
	| entity <- (gent2ent name) , entity `elem` entities =
	\rs -> case (p rs) of
		(DRS rs' conds) -> (DRS rs ((Rel (DRSRel (lin name)) [head rs]) : conds))

repDet :: GDet -> ([DRSRef] -> DRS) -> ([DRSRef] -> DRS) -> ([DRSRef] -> DRS)
repDet Ga_Det = \ p q rs-> let
       DRS prs pconds = p rs
       DRS qrs qconds = q prs
       reflist = (prs ++ qrs ++ rs)
       conds = pconds ++ qconds
       in DRS rs conds
repDet Gone = repDet Ga_Det
repDet Gsome_Det = repDet Ga_Det
repDet GtheSg_Det = repDet Ga_Det
repDet Gsome_pl_Det = repDet Gsome_Det
repDet GthePlural_Det =  repDet Gsome_pl_Det
repDet Gfive   = repDet Gsome_pl_Det
repDet (GApos owner) = \p q rs -> let
	owner_ref = head rs
	DRS prs pconds = p (tail rs)
	thing = head prs
	ownership_cond =  Rel (DRSRel "have") [owner_ref, thing]
	DRS qrs qconds = q prs
	conds = ownership_cond : (pconds ++ qconds)
	in repNP owner (\ rs' -> DRS rs' conds ) rs
repDet (GApos_pl owner) = repDet (GApos owner)

repMassDet :: GMassDet -> ([DRSRef] -> DRS) -> ([DRSRef] -> DRS) -> ([DRSRef] -> DRS)
repMassDet Gzero_Det_sg = \ p q rs-> let
       DRS prs pconds = p rs
       DRS qrs qconds = q rs
       reflist = (prs ++ qrs ++ rs)
       conds = pconds ++ qconds
       in DRS (qrs) conds
repMassDet Gthe_mass_Det = repMassDet Gzero_Det_sg
repMassDet (GMassApos owner) = \p q rs -> let
	owner_ref = head rs
	DRS prs pconds = p (tail rs)
	thing = head prs
	ownership_cond =  Rel (DRSRel "have") [owner_ref, thing]
	DRS qrs qconds = q prs
	conds = ownership_cond : (pconds ++ qconds)
	in repNP owner (\ rs' -> DRS rs' conds ) rs

repN :: GN -> [DRSRef] -> DRS
repN name = \rs ->
	DRS rs [Rel (DRSRel (lin name)) [head rs]]
repN2 :: GN2 -> [DRSRef] -> DRS
repN2 name     = \rs ->
	DRS rs [Rel (DRSRel (lin name)) [head rs]]

repCN :: GCN -> [DRSRef] -> DRS
repCN (GKind ap cn) = \rs -> let
       DRS thing_refs thing_conds = (repCN cn rs)
       DRS attri_refs attri_conds = (repAP ap thing_refs)
       in DRS (thing_refs ++ attri_refs) (thing_conds ++ attri_conds)
repCN (GOfpos n2 np) = \rs -> let
       thing = head rs
       rs' = (tail . tail) rs
       DRS _ conds = repN2 n2 rs in
       repNP np (\ (owner:_) -> let
       newconds = Rel (DRSRel "have") [owner, thing] : conds
       in DRS (thing:rs') newconds ) (tail rs)
repCN name     = \rs ->
	DRS rs [Rel (DRSRel (lin name)) [head rs]]

repAP :: GAP -> [DRSRef] -> DRS
repAP (GAdvAdj _ a) = \ rs@(r:_) -> DRS rs [Rel (DRSRel (lin a)) [r]]
repAP ap = \rs@(r:_) -> DRS rs [Rel (DRSRel (lin ap)) [r]]

repPlace :: GPlace -> ([DRSRef] -> DRS) -> ([DRSRef] -> DRS)
repPlace (GLocation _ (GPlaceKind _ name)) = \p rs -> case (p rs) of
	(DRS rs conds) -> (DRS rs ((Rel (DRSRel (lin name)) [head rs]) : conds))
repPlace (GLocation _ name) = \p rs -> case (p rs) of
	(DRS rs conds) -> (DRS rs ((Rel (DRSRel (lin name)) [head rs]) : conds))


repVP :: GVP -> [DRSRef] -> DRS
repVP (GWithCl vp _) = repVP vp
repVP (GWithPlace vp _) = repVP vp
repVP (GWithStyle vp _) = repVP vp
repVP (GWithTime vp _) = repVP vp
repVP (GBe_vp comp) = case comp of
	(GBe_someone np) -> \rs -> repNP np
		(\ (hypernym:_) -> DRS rs [] ) rs
	GBe_bad ap -> repAP ap
	GBe_somewhere (GLocating prep place) -> \rs -> let
		situatee = head rs
		rs' = tail rs in
		repPlace place (\(name:_) -> DRS rs'
		[ Rel (DRSRel (lin prep)) [situatee, name]]
		) rs'
repVP (GLook_bad v ap) = \rs -> let
	patient = head rs
	DRS rs' conds = repAP ap rs
	look_conds = [Rel (DRSRel (lin v)) [patient, DRSRef "p"]
		, Prop (DRSRef "p") (DRS [] conds)]
	in DRS rs look_conds
repVP (GHappening v) = \rs ->
	DRS rs [Rel (DRSRel (lin v)) [head rs]]
repVP (GChanging v obj) = \ rs -> let
	x = head rs; rs' = tail rs in
	repNP obj
	(\ (patient:_) -> DRS rs' [Rel (DRSRel (lin v)) [x, patient]] ) rs'
repVP (GTriangulating v obj1 obj2) = \rs -> let
	agent = head rs
	rs' = tail rs in repNP obj1 (\(theme:rs'') ->
		repNP obj2 (\(recipient:_) ->
			DRS rs [Rel (DRSRel (lin v)) [agent, theme, recipient]]
			) rs'' ) rs'
repVP (GPositing v0 (GPosS (GSentence np vp))) = case vp of
	(GBe_vp comp) -> case comp of
		(GBe_someone subjcomp ) -> \rs -> let
			positer = head rs
			rs' = tail rs in
			repNP np (\(referent:rs'') ->
			repNP subjcomp (\_ -> let
			cond = [Rel (DRSRel (lin v0)) [positer, DRSRef "p"]
				, Prop (DRSRef "p") (DRS []
				[Rel (DRSRel (linNP subjcomp)) [referent] ])]
			in DRS rs cond )
			rs'' ) rs'
	(GIntens vv vp2) -> case vp2 of
		(GChanging v obj) -> \rs -> let
			positer = head rs
			rs' = tail rs in
			repNP np (\(referent:rs'') ->
			repNP obj (\(theme:_) -> let
			conds = [Rel (DRSRel (lin v0)) [positer, DRSRef "p"]
				, Prop (DRSRef "p") (DRS [] [Rel (DRSRel (lin v))
				[referent, theme]])]
			in DRS [theme, referent, positer] conds )
			rs'' ) rs'
