module AFB1J0 where

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
   Gcute 
 | Gdifficult 
  deriving Show

data GAdv = GLocation GPrep GNP 
  deriving Show

data GCN =
   GKind GAP GCN 
 | GKindOfKind GCN GAdv 
 | GOfpos GN2 GNP 
 | Gbrother 
 | Gchild 
 | Gdog 
 | Gdream 
 | Gfamily 
 | Gfashion_designer 
 | Gfather 
 | Gfreshman 
 | Gfriend 
 | Ggraduation 
 | Gjob 
 | Glife 
 | Gman 
 | Gmother 
 | Gnephew 
 | Gpet 
 | Gschool 
 | Gsenior 
 | Gsister 
 | Gthing 
 | Gway 
 | Gwoman 
  deriving Show

data GCl = GSentence GNP GVP 
  deriving Show

data GComp =
   GBe_bad GAP 
 | GBe_mod GAdv 
 | GBe_someone GNP 
  deriving Show

data GDet =
   GApos GNP 
 | Ga_Det 
 | GthePlural_Det 
 | Gthe_Det 
 | Gzero_Det 
  deriving Show

data GIP =
   Gwhat_WH 
 | Gwho_WH 
  deriving Show

data GN2 =
   Gbrother_2 
 | Gfather_2 
 | Gmother_2 
 | Gsister_2 
  deriving Show

data GNP =
   GEntity GPN 
 | GItem GDet GCN 
 | Gdancing 
 | Gdogs_and_cats 
 | Gmoney 
 | Gplaying_basketball 
 | Gplaying_soccer 
 | Gplaying_with_her_nephews 
 | Gtime 
 | Gtwenty_one 
 | Gwatching_action_movies 
 | Gwatching_scary_movies 
 | Gwork 
  deriving Show

data GPN =
   Gbetty 
 | Gbruce2 
 | Gdwyane_wade 
 | Gemily2 
 | Gfast_and_furious 
 | Ggucci 
 | Ghsinchu 
 | Giris 
 | Gjapanese 
 | Gjeremy 
 | Glondon 
 | Gmay 
 | Gminghsin 
 | Gnew_york 
 | Goliver 
 | Gomo 
 | Gpingzhen 
 | Groger 
 | Gsilvi 
 | Gtaichung 
 | Gtaipei 
 | Gtaiwan 
 | Gtaoyuan 
 | Gtucheng 
 | Gyilan 
  deriving Show

data GPrep =
   Gfrom_prep 
 | Gin_prep 
 | Gof_prep 
  deriving Show

data GQCl =
   GTagComp GNP GComp 
 | GTagQ GNP GVP 
 | GWH_AP GIP GAP 
 | GWH_NP GIP GNP 
 | GWH_Pred GIP GVP 
 | GYN GCl 
  deriving Show

data GQS =
   GNegQ GQCl 
 | GPosQ GQCl 
  deriving Show

data GS =
   GNegS GCl 
 | GPosS GCl 
  deriving Show

data GUtt =
   GNo 
 | GNoAnswer 
 | GUt GQS 
 | GYes 
  deriving Show

data GV = Gstudy 
  deriving Show

data GV2 =
   Gbecome 
 | Gcome 
 | Ggo 
 | Ggraduate 
 | Ghave 
 | Glike 
  deriving Show

data GV2V = Gmake 
  deriving Show

data GVP =
   GBe_vp GComp 
 | GCausative GV2V GNP GVP 
 | GChanging GV2 GNP 
 | GHappening GV 
 | GInforming GV2S GNP GS 
 | GIntens GVV GVP 
 | GLocated GVP GAdv 
 | GLook_bad GVA GAP 
 | GPositing GVS GS 
  deriving Show

data GVS =
   Gsay 
 | Gthink 
  deriving Show

data GVV =
   Gcan 
 | Gwant 
  deriving Show

data GA

data GA2

data GAdA

data GAdN

data GAdV

data GAnt

data GCAdv

data GCard

data GClSlash

data GConj

data GDigits

data GIAdv

data GIComp

data GIDet

data GIQuant

data GImp

data GInterj

data GN

data GN3

data GNum

data GNumeral

data GOrd

data GPConj

data GPhr

data GPol

data GPredet

data GPron

data GQuant

data GRCl

data GRP

data GRS

data GSC

data GSSlash

data GSubj

data GTemp

data GTense

data GText

data GV2A

data GV2Q

data GV2S

data GV3

data GVA

data GVPSlash

data GVQ

data GVoc


instance Gf GAP where
  gf Gcute = mkApp (mkCId "cute") []
  gf Gdifficult = mkApp (mkCId "difficult") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "cute" -> Gcute 
      Just (i,[]) | i == mkCId "difficult" -> Gdifficult 


      _ -> error ("no AP " ++ show t)

instance Gf GAdv where
  gf (GLocation x1 x2) = mkApp (mkCId "Location") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Location" -> GLocation (fg x1) (fg x2)


      _ -> error ("no Adv " ++ show t)

instance Gf GCN where
  gf (GKind x1 x2) = mkApp (mkCId "Kind") [gf x1, gf x2]
  gf (GKindOfKind x1 x2) = mkApp (mkCId "KindOfKind") [gf x1, gf x2]
  gf (GOfpos x1 x2) = mkApp (mkCId "Ofpos") [gf x1, gf x2]
  gf Gbrother = mkApp (mkCId "brother") []
  gf Gchild = mkApp (mkCId "child") []
  gf Gdog = mkApp (mkCId "dog") []
  gf Gdream = mkApp (mkCId "dream") []
  gf Gfamily = mkApp (mkCId "family") []
  gf Gfashion_designer = mkApp (mkCId "fashion_designer") []
  gf Gfather = mkApp (mkCId "father") []
  gf Gfreshman = mkApp (mkCId "freshman") []
  gf Gfriend = mkApp (mkCId "friend") []
  gf Ggraduation = mkApp (mkCId "graduation") []
  gf Gjob = mkApp (mkCId "job") []
  gf Glife = mkApp (mkCId "life") []
  gf Gman = mkApp (mkCId "man") []
  gf Gmother = mkApp (mkCId "mother") []
  gf Gnephew = mkApp (mkCId "nephew") []
  gf Gpet = mkApp (mkCId "pet") []
  gf Gschool = mkApp (mkCId "school") []
  gf Gsenior = mkApp (mkCId "senior") []
  gf Gsister = mkApp (mkCId "sister") []
  gf Gthing = mkApp (mkCId "thing") []
  gf Gway = mkApp (mkCId "way") []
  gf Gwoman = mkApp (mkCId "woman") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Kind" -> GKind (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "KindOfKind" -> GKindOfKind (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Ofpos" -> GOfpos (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "brother" -> Gbrother 
      Just (i,[]) | i == mkCId "child" -> Gchild 
      Just (i,[]) | i == mkCId "dog" -> Gdog 
      Just (i,[]) | i == mkCId "dream" -> Gdream 
      Just (i,[]) | i == mkCId "family" -> Gfamily 
      Just (i,[]) | i == mkCId "fashion_designer" -> Gfashion_designer 
      Just (i,[]) | i == mkCId "father" -> Gfather 
      Just (i,[]) | i == mkCId "freshman" -> Gfreshman 
      Just (i,[]) | i == mkCId "friend" -> Gfriend 
      Just (i,[]) | i == mkCId "graduation" -> Ggraduation 
      Just (i,[]) | i == mkCId "job" -> Gjob 
      Just (i,[]) | i == mkCId "life" -> Glife 
      Just (i,[]) | i == mkCId "man" -> Gman 
      Just (i,[]) | i == mkCId "mother" -> Gmother 
      Just (i,[]) | i == mkCId "nephew" -> Gnephew 
      Just (i,[]) | i == mkCId "pet" -> Gpet 
      Just (i,[]) | i == mkCId "school" -> Gschool 
      Just (i,[]) | i == mkCId "senior" -> Gsenior 
      Just (i,[]) | i == mkCId "sister" -> Gsister 
      Just (i,[]) | i == mkCId "thing" -> Gthing 
      Just (i,[]) | i == mkCId "way" -> Gway 
      Just (i,[]) | i == mkCId "woman" -> Gwoman 


      _ -> error ("no CN " ++ show t)

instance Gf GCl where
  gf (GSentence x1 x2) = mkApp (mkCId "Sentence") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Sentence" -> GSentence (fg x1) (fg x2)


      _ -> error ("no Cl " ++ show t)

instance Gf GComp where
  gf (GBe_bad x1) = mkApp (mkCId "Be_bad") [gf x1]
  gf (GBe_mod x1) = mkApp (mkCId "Be_mod") [gf x1]
  gf (GBe_someone x1) = mkApp (mkCId "Be_someone") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Be_bad" -> GBe_bad (fg x1)
      Just (i,[x1]) | i == mkCId "Be_mod" -> GBe_mod (fg x1)
      Just (i,[x1]) | i == mkCId "Be_someone" -> GBe_someone (fg x1)


      _ -> error ("no Comp " ++ show t)

instance Gf GDet where
  gf (GApos x1) = mkApp (mkCId "Apos") [gf x1]
  gf Ga_Det = mkApp (mkCId "a_Det") []
  gf GthePlural_Det = mkApp (mkCId "thePlural_Det") []
  gf Gthe_Det = mkApp (mkCId "the_Det") []
  gf Gzero_Det = mkApp (mkCId "zero_Det") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Apos" -> GApos (fg x1)
      Just (i,[]) | i == mkCId "a_Det" -> Ga_Det 
      Just (i,[]) | i == mkCId "thePlural_Det" -> GthePlural_Det 
      Just (i,[]) | i == mkCId "the_Det" -> Gthe_Det 
      Just (i,[]) | i == mkCId "zero_Det" -> Gzero_Det 


      _ -> error ("no Det " ++ show t)

instance Gf GIP where
  gf Gwhat_WH = mkApp (mkCId "what_WH") []
  gf Gwho_WH = mkApp (mkCId "who_WH") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "what_WH" -> Gwhat_WH 
      Just (i,[]) | i == mkCId "who_WH" -> Gwho_WH 


      _ -> error ("no IP " ++ show t)

instance Gf GN2 where
  gf Gbrother_2 = mkApp (mkCId "brother_2") []
  gf Gfather_2 = mkApp (mkCId "father_2") []
  gf Gmother_2 = mkApp (mkCId "mother_2") []
  gf Gsister_2 = mkApp (mkCId "sister_2") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "brother_2" -> Gbrother_2 
      Just (i,[]) | i == mkCId "father_2" -> Gfather_2 
      Just (i,[]) | i == mkCId "mother_2" -> Gmother_2 
      Just (i,[]) | i == mkCId "sister_2" -> Gsister_2 


      _ -> error ("no N2 " ++ show t)

instance Gf GNP where
  gf (GEntity x1) = mkApp (mkCId "Entity") [gf x1]
  gf (GItem x1 x2) = mkApp (mkCId "Item") [gf x1, gf x2]
  gf Gdancing = mkApp (mkCId "dancing") []
  gf Gdogs_and_cats = mkApp (mkCId "dogs_and_cats") []
  gf Gmoney = mkApp (mkCId "money") []
  gf Gplaying_basketball = mkApp (mkCId "playing_basketball") []
  gf Gplaying_soccer = mkApp (mkCId "playing_soccer") []
  gf Gplaying_with_her_nephews = mkApp (mkCId "playing_with_her_nephews") []
  gf Gtime = mkApp (mkCId "time") []
  gf Gtwenty_one = mkApp (mkCId "twenty_one") []
  gf Gwatching_action_movies = mkApp (mkCId "watching_action_movies") []
  gf Gwatching_scary_movies = mkApp (mkCId "watching_scary_movies") []
  gf Gwork = mkApp (mkCId "work") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Entity" -> GEntity (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Item" -> GItem (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "dancing" -> Gdancing 
      Just (i,[]) | i == mkCId "dogs_and_cats" -> Gdogs_and_cats 
      Just (i,[]) | i == mkCId "money" -> Gmoney 
      Just (i,[]) | i == mkCId "playing_basketball" -> Gplaying_basketball 
      Just (i,[]) | i == mkCId "playing_soccer" -> Gplaying_soccer 
      Just (i,[]) | i == mkCId "playing_with_her_nephews" -> Gplaying_with_her_nephews 
      Just (i,[]) | i == mkCId "time" -> Gtime 
      Just (i,[]) | i == mkCId "twenty_one" -> Gtwenty_one 
      Just (i,[]) | i == mkCId "watching_action_movies" -> Gwatching_action_movies 
      Just (i,[]) | i == mkCId "watching_scary_movies" -> Gwatching_scary_movies 
      Just (i,[]) | i == mkCId "work" -> Gwork 


      _ -> error ("no NP " ++ show t)

instance Gf GPN where
  gf Gbetty = mkApp (mkCId "betty") []
  gf Gbruce2 = mkApp (mkCId "bruce2") []
  gf Gdwyane_wade = mkApp (mkCId "dwyane_wade") []
  gf Gemily2 = mkApp (mkCId "emily2") []
  gf Gfast_and_furious = mkApp (mkCId "fast_and_furious") []
  gf Ggucci = mkApp (mkCId "gucci") []
  gf Ghsinchu = mkApp (mkCId "hsinchu") []
  gf Giris = mkApp (mkCId "iris") []
  gf Gjapanese = mkApp (mkCId "japanese") []
  gf Gjeremy = mkApp (mkCId "jeremy") []
  gf Glondon = mkApp (mkCId "london") []
  gf Gmay = mkApp (mkCId "may") []
  gf Gminghsin = mkApp (mkCId "minghsin") []
  gf Gnew_york = mkApp (mkCId "new_york") []
  gf Goliver = mkApp (mkCId "oliver") []
  gf Gomo = mkApp (mkCId "omo") []
  gf Gpingzhen = mkApp (mkCId "pingzhen") []
  gf Groger = mkApp (mkCId "roger") []
  gf Gsilvi = mkApp (mkCId "silvi") []
  gf Gtaichung = mkApp (mkCId "taichung") []
  gf Gtaipei = mkApp (mkCId "taipei") []
  gf Gtaiwan = mkApp (mkCId "taiwan") []
  gf Gtaoyuan = mkApp (mkCId "taoyuan") []
  gf Gtucheng = mkApp (mkCId "tucheng") []
  gf Gyilan = mkApp (mkCId "yilan") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "betty" -> Gbetty 
      Just (i,[]) | i == mkCId "bruce2" -> Gbruce2 
      Just (i,[]) | i == mkCId "dwyane_wade" -> Gdwyane_wade 
      Just (i,[]) | i == mkCId "emily2" -> Gemily2 
      Just (i,[]) | i == mkCId "fast_and_furious" -> Gfast_and_furious 
      Just (i,[]) | i == mkCId "gucci" -> Ggucci 
      Just (i,[]) | i == mkCId "hsinchu" -> Ghsinchu 
      Just (i,[]) | i == mkCId "iris" -> Giris 
      Just (i,[]) | i == mkCId "japanese" -> Gjapanese 
      Just (i,[]) | i == mkCId "jeremy" -> Gjeremy 
      Just (i,[]) | i == mkCId "london" -> Glondon 
      Just (i,[]) | i == mkCId "may" -> Gmay 
      Just (i,[]) | i == mkCId "minghsin" -> Gminghsin 
      Just (i,[]) | i == mkCId "new_york" -> Gnew_york 
      Just (i,[]) | i == mkCId "oliver" -> Goliver 
      Just (i,[]) | i == mkCId "omo" -> Gomo 
      Just (i,[]) | i == mkCId "pingzhen" -> Gpingzhen 
      Just (i,[]) | i == mkCId "roger" -> Groger 
      Just (i,[]) | i == mkCId "silvi" -> Gsilvi 
      Just (i,[]) | i == mkCId "taichung" -> Gtaichung 
      Just (i,[]) | i == mkCId "taipei" -> Gtaipei 
      Just (i,[]) | i == mkCId "taiwan" -> Gtaiwan 
      Just (i,[]) | i == mkCId "taoyuan" -> Gtaoyuan 
      Just (i,[]) | i == mkCId "tucheng" -> Gtucheng 
      Just (i,[]) | i == mkCId "yilan" -> Gyilan 


      _ -> error ("no PN " ++ show t)

instance Gf GPrep where
  gf Gfrom_prep = mkApp (mkCId "from_prep") []
  gf Gin_prep = mkApp (mkCId "in_prep") []
  gf Gof_prep = mkApp (mkCId "of_prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "from_prep" -> Gfrom_prep 
      Just (i,[]) | i == mkCId "in_prep" -> Gin_prep 
      Just (i,[]) | i == mkCId "of_prep" -> Gof_prep 


      _ -> error ("no Prep " ++ show t)

instance Gf GQCl where
  gf (GTagComp x1 x2) = mkApp (mkCId "TagComp") [gf x1, gf x2]
  gf (GTagQ x1 x2) = mkApp (mkCId "TagQ") [gf x1, gf x2]
  gf (GWH_AP x1 x2) = mkApp (mkCId "WH_AP") [gf x1, gf x2]
  gf (GWH_NP x1 x2) = mkApp (mkCId "WH_NP") [gf x1, gf x2]
  gf (GWH_Pred x1 x2) = mkApp (mkCId "WH_Pred") [gf x1, gf x2]
  gf (GYN x1) = mkApp (mkCId "YN") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "TagComp" -> GTagComp (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "TagQ" -> GTagQ (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WH_AP" -> GWH_AP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WH_NP" -> GWH_NP (fg x1) (fg x2)
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

instance Gf GS where
  gf (GNegS x1) = mkApp (mkCId "NegS") [gf x1]
  gf (GPosS x1) = mkApp (mkCId "PosS") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "NegS" -> GNegS (fg x1)
      Just (i,[x1]) | i == mkCId "PosS" -> GPosS (fg x1)


      _ -> error ("no S " ++ show t)

instance Gf GUtt where
  gf GNo = mkApp (mkCId "No") []
  gf GNoAnswer = mkApp (mkCId "NoAnswer") []
  gf (GUt x1) = mkApp (mkCId "Ut") [gf x1]
  gf GYes = mkApp (mkCId "Yes") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "No" -> GNo 
      Just (i,[]) | i == mkCId "NoAnswer" -> GNoAnswer 
      Just (i,[x1]) | i == mkCId "Ut" -> GUt (fg x1)
      Just (i,[]) | i == mkCId "Yes" -> GYes 


      _ -> error ("no Utt " ++ show t)

instance Gf GV where
  gf Gstudy = mkApp (mkCId "study") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "study" -> Gstudy 


      _ -> error ("no V " ++ show t)

instance Gf GV2 where
  gf Gbecome = mkApp (mkCId "become") []
  gf Gcome = mkApp (mkCId "come") []
  gf Ggo = mkApp (mkCId "go") []
  gf Ggraduate = mkApp (mkCId "graduate") []
  gf Ghave = mkApp (mkCId "have") []
  gf Glike = mkApp (mkCId "like") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "become" -> Gbecome 
      Just (i,[]) | i == mkCId "come" -> Gcome 
      Just (i,[]) | i == mkCId "go" -> Ggo 
      Just (i,[]) | i == mkCId "graduate" -> Ggraduate 
      Just (i,[]) | i == mkCId "have" -> Ghave 
      Just (i,[]) | i == mkCId "like" -> Glike 


      _ -> error ("no V2 " ++ show t)

instance Gf GV2V where
  gf Gmake = mkApp (mkCId "make") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "make" -> Gmake 


      _ -> error ("no V2V " ++ show t)

instance Gf GVP where
  gf (GBe_vp x1) = mkApp (mkCId "Be_vp") [gf x1]
  gf (GCausative x1 x2 x3) = mkApp (mkCId "Causative") [gf x1, gf x2, gf x3]
  gf (GChanging x1 x2) = mkApp (mkCId "Changing") [gf x1, gf x2]
  gf (GHappening x1) = mkApp (mkCId "Happening") [gf x1]
  gf (GInforming x1 x2 x3) = mkApp (mkCId "Informing") [gf x1, gf x2, gf x3]
  gf (GIntens x1 x2) = mkApp (mkCId "Intens") [gf x1, gf x2]
  gf (GLocated x1 x2) = mkApp (mkCId "Located") [gf x1, gf x2]
  gf (GLook_bad x1 x2) = mkApp (mkCId "Look_bad") [gf x1, gf x2]
  gf (GPositing x1 x2) = mkApp (mkCId "Positing") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Be_vp" -> GBe_vp (fg x1)
      Just (i,[x1,x2,x3]) | i == mkCId "Causative" -> GCausative (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "Changing" -> GChanging (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "Happening" -> GHappening (fg x1)
      Just (i,[x1,x2,x3]) | i == mkCId "Informing" -> GInforming (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "Intens" -> GIntens (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Located" -> GLocated (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Look_bad" -> GLook_bad (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Positing" -> GPositing (fg x1) (fg x2)


      _ -> error ("no VP " ++ show t)

instance Gf GVS where
  gf Gsay = mkApp (mkCId "say") []
  gf Gthink = mkApp (mkCId "think") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "say" -> Gsay 
      Just (i,[]) | i == mkCId "think" -> Gthink 


      _ -> error ("no VS " ++ show t)

instance Gf GVV where
  gf Gcan = mkApp (mkCId "can") []
  gf Gwant = mkApp (mkCId "want") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "can" -> Gcan 
      Just (i,[]) | i == mkCId "want" -> Gwant 


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



instance Show GAdV

instance Gf GAdV where
  gf _ = undefined
  fg _ = undefined



instance Show GAnt

instance Gf GAnt where
  gf _ = undefined
  fg _ = undefined



instance Show GCAdv

instance Gf GCAdv where
  gf _ = undefined
  fg _ = undefined



instance Show GCard

instance Gf GCard where
  gf _ = undefined
  fg _ = undefined



instance Show GClSlash

instance Gf GClSlash where
  gf _ = undefined
  fg _ = undefined



instance Show GConj

instance Gf GConj where
  gf _ = undefined
  fg _ = undefined



instance Show GDigits

instance Gf GDigits where
  gf _ = undefined
  fg _ = undefined



instance Show GIAdv

instance Gf GIAdv where
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



instance Show GN

instance Gf GN where
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



instance Show GPhr

instance Gf GPhr where
  gf _ = undefined
  fg _ = undefined



instance Show GPol

instance Gf GPol where
  gf _ = undefined
  fg _ = undefined



instance Show GPredet

instance Gf GPredet where
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



instance Show GRCl

instance Gf GRCl where
  gf _ = undefined
  fg _ = undefined



instance Show GRP

instance Gf GRP where
  gf _ = undefined
  fg _ = undefined



instance Show GRS

instance Gf GRS where
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



instance Show GSubj

instance Gf GSubj where
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



instance Show GVPSlash

instance Gf GVPSlash where
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




