module Kiss where

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
   GA_PP GA2 GNP 
 | GAdjModified GAP GVP 
 | GAdvAdj GAdA GAP 
 | GAs_as GAP GNP 
 | GCloseAP GConj GListAP 
 | GComparaAP GA GNP 
 | GComparaS GAP GS 
 | GConjAP GConj GListAP 
 | GMore GA 
 | GVP_AP GVP 
 | GVP_NP_AP GVPSlash GNP 
 | Gable 
 | Gdifferent 
 | Gearlier 
 | Gsecond 
  deriving Show

data GAdV = GConjAdV GConj GListAdV 
  deriving Show

data GAdv =
   GCloseAdv GConj GListAdv 
 | GComparaAdv GCAdv GA GNP 
 | GConjAdv GConj GListAdv 
 | GIn_order_to GVP 
 | GNot_Adv GAdv 
 | GTo_purpose GVP 
 | GVery_Adv GAdv 
 | Gnot 
  deriving Show

data GAdv_attribute = GAttributing GAttributePrep GNP 
  deriving Show

data GAdv_coagent = GCoagency GCoagentPrep GNP 
  deriving Show

data GAdv_extent = GExtenting GExtentPrep GNP 
  deriving Show

data GAdv_instrument = GInstrumenting GInstrumentPrep GNP 
  deriving Show

data GAdv_location = GLocating GLocPrep GPlace 
  deriving Show

data GAdv_manner =
   GByGerund GVP 
 | GMannering GMannerPrep GNP 
  deriving Show

data GAdv_patient = GPatienting GPatientPrep GNP 
  deriving Show

data GAdv_result = GResulting GResultPrep GNP 
  deriving Show

data GAdv_source = GSourcing GSourcePrep GNP 
  deriving Show

data GAdv_stimulus = GStimulating GStimulusPrep GNP 
  deriving Show

data GAdv_theme = GThemeing GThemePrep GNP 
  deriving Show

data GAdv_time =
   GTimeAsAdv GDet GTime 
 | GTimeAsAdvWithPredet GPredet GDet GTime 
 | GTiming GTimePrep GNP 
  deriving Show

data GCAdv = Gmore 
  deriving Show

data GCN =
   GCompoundCN GCN GCN 
 | GConjCN GConj GListCN 
 | GGerundSlash GVPSlash 
 | GKind GAP GCN 
 | GKindInPlace GCN GAdv_location 
 | GKindInTime GCN GAdv_time 
 | GKindOfKind GCN GAdv 
 | GKindToExtent GCN GAdv_extent 
 | GMassModInf GN GVP 
 | GModInf GCN GVP 
 | GModPass3 GCN GV3 GNP 
 | GModified GCN GRCl 
 | GN2toCN GN2 
 | GOfpart GPartitive GN 
 | GOfpos GN2 GNP 
 | Gcamera 
 | Gdisturbance 
 | Gentity 
 | Gperson 
 | Gpolice 
 | Greport_N 
 | Gtheater 
 | Gthing 
  deriving Show

data GCl =
   GExist GNP 
 | GMembership GDet GCN GAdv_location 
 | GSentence GNP GVP 
  deriving Show

data GClSlash = GSClSlash GNP GVPSlash 
  deriving Show

data GComp =
   GBe_AdV_NP GAdV GNP 
 | GBe_bad GAP 
 | GBe_coagent GAdv_coagent 
 | GBe_someone GNP 
 | GBe_somewhere GAdv_location 
 | GBe_theme GAdv_theme 
  deriving Show

data GConj =
   Gand 
 | Gbut 
 | Gor_CONJ 
  deriving Show

data GDet =
   GApos GNP 
 | GApos_pl GNP 
 | GConjDet GConj GListDAP 
 | Ga_DET 
 | Gevery_DET 
 | Gher_DET 
 | Ghis_DET 
 | Gits 
 | Gno_DET 
 | Gno_PL_DET 
 | Gsome_DET 
 | Gsome_PL_DET 
 | Gthe_PLURAL_DET 
 | Gthe_SG_DET 
 | Gtheir 
 | Gthis 
 | Gthose 
 | Gyour 
 | Gzero_Det_pl 
  deriving Show

data GIAdv =
   GConjIAdv GConj GListIAdv 
 | Ghow_WH 
  deriving Show

data GIDet =
   Gwhat_PL_IDET 
 | Gwhich_SG_IDET 
  deriving Show

data GIP =
   GIPhrase GIDet GCN 
 | GWHose GCN 
 | Gwhat_WH 
 | Gwho_WH 
  deriving Show

data GListAP =
   GAPList GAP GAP 
 | GAddAP GAP GListAP 
 | GBaseAP GAP GAP 
 | GConsAP GAP GListAP 
  deriving Show

newtype GListAdV = GListAdV [GAdV] deriving Show

data GListAdv =
   GAddAdv GAdv GListAdv 
 | GAdvList GAdv GAdv 
 | GBaseAdv GAdv GAdv 
 | GConsAdv GAdv GListAdv 
  deriving Show

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

data GLocPrep = Gat_PREP 
  deriving Show

data GMassDet =
   GMassApos GNP 
 | Gany_MASS_DET 
 | Gher_MASSDET 
 | Gno_MASSDET 
 | Gsome_MASS_DET 
 | Gthe_MASS_DET 
 | Gzero_Det_sg 
  deriving Show

data GN =
   GMassKind GAP GN 
 | GMassMod GN GRCl 
 | GPartN GV 
  deriving Show

data GN2 = Garrest_N 
  deriving Show

data GNP =
   GApposNP GNP GNP 
 | GCloseList GConj GListNP 
 | GComparaN GCAdv GCN GNP 
 | GConjNP GConj GListNP 
 | GDetRCltoNP GDet GRCl 
 | GDetVPtoNP GDet GVP 
 | GEntity GPN 
 | GGerund GVP 
 | GHowNP GCl 
 | GItem GDet GCN 
 | GMannered GNP GAdv_manner 
 | GMassItem GMassDet GN 
 | GNPInPlace GNP GAdv_location 
 | GNPPostPredet GNP GPredet 
 | GNomCl GNounCl 
 | GPredetItem GPredet GNP 
 | GSomething GAP 
 | GSourced GNP GAdv_source 
 | GThatNP GCl 
 | GThemed GNP GAdv_theme 
 | GTitular GTitle 
 | GWayNP GCl 
 | Geveryone_NP 
 | Ghe 
 | Git 
 | Gno_NP 
 | Gno_PL_NP 
 | Gshe 
 | Gsome_NP 
 | Gsome_PL_NP 
 | Gsomething 
 | Gthat_PRON 
 | Gthey 
 | Gthis_PRON 
 | Gwe 
 | Gyou 
  deriving Show

data GNounCl =
   GFreeICl GIP GVP 
 | GFreeIClSlash GIP GClSlash 
 | GFreeInfICl GIAdv GVP 
  deriving Show

data GPN =
   Gerykah 
 | Gmario 
 | Gshia 
  deriving Show

data GPlace =
   GLocation GDet GPlaceNoun 
 | GNamedPlace GPN 
  deriving Show

data GPlaceNoun = GPlaceKind GAP GPlaceNoun 
  deriving Show

data GPredet =
   Gall_PREDET 
 | Gsome_PREDET 
  deriving Show

data GPrep =
   Gabout_PREP 
 | Gbefore_PREP 
 | Gby 
 | Gfor 
 | Gfrom_PREP 
 | Gin_PREP 
 | Glike_PREP 
 | Gof_PREP 
 | Gpart_prep 
 | Gto 
 | Gup_PREP 
  deriving Show

data GQCl =
   GTagComp GNP GComp 
 | GTagModal GNP GVV GVP 
 | GTagQ GNP GVP 
 | GTagS GNP GVP 
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
 | GEmptyRelSlash GClSlash 
 | GObjRel GRP GClSlash 
 | GSubjRel GRP GVP 
  deriving Show

data GRP =
   Gin_which 
 | Gthat_RP 
 | Gwhen_RP 
 | Gwhere_RP 
 | Gwho_RP 
  deriving Show

data GRS = GConjRS GConj GListRS 
  deriving Show

data GS =
   GConcatS GConj GS GS 
 | GConjS GConj GListS 
 | GNegS GCl 
 | GPatientPre GAdv_patient GS 
 | GPosS GCl 
 | GSourcePre GAdv_source GS 
 | GThemePre GAdv_theme GS 
 | GTimePre GAdv_time GS 
 | GWithAdvPre GAdv GS 
 | GWithClPre GSubordCl GS 
  deriving Show

data GSC = GInject GInterj 
  deriving Show

data GSubj =
   Gas 
 | Gbecause_SUBJ 
 | Gif_SUBJ 
 | Gso_SUBJ 
 | Gwhen_SUBJ 
  deriving Show

data GSubordCl = GSubjunct GSubj GS 
  deriving Show

data GTime = GTimeInTime GTime GAdv_time 
  deriving Show

data GUtt =
   GAnswer GNP 
 | GNo 
 | GNoAnswer 
 | GPreConjUtt GConj GUtt 
 | GQUt GQS 
 | GUt GS 
 | GYes 
  deriving Show

data GV = Ggo 
  deriving Show

data GV2 =
   Garrest 
 | Gavoid 
 | Gcontinue 
 | Gcreate 
 | Gescape 
 | Gfind 
 | Ghave 
 | Ginterview 
 | Gkiss 
 | Gknow_V2 
 | Greport_V 
  deriving Show

data GV2V = Glet_V2V 
  deriving Show

data GVP =
   GAdV_VP GAdV GVP 
 | GBe_vp GComp 
 | GChanging GV2 GNP 
 | GGetPassV3 GV3 GNP 
 | GHappening GV 
 | GIntens GVV GVP 
 | GLook_bad GVA GAP 
 | GPass GVPSlash 
 | GPassAgent GVPSlash GNP 
 | GVPAlready GVP 
 | GVPToo GVP 
 | GVP_Adv_attribute GVP GAdv_attribute 
 | GVP_Adv_coagent GVP GAdv_coagent 
 | GVP_Adv_instrument GVP GAdv_instrument 
 | GVP_Adv_location GMotion GAdv_location 
 | GVP_Adv_manner GVP GAdv_manner 
 | GVP_Adv_result GVP GAdv_result 
 | GVP_Adv_stimulus GVP GAdv_stimulus 
 | GVP_Adv_theme GVP GAdv_theme 
 | GVP_Adv_time GVP GAdv_time 
 | GV_NP_AP GV2A GNP GAP 
 | GV_NP_NP GV3 GNP GNP 
 | GV_NP_S GV2S GNP GS 
 | GV_NP_VP GV2V GNP GVP 
 | GV_NP_that_S GV2S GNP GS 
 | GV_NP_whether_S GV2Q GNP GQS 
 | GV_S GVS GS 
 | GV_SC GVS GSC 
 | GV_that_S GVS GS 
 | GWithCl GVP GSubordCl 
 | GWithPlace GV GAdv_location 
 | Gpassive GV2 
 | Greflexive GVPSlash 
  deriving Show

data GVPSlash =
   GAdV_VPSlash GAdV GVPSlash 
 | GV2ASlash GV2A GAP 
 | GV2Slash GV2 
 | GV2VSlash GV2V GVP 
 | GV3Slash GV3 GNP 
  deriving Show

data GVS = Gknow_VS 
  deriving Show

data GVV =
   Gcan 
 | Gtry 
  deriving Show

data GA

data GA2

data GAdA

data GAdN

data GAnt

data GAttributePrep

data GCard

data GCoagentPrep

data GDAP

data GDigits

data GExtentPrep

data GIComp

data GIQuant

data GImp

data GInstrumentPrep

data GInterj

data GMannerPrep

data GMotion

data GN3

data GNum

data GNumeral

data GOrd

data GPConj

data GPartitive

data GPatientPrep

data GPhr

data GPol

data GPron

data GQuant

data GResultPrep

data GSSlash

data GSourcePrep

data GStimulusPrep

data GTemp

data GTense

data GText

data GThemePrep

data GTimePrep

data GTitle

data GV2A

data GV2Q

data GV2S

data GV3

data GVA

data GVQ

data GVoc


instance Gf GAP where
  gf (GA_PP x1 x2) = mkApp (mkCId "A_PP") [gf x1, gf x2]
  gf (GAdjModified x1 x2) = mkApp (mkCId "AdjModified") [gf x1, gf x2]
  gf (GAdvAdj x1 x2) = mkApp (mkCId "AdvAdj") [gf x1, gf x2]
  gf (GAs_as x1 x2) = mkApp (mkCId "As_as") [gf x1, gf x2]
  gf (GCloseAP x1 x2) = mkApp (mkCId "CloseAP") [gf x1, gf x2]
  gf (GComparaAP x1 x2) = mkApp (mkCId "ComparaAP") [gf x1, gf x2]
  gf (GComparaS x1 x2) = mkApp (mkCId "ComparaS") [gf x1, gf x2]
  gf (GConjAP x1 x2) = mkApp (mkCId "ConjAP") [gf x1, gf x2]
  gf (GMore x1) = mkApp (mkCId "More") [gf x1]
  gf (GVP_AP x1) = mkApp (mkCId "VP_AP") [gf x1]
  gf (GVP_NP_AP x1 x2) = mkApp (mkCId "VP_NP_AP") [gf x1, gf x2]
  gf Gable = mkApp (mkCId "able") []
  gf Gdifferent = mkApp (mkCId "different") []
  gf Gearlier = mkApp (mkCId "earlier") []
  gf Gsecond = mkApp (mkCId "second") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "A_PP" -> GA_PP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "AdjModified" -> GAdjModified (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "AdvAdj" -> GAdvAdj (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "As_as" -> GAs_as (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "CloseAP" -> GCloseAP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComparaAP" -> GComparaAP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComparaS" -> GComparaS (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ConjAP" -> GConjAP (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "More" -> GMore (fg x1)
      Just (i,[x1]) | i == mkCId "VP_AP" -> GVP_AP (fg x1)
      Just (i,[x1,x2]) | i == mkCId "VP_NP_AP" -> GVP_NP_AP (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "able" -> Gable 
      Just (i,[]) | i == mkCId "different" -> Gdifferent 
      Just (i,[]) | i == mkCId "earlier" -> Gearlier 
      Just (i,[]) | i == mkCId "second" -> Gsecond 


      _ -> error ("no AP " ++ show t)

instance Gf GAdV where
  gf (GConjAdV x1 x2) = mkApp (mkCId "ConjAdV") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjAdV" -> GConjAdV (fg x1) (fg x2)


      _ -> error ("no AdV " ++ show t)

instance Gf GAdv where
  gf (GCloseAdv x1 x2) = mkApp (mkCId "CloseAdv") [gf x1, gf x2]
  gf (GComparaAdv x1 x2 x3) = mkApp (mkCId "ComparaAdv") [gf x1, gf x2, gf x3]
  gf (GConjAdv x1 x2) = mkApp (mkCId "ConjAdv") [gf x1, gf x2]
  gf (GIn_order_to x1) = mkApp (mkCId "In_order_to") [gf x1]
  gf (GNot_Adv x1) = mkApp (mkCId "Not_Adv") [gf x1]
  gf (GTo_purpose x1) = mkApp (mkCId "To_purpose") [gf x1]
  gf (GVery_Adv x1) = mkApp (mkCId "Very_Adv") [gf x1]
  gf Gnot = mkApp (mkCId "not") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "CloseAdv" -> GCloseAdv (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "ComparaAdv" -> GComparaAdv (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "ConjAdv" -> GConjAdv (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "In_order_to" -> GIn_order_to (fg x1)
      Just (i,[x1]) | i == mkCId "Not_Adv" -> GNot_Adv (fg x1)
      Just (i,[x1]) | i == mkCId "To_purpose" -> GTo_purpose (fg x1)
      Just (i,[x1]) | i == mkCId "Very_Adv" -> GVery_Adv (fg x1)
      Just (i,[]) | i == mkCId "not" -> Gnot 


      _ -> error ("no Adv " ++ show t)

instance Gf GAdv_attribute where
  gf (GAttributing x1 x2) = mkApp (mkCId "Attributing") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Attributing" -> GAttributing (fg x1) (fg x2)


      _ -> error ("no Adv_attribute " ++ show t)

instance Gf GAdv_coagent where
  gf (GCoagency x1 x2) = mkApp (mkCId "Coagency") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Coagency" -> GCoagency (fg x1) (fg x2)


      _ -> error ("no Adv_coagent " ++ show t)

instance Gf GAdv_extent where
  gf (GExtenting x1 x2) = mkApp (mkCId "Extenting") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Extenting" -> GExtenting (fg x1) (fg x2)


      _ -> error ("no Adv_extent " ++ show t)

instance Gf GAdv_instrument where
  gf (GInstrumenting x1 x2) = mkApp (mkCId "Instrumenting") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Instrumenting" -> GInstrumenting (fg x1) (fg x2)


      _ -> error ("no Adv_instrument " ++ show t)

instance Gf GAdv_location where
  gf (GLocating x1 x2) = mkApp (mkCId "Locating") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Locating" -> GLocating (fg x1) (fg x2)


      _ -> error ("no Adv_location " ++ show t)

instance Gf GAdv_manner where
  gf (GByGerund x1) = mkApp (mkCId "ByGerund") [gf x1]
  gf (GMannering x1 x2) = mkApp (mkCId "Mannering") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "ByGerund" -> GByGerund (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Mannering" -> GMannering (fg x1) (fg x2)


      _ -> error ("no Adv_manner " ++ show t)

instance Gf GAdv_patient where
  gf (GPatienting x1 x2) = mkApp (mkCId "Patienting") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Patienting" -> GPatienting (fg x1) (fg x2)


      _ -> error ("no Adv_patient " ++ show t)

instance Gf GAdv_result where
  gf (GResulting x1 x2) = mkApp (mkCId "Resulting") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Resulting" -> GResulting (fg x1) (fg x2)


      _ -> error ("no Adv_result " ++ show t)

instance Gf GAdv_source where
  gf (GSourcing x1 x2) = mkApp (mkCId "Sourcing") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Sourcing" -> GSourcing (fg x1) (fg x2)


      _ -> error ("no Adv_source " ++ show t)

instance Gf GAdv_stimulus where
  gf (GStimulating x1 x2) = mkApp (mkCId "Stimulating") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Stimulating" -> GStimulating (fg x1) (fg x2)


      _ -> error ("no Adv_stimulus " ++ show t)

instance Gf GAdv_theme where
  gf (GThemeing x1 x2) = mkApp (mkCId "Themeing") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Themeing" -> GThemeing (fg x1) (fg x2)


      _ -> error ("no Adv_theme " ++ show t)

instance Gf GAdv_time where
  gf (GTimeAsAdv x1 x2) = mkApp (mkCId "TimeAsAdv") [gf x1, gf x2]
  gf (GTimeAsAdvWithPredet x1 x2 x3) = mkApp (mkCId "TimeAsAdvWithPredet") [gf x1, gf x2, gf x3]
  gf (GTiming x1 x2) = mkApp (mkCId "Timing") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "TimeAsAdv" -> GTimeAsAdv (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "TimeAsAdvWithPredet" -> GTimeAsAdvWithPredet (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "Timing" -> GTiming (fg x1) (fg x2)


      _ -> error ("no Adv_time " ++ show t)

instance Gf GCAdv where
  gf Gmore = mkApp (mkCId "more") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "more" -> Gmore 


      _ -> error ("no CAdv " ++ show t)

instance Gf GCN where
  gf (GCompoundCN x1 x2) = mkApp (mkCId "CompoundCN") [gf x1, gf x2]
  gf (GConjCN x1 x2) = mkApp (mkCId "ConjCN") [gf x1, gf x2]
  gf (GGerundSlash x1) = mkApp (mkCId "GerundSlash") [gf x1]
  gf (GKind x1 x2) = mkApp (mkCId "Kind") [gf x1, gf x2]
  gf (GKindInPlace x1 x2) = mkApp (mkCId "KindInPlace") [gf x1, gf x2]
  gf (GKindInTime x1 x2) = mkApp (mkCId "KindInTime") [gf x1, gf x2]
  gf (GKindOfKind x1 x2) = mkApp (mkCId "KindOfKind") [gf x1, gf x2]
  gf (GKindToExtent x1 x2) = mkApp (mkCId "KindToExtent") [gf x1, gf x2]
  gf (GMassModInf x1 x2) = mkApp (mkCId "MassModInf") [gf x1, gf x2]
  gf (GModInf x1 x2) = mkApp (mkCId "ModInf") [gf x1, gf x2]
  gf (GModPass3 x1 x2 x3) = mkApp (mkCId "ModPass3") [gf x1, gf x2, gf x3]
  gf (GModified x1 x2) = mkApp (mkCId "Modified") [gf x1, gf x2]
  gf (GN2toCN x1) = mkApp (mkCId "N2toCN") [gf x1]
  gf (GOfpart x1 x2) = mkApp (mkCId "Ofpart") [gf x1, gf x2]
  gf (GOfpos x1 x2) = mkApp (mkCId "Ofpos") [gf x1, gf x2]
  gf Gcamera = mkApp (mkCId "camera") []
  gf Gdisturbance = mkApp (mkCId "disturbance") []
  gf Gentity = mkApp (mkCId "entity") []
  gf Gperson = mkApp (mkCId "person") []
  gf Gpolice = mkApp (mkCId "police") []
  gf Greport_N = mkApp (mkCId "report_N") []
  gf Gtheater = mkApp (mkCId "theater") []
  gf Gthing = mkApp (mkCId "thing") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "CompoundCN" -> GCompoundCN (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ConjCN" -> GConjCN (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "GerundSlash" -> GGerundSlash (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Kind" -> GKind (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "KindInPlace" -> GKindInPlace (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "KindInTime" -> GKindInTime (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "KindOfKind" -> GKindOfKind (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "KindToExtent" -> GKindToExtent (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "MassModInf" -> GMassModInf (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ModInf" -> GModInf (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "ModPass3" -> GModPass3 (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "Modified" -> GModified (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "N2toCN" -> GN2toCN (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Ofpart" -> GOfpart (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Ofpos" -> GOfpos (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "camera" -> Gcamera 
      Just (i,[]) | i == mkCId "disturbance" -> Gdisturbance 
      Just (i,[]) | i == mkCId "entity" -> Gentity 
      Just (i,[]) | i == mkCId "person" -> Gperson 
      Just (i,[]) | i == mkCId "police" -> Gpolice 
      Just (i,[]) | i == mkCId "report_N" -> Greport_N 
      Just (i,[]) | i == mkCId "theater" -> Gtheater 
      Just (i,[]) | i == mkCId "thing" -> Gthing 


      _ -> error ("no CN " ++ show t)

instance Gf GCl where
  gf (GExist x1) = mkApp (mkCId "Exist") [gf x1]
  gf (GMembership x1 x2 x3) = mkApp (mkCId "Membership") [gf x1, gf x2, gf x3]
  gf (GSentence x1 x2) = mkApp (mkCId "Sentence") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Exist" -> GExist (fg x1)
      Just (i,[x1,x2,x3]) | i == mkCId "Membership" -> GMembership (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "Sentence" -> GSentence (fg x1) (fg x2)


      _ -> error ("no Cl " ++ show t)

instance Gf GClSlash where
  gf (GSClSlash x1 x2) = mkApp (mkCId "SClSlash") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "SClSlash" -> GSClSlash (fg x1) (fg x2)


      _ -> error ("no ClSlash " ++ show t)

instance Gf GComp where
  gf (GBe_AdV_NP x1 x2) = mkApp (mkCId "Be_AdV_NP") [gf x1, gf x2]
  gf (GBe_bad x1) = mkApp (mkCId "Be_bad") [gf x1]
  gf (GBe_coagent x1) = mkApp (mkCId "Be_coagent") [gf x1]
  gf (GBe_someone x1) = mkApp (mkCId "Be_someone") [gf x1]
  gf (GBe_somewhere x1) = mkApp (mkCId "Be_somewhere") [gf x1]
  gf (GBe_theme x1) = mkApp (mkCId "Be_theme") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Be_AdV_NP" -> GBe_AdV_NP (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Be_bad" -> GBe_bad (fg x1)
      Just (i,[x1]) | i == mkCId "Be_coagent" -> GBe_coagent (fg x1)
      Just (i,[x1]) | i == mkCId "Be_someone" -> GBe_someone (fg x1)
      Just (i,[x1]) | i == mkCId "Be_somewhere" -> GBe_somewhere (fg x1)
      Just (i,[x1]) | i == mkCId "Be_theme" -> GBe_theme (fg x1)


      _ -> error ("no Comp " ++ show t)

instance Gf GConj where
  gf Gand = mkApp (mkCId "and") []
  gf Gbut = mkApp (mkCId "but") []
  gf Gor_CONJ = mkApp (mkCId "or_CONJ") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "and" -> Gand 
      Just (i,[]) | i == mkCId "but" -> Gbut 
      Just (i,[]) | i == mkCId "or_CONJ" -> Gor_CONJ 


      _ -> error ("no Conj " ++ show t)

instance Gf GDet where
  gf (GApos x1) = mkApp (mkCId "Apos") [gf x1]
  gf (GApos_pl x1) = mkApp (mkCId "Apos_pl") [gf x1]
  gf (GConjDet x1 x2) = mkApp (mkCId "ConjDet") [gf x1, gf x2]
  gf Ga_DET = mkApp (mkCId "a_DET") []
  gf Gevery_DET = mkApp (mkCId "every_DET") []
  gf Gher_DET = mkApp (mkCId "her_DET") []
  gf Ghis_DET = mkApp (mkCId "his_DET") []
  gf Gits = mkApp (mkCId "its") []
  gf Gno_DET = mkApp (mkCId "no_DET") []
  gf Gno_PL_DET = mkApp (mkCId "no_PL_DET") []
  gf Gsome_DET = mkApp (mkCId "some_DET") []
  gf Gsome_PL_DET = mkApp (mkCId "some_PL_DET") []
  gf Gthe_PLURAL_DET = mkApp (mkCId "the_PLURAL_DET") []
  gf Gthe_SG_DET = mkApp (mkCId "the_SG_DET") []
  gf Gtheir = mkApp (mkCId "their") []
  gf Gthis = mkApp (mkCId "this") []
  gf Gthose = mkApp (mkCId "those") []
  gf Gyour = mkApp (mkCId "your") []
  gf Gzero_Det_pl = mkApp (mkCId "zero_Det_pl") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Apos" -> GApos (fg x1)
      Just (i,[x1]) | i == mkCId "Apos_pl" -> GApos_pl (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ConjDet" -> GConjDet (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "a_DET" -> Ga_DET 
      Just (i,[]) | i == mkCId "every_DET" -> Gevery_DET 
      Just (i,[]) | i == mkCId "her_DET" -> Gher_DET 
      Just (i,[]) | i == mkCId "his_DET" -> Ghis_DET 
      Just (i,[]) | i == mkCId "its" -> Gits 
      Just (i,[]) | i == mkCId "no_DET" -> Gno_DET 
      Just (i,[]) | i == mkCId "no_PL_DET" -> Gno_PL_DET 
      Just (i,[]) | i == mkCId "some_DET" -> Gsome_DET 
      Just (i,[]) | i == mkCId "some_PL_DET" -> Gsome_PL_DET 
      Just (i,[]) | i == mkCId "the_PLURAL_DET" -> Gthe_PLURAL_DET 
      Just (i,[]) | i == mkCId "the_SG_DET" -> Gthe_SG_DET 
      Just (i,[]) | i == mkCId "their" -> Gtheir 
      Just (i,[]) | i == mkCId "this" -> Gthis 
      Just (i,[]) | i == mkCId "those" -> Gthose 
      Just (i,[]) | i == mkCId "your" -> Gyour 
      Just (i,[]) | i == mkCId "zero_Det_pl" -> Gzero_Det_pl 


      _ -> error ("no Det " ++ show t)

instance Gf GIAdv where
  gf (GConjIAdv x1 x2) = mkApp (mkCId "ConjIAdv") [gf x1, gf x2]
  gf Ghow_WH = mkApp (mkCId "how_WH") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjIAdv" -> GConjIAdv (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "how_WH" -> Ghow_WH 


      _ -> error ("no IAdv " ++ show t)

instance Gf GIDet where
  gf Gwhat_PL_IDET = mkApp (mkCId "what_PL_IDET") []
  gf Gwhich_SG_IDET = mkApp (mkCId "which_SG_IDET") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "what_PL_IDET" -> Gwhat_PL_IDET 
      Just (i,[]) | i == mkCId "which_SG_IDET" -> Gwhich_SG_IDET 


      _ -> error ("no IDet " ++ show t)

instance Gf GIP where
  gf (GIPhrase x1 x2) = mkApp (mkCId "IPhrase") [gf x1, gf x2]
  gf (GWHose x1) = mkApp (mkCId "WHose") [gf x1]
  gf Gwhat_WH = mkApp (mkCId "what_WH") []
  gf Gwho_WH = mkApp (mkCId "who_WH") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "IPhrase" -> GIPhrase (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "WHose" -> GWHose (fg x1)
      Just (i,[]) | i == mkCId "what_WH" -> Gwhat_WH 
      Just (i,[]) | i == mkCId "who_WH" -> Gwho_WH 


      _ -> error ("no IP " ++ show t)

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
  gf (GAddAdv x1 x2) = mkApp (mkCId "AddAdv") [gf x1, gf x2]
  gf (GAdvList x1 x2) = mkApp (mkCId "AdvList") [gf x1, gf x2]
  gf (GBaseAdv x1 x2) = mkApp (mkCId "BaseAdv") [gf x1, gf x2]
  gf (GConsAdv x1 x2) = mkApp (mkCId "ConsAdv") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AddAdv" -> GAddAdv (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "AdvList" -> GAdvList (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "BaseAdv" -> GBaseAdv (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ConsAdv" -> GConsAdv (fg x1) (fg x2)


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
  gf Gat_PREP = mkApp (mkCId "at_PREP") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "at_PREP" -> Gat_PREP 


      _ -> error ("no LocPrep " ++ show t)

instance Gf GMassDet where
  gf (GMassApos x1) = mkApp (mkCId "MassApos") [gf x1]
  gf Gany_MASS_DET = mkApp (mkCId "any_MASS_DET") []
  gf Gher_MASSDET = mkApp (mkCId "her_MASSDET") []
  gf Gno_MASSDET = mkApp (mkCId "no_MASSDET") []
  gf Gsome_MASS_DET = mkApp (mkCId "some_MASS_DET") []
  gf Gthe_MASS_DET = mkApp (mkCId "the_MASS_DET") []
  gf Gzero_Det_sg = mkApp (mkCId "zero_Det_sg") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "MassApos" -> GMassApos (fg x1)
      Just (i,[]) | i == mkCId "any_MASS_DET" -> Gany_MASS_DET 
      Just (i,[]) | i == mkCId "her_MASSDET" -> Gher_MASSDET 
      Just (i,[]) | i == mkCId "no_MASSDET" -> Gno_MASSDET 
      Just (i,[]) | i == mkCId "some_MASS_DET" -> Gsome_MASS_DET 
      Just (i,[]) | i == mkCId "the_MASS_DET" -> Gthe_MASS_DET 
      Just (i,[]) | i == mkCId "zero_Det_sg" -> Gzero_Det_sg 


      _ -> error ("no MassDet " ++ show t)

instance Gf GN where
  gf (GMassKind x1 x2) = mkApp (mkCId "MassKind") [gf x1, gf x2]
  gf (GMassMod x1 x2) = mkApp (mkCId "MassMod") [gf x1, gf x2]
  gf (GPartN x1) = mkApp (mkCId "PartN") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "MassKind" -> GMassKind (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "MassMod" -> GMassMod (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "PartN" -> GPartN (fg x1)


      _ -> error ("no N " ++ show t)

instance Gf GN2 where
  gf Garrest_N = mkApp (mkCId "arrest_N") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "arrest_N" -> Garrest_N 


      _ -> error ("no N2 " ++ show t)

instance Gf GNP where
  gf (GApposNP x1 x2) = mkApp (mkCId "ApposNP") [gf x1, gf x2]
  gf (GCloseList x1 x2) = mkApp (mkCId "CloseList") [gf x1, gf x2]
  gf (GComparaN x1 x2 x3) = mkApp (mkCId "ComparaN") [gf x1, gf x2, gf x3]
  gf (GConjNP x1 x2) = mkApp (mkCId "ConjNP") [gf x1, gf x2]
  gf (GDetRCltoNP x1 x2) = mkApp (mkCId "DetRCltoNP") [gf x1, gf x2]
  gf (GDetVPtoNP x1 x2) = mkApp (mkCId "DetVPtoNP") [gf x1, gf x2]
  gf (GEntity x1) = mkApp (mkCId "Entity") [gf x1]
  gf (GGerund x1) = mkApp (mkCId "Gerund") [gf x1]
  gf (GHowNP x1) = mkApp (mkCId "HowNP") [gf x1]
  gf (GItem x1 x2) = mkApp (mkCId "Item") [gf x1, gf x2]
  gf (GMannered x1 x2) = mkApp (mkCId "Mannered") [gf x1, gf x2]
  gf (GMassItem x1 x2) = mkApp (mkCId "MassItem") [gf x1, gf x2]
  gf (GNPInPlace x1 x2) = mkApp (mkCId "NPInPlace") [gf x1, gf x2]
  gf (GNPPostPredet x1 x2) = mkApp (mkCId "NPPostPredet") [gf x1, gf x2]
  gf (GNomCl x1) = mkApp (mkCId "NomCl") [gf x1]
  gf (GPredetItem x1 x2) = mkApp (mkCId "PredetItem") [gf x1, gf x2]
  gf (GSomething x1) = mkApp (mkCId "Something") [gf x1]
  gf (GSourced x1 x2) = mkApp (mkCId "Sourced") [gf x1, gf x2]
  gf (GThatNP x1) = mkApp (mkCId "ThatNP") [gf x1]
  gf (GThemed x1 x2) = mkApp (mkCId "Themed") [gf x1, gf x2]
  gf (GTitular x1) = mkApp (mkCId "Titular") [gf x1]
  gf (GWayNP x1) = mkApp (mkCId "WayNP") [gf x1]
  gf Geveryone_NP = mkApp (mkCId "everyone_NP") []
  gf Ghe = mkApp (mkCId "he") []
  gf Git = mkApp (mkCId "it") []
  gf Gno_NP = mkApp (mkCId "no_NP") []
  gf Gno_PL_NP = mkApp (mkCId "no_PL_NP") []
  gf Gshe = mkApp (mkCId "she") []
  gf Gsome_NP = mkApp (mkCId "some_NP") []
  gf Gsome_PL_NP = mkApp (mkCId "some_PL_NP") []
  gf Gsomething = mkApp (mkCId "something") []
  gf Gthat_PRON = mkApp (mkCId "that_PRON") []
  gf Gthey = mkApp (mkCId "they") []
  gf Gthis_PRON = mkApp (mkCId "this_PRON") []
  gf Gwe = mkApp (mkCId "we") []
  gf Gyou = mkApp (mkCId "you") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ApposNP" -> GApposNP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "CloseList" -> GCloseList (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "ComparaN" -> GComparaN (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "ConjNP" -> GConjNP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "DetRCltoNP" -> GDetRCltoNP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "DetVPtoNP" -> GDetVPtoNP (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Entity" -> GEntity (fg x1)
      Just (i,[x1]) | i == mkCId "Gerund" -> GGerund (fg x1)
      Just (i,[x1]) | i == mkCId "HowNP" -> GHowNP (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Item" -> GItem (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Mannered" -> GMannered (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "MassItem" -> GMassItem (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "NPInPlace" -> GNPInPlace (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "NPPostPredet" -> GNPPostPredet (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "NomCl" -> GNomCl (fg x1)
      Just (i,[x1,x2]) | i == mkCId "PredetItem" -> GPredetItem (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Something" -> GSomething (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Sourced" -> GSourced (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "ThatNP" -> GThatNP (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Themed" -> GThemed (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Titular" -> GTitular (fg x1)
      Just (i,[x1]) | i == mkCId "WayNP" -> GWayNP (fg x1)
      Just (i,[]) | i == mkCId "everyone_NP" -> Geveryone_NP 
      Just (i,[]) | i == mkCId "he" -> Ghe 
      Just (i,[]) | i == mkCId "it" -> Git 
      Just (i,[]) | i == mkCId "no_NP" -> Gno_NP 
      Just (i,[]) | i == mkCId "no_PL_NP" -> Gno_PL_NP 
      Just (i,[]) | i == mkCId "she" -> Gshe 
      Just (i,[]) | i == mkCId "some_NP" -> Gsome_NP 
      Just (i,[]) | i == mkCId "some_PL_NP" -> Gsome_PL_NP 
      Just (i,[]) | i == mkCId "something" -> Gsomething 
      Just (i,[]) | i == mkCId "that_PRON" -> Gthat_PRON 
      Just (i,[]) | i == mkCId "they" -> Gthey 
      Just (i,[]) | i == mkCId "this_PRON" -> Gthis_PRON 
      Just (i,[]) | i == mkCId "we" -> Gwe 
      Just (i,[]) | i == mkCId "you" -> Gyou 


      _ -> error ("no NP " ++ show t)

instance Gf GNounCl where
  gf (GFreeICl x1 x2) = mkApp (mkCId "FreeICl") [gf x1, gf x2]
  gf (GFreeIClSlash x1 x2) = mkApp (mkCId "FreeIClSlash") [gf x1, gf x2]
  gf (GFreeInfICl x1 x2) = mkApp (mkCId "FreeInfICl") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "FreeICl" -> GFreeICl (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "FreeIClSlash" -> GFreeIClSlash (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "FreeInfICl" -> GFreeInfICl (fg x1) (fg x2)


      _ -> error ("no NounCl " ++ show t)

instance Gf GPN where
  gf Gerykah = mkApp (mkCId "erykah") []
  gf Gmario = mkApp (mkCId "mario") []
  gf Gshia = mkApp (mkCId "shia") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "erykah" -> Gerykah 
      Just (i,[]) | i == mkCId "mario" -> Gmario 
      Just (i,[]) | i == mkCId "shia" -> Gshia 


      _ -> error ("no PN " ++ show t)

instance Gf GPlace where
  gf (GLocation x1 x2) = mkApp (mkCId "Location") [gf x1, gf x2]
  gf (GNamedPlace x1) = mkApp (mkCId "NamedPlace") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Location" -> GLocation (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "NamedPlace" -> GNamedPlace (fg x1)


      _ -> error ("no Place " ++ show t)

instance Gf GPlaceNoun where
  gf (GPlaceKind x1 x2) = mkApp (mkCId "PlaceKind") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "PlaceKind" -> GPlaceKind (fg x1) (fg x2)


      _ -> error ("no PlaceNoun " ++ show t)

instance Gf GPredet where
  gf Gall_PREDET = mkApp (mkCId "all_PREDET") []
  gf Gsome_PREDET = mkApp (mkCId "some_PREDET") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "all_PREDET" -> Gall_PREDET 
      Just (i,[]) | i == mkCId "some_PREDET" -> Gsome_PREDET 


      _ -> error ("no Predet " ++ show t)

instance Gf GPrep where
  gf Gabout_PREP = mkApp (mkCId "about_PREP") []
  gf Gbefore_PREP = mkApp (mkCId "before_PREP") []
  gf Gby = mkApp (mkCId "by") []
  gf Gfor = mkApp (mkCId "for") []
  gf Gfrom_PREP = mkApp (mkCId "from_PREP") []
  gf Gin_PREP = mkApp (mkCId "in_PREP") []
  gf Glike_PREP = mkApp (mkCId "like_PREP") []
  gf Gof_PREP = mkApp (mkCId "of_PREP") []
  gf Gpart_prep = mkApp (mkCId "part_prep") []
  gf Gto = mkApp (mkCId "to") []
  gf Gup_PREP = mkApp (mkCId "up_PREP") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "about_PREP" -> Gabout_PREP 
      Just (i,[]) | i == mkCId "before_PREP" -> Gbefore_PREP 
      Just (i,[]) | i == mkCId "by" -> Gby 
      Just (i,[]) | i == mkCId "for" -> Gfor 
      Just (i,[]) | i == mkCId "from_PREP" -> Gfrom_PREP 
      Just (i,[]) | i == mkCId "in_PREP" -> Gin_PREP 
      Just (i,[]) | i == mkCId "like_PREP" -> Glike_PREP 
      Just (i,[]) | i == mkCId "of_PREP" -> Gof_PREP 
      Just (i,[]) | i == mkCId "part_prep" -> Gpart_prep 
      Just (i,[]) | i == mkCId "to" -> Gto 
      Just (i,[]) | i == mkCId "up_PREP" -> Gup_PREP 


      _ -> error ("no Prep " ++ show t)

instance Gf GQCl where
  gf (GTagComp x1 x2) = mkApp (mkCId "TagComp") [gf x1, gf x2]
  gf (GTagModal x1 x2 x3) = mkApp (mkCId "TagModal") [gf x1, gf x2, gf x3]
  gf (GTagQ x1 x2) = mkApp (mkCId "TagQ") [gf x1, gf x2]
  gf (GTagS x1 x2) = mkApp (mkCId "TagS") [gf x1, gf x2]
  gf (GWH_ClSlash x1 x2) = mkApp (mkCId "WH_ClSlash") [gf x1, gf x2]
  gf (GWH_Pred x1 x2) = mkApp (mkCId "WH_Pred") [gf x1, gf x2]
  gf (GYN x1) = mkApp (mkCId "YN") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "TagComp" -> GTagComp (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "TagModal" -> GTagModal (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "TagQ" -> GTagQ (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "TagS" -> GTagS (fg x1) (fg x2)
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
  gf (GEmptyRelSlash x1) = mkApp (mkCId "EmptyRelSlash") [gf x1]
  gf (GObjRel x1 x2) = mkApp (mkCId "ObjRel") [gf x1, gf x2]
  gf (GSubjRel x1 x2) = mkApp (mkCId "SubjRel") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "EmptyRel" -> GEmptyRel (fg x1)
      Just (i,[x1]) | i == mkCId "EmptyRelSlash" -> GEmptyRelSlash (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ObjRel" -> GObjRel (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "SubjRel" -> GSubjRel (fg x1) (fg x2)


      _ -> error ("no RCl " ++ show t)

instance Gf GRP where
  gf Gin_which = mkApp (mkCId "in_which") []
  gf Gthat_RP = mkApp (mkCId "that_RP") []
  gf Gwhen_RP = mkApp (mkCId "when_RP") []
  gf Gwhere_RP = mkApp (mkCId "where_RP") []
  gf Gwho_RP = mkApp (mkCId "who_RP") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "in_which" -> Gin_which 
      Just (i,[]) | i == mkCId "that_RP" -> Gthat_RP 
      Just (i,[]) | i == mkCId "when_RP" -> Gwhen_RP 
      Just (i,[]) | i == mkCId "where_RP" -> Gwhere_RP 
      Just (i,[]) | i == mkCId "who_RP" -> Gwho_RP 


      _ -> error ("no RP " ++ show t)

instance Gf GRS where
  gf (GConjRS x1 x2) = mkApp (mkCId "ConjRS") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjRS" -> GConjRS (fg x1) (fg x2)


      _ -> error ("no RS " ++ show t)

instance Gf GS where
  gf (GConcatS x1 x2 x3) = mkApp (mkCId "ConcatS") [gf x1, gf x2, gf x3]
  gf (GConjS x1 x2) = mkApp (mkCId "ConjS") [gf x1, gf x2]
  gf (GNegS x1) = mkApp (mkCId "NegS") [gf x1]
  gf (GPatientPre x1 x2) = mkApp (mkCId "PatientPre") [gf x1, gf x2]
  gf (GPosS x1) = mkApp (mkCId "PosS") [gf x1]
  gf (GSourcePre x1 x2) = mkApp (mkCId "SourcePre") [gf x1, gf x2]
  gf (GThemePre x1 x2) = mkApp (mkCId "ThemePre") [gf x1, gf x2]
  gf (GTimePre x1 x2) = mkApp (mkCId "TimePre") [gf x1, gf x2]
  gf (GWithAdvPre x1 x2) = mkApp (mkCId "WithAdvPre") [gf x1, gf x2]
  gf (GWithClPre x1 x2) = mkApp (mkCId "WithClPre") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2,x3]) | i == mkCId "ConcatS" -> GConcatS (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "ConjS" -> GConjS (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "NegS" -> GNegS (fg x1)
      Just (i,[x1,x2]) | i == mkCId "PatientPre" -> GPatientPre (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "PosS" -> GPosS (fg x1)
      Just (i,[x1,x2]) | i == mkCId "SourcePre" -> GSourcePre (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ThemePre" -> GThemePre (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "TimePre" -> GTimePre (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithAdvPre" -> GWithAdvPre (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithClPre" -> GWithClPre (fg x1) (fg x2)


      _ -> error ("no S " ++ show t)

instance Gf GSC where
  gf (GInject x1) = mkApp (mkCId "Inject") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Inject" -> GInject (fg x1)


      _ -> error ("no SC " ++ show t)

instance Gf GSubj where
  gf Gas = mkApp (mkCId "as") []
  gf Gbecause_SUBJ = mkApp (mkCId "because_SUBJ") []
  gf Gif_SUBJ = mkApp (mkCId "if_SUBJ") []
  gf Gso_SUBJ = mkApp (mkCId "so_SUBJ") []
  gf Gwhen_SUBJ = mkApp (mkCId "when_SUBJ") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "as" -> Gas 
      Just (i,[]) | i == mkCId "because_SUBJ" -> Gbecause_SUBJ 
      Just (i,[]) | i == mkCId "if_SUBJ" -> Gif_SUBJ 
      Just (i,[]) | i == mkCId "so_SUBJ" -> Gso_SUBJ 
      Just (i,[]) | i == mkCId "when_SUBJ" -> Gwhen_SUBJ 


      _ -> error ("no Subj " ++ show t)

instance Gf GSubordCl where
  gf (GSubjunct x1 x2) = mkApp (mkCId "Subjunct") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Subjunct" -> GSubjunct (fg x1) (fg x2)


      _ -> error ("no SubordCl " ++ show t)

instance Gf GTime where
  gf (GTimeInTime x1 x2) = mkApp (mkCId "TimeInTime") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "TimeInTime" -> GTimeInTime (fg x1) (fg x2)


      _ -> error ("no Time " ++ show t)

instance Gf GUtt where
  gf (GAnswer x1) = mkApp (mkCId "Answer") [gf x1]
  gf GNo = mkApp (mkCId "No") []
  gf GNoAnswer = mkApp (mkCId "NoAnswer") []
  gf (GPreConjUtt x1 x2) = mkApp (mkCId "PreConjUtt") [gf x1, gf x2]
  gf (GQUt x1) = mkApp (mkCId "QUt") [gf x1]
  gf (GUt x1) = mkApp (mkCId "Ut") [gf x1]
  gf GYes = mkApp (mkCId "Yes") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Answer" -> GAnswer (fg x1)
      Just (i,[]) | i == mkCId "No" -> GNo 
      Just (i,[]) | i == mkCId "NoAnswer" -> GNoAnswer 
      Just (i,[x1,x2]) | i == mkCId "PreConjUtt" -> GPreConjUtt (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "QUt" -> GQUt (fg x1)
      Just (i,[x1]) | i == mkCId "Ut" -> GUt (fg x1)
      Just (i,[]) | i == mkCId "Yes" -> GYes 


      _ -> error ("no Utt " ++ show t)

instance Gf GV where
  gf Ggo = mkApp (mkCId "go") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "go" -> Ggo 


      _ -> error ("no V " ++ show t)

instance Gf GV2 where
  gf Garrest = mkApp (mkCId "arrest") []
  gf Gavoid = mkApp (mkCId "avoid") []
  gf Gcontinue = mkApp (mkCId "continue") []
  gf Gcreate = mkApp (mkCId "create") []
  gf Gescape = mkApp (mkCId "escape") []
  gf Gfind = mkApp (mkCId "find") []
  gf Ghave = mkApp (mkCId "have") []
  gf Ginterview = mkApp (mkCId "interview") []
  gf Gkiss = mkApp (mkCId "kiss") []
  gf Gknow_V2 = mkApp (mkCId "know_V2") []
  gf Greport_V = mkApp (mkCId "report_V") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "arrest" -> Garrest 
      Just (i,[]) | i == mkCId "avoid" -> Gavoid 
      Just (i,[]) | i == mkCId "continue" -> Gcontinue 
      Just (i,[]) | i == mkCId "create" -> Gcreate 
      Just (i,[]) | i == mkCId "escape" -> Gescape 
      Just (i,[]) | i == mkCId "find" -> Gfind 
      Just (i,[]) | i == mkCId "have" -> Ghave 
      Just (i,[]) | i == mkCId "interview" -> Ginterview 
      Just (i,[]) | i == mkCId "kiss" -> Gkiss 
      Just (i,[]) | i == mkCId "know_V2" -> Gknow_V2 
      Just (i,[]) | i == mkCId "report_V" -> Greport_V 


      _ -> error ("no V2 " ++ show t)

instance Gf GV2V where
  gf Glet_V2V = mkApp (mkCId "let_V2V") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "let_V2V" -> Glet_V2V 


      _ -> error ("no V2V " ++ show t)

instance Gf GVP where
  gf (GAdV_VP x1 x2) = mkApp (mkCId "AdV_VP") [gf x1, gf x2]
  gf (GBe_vp x1) = mkApp (mkCId "Be_vp") [gf x1]
  gf (GChanging x1 x2) = mkApp (mkCId "Changing") [gf x1, gf x2]
  gf (GGetPassV3 x1 x2) = mkApp (mkCId "GetPassV3") [gf x1, gf x2]
  gf (GHappening x1) = mkApp (mkCId "Happening") [gf x1]
  gf (GIntens x1 x2) = mkApp (mkCId "Intens") [gf x1, gf x2]
  gf (GLook_bad x1 x2) = mkApp (mkCId "Look_bad") [gf x1, gf x2]
  gf (GPass x1) = mkApp (mkCId "Pass") [gf x1]
  gf (GPassAgent x1 x2) = mkApp (mkCId "PassAgent") [gf x1, gf x2]
  gf (GVPAlready x1) = mkApp (mkCId "VPAlready") [gf x1]
  gf (GVPToo x1) = mkApp (mkCId "VPToo") [gf x1]
  gf (GVP_Adv_attribute x1 x2) = mkApp (mkCId "VP_Adv_attribute") [gf x1, gf x2]
  gf (GVP_Adv_coagent x1 x2) = mkApp (mkCId "VP_Adv_coagent") [gf x1, gf x2]
  gf (GVP_Adv_instrument x1 x2) = mkApp (mkCId "VP_Adv_instrument") [gf x1, gf x2]
  gf (GVP_Adv_location x1 x2) = mkApp (mkCId "VP_Adv_location") [gf x1, gf x2]
  gf (GVP_Adv_manner x1 x2) = mkApp (mkCId "VP_Adv_manner") [gf x1, gf x2]
  gf (GVP_Adv_result x1 x2) = mkApp (mkCId "VP_Adv_result") [gf x1, gf x2]
  gf (GVP_Adv_stimulus x1 x2) = mkApp (mkCId "VP_Adv_stimulus") [gf x1, gf x2]
  gf (GVP_Adv_theme x1 x2) = mkApp (mkCId "VP_Adv_theme") [gf x1, gf x2]
  gf (GVP_Adv_time x1 x2) = mkApp (mkCId "VP_Adv_time") [gf x1, gf x2]
  gf (GV_NP_AP x1 x2 x3) = mkApp (mkCId "V_NP_AP") [gf x1, gf x2, gf x3]
  gf (GV_NP_NP x1 x2 x3) = mkApp (mkCId "V_NP_NP") [gf x1, gf x2, gf x3]
  gf (GV_NP_S x1 x2 x3) = mkApp (mkCId "V_NP_S") [gf x1, gf x2, gf x3]
  gf (GV_NP_VP x1 x2 x3) = mkApp (mkCId "V_NP_VP") [gf x1, gf x2, gf x3]
  gf (GV_NP_that_S x1 x2 x3) = mkApp (mkCId "V_NP_that_S") [gf x1, gf x2, gf x3]
  gf (GV_NP_whether_S x1 x2 x3) = mkApp (mkCId "V_NP_whether_S") [gf x1, gf x2, gf x3]
  gf (GV_S x1 x2) = mkApp (mkCId "V_S") [gf x1, gf x2]
  gf (GV_SC x1 x2) = mkApp (mkCId "V_SC") [gf x1, gf x2]
  gf (GV_that_S x1 x2) = mkApp (mkCId "V_that_S") [gf x1, gf x2]
  gf (GWithCl x1 x2) = mkApp (mkCId "WithCl") [gf x1, gf x2]
  gf (GWithPlace x1 x2) = mkApp (mkCId "WithPlace") [gf x1, gf x2]
  gf (Gpassive x1) = mkApp (mkCId "passive") [gf x1]
  gf (Greflexive x1) = mkApp (mkCId "reflexive") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AdV_VP" -> GAdV_VP (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Be_vp" -> GBe_vp (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Changing" -> GChanging (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "GetPassV3" -> GGetPassV3 (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Happening" -> GHappening (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Intens" -> GIntens (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Look_bad" -> GLook_bad (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Pass" -> GPass (fg x1)
      Just (i,[x1,x2]) | i == mkCId "PassAgent" -> GPassAgent (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "VPAlready" -> GVPAlready (fg x1)
      Just (i,[x1]) | i == mkCId "VPToo" -> GVPToo (fg x1)
      Just (i,[x1,x2]) | i == mkCId "VP_Adv_attribute" -> GVP_Adv_attribute (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VP_Adv_coagent" -> GVP_Adv_coagent (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VP_Adv_instrument" -> GVP_Adv_instrument (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VP_Adv_location" -> GVP_Adv_location (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VP_Adv_manner" -> GVP_Adv_manner (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VP_Adv_result" -> GVP_Adv_result (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VP_Adv_stimulus" -> GVP_Adv_stimulus (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VP_Adv_theme" -> GVP_Adv_theme (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "VP_Adv_time" -> GVP_Adv_time (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_AP" -> GV_NP_AP (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_NP" -> GV_NP_NP (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_S" -> GV_NP_S (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_VP" -> GV_NP_VP (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_that_S" -> GV_NP_that_S (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "V_NP_whether_S" -> GV_NP_whether_S (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "V_S" -> GV_S (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V_SC" -> GV_SC (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V_that_S" -> GV_that_S (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithCl" -> GWithCl (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithPlace" -> GWithPlace (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "passive" -> Gpassive (fg x1)
      Just (i,[x1]) | i == mkCId "reflexive" -> Greflexive (fg x1)


      _ -> error ("no VP " ++ show t)

instance Gf GVPSlash where
  gf (GAdV_VPSlash x1 x2) = mkApp (mkCId "AdV_VPSlash") [gf x1, gf x2]
  gf (GV2ASlash x1 x2) = mkApp (mkCId "V2ASlash") [gf x1, gf x2]
  gf (GV2Slash x1) = mkApp (mkCId "V2Slash") [gf x1]
  gf (GV2VSlash x1 x2) = mkApp (mkCId "V2VSlash") [gf x1, gf x2]
  gf (GV3Slash x1 x2) = mkApp (mkCId "V3Slash") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AdV_VPSlash" -> GAdV_VPSlash (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V2ASlash" -> GV2ASlash (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "V2Slash" -> GV2Slash (fg x1)
      Just (i,[x1,x2]) | i == mkCId "V2VSlash" -> GV2VSlash (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V3Slash" -> GV3Slash (fg x1) (fg x2)


      _ -> error ("no VPSlash " ++ show t)

instance Gf GVS where
  gf Gknow_VS = mkApp (mkCId "know_VS") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "know_VS" -> Gknow_VS 


      _ -> error ("no VS " ++ show t)

instance Gf GVV where
  gf Gcan = mkApp (mkCId "can") []
  gf Gtry = mkApp (mkCId "try") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "can" -> Gcan 
      Just (i,[]) | i == mkCId "try" -> Gtry 


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



instance Show GAttributePrep

instance Gf GAttributePrep where
  gf _ = undefined
  fg _ = undefined



instance Show GCard

instance Gf GCard where
  gf _ = undefined
  fg _ = undefined



instance Show GCoagentPrep

instance Gf GCoagentPrep where
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



instance Show GExtentPrep

instance Gf GExtentPrep where
  gf _ = undefined
  fg _ = undefined



instance Show GIComp

instance Gf GIComp where
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



instance Show GInstrumentPrep

instance Gf GInstrumentPrep where
  gf _ = undefined
  fg _ = undefined



instance Show GInterj

instance Gf GInterj where
  gf _ = undefined
  fg _ = undefined



instance Show GMannerPrep

instance Gf GMannerPrep where
  gf _ = undefined
  fg _ = undefined



instance Show GMotion

instance Gf GMotion where
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



instance Show GPatientPrep

instance Gf GPatientPrep where
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



instance Show GResultPrep

instance Gf GResultPrep where
  gf _ = undefined
  fg _ = undefined



instance Show GSSlash

instance Gf GSSlash where
  gf _ = undefined
  fg _ = undefined



instance Show GSourcePrep

instance Gf GSourcePrep where
  gf _ = undefined
  fg _ = undefined



instance Show GStimulusPrep

instance Gf GStimulusPrep where
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



instance Show GThemePrep

instance Gf GThemePrep where
  gf _ = undefined
  fg _ = undefined



instance Show GTimePrep

instance Gf GTimePrep where
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



instance Show GV3

instance Gf GV3 where
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




