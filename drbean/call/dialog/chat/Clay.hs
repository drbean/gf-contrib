module Clay where

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
 | GComparaAP GA GNP 
 | GComparaS GAP GS 
 | GConjAP GConj GListAP 
 | GMore GA 
 | Gbeautiful 
 | Gbest 
 | Gbig 
 | Gbiological 
 | Ghappy 
 | Gmagnificent 
 | Gmarried 
 | Goldest 
 | Gpregnant 
 | Gugly 
  deriving Show

data GAdV = GConjAdV GConj GListAdV 
  deriving Show

data GAdv = GConjAdv GConj GListAdv 
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
 | Gback 
 | Gboyfriend 
 | Gchild 
 | Gclass_ring 
 | Gdad 
 | Gengagement_ring 
 | Gfather 
 | Gfinger 
 | Ggentleman 
 | Gguy 
 | Ghouse 
 | Gkid 
 | Gname 
 | Gnote 
 | Gperson 
 | Gring 
 | Gring_box 
 | Gson 
 | Gthing 
 | Gwedding_ring 
 | Gwhisper 
 | Gwife 
 | Gwoman 
 | Gyear 
  deriving Show

data GCl =
   GMembership GDet GCN GLocated 
 | GSentence GNP GVP 
  deriving Show

data GClSlash = GVPClSlash GNP GVPSlash 
  deriving Show

data GComp =
   GBe_bad GAP 
 | GBe_someone GNP 
  deriving Show

data GConj = Gor_Conj 
  deriving Show

data GDet =
   GApos GNP 
 | GApos_pl GNP 
 | GConjDet GConj GListDAP 
 | Ga_Det 
 | Gfive 
 | Gfour 
 | Ghe_Det 
 | Gher_Det 
 | Gits 
 | Gno_Det 
 | Gno_pl_Det 
 | Gone 
 | Gseventeen 
 | Gsome_Det 
 | Gsome_pl_Det 
 | GthePlural_Det 
 | GtheSg_Det 
 | Gthree 
 | Gzero_Det_pl 
  deriving Show

data GIAdv = GConjIAdv GConj GListIAdv 
  deriving Show

data GIP =
   GWHose GCN 
 | Gwhat_WH 
 | Gwho_WH 
  deriving Show

newtype GListAP = GListAP [GAP] deriving Show

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
 | Gdown_on 
 | Gdown_to 
 | Gin_prep 
 | Ginto 
 | Gon_back_of 
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

data GN =
   Gdetails 
 | Gdinner 
 | Ghome 
 | Gpopcorn 
 | Gstuff 
 | Gtrue_love 
  deriving Show

data GNP =
   GCloseList GConj GListNP 
 | GConjNP GConj GListNP 
 | GEntity GPN 
 | GItem GDet GCN 
 | GMassItem GMassDet GN 
 | GPredetItem GPredet GNP 
 | GTitular GTitle 
 | Gfrank_and_rebia 
 | Ghe 
 | Git 
 | Gno_NP 
 | Gno_pl_NP 
 | Grebia_and_frank 
 | Gshe 
 | Gsome_NP 
 | Gsome_pl_NP 
  deriving Show

data GPN =
   Gfrank 
 | Grebia 
 | Gso_and_so 
  deriving Show

data GPeriod = GPeriodAdv GTimes 
  deriving Show

data GPlace =
   GLocation GDet GPlaceName 
 | Gcity_hall 
 | Gmichigan 
  deriving Show

data GPlaceName =
   GPlaceKind GAP GPlaceName 
 | Galtercation 
 | Gbedroom 
 | Gdoor 
 | Gdresser 
 | Gknee 
 | Gring_box_Place 
  deriving Show

data GPredet = Gsome_Predet 
  deriving Show

data GPrep =
   Gabout_prep 
 | Gas_prep 
 | Gbefore_prep 
 | Gfor 
 | Gfrom_prep 
 | Glike_prep 
 | Gof_prep 
 | Gover_prep 
 | Gover_to 
 | Gpart_prep 
 | Gup_prep 
 | Gwith_prep 
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
   GNegQ GQCl 
 | GPosQ GQCl 
  deriving Show

data GRCl =
   GEmptyRel GClSlash 
 | GObjRel GRP GClSlash 
 | GSubjRel GRP GVP 
  deriving Show

data GRP =
   Gthat_RP 
 | Gwhich_RP 
  deriving Show

data GRS = GConjRS GConj GListRS 
  deriving Show

data GS =
   GConjS GConj GListS 
 | GNegS GCl 
 | GPosS GCl 
  deriving Show

data GStyle =
   GComparaAdv GCAdv GA GNP 
 | GStyling GPrep GNP 
 | GVery_Style GStyle 
  deriving Show

data GSubj =
   Gbecause_Subj 
 | Gif_Subj 
  deriving Show

data GSubordCl = GSubjunct GSubj GS 
  deriving Show

data GTime = GFreqAdv GNP GPeriod 
  deriving Show

data GTimeName = Gday 
  deriving Show

data GTimes =
   GTiming GDet GTimeName 
 | Gseventeen_years 
  deriving Show

data GUtt =
   GAnswer GNP 
 | GNo 
 | GNoAnswer 
 | GQUt GQS 
 | GUt GS 
 | GYes 
  deriving Show

data GV =
   Gget_Place 
 | Gget_married 
 | Ggo 
 | Ghang 
 | Glaugh 
 | Glook 
 | Gmove 
 | Gseparate 
 | Gshake 
  deriving Show

data GV2 =
   Gbecome 
 | Gburn 
 | Gcome 
 | Gfind 
 | Ggrab 
 | Ghave 
 | Ghelp 
 | Gknow_V2 
 | Gmeet 
 | Gput_V2 
 | Gremember_V2 
 | Grun 
 | Gsee_V2 
 | Gshoot_V2 
 | Gtalk 
 | Gwalk 
  deriving Show

data GV2S = Gtell 
  deriving Show

data GV2V =
   Gmake_V2V 
 | Gsee_V2V 
  deriving Show

data GV3 =
   Ggive 
 | Ghand 
 | Gput_V3 
 | Gshoot_V3 
  deriving Show

data GVA = Gfeel 
  deriving Show

data GVP =
   GBe_vp GComp 
 | GCausative GV2V GNP GVP 
 | GChanging GV2 GNP 
 | GHappening GV 
 | GInforming GV2S GNP GS 
 | GIntens GVV GVP 
 | GLook_bad GVA GAP 
 | GPass GVPSlash 
 | GPositing GVS GS 
 | GPred2A GV2A GNP GAP 
 | GToPlace GMotion GLocated 
 | GTriangulating GV3 GNP GNP 
 | GWithCl GVP GSubordCl 
 | GWithPlace GV GLocated 
 | GWithStyle GVP GStyle 
 | GWithTime GVP GPeriod 
  deriving Show

data GVPSlash =
   GV2Slash GV2 
 | GV2VSlash GV2V GVP 
 | GV3Slash GV3 GNP 
  deriving Show

data GVS =
   Gbelieve 
 | Gknow_VS 
 | Gsay 
  deriving Show

data GVV =
   Gcan 
 | Gremember_VV 
 | Gtry 
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

data GMotion

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

data GSC

data GSSlash

data GTemp

data GTense

data GText

data GTitle

data GV2A

data GV2Q

data GVQ

data GVoc


instance Gf GAP where
  gf (GAdjModified x1 x2) = mkApp (mkCId "AdjModified") [gf x1, gf x2]
  gf (GAdvAdj x1 x2) = mkApp (mkCId "AdvAdj") [gf x1, gf x2]
  gf (GAs_as x1 x2) = mkApp (mkCId "As_as") [gf x1, gf x2]
  gf (GComparaAP x1 x2) = mkApp (mkCId "ComparaAP") [gf x1, gf x2]
  gf (GComparaS x1 x2) = mkApp (mkCId "ComparaS") [gf x1, gf x2]
  gf (GConjAP x1 x2) = mkApp (mkCId "ConjAP") [gf x1, gf x2]
  gf (GMore x1) = mkApp (mkCId "More") [gf x1]
  gf Gbeautiful = mkApp (mkCId "beautiful") []
  gf Gbest = mkApp (mkCId "best") []
  gf Gbig = mkApp (mkCId "big") []
  gf Gbiological = mkApp (mkCId "biological") []
  gf Ghappy = mkApp (mkCId "happy") []
  gf Gmagnificent = mkApp (mkCId "magnificent") []
  gf Gmarried = mkApp (mkCId "married") []
  gf Goldest = mkApp (mkCId "oldest") []
  gf Gpregnant = mkApp (mkCId "pregnant") []
  gf Gugly = mkApp (mkCId "ugly") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AdjModified" -> GAdjModified (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "AdvAdj" -> GAdvAdj (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "As_as" -> GAs_as (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComparaAP" -> GComparaAP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComparaS" -> GComparaS (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ConjAP" -> GConjAP (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "More" -> GMore (fg x1)
      Just (i,[]) | i == mkCId "beautiful" -> Gbeautiful 
      Just (i,[]) | i == mkCId "best" -> Gbest 
      Just (i,[]) | i == mkCId "big" -> Gbig 
      Just (i,[]) | i == mkCId "biological" -> Gbiological 
      Just (i,[]) | i == mkCId "happy" -> Ghappy 
      Just (i,[]) | i == mkCId "magnificent" -> Gmagnificent 
      Just (i,[]) | i == mkCId "married" -> Gmarried 
      Just (i,[]) | i == mkCId "oldest" -> Goldest 
      Just (i,[]) | i == mkCId "pregnant" -> Gpregnant 
      Just (i,[]) | i == mkCId "ugly" -> Gugly 


      _ -> error ("no AP " ++ show t)

instance Gf GAdV where
  gf (GConjAdV x1 x2) = mkApp (mkCId "ConjAdV") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjAdV" -> GConjAdV (fg x1) (fg x2)


      _ -> error ("no AdV " ++ show t)

instance Gf GAdv where
  gf (GConjAdv x1 x2) = mkApp (mkCId "ConjAdv") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "ConjAdv" -> GConjAdv (fg x1) (fg x2)


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
  gf Gback = mkApp (mkCId "back") []
  gf Gboyfriend = mkApp (mkCId "boyfriend") []
  gf Gchild = mkApp (mkCId "child") []
  gf Gclass_ring = mkApp (mkCId "class_ring") []
  gf Gdad = mkApp (mkCId "dad") []
  gf Gengagement_ring = mkApp (mkCId "engagement_ring") []
  gf Gfather = mkApp (mkCId "father") []
  gf Gfinger = mkApp (mkCId "finger") []
  gf Ggentleman = mkApp (mkCId "gentleman") []
  gf Gguy = mkApp (mkCId "guy") []
  gf Ghouse = mkApp (mkCId "house") []
  gf Gkid = mkApp (mkCId "kid") []
  gf Gname = mkApp (mkCId "name") []
  gf Gnote = mkApp (mkCId "note") []
  gf Gperson = mkApp (mkCId "person") []
  gf Gring = mkApp (mkCId "ring") []
  gf Gring_box = mkApp (mkCId "ring_box") []
  gf Gson = mkApp (mkCId "son") []
  gf Gthing = mkApp (mkCId "thing") []
  gf Gwedding_ring = mkApp (mkCId "wedding_ring") []
  gf Gwhisper = mkApp (mkCId "whisper") []
  gf Gwife = mkApp (mkCId "wife") []
  gf Gwoman = mkApp (mkCId "woman") []
  gf Gyear = mkApp (mkCId "year") []

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
      Just (i,[]) | i == mkCId "back" -> Gback 
      Just (i,[]) | i == mkCId "boyfriend" -> Gboyfriend 
      Just (i,[]) | i == mkCId "child" -> Gchild 
      Just (i,[]) | i == mkCId "class_ring" -> Gclass_ring 
      Just (i,[]) | i == mkCId "dad" -> Gdad 
      Just (i,[]) | i == mkCId "engagement_ring" -> Gengagement_ring 
      Just (i,[]) | i == mkCId "father" -> Gfather 
      Just (i,[]) | i == mkCId "finger" -> Gfinger 
      Just (i,[]) | i == mkCId "gentleman" -> Ggentleman 
      Just (i,[]) | i == mkCId "guy" -> Gguy 
      Just (i,[]) | i == mkCId "house" -> Ghouse 
      Just (i,[]) | i == mkCId "kid" -> Gkid 
      Just (i,[]) | i == mkCId "name" -> Gname 
      Just (i,[]) | i == mkCId "note" -> Gnote 
      Just (i,[]) | i == mkCId "person" -> Gperson 
      Just (i,[]) | i == mkCId "ring" -> Gring 
      Just (i,[]) | i == mkCId "ring_box" -> Gring_box 
      Just (i,[]) | i == mkCId "son" -> Gson 
      Just (i,[]) | i == mkCId "thing" -> Gthing 
      Just (i,[]) | i == mkCId "wedding_ring" -> Gwedding_ring 
      Just (i,[]) | i == mkCId "whisper" -> Gwhisper 
      Just (i,[]) | i == mkCId "wife" -> Gwife 
      Just (i,[]) | i == mkCId "woman" -> Gwoman 
      Just (i,[]) | i == mkCId "year" -> Gyear 


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

instance Gf GComp where
  gf (GBe_bad x1) = mkApp (mkCId "Be_bad") [gf x1]
  gf (GBe_someone x1) = mkApp (mkCId "Be_someone") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Be_bad" -> GBe_bad (fg x1)
      Just (i,[x1]) | i == mkCId "Be_someone" -> GBe_someone (fg x1)


      _ -> error ("no Comp " ++ show t)

instance Gf GConj where
  gf Gor_Conj = mkApp (mkCId "or_Conj") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "or_Conj" -> Gor_Conj 


      _ -> error ("no Conj " ++ show t)

instance Gf GDet where
  gf (GApos x1) = mkApp (mkCId "Apos") [gf x1]
  gf (GApos_pl x1) = mkApp (mkCId "Apos_pl") [gf x1]
  gf (GConjDet x1 x2) = mkApp (mkCId "ConjDet") [gf x1, gf x2]
  gf Ga_Det = mkApp (mkCId "a_Det") []
  gf Gfive = mkApp (mkCId "five") []
  gf Gfour = mkApp (mkCId "four") []
  gf Ghe_Det = mkApp (mkCId "he_Det") []
  gf Gher_Det = mkApp (mkCId "her_Det") []
  gf Gits = mkApp (mkCId "its") []
  gf Gno_Det = mkApp (mkCId "no_Det") []
  gf Gno_pl_Det = mkApp (mkCId "no_pl_Det") []
  gf Gone = mkApp (mkCId "one") []
  gf Gseventeen = mkApp (mkCId "seventeen") []
  gf Gsome_Det = mkApp (mkCId "some_Det") []
  gf Gsome_pl_Det = mkApp (mkCId "some_pl_Det") []
  gf GthePlural_Det = mkApp (mkCId "thePlural_Det") []
  gf GtheSg_Det = mkApp (mkCId "theSg_Det") []
  gf Gthree = mkApp (mkCId "three") []
  gf Gzero_Det_pl = mkApp (mkCId "zero_Det_pl") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Apos" -> GApos (fg x1)
      Just (i,[x1]) | i == mkCId "Apos_pl" -> GApos_pl (fg x1)
      Just (i,[x1,x2]) | i == mkCId "ConjDet" -> GConjDet (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "a_Det" -> Ga_Det 
      Just (i,[]) | i == mkCId "five" -> Gfive 
      Just (i,[]) | i == mkCId "four" -> Gfour 
      Just (i,[]) | i == mkCId "he_Det" -> Ghe_Det 
      Just (i,[]) | i == mkCId "her_Det" -> Gher_Det 
      Just (i,[]) | i == mkCId "its" -> Gits 
      Just (i,[]) | i == mkCId "no_Det" -> Gno_Det 
      Just (i,[]) | i == mkCId "no_pl_Det" -> Gno_pl_Det 
      Just (i,[]) | i == mkCId "one" -> Gone 
      Just (i,[]) | i == mkCId "seventeen" -> Gseventeen 
      Just (i,[]) | i == mkCId "some_Det" -> Gsome_Det 
      Just (i,[]) | i == mkCId "some_pl_Det" -> Gsome_pl_Det 
      Just (i,[]) | i == mkCId "thePlural_Det" -> GthePlural_Det 
      Just (i,[]) | i == mkCId "theSg_Det" -> GtheSg_Det 
      Just (i,[]) | i == mkCId "three" -> Gthree 
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

instance Gf GListAP where
  gf (GListAP [x1,x2]) = mkApp (mkCId "BaseAP") [gf x1, gf x2]
  gf (GListAP (x:xs)) = mkApp (mkCId "ConsAP") [gf x, gf (GListAP xs)]
  fg t =
    GListAP (fgs t) where
     fgs t = case unApp t of
      Just (i,[x1,x2]) | i == mkCId "BaseAP" -> [fg x1, fg x2]
      Just (i,[x1,x2]) | i == mkCId "ConsAP" -> fg x1 : fgs x2


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
  gf Gdown_on = mkApp (mkCId "down_on") []
  gf Gdown_to = mkApp (mkCId "down_to") []
  gf Gin_prep = mkApp (mkCId "in_prep") []
  gf Ginto = mkApp (mkCId "into") []
  gf Gon_back_of = mkApp (mkCId "on_back_of") []
  gf Gon_prep = mkApp (mkCId "on_prep") []
  gf Gto_prep = mkApp (mkCId "to_prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "at_prep" -> Gat_prep 
      Just (i,[]) | i == mkCId "down_on" -> Gdown_on 
      Just (i,[]) | i == mkCId "down_to" -> Gdown_to 
      Just (i,[]) | i == mkCId "in_prep" -> Gin_prep 
      Just (i,[]) | i == mkCId "into" -> Ginto 
      Just (i,[]) | i == mkCId "on_back_of" -> Gon_back_of 
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

instance Gf GN where
  gf Gdetails = mkApp (mkCId "details") []
  gf Gdinner = mkApp (mkCId "dinner") []
  gf Ghome = mkApp (mkCId "home") []
  gf Gpopcorn = mkApp (mkCId "popcorn") []
  gf Gstuff = mkApp (mkCId "stuff") []
  gf Gtrue_love = mkApp (mkCId "true_love") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "details" -> Gdetails 
      Just (i,[]) | i == mkCId "dinner" -> Gdinner 
      Just (i,[]) | i == mkCId "home" -> Ghome 
      Just (i,[]) | i == mkCId "popcorn" -> Gpopcorn 
      Just (i,[]) | i == mkCId "stuff" -> Gstuff 
      Just (i,[]) | i == mkCId "true_love" -> Gtrue_love 


      _ -> error ("no N " ++ show t)

instance Gf GNP where
  gf (GCloseList x1 x2) = mkApp (mkCId "CloseList") [gf x1, gf x2]
  gf (GConjNP x1 x2) = mkApp (mkCId "ConjNP") [gf x1, gf x2]
  gf (GEntity x1) = mkApp (mkCId "Entity") [gf x1]
  gf (GItem x1 x2) = mkApp (mkCId "Item") [gf x1, gf x2]
  gf (GMassItem x1 x2) = mkApp (mkCId "MassItem") [gf x1, gf x2]
  gf (GPredetItem x1 x2) = mkApp (mkCId "PredetItem") [gf x1, gf x2]
  gf (GTitular x1) = mkApp (mkCId "Titular") [gf x1]
  gf Gfrank_and_rebia = mkApp (mkCId "frank_and_rebia") []
  gf Ghe = mkApp (mkCId "he") []
  gf Git = mkApp (mkCId "it") []
  gf Gno_NP = mkApp (mkCId "no_NP") []
  gf Gno_pl_NP = mkApp (mkCId "no_pl_NP") []
  gf Grebia_and_frank = mkApp (mkCId "rebia_and_frank") []
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
      Just (i,[]) | i == mkCId "frank_and_rebia" -> Gfrank_and_rebia 
      Just (i,[]) | i == mkCId "he" -> Ghe 
      Just (i,[]) | i == mkCId "it" -> Git 
      Just (i,[]) | i == mkCId "no_NP" -> Gno_NP 
      Just (i,[]) | i == mkCId "no_pl_NP" -> Gno_pl_NP 
      Just (i,[]) | i == mkCId "rebia_and_frank" -> Grebia_and_frank 
      Just (i,[]) | i == mkCId "she" -> Gshe 
      Just (i,[]) | i == mkCId "some_NP" -> Gsome_NP 
      Just (i,[]) | i == mkCId "some_pl_NP" -> Gsome_pl_NP 


      _ -> error ("no NP " ++ show t)

instance Gf GPN where
  gf Gfrank = mkApp (mkCId "frank") []
  gf Grebia = mkApp (mkCId "rebia") []
  gf Gso_and_so = mkApp (mkCId "so_and_so") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "frank" -> Gfrank 
      Just (i,[]) | i == mkCId "rebia" -> Grebia 
      Just (i,[]) | i == mkCId "so_and_so" -> Gso_and_so 


      _ -> error ("no PN " ++ show t)

instance Gf GPeriod where
  gf (GPeriodAdv x1) = mkApp (mkCId "PeriodAdv") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "PeriodAdv" -> GPeriodAdv (fg x1)


      _ -> error ("no Period " ++ show t)

instance Gf GPlace where
  gf (GLocation x1 x2) = mkApp (mkCId "Location") [gf x1, gf x2]
  gf Gcity_hall = mkApp (mkCId "city_hall") []
  gf Gmichigan = mkApp (mkCId "michigan") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Location" -> GLocation (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "city_hall" -> Gcity_hall 
      Just (i,[]) | i == mkCId "michigan" -> Gmichigan 


      _ -> error ("no Place " ++ show t)

instance Gf GPlaceName where
  gf (GPlaceKind x1 x2) = mkApp (mkCId "PlaceKind") [gf x1, gf x2]
  gf Galtercation = mkApp (mkCId "altercation") []
  gf Gbedroom = mkApp (mkCId "bedroom") []
  gf Gdoor = mkApp (mkCId "door") []
  gf Gdresser = mkApp (mkCId "dresser") []
  gf Gknee = mkApp (mkCId "knee") []
  gf Gring_box_Place = mkApp (mkCId "ring_box_Place") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "PlaceKind" -> GPlaceKind (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "altercation" -> Galtercation 
      Just (i,[]) | i == mkCId "bedroom" -> Gbedroom 
      Just (i,[]) | i == mkCId "door" -> Gdoor 
      Just (i,[]) | i == mkCId "dresser" -> Gdresser 
      Just (i,[]) | i == mkCId "knee" -> Gknee 
      Just (i,[]) | i == mkCId "ring_box_Place" -> Gring_box_Place 


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
  gf Gfor = mkApp (mkCId "for") []
  gf Gfrom_prep = mkApp (mkCId "from_prep") []
  gf Glike_prep = mkApp (mkCId "like_prep") []
  gf Gof_prep = mkApp (mkCId "of_prep") []
  gf Gover_prep = mkApp (mkCId "over_prep") []
  gf Gover_to = mkApp (mkCId "over_to") []
  gf Gpart_prep = mkApp (mkCId "part_prep") []
  gf Gup_prep = mkApp (mkCId "up_prep") []
  gf Gwith_prep = mkApp (mkCId "with_prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "about_prep" -> Gabout_prep 
      Just (i,[]) | i == mkCId "as_prep" -> Gas_prep 
      Just (i,[]) | i == mkCId "before_prep" -> Gbefore_prep 
      Just (i,[]) | i == mkCId "for" -> Gfor 
      Just (i,[]) | i == mkCId "from_prep" -> Gfrom_prep 
      Just (i,[]) | i == mkCId "like_prep" -> Glike_prep 
      Just (i,[]) | i == mkCId "of_prep" -> Gof_prep 
      Just (i,[]) | i == mkCId "over_prep" -> Gover_prep 
      Just (i,[]) | i == mkCId "over_to" -> Gover_to 
      Just (i,[]) | i == mkCId "part_prep" -> Gpart_prep 
      Just (i,[]) | i == mkCId "up_prep" -> Gup_prep 
      Just (i,[]) | i == mkCId "with_prep" -> Gwith_prep 


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
  gf (GNegQ x1) = mkApp (mkCId "NegQ") [gf x1]
  gf (GPosQ x1) = mkApp (mkCId "PosQ") [gf x1]

  fg t =
    case unApp t of
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
  gf Gthat_RP = mkApp (mkCId "that_RP") []
  gf Gwhich_RP = mkApp (mkCId "which_RP") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "that_RP" -> Gthat_RP 
      Just (i,[]) | i == mkCId "which_RP" -> Gwhich_RP 


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

instance Gf GStyle where
  gf (GComparaAdv x1 x2 x3) = mkApp (mkCId "ComparaAdv") [gf x1, gf x2, gf x3]
  gf (GStyling x1 x2) = mkApp (mkCId "Styling") [gf x1, gf x2]
  gf (GVery_Style x1) = mkApp (mkCId "Very_Style") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2,x3]) | i == mkCId "ComparaAdv" -> GComparaAdv (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "Styling" -> GStyling (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Very_Style" -> GVery_Style (fg x1)


      _ -> error ("no Style " ++ show t)

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

instance Gf GTimeName where
  gf Gday = mkApp (mkCId "day") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "day" -> Gday 


      _ -> error ("no TimeName " ++ show t)

instance Gf GTimes where
  gf (GTiming x1 x2) = mkApp (mkCId "Timing") [gf x1, gf x2]
  gf Gseventeen_years = mkApp (mkCId "seventeen_years") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Timing" -> GTiming (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "seventeen_years" -> Gseventeen_years 


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
  gf Gget_Place = mkApp (mkCId "get_Place") []
  gf Gget_married = mkApp (mkCId "get_married") []
  gf Ggo = mkApp (mkCId "go") []
  gf Ghang = mkApp (mkCId "hang") []
  gf Glaugh = mkApp (mkCId "laugh") []
  gf Glook = mkApp (mkCId "look") []
  gf Gmove = mkApp (mkCId "move") []
  gf Gseparate = mkApp (mkCId "separate") []
  gf Gshake = mkApp (mkCId "shake") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "get_Place" -> Gget_Place 
      Just (i,[]) | i == mkCId "get_married" -> Gget_married 
      Just (i,[]) | i == mkCId "go" -> Ggo 
      Just (i,[]) | i == mkCId "hang" -> Ghang 
      Just (i,[]) | i == mkCId "laugh" -> Glaugh 
      Just (i,[]) | i == mkCId "look" -> Glook 
      Just (i,[]) | i == mkCId "move" -> Gmove 
      Just (i,[]) | i == mkCId "separate" -> Gseparate 
      Just (i,[]) | i == mkCId "shake" -> Gshake 


      _ -> error ("no V " ++ show t)

instance Gf GV2 where
  gf Gbecome = mkApp (mkCId "become") []
  gf Gburn = mkApp (mkCId "burn") []
  gf Gcome = mkApp (mkCId "come") []
  gf Gfind = mkApp (mkCId "find") []
  gf Ggrab = mkApp (mkCId "grab") []
  gf Ghave = mkApp (mkCId "have") []
  gf Ghelp = mkApp (mkCId "help") []
  gf Gknow_V2 = mkApp (mkCId "know_V2") []
  gf Gmeet = mkApp (mkCId "meet") []
  gf Gput_V2 = mkApp (mkCId "put_V2") []
  gf Gremember_V2 = mkApp (mkCId "remember_V2") []
  gf Grun = mkApp (mkCId "run") []
  gf Gsee_V2 = mkApp (mkCId "see_V2") []
  gf Gshoot_V2 = mkApp (mkCId "shoot_V2") []
  gf Gtalk = mkApp (mkCId "talk") []
  gf Gwalk = mkApp (mkCId "walk") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "become" -> Gbecome 
      Just (i,[]) | i == mkCId "burn" -> Gburn 
      Just (i,[]) | i == mkCId "come" -> Gcome 
      Just (i,[]) | i == mkCId "find" -> Gfind 
      Just (i,[]) | i == mkCId "grab" -> Ggrab 
      Just (i,[]) | i == mkCId "have" -> Ghave 
      Just (i,[]) | i == mkCId "help" -> Ghelp 
      Just (i,[]) | i == mkCId "know_V2" -> Gknow_V2 
      Just (i,[]) | i == mkCId "meet" -> Gmeet 
      Just (i,[]) | i == mkCId "put_V2" -> Gput_V2 
      Just (i,[]) | i == mkCId "remember_V2" -> Gremember_V2 
      Just (i,[]) | i == mkCId "run" -> Grun 
      Just (i,[]) | i == mkCId "see_V2" -> Gsee_V2 
      Just (i,[]) | i == mkCId "shoot_V2" -> Gshoot_V2 
      Just (i,[]) | i == mkCId "talk" -> Gtalk 
      Just (i,[]) | i == mkCId "walk" -> Gwalk 


      _ -> error ("no V2 " ++ show t)

instance Gf GV2S where
  gf Gtell = mkApp (mkCId "tell") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "tell" -> Gtell 


      _ -> error ("no V2S " ++ show t)

instance Gf GV2V where
  gf Gmake_V2V = mkApp (mkCId "make_V2V") []
  gf Gsee_V2V = mkApp (mkCId "see_V2V") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "make_V2V" -> Gmake_V2V 
      Just (i,[]) | i == mkCId "see_V2V" -> Gsee_V2V 


      _ -> error ("no V2V " ++ show t)

instance Gf GV3 where
  gf Ggive = mkApp (mkCId "give") []
  gf Ghand = mkApp (mkCId "hand") []
  gf Gput_V3 = mkApp (mkCId "put_V3") []
  gf Gshoot_V3 = mkApp (mkCId "shoot_V3") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "give" -> Ggive 
      Just (i,[]) | i == mkCId "hand" -> Ghand 
      Just (i,[]) | i == mkCId "put_V3" -> Gput_V3 
      Just (i,[]) | i == mkCId "shoot_V3" -> Gshoot_V3 


      _ -> error ("no V3 " ++ show t)

instance Gf GVA where
  gf Gfeel = mkApp (mkCId "feel") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "feel" -> Gfeel 


      _ -> error ("no VA " ++ show t)

instance Gf GVP where
  gf (GBe_vp x1) = mkApp (mkCId "Be_vp") [gf x1]
  gf (GCausative x1 x2 x3) = mkApp (mkCId "Causative") [gf x1, gf x2, gf x3]
  gf (GChanging x1 x2) = mkApp (mkCId "Changing") [gf x1, gf x2]
  gf (GHappening x1) = mkApp (mkCId "Happening") [gf x1]
  gf (GInforming x1 x2 x3) = mkApp (mkCId "Informing") [gf x1, gf x2, gf x3]
  gf (GIntens x1 x2) = mkApp (mkCId "Intens") [gf x1, gf x2]
  gf (GLook_bad x1 x2) = mkApp (mkCId "Look_bad") [gf x1, gf x2]
  gf (GPass x1) = mkApp (mkCId "Pass") [gf x1]
  gf (GPositing x1 x2) = mkApp (mkCId "Positing") [gf x1, gf x2]
  gf (GPred2A x1 x2 x3) = mkApp (mkCId "Pred2A") [gf x1, gf x2, gf x3]
  gf (GToPlace x1 x2) = mkApp (mkCId "ToPlace") [gf x1, gf x2]
  gf (GTriangulating x1 x2 x3) = mkApp (mkCId "Triangulating") [gf x1, gf x2, gf x3]
  gf (GWithCl x1 x2) = mkApp (mkCId "WithCl") [gf x1, gf x2]
  gf (GWithPlace x1 x2) = mkApp (mkCId "WithPlace") [gf x1, gf x2]
  gf (GWithStyle x1 x2) = mkApp (mkCId "WithStyle") [gf x1, gf x2]
  gf (GWithTime x1 x2) = mkApp (mkCId "WithTime") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Be_vp" -> GBe_vp (fg x1)
      Just (i,[x1,x2,x3]) | i == mkCId "Causative" -> GCausative (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "Changing" -> GChanging (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Happening" -> GHappening (fg x1)
      Just (i,[x1,x2,x3]) | i == mkCId "Informing" -> GInforming (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "Intens" -> GIntens (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Look_bad" -> GLook_bad (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Pass" -> GPass (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Positing" -> GPositing (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "Pred2A" -> GPred2A (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "ToPlace" -> GToPlace (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "Triangulating" -> GTriangulating (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "WithCl" -> GWithCl (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithPlace" -> GWithPlace (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithStyle" -> GWithStyle (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WithTime" -> GWithTime (fg x1) (fg x2)


      _ -> error ("no VP " ++ show t)

instance Gf GVPSlash where
  gf (GV2Slash x1) = mkApp (mkCId "V2Slash") [gf x1]
  gf (GV2VSlash x1 x2) = mkApp (mkCId "V2VSlash") [gf x1, gf x2]
  gf (GV3Slash x1 x2) = mkApp (mkCId "V3Slash") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "V2Slash" -> GV2Slash (fg x1)
      Just (i,[x1,x2]) | i == mkCId "V2VSlash" -> GV2VSlash (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "V3Slash" -> GV3Slash (fg x1) (fg x2)


      _ -> error ("no VPSlash " ++ show t)

instance Gf GVS where
  gf Gbelieve = mkApp (mkCId "believe") []
  gf Gknow_VS = mkApp (mkCId "know_VS") []
  gf Gsay = mkApp (mkCId "say") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "believe" -> Gbelieve 
      Just (i,[]) | i == mkCId "know_VS" -> Gknow_VS 
      Just (i,[]) | i == mkCId "say" -> Gsay 


      _ -> error ("no VS " ++ show t)

instance Gf GVV where
  gf Gcan = mkApp (mkCId "can") []
  gf Gremember_VV = mkApp (mkCId "remember_VV") []
  gf Gtry = mkApp (mkCId "try") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "can" -> Gcan 
      Just (i,[]) | i == mkCId "remember_VV" -> Gremember_VV 
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



instance Show GMotion

instance Gf GMotion where
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



instance Show GSC

instance Gf GSC where
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



instance Show GVQ

instance Gf GVQ where
  gf _ = undefined
  fg _ = undefined



instance Show GVoc

instance Gf GVoc where
  gf _ = undefined
  fg _ = undefined




