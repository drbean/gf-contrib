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

instance Ord DRSRef where
	(<=) (DRSRef a) (DRSRef b) = (a <= b)

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

linAP :: GAP -> String
linAP (GAdvAdj _ a) = lin a
linAP a = lin a

linIP :: GIP -> String
linIP who_WH = "person"
linIP what_WH = "thing"

-- e2t :: GPN -> Tree
-- e2t e | (Just tr) <- unApp (gf e) = tr

unmaybe (Just x) = x
-- unmaybe Nothing = I

repS :: GUtt -> Maybe (DRSRef -> DRS)
repS (GQUt (GPosQ (GYN (GSentence np vp)))) = Just (repNP np (repVP vp))

newR :: DRSRef -> DRSRef
newR r = let
	es = [r]
	rs = newDRSRefs [r] es
	r' = head rs in r'

repNP :: GNP -> (DRSRef -> DRS) -> DRSRef -> DRS
repNP (GItem det cn) p r = (repDet det) (repCN cn) p r
repNP (GMassItem det n) p r = (repMassDet det) (repN n) p r
repNP (GEntity name) p r
	| entity <- (gent2ent name) , entity `elem` entities = let
	DRS rs conds = p r
	len = length (nub rs)
	reflist = newDRSRefs (replicate len (DRSRef "r")) [] in
	(DRS reflist ((Rel (DRSRel (lin name)) [head rs]) : conds))

repDet :: GDet -> (DRSRef -> DRS) -> (DRSRef -> DRS) -> DRSRef -> DRS
repDet Ga_Det = \ p q r-> let
	DRS prs pconds = p r
	DRS qrs qconds = q (maximum prs)
	len = length (nub (prs ++ qrs))
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	conds = pconds ++ qconds
	in DRS reflist conds
repDet Gone = repDet Ga_Det
repDet Gsome_Det = repDet Ga_Det
repDet GtheSg_Det = repDet Ga_Det
repDet Gsome_pl_Det = repDet Gsome_Det
repDet GthePlural_Det =  repDet Gsome_pl_Det
repDet Gfive   = repDet Gsome_pl_Det
repDet (GApos owner) = \p q r -> let
	owner_ref = r
	thing = head (newDRSRefs [owner_ref] [r])
	DRS prs pconds = p thing
	ownership_cond =  Rel (DRSRel "have") [owner_ref, thing]
	DRS qrs qconds = q thing
	conds = pconds ++ [ownership_cond] ++ qconds
	in repNP owner (\ ref -> DRS (ref : qrs) conds ) owner_ref
repDet (GApos_pl owner) = repDet (GApos owner)

repMassDet :: GMassDet -> (DRSRef -> DRS) -> (DRSRef -> DRS) -> DRSRef -> DRS
repMassDet Gzero_Det_sg = \ p q r-> let
	r' = newR r
	DRS prs pconds = p r'
	DRS qrs qconds = q r'
	len = length (nub (prs ++ qrs))
	reflist = newDRSRefs (replicate len (DRSRef "r")) []
	conds = pconds ++ qconds
	in DRS reflist conds
repMassDet Gthe_mass_Det = repMassDet Gzero_Det_sg
repMassDet (GMassApos owner) = \p q r -> let
	owner_ref = newR r
	thing = head (newDRSRefs [owner_ref] [r])
	DRS prs pconds = p thing
	ownership_cond =  Rel (DRSRel "have") [owner_ref, thing]
	DRS qrs qconds = q thing
	conds = pconds ++ [ownership_cond] ++ qconds
	in repNP owner (\ ref -> DRS (ref : qrs) conds ) owner_ref

repN :: GN -> DRSRef -> DRS
repN name = \r ->
	DRS [r] [Rel (DRSRel (lin name)) [r]]
repN2 :: GN2 -> [DRSRef] -> DRS
repN2 name     = \rs ->
	DRS rs [Rel (DRSRel (lin name)) [head rs]]
repPartitive :: GPartitive -> [DRSRef] -> DRS
repPartitive name     = \rs ->
	DRS rs [Rel (DRSRel (lin name)) [head rs]]

repCN :: GCN -> DRSRef -> DRS
repCN (GKind ap cn) = \r -> let
       DRS thing_refs thing_conds = (repCN cn r)
       DRS attri_refs attri_conds = (repAP ap r)
       in DRS (thing_refs ++ attri_refs) (thing_conds ++ attri_conds)
--repCN (GOfpart part n) = \rs -> let
--	form = head rs
--	rs' = tail rs
--	thing = head rs'
--	DRS _ partconds = repPartitive part rs
--	DRS _ thingconds = repN n rs'
--	formcond = [ Rel (DRSRel "in_form_of") [thing,form] ]
--	in DRS rs' (thingconds ++ partconds ++ formcond)
--repCN (GOfpos n2 np) = \rs -> let
--       thing = head rs
--       rs' = (tail . tail) rs
--       DRS _ conds = repN2 n2 rs in
--       repNP np (\ (owner:_) -> let
--       newconds = conds ++ [Rel (DRSRel "have") [owner, thing]]
--       in DRS (thing:rs') newconds ) (tail rs)
repCN name     = \r ->
	DRS [r] [Rel (DRSRel (lin name)) [r]]

repAP :: GAP -> DRSRef -> DRS
repAP (GAdvAdj _ a) = \ r -> DRS [r] [Rel (DRSRel (lin a)) [r]]
repAP ap = \r -> DRS [r] [Rel (DRSRel (lin ap)) [r]]

repPlace :: GPlace -> (DRSRef -> DRS) -> DRSRef -> DRS
repPlace (GLocation _ (GPlaceKind _ name)) = \p r -> let 
	DRS rs conds = p r in (DRS rs ((Rel (DRSRel (lin name)) [head rs]) : conds))
repPlace (GLocation _ name) = \p r -> let
	DRS rs conds = p r in (DRS rs ((Rel (DRSRel (lin name)) [head rs]) : conds))


repVP :: GVP -> DRSRef -> DRS
repVP (GWithCl vp _) = repVP vp
repVP (GWithPlace vp _) = repVP vp
repVP (GWithStyle vp _) = repVP vp
repVP (GWithTime vp _) = repVP vp
repVP (GBe_vp comp) = case comp of
	(GBe_someone np) -> \r -> repNP np
		(\ hypernym -> DRS [r] [] ) r
	GBe_bad ap -> repAP ap
	GBe_somewhere (GLocating prep place) -> \r -> let
		situatee = r
		rs' = newR situatee in
		repPlace place (\name -> DRS [name]
		[ Rel (DRSRel (lin prep)) [situatee, name]]
		) rs'
repVP (GLook_bad v ap) = \r -> let
	patient = r
	DRS rs' conds = repAP ap patient
	look_conds = [Rel (DRSRel (lin v)) [patient, DRSRef ((linAP ap)++"_prop")]
		, Prop (DRSRef ((linAP ap)++"_prop")) (DRS [] conds)]
	in DRS [patient] look_conds
repVP (GHappening v) = \r -> let r' = newR r in
	DRS [r'] [Rel (DRSRel (lin v)) [r']]
repVP (GChanging v obj) = \r -> let r' = newR r; r'' = newR r' in repNP obj
	(\patient -> DRS [r',patient] [Rel (DRSRel (lin v)) [r', patient]] ) r''
repVP (GTriangulating v obj1 obj2) = \r -> repNP obj1 (\theme ->
		repNP obj2 (\recipient ->
			DRS [theme,recipient] [Rel (DRSRel (lin v)) [r, theme, recipient]]
			) r ) r
repVP (GPositing v0 (GPosS (GSentence np vp))) = case vp of
	(GBe_vp comp) -> case comp of
		(GBe_someone subjcomp ) -> \r -> repNP np (\referent ->
			repNP subjcomp (\_ -> let
			cond = [Rel (DRSRel (lin v0)) [r, DRSRef ((lin v0)++":be")]
				, Prop (DRSRef ((lin v0)++":be")) (DRS []
				[Rel (DRSRel ((linNP subjcomp)++"_prop")) [referent] ])]
			in DRS [referent] cond )
			r ) r
	(GIntens vv vp2) -> case vp2 of
		(GChanging v obj) -> \r -> 
			repNP np (\referent -> repNP obj (\theme -> let
			lin_v = lin v
			p = DRSRef (lin_v ++ "_prop")
			conds = [Rel (DRSRel (lin v0)) [r, p]
				, Prop p (DRS [] [Rel 
				(DRSRel lin_v) [p, referent, theme]])]
			in DRS [theme, referent] conds )
			r ) r
repVP (GPositing v0 (GNegS (GSentence np vp))) = case vp of
	(GIntens vv vp2) -> case vp2 of
		(GChanging v obj) -> \r -> repNP np (\referent ->
			repNP obj (\theme -> let
			lin_v = lin v
			p = DRSRef (lin_v ++ "_prop")
			conds = [Rel (DRSRel (lin v0)) [r, p]
				, Prop p (DRS [] [Neg (DRS []
				[Rel (DRSRel lin_v)
				[p, referent, theme]])])]
			in DRS [theme, referent] conds )
			r ) r

-- vim: set ts=2 sts=2 sw=2 noet:
