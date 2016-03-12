module Drunk_driving where

import PGF hiding (Tree)
import qualified PGF
----------------------------------------------------
-- automatic translation from GF to Haskell
----------------------------------------------------

class Gf a where
  gf :: a -> PGF.Tree
  fg :: PGF.Tree -> a

newtype GString = GString String  deriving Show

instance Gf GString where
  gf (GString x) = mkStr x
  fg t =
    case unStr t of
      Just x  ->  GString x
      Nothing -> error ("no GString " ++ show t)

newtype GInt = GInt Int  deriving Show

instance Gf GInt where
  gf (GInt x) = mkInt x
  fg t =
    case unInt t of
      Just x  ->  GInt x
      Nothing -> error ("no GInt " ++ show t)

newtype GFloat = GFloat Double  deriving Show

instance Gf GFloat where
  gf (GFloat x) = mkDouble x
  fg t =
    case unDouble t of
      Just x  ->  GFloat x
      Nothing -> error ("no GFloat " ++ show t)

----------------------------------------------------
-- below this line machine-generated
----------------------------------------------------

data GAP =
   GAdjModified GAP GVP 
 | GAdvAdj GAdA GAP 
 | GAs_as GAP GNP 
 | GCloseAP GConj GListAP 
 | GComparaAP GA GNP 
 | GComparaS GAP GS 
 | GConjAP GConj GListAP 
 | GMore GA 
 | Gdrunk 
 | Glittle 
 | Gsorry 
 | Gthree_year_old 
  deriving Show

data GAdV = GConjAdV GConj GListAdV 
  deriving Show

data GAdv =
   GComparaAdv GCAdv GA GNP 
 | GConjAdv GConj GListAdv 
 | GVery_Adv GAdv 
 | Ga_long_time 
 | Gagain 
 | Gevery_month 
 | Gfor_eight_months 
 | Gfour_times 
 | Gfrom_an_afternoon_party 
 | Ghome 
 | Gin_the_past_ten_years 
 | Gnever 
 | Gon_a_tricycle 
 | Gon_february_nine 
 | Gon_july_10 
  deriving Show

data GCAdv = Gmore 
  deriving Show

data GCN =
   GConjCN GConj GListCN 
 | GKind GAP GCN 
 | GKindInPlace GCN GLocated 
 | GKindOfKind GCN GAdv 
 | GMassModInf GN GVP 
 | GModInf GCN GVP 
 | GModified GCN GRCl 
 | GOfpart GPartitive GN 
 | GOfpos GN2 GNP 
 | Galcoholic 
 | Gentity 
 | Ggirl 
 | Ghospital 
 | Gparents 
 | Gperson 
 | Gthing 
  deriving Show

data GCl =
   GMembership GDet GCN GLocated 
 | GSentence GNP GVP 
  deriving Show

data GClSlash = GVPClSlash GNP GVPSlash 
  deriving Show

data GCoagentPrep = Gwith_prep 
  deriving Show

data GComp =
   GBe_bad GAP 
 | GBe_someone GNP 
 | GBe_somewhere GLocated 
  deriving Show

data GConj =
   Gand_Conj 
 | Gor_Conj 
  deriving Show

data GDet =
   GApos GNP 
 | GApos_pl GNP 
 | GConjDet GConj GListDAP 
 | Ga_Det 
 | Ghe_Det 
 | Gher_Det 
 | Gits 
 | Gno_Det 
 | Gno_pl_Det 
 | Gsome_Det 
 | Gsome_pl_Det 
 | GthePlural_Det 
 | GtheSg_Det 
 | Gzero_Det_pl 
  deriving Show

data GIAdv = GConjIAdv GConj GListIAdv 
  deriving Show

data GIP =
   GWHose GCN 
 | Gwhat_WH 
 | Gwho_WH 
  deriving Show

data GInstrumentPrep = Gby 
  deriving Show

data GListAP =
   GAPList GAP GAP 
 | GAddAP GAP GListAP 
 | GBaseAP GAP GAP 
 | GConsAP GAP GListAP 
  deriving Show

newtype GListAdV = GListAdV [GAdV] deriving Show

newtype GListAdv = GListAdv [GAdv] deriving Show

newtype GListCN = GListCN [GCN] deriving Show

newtype GListDAP = GListDAP [GDAP] deriving Show

newtype GListIAdv = GListIAdv [GIAdv] deriving Show

data GListNP =
   GAddList GNP GListNP 
 | GBaseNP GNP GNP 
 | GConsNP GNP GListNP 
 | GList GNP GNP 
  deriving Show

newtype GListRS = GListRS [GRS] deriving Show

newtype GListS = GListS [GS] deriving Show

data GLocPrep =
   Gat_prep 
 | Gin_prep 
 | Gon_prep 
 | Gto_prep 
  deriving Show

data GLocated = GLocating GLocPrep GPlace 
  deriving Show

data GMassDet =
   GMassApos GNP 
 | Gher_MassDet 
 | Gsome_mass_Det 
 | Gthe_mass_Det 
 | Gzero_Det_sg 
  deriving Show

data GMotion = Ggo 
  deriving Show

data GN =
   Gdrunk_driving 
 | Gmoney 
 | Gpolice 
  deriving Show

data GNP =
   GCloseList GConj GListNP 
 | GConjNP GConj GListNP 
 | GEntity GPN 
 | GItem GDet GCN 
 | GMassItem GMassDet GN 
 | GPredetItem GPredet GNP 
 | GTitular GTitle 
 | Ghe 
 | Git 
 | Gno_NP 
 | Gno_pl_NP 
 | Gshe 
 | Gsome_NP 
 | Gsome_pl_NP 
  deriving Show

data GPN = Gmrs_tipton 
  deriving Show

data GPP_coagent = GCoagency GCoagentPrep GNP 
  deriving Show

data GPP_instrument = GInstrumenting GInstrumentPrep GNP 
  deriving Show

data GPeriod = GPeriodAdv GTimes 
  deriving Show

data GPlace =
   GLocation GDet GPlaceName 
 | Ghospital_place 
  deriving Show

data GPlaceName =
   GPlaceKind GAP GPlaceName 
 | Ghospital_name 
  deriving Show

data GPredet = Gsome_Predet 
  deriving Show

data GPrep =
   Gabout_prep 
 | Gas_prep 
 | Gbefore_prep 
 | Gfrom_prep 
 | Glike_prep 
 | Gof_prep 
 | Gover_prep 
 | Gpart_prep 
 | Gto 
 | Gup_prep 
  deriving Show

data GQCl =
   GTagComp GNP GComp 
 | GTagModal GNP GVV GVP 
 | GTagQ GNP GVP 
 | GWH_ClSlash GIP GClSlash 
 | GWH_Pred GIP GVP 
 | GYN GCl 
  deriving Show

data GQS =
   GICompS GIComp GNP 
 | GNegQ GQCl 
 | GPosQ GQCl 
  deriving Show

data GRCl =
   GEmptyRel GClSlash 
 | GObjRel GRP GClSlash 
 | GSubjRel GRP GVP 
  deriving Show

data GRP =
   GIdRP 
 | Gthat_RP 
  deriving Show

data GRS = GConjRS GConj GListRS 
  deriving Show

data GS =
   GConjS GConj GListS 
 | GNegS GCl 
 | GPosS GCl 
  deriving Show

data GSC = GInject GInterj 
  deriving Show

data GSubj =
   Gbecause_Subj 
 | Gif_Subj 
  deriving Show

data GSubordCl = GSubjunct GSubj GS 
  deriving Show

data GTime = GFreqAdv GNP GPeriod 
  deriving Show

data GTimes = GTiming GDet GTimeName 
  deriving Show

data GUtt =
   GAnswer GNP 
 | GNo 
 | GNoAnswer 
 | GQUt GQS 
 | GUt GS 
 | GYes 
  deriving Show

data GV = Gdrink 
  deriving Show

data GV2 =
   Garrest 
 | Gbecome 
 | Gdrive 
 | Ghave 
 | Ghit 
 | Gknow_V2 
  deriving Show

data GV3 = Gpay 
  deriving Show

data GVP =
   GBe_vp GComp 
 | GChanging GV2 GNP 
 | GHappening GV 
 | GIntens GVV GVP 
 | GLook_bad GVA GAP 
 | GPass GVPSlash 
 | GToPlace GMotion GLocated 
 | GV_NP_AP GV2A GNP GAP 
 | GV_NP_NP GV3 GNP GNP 
 | GV_NP_S GV2S GNP GS 
 | GV_NP_VP GV2V GNP GVP 
 | GV_NP_that_S GV2S GNP GS 
 | GV_NP_whether_S GV2Q GNP GQS 
 | GV_PP_coagent GV GPP_coagent 
 | GV_PP_instrument GVP GPP_instrument 
 | GV_PP_manner GVP GAdv 
 | GV_S GVS GS 
 | GV_SC GVS GSC 
 | GV_that_S GVS GS 
 | GWithCl GVP GSubordCl 
 | GWithPlace GV GLocated 
 | GWithTime GVP GPeriod 
  deriving Show

data GVPSlash =
   GV2ASlash GV2A GAP 
 | GV2Slash GV2 
 | GV2VSlash GV2V GVP 
 | GV3Slash GV3 GNP 
  deriving Show

data GVS =
   Gknow_VS 
 | Gsay 
  deriving Show

data GVV =
   Gcan 
 | Gpromise 
  deriving Show

data GA

data GA2

data GAdA

data GAdN

data GAnt

data GCard

data GDAP

data GDigits

data GIComp

data GIDet

data GIQuant

data GImp

data GInterj

data GN2

data GN3

data GNum

data GNumeral

data GOrd

data GPConj

data GPartitive

data GPhr

data GPol

data GPron

data GQuant

data GSSlash

data GTemp

data GTense

data GText

data GTimeName

data GTitle

data GV2A

data GV2Q

data GV2S

data GV2V

data GVA

data GVQ

data GVoc


instance Gf GAP where
  gf (GAdjModified x1 x2) = mkApp (mkCId "AdjModified") [gf x1, gf x2]
  gf (GAdvAdj x1 x2) = mkApp (mkCId "AdvAdj") [gf x1, gf x2]
  gf (GAs_as x1 x2) = mkApp (mkCId "As_as") [gf x1, gf x2]
  gf (GCloseAP x1 x2) = mkApp (mkCId "CloseAP") [gf x1, gf x2]
  gf (GComparaAP x1 x2) = mkApp (mkCId "ComparaAP") [gf x1, gf x2]
  gf (GComparaS x1 x2) = mkApp (mkCId "ComparaS") [gf x1, gf x2]
  gf (GConjAP x1 x2) = mkApp (mkCId "ConjAP") [gf x1, gf x2]
  gf (GMore x1) = mkApp (mkCId "More") [gf x1]
  gf Gdrunk = mkApp (mkCId "drunk") []
  gf Glittle = mkApp (mkCId "little") []
  gf Gsorry = mkApp (mkCId "sorry") []
  gf Gthree_year_old = mkApp (mkCId "three_year_old") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AdjModified" -> GAdjModified (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "AdvAdj" -> GAdvAdj (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "As_as" -> GAs_as (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "CloseAP" -> GCloseAP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComparaAP" -> GComparaAP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComparaS" -> GComparaS (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ConjAP" -> GConjAP (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "More" -> GMore (fg x1)
      Just (i,[]) | i == mkCId "drunk" -> Gdrunk 
      Just (i,[]) | i == mkCId "little" -> Glittle 
      Just (i,[]) | i == mkCId "sorry" -> Gsorry 
      Just (i,[]) | i == mkCId "three_year_old" -> Gthree_year_old 


      _ -> error ("no AP " ++ show t)

instance Gf GAdV where
  gf (GConjAdV x1 x2) = mkApp (mkCId "ConjAdV") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjAdV" -> GConjAdV (fg x1) (fg x2)


      _ -> error ("no AdV " ++ show t)

instance Gf GAdv where
  gf (GComparaAdv x1 x2 x3) = mkApp (mkCId "ComparaAdv") [gf x1, gf x2, gf x3]
  gf (GConjAdv x1 x2) = mkApp (mkCId "ConjAdv") [gf x1, gf x2]
  gf (GVery_Adv x1) = mkApp (mkCId "Very_Adv") [gf x1]
  gf Ga_long_time = mkApp (mkCId "a_long_time") []
  gf Gagain = mkApp (mkCId "again") []
  gf Gevery_month = mkApp (mkCId "every_month") []
  gf Gfor_eight_months = mkApp (mkCId "for_eight_months") []
  gf Gfour_times = mkApp (mkCId "four_times") []
  gf Gfrom_an_afternoon_party = mkApp (mkCId "from_an_afternoon_party") []
  gf Ghome = mkApp (mkCId "home") []
  gf Gin_the_past_ten_years = mkApp (mkCId "in_the_past_ten_years") []
  gf Gnever = mkApp (mkCId "never") []
  gf Gon_a_tricycle = mkApp (mkCId "on_a_tricycle") []
  gf Gon_february_nine = mkApp (mkCId "on_february_nine") []
  gf Gon_july_10 = mkApp (mkCId "on_july_10") []

  fg t =
    case unApp t of
      Just (i,[x1,x2,x3]) | i == mkCId "ComparaAdv" -> GComparaAdv (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "ConjAdv" -> GConjAdv (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Very_Adv" -> GVery_Adv (fg x1)
      Just (i,[]) | i == mkCId "a_long_time" -> Ga_long_time 
      Just (i,[]) | i == mkCId "again" -> Gagain 
      Just (i,[]) | i == mkCId "every_month" -> Gevery_month 
      Just (i,[]) | i == mkCId "for_eight_months" -> Gfor_eight_months 
      Just (i,[]) | i == mkCId "four_times" -> Gfour_times 
      Just (i,[]) | i == mkCId "from_an_afternoon_party" -> Gfrom_an_afternoon_party 
      Just (i,[]) | i == mkCId "home" -> Ghome 
      Just (i,[]) | i == mkCId "in_the_past_ten_years" -> Gin_the_past_ten_years 
      Just (i,[]) | i == mkCId "never" -> Gnever 
      Just (i,[]) | i == mkCId "on_a_tricycle" -> Gon_a_tricycle 
      Just (i,[]) | i == mkCId "on_february_nine" -> Gon_february_nine 
      Just (i,[]) | i == mkCId "on_july_10" -> Gon_july_10 


      _ -> error ("no Adv " ++ show t)

instance Gf GCAdv where
  gf Gmore = mkApp (mkCId "more") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "more" -> Gmore 


      _ -> error ("no CAdv " ++ show t)

instance Gf GCN where
  gf (GConjCN x1 x2) = mkApp (mkCId "ConjCN") [gf x1, gf x2]
  gf (GKind x1 x2) = mkApp (mkCId "Kind") [gf x1, gf x2]
  gf (GKindInPlace x1 x2) = mkApp (mkCId "KindInPlace") [gf x1, gf x2]
  gf (GKindOfKind x1 x2) = mkApp (mkCId "KindOfKind") [gf x1, gf x2]
  gf (GMassModInf x1 x2) = mkApp (mkCId "MassModInf") [gf x1, gf x2]
  gf (GModInf x1 x2) = mkApp (mkCId "ModInf") [gf x1, gf x2]
  gf (GModified x1 x2) = mkApp (mkCId "Modified") [gf x1, gf x2]
  gf (GOfpart x1 x2) = mkApp (mkCId "Ofpart") [gf x1, gf x2]
  gf (GOfpos x1 x2) = mkApp (mkCId "Ofpos") [gf x1, gf x2]
  gf Galcoholic = mkApp (mkCId "alcoholic") []
  gf Gentity = mkApp (mkCId "entity") []
  gf Ggirl = mkApp (mkCId "girl") []
  gf Ghospital = mkApp (mkCId "hospital") []
  gf Gparents = mkApp (mkCId "parents") []
  gf Gperson = mkApp (mkCId "person") []
  gf Gthing = mkApp (mkCId "thing") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjCN" -> GConjCN (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Kind" -> GKind (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "KindInPlace" -> GKindInPlace (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "KindOfKind" -> GKindOfKind (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "MassModInf" -> GMassModInf (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ModInf" -> GModInf (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Modified" -> GModified (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Ofpart" -> GOfpart (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Ofpos" -> GOfpos (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "alcoholic" -> Galcoholic 
      Just (i,[]) | i == mkCId "entity" -> Gentity 
      Just (i,[]) | i == mkCId "girl" -> Ggirl 
      Just (i,[]) | i == mkCId "hospital" -> Ghospital 
      Just (i,[]) | i == mkCId "parents" -> Gparents 
      Just (i,[]) | i == mkCId "person" -> Gperson 
      Just (i,[]) | i == mkCId "thing" -> Gthing 


      _ -> error ("no CN " ++ show t)

instance Gf GCl where
  gf (GMembership x1 x2 x3) = mkApp (mkCId "Membership") [gf x1, gf x2, gf x3]
  gf (GSentence x1 x2) = mkApp (mkCId "Sentence") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2,x3]) | i == mkCId "Membership" -> GMembership (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "Sentence" -> GSentence (fg x1) (fg x2)


      _ -> error ("no Cl " ++ show t)

instance Gf GClSlash where
  gf (GVPClSlash x1 x2) = mkApp (mkCId "VPClSlash") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "VPClSlash" -> GVPClSlash (fg x1) (fg x2)


      _ -> error ("no ClSlash " ++ show t)

instance Gf GCoagentPrep where
  gf Gwith_prep = mkApp (mkCId "with_prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "with_prep" -> Gwith_prep 


      _ -> error ("no CoagentPrep " ++ show t)

instance Gf GComp where
  gf (GBe_bad x1) = mkApp (mkCId "Be_bad") [gf x1]
  gf (GBe_someone x1) = mkApp (mkCId "Be_someone") [gf x1]
  gf (GBe_somewhere x1) = mkApp (mkCId "Be_somewhere") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Be_bad" -> GBe_bad (fg x1)
      Just (i,[x1]) | i == mkCId "Be_someone" -> GBe_someone (fg x1)
      Just (i,[x1]) | i == mkCId "Be_somewhere" -> GBe_somewhere (fg x1)


      _ -> error ("no Comp " ++ show t)

instance Gf GConj where
  gf Gand_Conj = mkApp (mkCId "and_Conj") []
  gf Gor_Conj = mkApp (mkCId "or_Conj") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "and_Conj" -> Gand_Conj 
      Just (i,[]) | i == mkCId "or_Conj" -> Gor_Conj 


      _ -> error ("no Conj " ++ show t)

instance Gf GDet where
  gf (GApos x1) = mkApp (mkCId "Apos") [gf x1]
  gf (GApos_pl x1) = mkApp (mkCId "Apos_pl") [gf x1]
  gf (GConjDet x1 x2) = mkApp (mkCId "ConjDet") [gf x1, gf x2]
  gf Ga_Det = mkApp (mkCId "a_Det") []
  gf Ghe_Det = mkApp (mkCId "he_Det") []
  gf Gher_Det = mkApp (mkCId "her_Det") []
  gf Gits = mkApp (mkCId "its") []
  gf Gno_Det = mkApp (mkCId "no_Det") []
  gf Gno_pl_Det = mkApp (mkCId "no_pl_Det") []
  gf Gsome_Det = mkApp (mkCId "some_Det") []
  gf Gsome_pl_Det = mkApp (mkCId "some_pl_Det") []
  gf GthePlural_Det = mkApp (mkCId "thePlural_Det") []
  gf GtheSg_Det = mkApp (mkCId "theSg_Det") []
  gf Gzero_Det_pl = mkApp (mkCId "zero_Det_pl") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Apos" -> GApos (fg x1)
      Just (i,[x1]) | i == mkCId "Apos_pl" -> GApos_pl (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ConjDet" -> GConjDet (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "a_Det" -> Ga_Det 
      Just (i,[]) | i == mkCId "he_Det" -> Ghe_Det 
      Just (i,[]) | i == mkCId "her_Det" -> Gher_Det 
      Just (i,[]) | i == mkCId "its" -> Gits 
      Just (i,[]) | i == mkCId "no_Det" -> Gno_Det 
      Just (i,[]) | i == mkCId "no_pl_Det" -> Gno_pl_Det 
      Just (i,[]) | i == mkCId "some_Det" -> Gsome_Det 
      Just (i,[]) | i == mkCId "some_pl_Det" -> Gsome_pl_Det 
      Just (i,[]) | i == mkCId "thePlural_Det" -> GthePlural_Det 
      Just (i,[]) | i == mkCId "theSg_Det" -> GtheSg_Det 
      Just (i,[]) | i == mkCId "zero_Det_pl" -> Gzero_Det_pl 


      _ -> error ("no Det " ++ show t)

instance Gf GIAdv where
  gf (GConjIAdv x1 x2) = mkApp (mkCId "ConjIAdv") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjIAdv" -> GConjIAdv (fg x1) (fg x2)


      _ -> error ("no IAdv " ++ show t)

instance Gf GIP where
  gf (GWHose x1) = mkApp (mkCId "WHose") [gf x1]
  gf Gwhat_WH = mkApp (mkCId "what_WH") []
  gf Gwho_WH = mkApp (mkCId "who_WH") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "WHose" -> GWHose (fg x1)
      Just (i,[]) | i == mkCId "what_WH" -> Gwhat_WH 
      Just (i,[]) | i == mkCId "who_WH" -> Gwho_WH 


      _ -> error ("no IP " ++ show t)

instance Gf GInstrumentPrep where
  gf Gby = mkApp (mkCId "by") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "by" -> Gby 


      _ -> error ("no InstrumentPrep " ++ show t)

instance Gf GListAP where
  gf (GAPList x1 x2) = mkApp (mkCId "APList") [gf x1, gf x2]
  gf (GAddAP x1 x2) = mkApp (mkCId "AddAP") [gf x1, gf x2]
  gf (GBaseAP x1 x2) = mkApp (mkCId "BaseAP") [gf x1, gf x2]
  gf (GConsAP x1 x2) = mkApp (mkCId "ConsAP") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "APList" -> GAPList (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "AddAP" -> GAddAP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "BaseAP" -> GBaseAP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ConsAP" -> GConsAP (fg x1) (fg x2)


      _ -> error ("no ListAP " ++ show t)

instance Gf GListAdV where
  gf (GListAdV [x1,x2]) = mkApp (mkCId "BaseAdV") [gf x1, gf x2]
  gf (GListAdV (x:xs)) = mkApp (mkCId "ConsAdV") [gf x, gf (GListAdV xs)]
  fg t =
    GListAdV (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseAdV" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsAdV" -> fg x1 : fgs x2


      _ -> error ("no ListAdV " ++ show t)

instance Gf GListAdv where
  gf (GListAdv [x1,x2]) = mkApp (mkCId "BaseAdv") [gf x1, gf x2]
  gf (GListAdv (x:xs)) = mkApp (mkCId "ConsAdv") [gf x, gf (GListAdv xs)]
  fg t =
    GListAdv (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseAdv" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsAdv" -> fg x1 : fgs x2


      _ -> error ("no ListAdv " ++ show t)

instance Gf GListCN where
  gf (GListCN [x1,x2]) = mkApp (mkCId "BaseCN") [gf x1, gf x2]
  gf (GListCN (x:xs)) = mkApp (mkCId "ConsCN") [gf x, gf (GListCN xs)]
  fg t =
    GListCN (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseCN" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsCN" -> fg x1 : fgs x2


      _ -> error ("no ListCN " ++ show t)

instance Gf GListDAP where
  gf (GListDAP [x1,x2]) = mkApp (mkCId "BaseDAP") [gf x1, gf x2]
  gf (GListDAP (x:xs)) = mkApp (mkCId "ConsDAP") [gf x, gf (GListDAP xs)]
  fg t =
    GListDAP (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseDAP" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsDAP" -> fg x1 : fgs x2


      _ -> error ("no ListDAP " ++ show t)

instance Gf GListIAdv where
  gf (GListIAdv [x1,x2]) = mkApp (mkCId "BaseIAdv") [gf x1, gf x2]
  gf (GListIAdv (x:xs)) = mkApp (mkCId "ConsIAdv") [gf x, gf (GListIAdv xs)]
  fg t =
    GListIAdv (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseIAdv" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsIAdv" -> fg x1 : fgs x2


      _ -> error ("no ListIAdv " ++ show t)

instance Gf GListNP where
  gf (GAddList x1 x2) = mkApp (mkCId "AddList") [gf x1, gf x2]
  gf (GBaseNP x1 x2) = mkApp (mkCId "BaseNP") [gf x1, gf x2]
  gf (GConsNP x1 x2) = mkApp (mkCId "ConsNP") [gf x1, gf x2]
  gf (GList x1 x2) = mkApp (mkCId "List") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AddList" -> GAddList (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "BaseNP" -> GBaseNP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ConsNP" -> GConsNP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "List" -> GList (fg x1) (fg x2)


      _ -> error ("no ListNP " ++ show t)

instance Gf GListRS where
  gf (GListRS [x1,x2]) = mkApp (mkCId "BaseRS") [gf x1, gf x2]
  gf (GListRS (x:xs)) = mkApp (mkCId "ConsRS") [gf x, gf (GListRS xs)]
  fg t =
    GListRS (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseRS" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsRS" -> fg x1 : fgs x2


      _ -> error ("no ListRS " ++ show t)

instance Gf GListS where
  gf (GListS [x1,x2]) = mkApp (mkCId "BaseS") [gf x1, gf x2]
  gf (GListS (x:xs)) = mkApp (mkCId "ConsS") [gf x, gf (GListS xs)]
  fg t =
    GListS (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseS" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsS" -> fg x1 : fgs x2


      _ -> error ("no ListS " ++ show t)

instance Gf GLocPrep where
  gf Gat_prep = mkApp (mkCId "at_prep") []
  gf Gin_prep = mkApp (mkCId "in_prep") []
  gf Gon_prep = mkApp (mkCId "on_prep") []
  gf Gto_prep = mkApp (mkCId "to_prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "at_prep" -> Gat_prep 
      Just (i,[]) | i == mkCId "in_prep" -> Gin_prep 
      Just (i,[]) | i == mkCId "on_prep" -> Gon_prep 
      Just (i,[]) | i == mkCId "to_prep" -> Gto_prep 


      _ -> error ("no LocPrep " ++ show t)

instance Gf GLocated where
  gf (GLocating x1 x2) = mkApp (mkCId "Locating") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Locating" -> GLocating (fg x1) (fg x2)


      _ -> error ("no Located " ++ show t)

instance Gf GMassDet where
  gf (GMassApos x1) = mkApp (mkCId "MassApos") [gf x1]
  gf Gher_MassDet = mkApp (mkCId "her_MassDet") []
  gf Gsome_mass_Det = mkApp (mkCId "some_mass_Det") []
  gf Gthe_mass_Det = mkApp (mkCId "the_mass_Det") []
  gf Gzero_Det_sg = mkApp (mkCId "zero_Det_sg") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "MassApos" -> GMassApos (fg x1)
      Just (i,[]) | i == mkCId "her_MassDet" -> Gher_MassDet 
      Just (i,[]) | i == mkCId "some_mass_Det" -> Gsome_mass_Det 
      Just (i,[]) | i == mkCId "the_mass_Det" -> Gthe_mass_Det 
      Just (i,[]) | i == mkCId "zero_Det_sg" -> Gzero_Det_sg 


      _ -> error ("no MassDet " ++ show t)

instance Gf GMotion where
  gf Ggo = mkApp (mkCId "go") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "go" -> Ggo 


      _ -> error ("no Motion " ++ show t)

instance Gf GN where
  gf Gdrunk_driving = mkApp (mkCId "drunk_driving") []
  gf Gmoney = mkApp (mkCId "money") []
  gf Gpolice = mkApp (mkCId "police") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "drunk_driving" -> Gdrunk_driving 
      Just (i,[]) | i == mkCId "money" -> Gmoney 
      Just (i,[]) | i == mkCId "police" -> Gpolice 


      _ -> error ("no N " ++ show t)

instance Gf GNP where
  gf (GCloseList x1 x2) = mkApp (mkCId "CloseList") [gf x1, gf x2]
  gf (GConjNP x1 x2) = mkApp (mkCId "ConjNP") [gf x1, gf x2]
  gf (GEntity x1) = mkApp (mkCId "Entity") [gf x1]
  gf (GItem x1 x2) = mkApp (mkCId "Item") [gf x1, gf x2]
  gf (GMassItem x1 x2) = mkApp (mkCId "MassItem") [gf x1, gf x2]
  gf (GPredetItem x1 x2) = mkApp (mkCId "PredetItem") [gf x1, gf x2]
  gf (GTitular x1) = mkApp (mkCId "Titular") [gf x1]
  gf Ghe = mkApp (mkCId "he") []
  gf Git = mkApp (mkCId "it") []
  gf Gno_NP = mkApp (mkCId "no_NP") []
  gf Gno_pl_NP = mkApp (mkCId "no_pl_NP") []
  gf Gshe = mkApp (mkCId "she") []
  gf Gsome_NP = mkApp (mkCId "some_NP") []
  gf Gsome_pl_NP = mkApp (mkCId "some_pl_NP") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "CloseList" -> GCloseList (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ConjNP" -> GConjNP (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Entity" -> GEntity (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Item" -> GItem (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "MassItem" -> GMassItem (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "PredetItem" -> GPredetItem (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Titular" -> GTitular (fg x1)
      Just (i,[]) | i == mkCId "he" -> Ghe 
      Just (i,[]) | i == mkCId "it" -> Git 
      Just (i,[]) | i == mkCId "no_NP" -> Gno_NP 
      Just (i,[]) | i == mkCId "no_pl_NP" -> Gno_pl_NP 
      Just (i,[]) | i == mkCId "she" -> Gshe 
      Just (i,[]) | i == mkCId "some_NP" -> Gsome_NP 
      Just (i,[]) | i == mkCId "some_pl_NP" -> Gsome_pl_NP 


      _ -> error ("no NP " ++ show t)

instance Gf GPN where
  gf Gmrs_tipton = mkApp (mkCId "mrs_tipton") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "mrs_tipton" -> Gmrs_tipton 


      _ -> error ("no PN " ++ show t)

instance Gf GPP_coagent where
  gf (GCoagency x1 x2) = mkApp (mkCId "Coagency") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Coagency" -> GCoagency (fg x1) (fg x2)


      _ -> error ("no PP_coagent " ++ show t)

instance Gf GPP_instrument where
  gf (GInstrumenting x1 x2) = mkApp (mkCId "Instrumenting") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Instrumenting" -> GInstrumenting (fg x1) (fg x2)


      _ -> error ("no PP_instrument " ++ show t)

instance Gf GPeriod where
  gf (GPeriodAdv x1) = mkApp (mkCId "PeriodAdv") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "PeriodAdv" -> GPeriodAdv (fg x1)


      _ -> error ("no Period " ++ show t)

instance Gf GPlace where
  gf (GLocation x1 x2) = mkApp (mkCId "Location") [gf x1, gf x2]
  gf Ghospital_place = mkApp (mkCId "hospital_place") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Location" -> GLocation (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "hospital_place" -> Ghospital_place 


      _ -> error ("no Place " ++ show t)

instance Gf GPlaceName where
  gf (GPlaceKind x1 x2) = mkApp (mkCId "PlaceKind") [gf x1, gf x2]
  gf Ghospital_name = mkApp (mkCId "hospital_name") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "PlaceKind" -> GPlaceKind (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "hospital_name" -> Ghospital_name 


      _ -> error ("no PlaceName " ++ show t)

instance Gf GPredet where
  gf Gsome_Predet = mkApp (mkCId "some_Predet") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "some_Predet" -> Gsome_Predet 


      _ -> error ("no Predet " ++ show t)

instance Gf GPrep where
  gf Gabout_prep = mkApp (mkCId "about_prep") []
  gf Gas_prep = mkApp (mkCId "as_prep") []
  gf Gbefore_prep = mkApp (mkCId "before_prep") []
  gf Gfrom_prep = mkApp (mkCId "from_prep") []
  gf Glike_prep = mkApp (mkCId "like_prep") []
  gf Gof_prep = mkApp (mkCId "of_prep") []
  gf Gover_prep = mkApp (mkCId "over_prep") []
  gf Gpart_prep = mkApp (mkCId "part_prep") []
  gf Gto = mkApp (mkCId "to") []
  gf Gup_prep = mkApp (mkCId "up_prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "about_prep" -> Gabout_prep 
      Just (i,[]) | i == mkCId "as_prep" -> Gas_prep 
      Just (i,[]) | i == mkCId "before_prep" -> Gbefore_prep 
      Just (i,[]) | i == mkCId "from_prep" -> Gfrom_prep 
      Just (i,[]) | i == mkCId "like_prep" -> Glike_prep 
      Just (i,[]) | i == mkCId "of_prep" -> Gof_prep 
      Just (i,[]) | i == mkCId "over_prep" -> Gover_prep 
      Just (i,[]) | i == mkCId "part_prep" -> Gpart_prep 
      Just (i,[]) | i == mkCId "to" -> Gto 
      Just (i,[]) | i == mkCId "up_prep" -> Gup_prep 


      _ -> error ("no Prep " ++ show t)

instance Gf GQCl where
  gf (GTagComp x1 x2) = mkApp (mkCId "TagComp") [gf x1, gf x2]
  gf (GTagModal x1 x2 x3) = mkApp (mkCId "TagModal") [gf x1, gf x2, gf x3]
  gf (GTagQ x1 x2) = mkApp (mkCId "TagQ") [gf x1, gf x2]
  gf (GWH_ClSlash x1 x2) = mkApp (mkCId "WH_ClSlash") [gf x1, gf x2]
  gf (GWH_Pred x1 x2) = mkApp (mkCId "WH_Pred") [gf x1, gf x2]
  gf (GYN x1) = mkApp (mkCId "YN") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "TagComp" -> GTagComp (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "TagModal" -> GTagModal (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "TagQ" -> GTagQ (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WH_ClSlash" -> GWH_ClSlash (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WH_Pred" -> GWH_Pred (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "YN" -> GYN (fg x1)


      _ -> error ("no QCl " ++ show t)

instance Gf GQS where
  gf (GICompS x1 x2) = mkApp (mkCId "ICompS") [gf x1, gf x2]
  gf (GNegQ x1) = mkApp (mkCId "NegQ") [gf x1]
  gf (GPosQ x1) = mkApp (mkCId "PosQ") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ICompS" -> GICompS (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "NegQ" -> GNegQ (fg x1)
      Just (i,[x1]) | i == mkCId "PosQ" -> GPosQ (fg x1)


      _ -> error ("no QS " ++ show t)

instance Gf GRCl where
  gf (GEmptyRel x1) = mkApp (mkCId "EmptyRel") [gf x1]
  gf (GObjRel x1 x2) = mkApp (mkCId "ObjRel") [gf x1, gf x2]
  gf (GSubjRel x1 x2) = mkApp (mkCId "SubjRel") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "EmptyRel" -> GEmptyRel (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ObjRel" -> GObjRel (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "SubjRel" -> GSubjRel (fg x1) (fg x2)


      _ -> error ("no RCl " ++ show t)

instance Gf GRP where
  gf GIdRP = mkApp (mkCId "IdRP") []
  gf Gthat_RP = mkApp (mkCId "that_RP") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "IdRP" -> GIdRP 
      Just (i,[]) | i == mkCId "that_RP" -> Gthat_RP 


      _ -> error ("no RP " ++ show t)

instance Gf GRS where
  gf (GConjRS x1 x2) = mkApp (mkCId "ConjRS") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjRS" -> GConjRS (fg x1) (fg x2)


      _ -> error ("no RS " ++ show t)

instance Gf GS where
  gf (GConjS x1 x2) = mkApp (mkCId "ConjS") [gf x1, gf x2]
  gf (GNegS x1) = mkApp (mkCId "NegS") [gf x1]
  gf (GPosS x1) = mkApp (mkCId "PosS") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjS" -> GConjS (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "NegS" -> GNegS (fg x1)
      Just (i,[x1]) | i == mkCId "PosS" -> GPosS (fg x1)


      _ -> error ("no S " ++ show t)

instance Gf GSC where
  gf (GInject x1) = mkApp (mkCId "Inject") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Inject" -> GInject (fg x1)


      _ -> error ("no SC " ++ show t)

instance Gf GSubj where
  gf Gbecause_Subj = mkApp (mkCId "because_Subj") []
  gf Gif_Subj = mkApp (mkCId "if_Subj") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "because_Subj" -> Gbecause_Subj 
      Just (i,[]) | i == mkCId "if_Subj" -> Gif_Subj 


      _ -> error ("no Subj " ++ show t)

instance Gf GSubordCl where
  gf (GSubjunct x1 x2) = mkApp (mkCId "Subjunct") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Subjunct" -> GSubjunct (fg x1) (fg x2)


      _ -> error ("no SubordCl " ++ show t)

instance Gf GTime where
  gf (GFreqAdv x1 x2) = mkApp (mkCId "FreqAdv") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "FreqAdv" -> GFreqAdv (fg x1) (fg x2)


      _ -> error ("no Time " ++ show t)

instance Gf GTimes where
  gf (GTiming x1 x2) = mkApp (mkCId "Timing") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Timing" -> GTiming (fg x1) (fg x2)


      _ -> error ("no Times " ++ show t)

instance Gf GUtt where
  gf (GAnswer x1) = mkApp (mkCId "Answer") [gf x1]
  gf GNo = mkApp (mkCId "No") []
  gf GNoAnswer = mkApp (mkCId "NoAnswer") []
  gf (GQUt x1) = mkApp (mkCId "QUt") [gf x1]
  gf (GUt x1) = mkApp (mkCId "Ut") [gf x1]
  gf GYes = mkApp (mkCId "Yes") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Answer" -> GAnswer (fg x1)
      Just (i,[]) | i == mkCId "No" -> GNo 
      Just (i,[]) | i == mkCId "NoAnswer" -> GNoAnswer 
      Just (i,[x1]) | i == mkCId "QUt" -> GQUt (fg x1)
      Just (i,[x1]) | i == mkCId "Ut" -> GUt (fg x1)
      Just (i,[]) | i == mkCId "Yes" -> GYes 


      _ -> error ("no Utt " ++ show t)

instance Gf GV where
  gf Gdrink = mkApp (mkCId "drink") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "drink" -> Gdrink 


      _ -> error ("no V " ++ show t)

instance Gf GV2 where
  gf Garrest = mkApp (mkCId "arrest") []
  gf Gbecome = mkApp (mkCId "become") []
  gf Gdrive = mkApp (mkCId "drive") []
  gf Ghave = mkApp (mkCId "have") []
  gf Ghit = mkApp (mkCId "hit") []
  gf Gknow_V2 = mkApp (mkCId "know_V2") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "arrest" -> Garrest 
      Just (i,[]) | i == mkCId "become" -> Gbecome 
      Just (i,[]) | i == mkCId "drive" -> Gdrive 
      Just (i,[]) | i == mkCId "have" -> Ghave 
      Just (i,[]) | i == mkCId "hit" -> Ghit 
      Just (i,[]) | i == mkCId "know_V2" -> Gknow_V2 


      _ -> error ("no V2 " ++ show t)

instance Gf GV3 where
  gf Gpay = mkApp (mkCId "pay") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "pay" -> Gpay 


      _ -> error ("no V3 " ++ show t)

instance Gf GVP where
  gf (GBe_vp x1) = mkApp (mkCId "Be_vp") [gf x1]
  gf (GChanging x1 x2) = mkApp (mkCId "Changing") [gf x1, gf x2]
  gf (GHappening x1) = mkApp (mkCId "Happening") [gf x1]
  gf (GIntens x1 x2) = mkApp (mkCId "Intens") [gf x1, gf x2]
  gf (GLook_bad x1 x2) = mkApp (mkCId "Look_bad") [gf x1, gf x2]
  gf (GPass x1) = mkApp (mkCId "Pass") [gf x1]
  gf (GToPlace x1 x2) = mkApp (mkCId "ToPlace") [gf x1, gf x2]
  gf (GV_NP_AP x1 x2 x3) = mkApp (mkCId "V_NP_AP") [gf x1, gf x2, gf x3]
  gf (GV_NP_NP x1 x2 x3) = mkApp (mkCId "V_NP_NP") [gf x1, gf x2, gf x3]
  gf (GV_NP_S x1 x2 x3) = mkApp (mkCId "V_NP_S") [gf x1, gf x2, gf x3]
  gf (GV_NP_VP x1 x2 x3) = mkApp (mkCId "V_NP_VP") [gf x1, gf x2, gf x3]
  gf (GV_NP_that_S x1 x2 x3) = mkApp (mkCId "V_NP_that_S") [gf x1, gf x2, gf x3]
  gf (GV_NP_whether_S x1 x2 x3) = mkApp (mkCId "V_NP_whether_S") [gf x1, gf x2, gf x3]
  gf (GV_PP_coagent x1 x2) = mkApp (mkCId "V_PP_coagent") [gf x1, gf x2]
  gf (GV_PP_instrument x1 x2) = mkApp (mkCId "V_PP_instrument") [gf x1, gf x2]
  gf (GV_PP_manner x1 x2) = mkApp (mkCId "V_PP_manner") [gf x1, gf x2]
  gf (GV_S x1 x2) = mkApp (mkCId "V_S") [gf x1, gf x2]
  gf (GV_SC x1 x2) = mkApp (mkCId "V_SC") [gf x1, gf x2]
  gf (GV_that_S x1 x2) = mkApp (mkCId "V_that_S") [gf x1, gf x2]
  gf (GWithCl x1 x2) = mkApp (mkCId "WithCl") [gf x1, gf x2]
  gf (GWithPlace x1 x2) = mkApp (mkCId "WithPlace") [gf x1, gf x2]
  gf (GWithTime x1 x2) = mkApp (mkCId "WithTime") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Be_vp" -> GBe_vp (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Changing" -> GChanging (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Happening" -> GHappening (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Intens" -> GIntens (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Look_bad" -> GLook_bad (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Pass" -> GPass (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ToPlace" -> GToPlace (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_AP" -> GV_NP_AP (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_NP" -> GV_NP_NP (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_S" -> GV_NP_S (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_VP" -> GV_NP_VP (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_that_S" -> GV_NP_that_S (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_whether_S" -> GV_NP_whether_S (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "V_PP_coagent" -> GV_PP_coagent (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V_PP_instrument" -> GV_PP_instrument (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V_PP_manner" -> GV_PP_manner (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V_S" -> GV_S (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V_SC" -> GV_SC (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V_that_S" -> GV_that_S (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithCl" -> GWithCl (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithPlace" -> GWithPlace (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithTime" -> GWithTime (fg x1) (fg x2)


      _ -> error ("no VP " ++ show t)

instance Gf GVPSlash where
  gf (GV2ASlash x1 x2) = mkApp (mkCId "V2ASlash") [gf x1, gf x2]
  gf (GV2Slash x1) = mkApp (mkCId "V2Slash") [gf x1]
  gf (GV2VSlash x1 x2) = mkApp (mkCId "V2VSlash") [gf x1, gf x2]
  gf (GV3Slash x1 x2) = mkApp (mkCId "V3Slash") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "V2ASlash" -> GV2ASlash (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "V2Slash" -> GV2Slash (fg x1)
      Just (i,[x1,x2]) | i == mkCId "V2VSlash" -> GV2VSlash (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V3Slash" -> GV3Slash (fg x1) (fg x2)


      _ -> error ("no VPSlash " ++ show t)

instance Gf GVS where
  gf Gknow_VS = mkApp (mkCId "know_VS") []
  gf Gsay = mkApp (mkCId "say") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "know_VS" -> Gknow_VS 
      Just (i,[]) | i == mkCId "say" -> Gsay 


      _ -> error ("no VS " ++ show t)

instance Gf GVV where
  gf Gcan = mkApp (mkCId "can") []
  gf Gpromise = mkApp (mkCId "promise") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "can" -> Gcan 
      Just (i,[]) | i == mkCId "promise" -> Gpromise 


      _ -> error ("no VV " ++ show t)

instance Show GA

instance Gf GA where
  gf _ = undefined
  fg _ = undefined



instance Show GA2

instance Gf GA2 where
  gf _ = undefined
  fg _ = undefined



instance Show GAdA

instance Gf GAdA where
  gf _ = undefined
  fg _ = undefined



instance Show GAdN

instance Gf GAdN where
  gf _ = undefined
  fg _ = undefined



instance Show GAnt

instance Gf GAnt where
  gf _ = undefined
  fg _ = undefined



instance Show GCard

instance Gf GCard where
  gf _ = undefined
  fg _ = undefined



instance Show GDAP

instance Gf GDAP where
  gf _ = undefined
  fg _ = undefined



instance Show GDigits

instance Gf GDigits where
  gf _ = undefined
  fg _ = undefined



instance Show GIComp

instance Gf GIComp where
  gf _ = undefined
  fg _ = undefined



instance Show GIDet

instance Gf GIDet where
  gf _ = undefined
  fg _ = undefined



instance Show GIQuant

instance Gf GIQuant where
  gf _ = undefined
  fg _ = undefined



instance Show GImp

instance Gf GImp where
  gf _ = undefined
  fg _ = undefined



instance Show GInterj

instance Gf GInterj where
  gf _ = undefined
  fg _ = undefined



instance Show GN2

instance Gf GN2 where
  gf _ = undefined
  fg _ = undefined



instance Show GN3

instance Gf GN3 where
  gf _ = undefined
  fg _ = undefined



instance Show GNum

instance Gf GNum where
  gf _ = undefined
  fg _ = undefined



instance Show GNumeral

instance Gf GNumeral where
  gf _ = undefined
  fg _ = undefined



instance Show GOrd

instance Gf GOrd where
  gf _ = undefined
  fg _ = undefined



instance Show GPConj

instance Gf GPConj where
  gf _ = undefined
  fg _ = undefined



instance Show GPartitive

instance Gf GPartitive where
  gf _ = undefined
  fg _ = undefined



instance Show GPhr

instance Gf GPhr where
  gf _ = undefined
  fg _ = undefined



instance Show GPol

instance Gf GPol where
  gf _ = undefined
  fg _ = undefined



instance Show GPron

instance Gf GPron where
  gf _ = undefined
  fg _ = undefined



instance Show GQuant

instance Gf GQuant where
  gf _ = undefined
  fg _ = undefined



instance Show GSSlash

instance Gf GSSlash where
  gf _ = undefined
  fg _ = undefined



instance Show GTemp

instance Gf GTemp where
  gf _ = undefined
  fg _ = undefined



instance Show GTense

instance Gf GTense where
  gf _ = undefined
  fg _ = undefined



instance Show GText

instance Gf GText where
  gf _ = undefined
  fg _ = undefined



instance Show GTimeName

instance Gf GTimeName where
  gf _ = undefined
  fg _ = undefined



instance Show GTitle

instance Gf GTitle where
  gf _ = undefined
  fg _ = undefined



instance Show GV2A

instance Gf GV2A where
  gf _ = undefined
  fg _ = undefined



instance Show GV2Q

instance Gf GV2Q where
  gf _ = undefined
  fg _ = undefined



instance Show GV2S

instance Gf GV2S where
  gf _ = undefined
  fg _ = undefined



instance Show GV2V

instance Gf GV2V where
  gf _ = undefined
  fg _ = undefined



instance Show GVA

instance Gf GVA where
  gf _ = undefined
  fg _ = undefined



instance Show GVQ

instance Gf GVQ where
  gf _ = undefined
  fg _ = undefined



instance Show GVoc

instance Gf GVoc where
  gf _ = undefined
  fg _ = undefined




