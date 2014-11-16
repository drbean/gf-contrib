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

repS :: GUtt -> Maybe DRS
repS (GQUt (GPosQ (GWH_Pred wh (GBe_vp (GBe_bad comp))))) =
	Just (DRS [DRSRef "x"] [Imp (DRS [] [Rel (DRSRel (linIP wh)) [DRSRef "x"]])
	(DRS [] [Rel (DRSRel (lin comp)) [DRSRef "x"]])])
repS (GQUt (GPosQ (GWH_Pred wh (GBe_vp (GBe_someone comp))))) =
	Just (DRS [DRSRef "x"] [Imp (DRS [] [Rel (DRSRel (linIP wh)) [DRSRef "x"]])
	(DRS [] [Rel (DRSRel (linNP comp)) [DRSRef "x"]])])
repS (GQUt (GPosQ (GWH_Pred wh vp))) = Just (repW wh (repVP vp) (DRSRef "x0"))
repS (GQUt (GPosQ (GYN (GSentence np vp)))) = Just (repNP np (repVP vp) (DRSRef "x1"))

newR :: DRSRef -> DRSRef
newR r = let
	es = [r]
	rs = newDRSRefs [r] es
	r' = head rs in r'

repNP :: GNP -> (DRSRef -> DRS) -> DRSRef -> DRS
repNP (GItem det cn) = (repDet det) (repCN cn)
repNP (GMassItem det n) = (repMassDet det) (repN n)
repNP (GEntity name)
	| entity <- (gent2ent name) , entity `elem` entities =
			\p r -> let
				DRS prs conds = p r
				in DRS prs ( Rel (DRSRel (lin name)) [r] : conds )


repDet :: GDet -> (DRSRef -> DRS) -> (DRSRef -> DRS) -> DRSRef -> DRS

repDet Ga_Det = \ p q r-> let 
	prs = drsUniverse (p r)
	qrs = drsUniverse (q r)
	reflist = (prs ++ qrs ++ [r])
	pconds = drsCons (p r)
	qconds = drsCons (q r)
	conds = pconds ++ qconds
	in DRS (prs ++ qrs) conds
repDet Gone = repDet Ga_Det
repDet Gsome_Det = repDet Ga_Det
repDet GtheSg_Det = repDet Ga_Det
repDet Gsome_pl_Det = repDet Gsome_Det
repDet GthePlural_Det =  repDet Gsome_pl_Det
repDet Gfive	= repDet Gsome_pl_Det
repDet (GApos owner) = \p q r -> let 
	DRS prs pconds = p r
	DRS qrs qconds = q r
	conds = pconds ++ qconds
	r' = head qrs
	in repNP owner (\owner_ref -> let 
	ownership_conds =  Rel (DRSRel "have") [owner_ref, r] : conds
	in DRS (owner_ref : qrs) ownership_conds ) (newR r')
repDet (GApos_pl owner) = repDet (GApos owner)

repMassDet :: GMassDet -> (DRSRef -> DRS) -> (DRSRef -> DRS) -> DRSRef -> DRS
repMassDet Gzero_Det_sg  = \ p q r-> let 
	prs = drsUniverse (p r)
	qrs = drsUniverse (q r)
	reflist = (prs ++ qrs ++ [r])
	pconds = drsCons (p r)
	qconds = drsCons (q r)
	conds = pconds ++ qconds
	in DRS qrs conds
repMassDet Gthe_mass_Det = repMassDet Gzero_Det_sg
repMassDet (GMassApos owner) = \p q r -> let 
	DRS prs pconds = p r
	DRS qrs qconds = q r
	conds = pconds ++ qconds
	r' = head qrs
	in repNP owner (\owner_ref -> let 
	ownership_conds =  Rel (DRSRel "have") [owner_ref, r] : conds
	in DRS (owner_ref : qrs) ownership_conds ) (newR r')

repN :: GN -> DRSRef -> DRS
repN name = \r -> let
	conds = [Rel (DRSRel (lin name)) [r]]
	in DRS [r] conds
repN2 :: GN2 -> DRSRef -> DRS
repN2 name	= \r -> let
	conds = [Rel (DRSRel (lin name)) [r]]
	in DRS [r] conds

repCN :: GCN -> DRSRef -> DRS
repCN (GKind ap cn) = \r -> let
	DRS thing_refs thing_conds = (repCN cn r)
	DRS attri_refs attri_conds = (repAP ap r)
	in DRS (thing_refs ++ attri_refs) (thing_conds ++ attri_conds)
repCN (GOfpart part n) = repN n
repCN (GOfpos n2 np) = \thing -> let
	DRS refs conds = repN2 n2 thing in
	repNP np (\owner -> let
	newconds = Rel (DRSRel "have") [owner, thing] : conds
	in DRS [owner] newconds ) (newR thing)
repCN name	= \r -> let 
	conds = [Rel (DRSRel (lin name)) [r]]
	in DRS [r] conds

repAP :: GAP -> DRSRef -> DRS
repAP (GAdvAdj _ a) = \r -> DRS [r] [Rel (DRSRel (lin a)) [r]]
repAP ap = \r -> DRS [r] [Rel (DRSRel (lin ap)) [r]]

repPlace :: GPlace -> (DRSRef-> DRS) -> DRSRef -> DRS
repPlace (GLocation _ (GPlaceKind _ name)) = \p place -> let
	es = [place]
	newrefs = drsUniverse (p place)
	rs = ( newrefs ++ es)
	conds = (Rel (DRSRel (lin name)) [place]) : drsCons (p place)
	in DRS rs conds
repPlace (GLocation _ name) = \p place -> let
	es = [place]
	newrefs = drsUniverse (p place)
	rs = ( newrefs ++ es)
	conds = (Rel (DRSRel (lin name)) [place]) : drsCons (p place)
	in DRS rs conds

repVP :: GVP -> DRSRef -> DRS
repVP (GWithCl vp _) = repVP vp
repVP (GWithPlace vp _) = repVP vp
repVP (GWithStyle vp _) = repVP vp
repVP (GWithTime vp _) = repVP vp
repVP (GBe_vp comp) = case comp of
	(GBe_someone np) -> \r -> repNP np
		(\hyper -> DRS [r] [] ) r
	GBe_bad ap -> repAP ap
	GBe_somewhere (GLocating prep place) -> \situatee -> let
		es = [situatee]
		us = newDRSRefs [situatee] es
		r' = head us in
		repPlace place (\name -> let
		conds = [ Rel (DRSRel (lin prep)) [situatee, name]]
		in DRS [name, situatee] conds
		) r'
repVP (GLook_bad v ap) = \patient -> let
	DRS rs conds = repAP ap patient
	look_conds = [Rel (DRSRel (lin v)) [patient, DRSRef "p"]
		, Prop (DRSRef "p") (DRS [] conds)]
	in DRS [patient] look_conds
repVP (GHappening v) = \r -> let
	conds =  [Rel (DRSRel (lin v)) [r]]
	in DRS [r] conds
repVP (GChanging v obj) = \agent -> let
	in repNP obj (\patient -> let
	conds = [Rel (DRSRel (lin v)) [agent, patient]]
	in DRS [patient, agent] conds ) (newR agent)
repVP (GTriangulating v obj1 obj2) =
	\agent -> repNP obj1
		(\theme -> repNP obj2
			(\recipient -> let
			conds = [Rel (DRSRel (lin v)) [agent, theme, recipient]]
		in DRS [recipient, theme, agent] conds ) (newR theme) ) (newR agent)
repVP (GPositing v0 (GPosS (GSentence np vp))) = case vp of
	(GBe_vp comp) -> case comp of
		(GBe_someone subjcomp ) -> \positer -> 
			repNP np (\referent ->
			repNP subjcomp (\hyper -> let
				cond = [Rel (DRSRel (lin v0)) [positer, DRSRef "p"]
					, Prop (DRSRef "p") (DRS []
					[Rel (DRSRel (linNP subjcomp)) [referent] ])]
				in DRS [hyper, referent, positer] cond )
						(newR referent) ) (newR positer)
	(GIntens vv vp2) -> case vp2 of
		(GChanging v obj) -> \positer -> 
			repNP np (\referent ->
			repNP obj (\theme -> let
			conds = [Rel (DRSRel (lin v0)) [positer, DRSRef "p"]
				, Prop (DRSRef "p") (DRS [] [Rel (DRSRel (lin v))
				[referent, theme]])]
			in DRS [theme, referent, positer] conds )
			(newR referent) ) (newR positer)
repVP (GPositing v0 (GNegS (GSentence np vp))) = case vp of
	(GIntens vv vp2) -> case vp2 of
		(GChanging v obj) -> \positer -> 
			repNP np (\referent ->
			repNP obj (\theme -> let
			conds = [Rel (DRSRel (lin v0)) [positer, DRSRef "p"]
				, Prop (DRSRef "p") (DRS [] [Neg (DRS [] [Rel (DRSRel (lin v))
				[referent, theme]])])]
			in DRS [theme, referent, positer] conds )
			(newR referent) ) (newR positer)

repW :: GIP -> (DRSRef -> DRS) -> DRSRef -> DRS
repW Gwho_WH p who = let 
	DRS refs conds = p who
	newconds = Rel (DRSRel "person") [who] : conds
	in DRS refs newconds
repW Gwhat_WH p what = let 
	DRS refs conds = p what
	newconds = Rel (DRSRel "thing") [what] : conds
	in DRS refs newconds
