module Trinka where

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
   Gbeautiful 
 | Gbig 
 | Gfront 
 | Ggood 
 | Ggreat 
 | Ghappy 
 | Gimportant 
 | Glast 
 | Gnice 
 | GoPen 
 | Gshined 
 | Gsick 
 | Gyoung 
  deriving Show

data GAdv = GLocation GPrep GNP 
  deriving Show

data GCN =
   GKind GAP GCN 
 | GOfpos GN2 GNP 
 | Gbarber 
 | Gcoat 
 | Gday 
 | Gdollar 
 | Gdoor 
 | Gdoorman 
 | Gfact 
 | Gfriend 
 | Ggarage 
 | Gguest 
 | Ghour 
 | Gjob 
 | Gkit 
 | Glady 
 | Glife 
 | Glocker 
 | Gman 
 | Gmanager 
 | Gmeeting 
 | Gmorning 
 | Gparadise 
 | Gshoe 
 | Gshop 
 | Gstory 
 | Gthing 
 | Gtime 
 | Gtip 
 | Gvip 
 | Gway 
 | Gyear 
  deriving Show

data GCl = GSentence GNP GVP 
  deriving Show

data GComp =
   GBe_bad GAP 
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

data GN2 = Gfather 
  deriving Show

data GNP =
   GEntity GPN 
 | GItem GDet GCN 
 | Gschool_NP 
 | Gwork_NP 
  deriving Show

data GPN =
   Gchristmas 
 | Gdebra 
 | Ged 
 | Ggod 
 | Gjackie 
 | Gmerry_xmas 
 | Gplaza 
  deriving Show

data GPrep =
   Gabout_prep 
 | Gat_prep 
 | Gby_prep 
 | Gfrom_prep 
 | Gin_prep 
 | Glike_prep 
 | Gof_prep 
 | Gon_prep 
 | Gover_prep 
 | Gpart_prep 
 | Gto_prep 
 | Gup_prep 
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

data GV =
   Gcome 
 | Gfit 
 | Gsmile 
 | Gwork_V 
  deriving Show

data GV2 =
   Gbecome 
 | Gcut 
 | Gget 
 | Ggraduate 
 | Ghave 
 | Gknow 
 | Glive 
 | Gput_on 
 | Grun 
 | Gshine 
 | Gtalk 
 | Gtell 
 | Gwalk 
  deriving Show

data GV2A = Gmake 
  deriving Show

data GV2Q = Gask 
  deriving Show

data GV2V = Gtell_to 
  deriving Show

data GV3 =
   Ggive 
 | Gput 
 | Gtreat 
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
 | GPassV3 GV3 GNP 
 | GPositing GVS GS 
 | GPred2A GV2A GNP GAP 
 | GTriangulating GV3 GNP GNP 
  deriving Show

data GVS = Gsay 
  deriving Show

data GVV =
   Gcan 
 | Gstart 
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

data GV2S

data GVA

data GVPSlash

data GVQ

data GVoc


instance Gf GAP where
  gf Gbeautiful = mkApp (mkCId "beautiful") []
  gf Gbig = mkApp (mkCId "big") []
  gf Gfront = mkApp (mkCId "front") []
  gf Ggood = mkApp (mkCId "good") []
  gf Ggreat = mkApp (mkCId "great") []
  gf Ghappy = mkApp (mkCId "happy") []
  gf Gimportant = mkApp (mkCId "important") []
  gf Glast = mkApp (mkCId "last") []
  gf Gnice = mkApp (mkCId "nice") []
  gf GoPen = mkApp (mkCId "oPen") []
  gf Gshined = mkApp (mkCId "shined") []
  gf Gsick = mkApp (mkCId "sick") []
  gf Gyoung = mkApp (mkCId "young") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "beautiful" -> Gbeautiful 
      Just (i,[]) | i == mkCId "big" -> Gbig 
      Just (i,[]) | i == mkCId "front" -> Gfront 
      Just (i,[]) | i == mkCId "good" -> Ggood 
      Just (i,[]) | i == mkCId "great" -> Ggreat 
      Just (i,[]) | i == mkCId "happy" -> Ghappy 
      Just (i,[]) | i == mkCId "important" -> Gimportant 
      Just (i,[]) | i == mkCId "last" -> Glast 
      Just (i,[]) | i == mkCId "nice" -> Gnice 
      Just (i,[]) | i == mkCId "oPen" -> GoPen 
      Just (i,[]) | i == mkCId "shined" -> Gshined 
      Just (i,[]) | i == mkCId "sick" -> Gsick 
      Just (i,[]) | i == mkCId "young" -> Gyoung 


      _ -> error ("no AP " ++ show t)

instance Gf GAdv where
  gf (GLocation x1 x2) = mkApp (mkCId "Location") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Location" -> GLocation (fg x1) (fg x2)


      _ -> error ("no Adv " ++ show t)

instance Gf GCN where
  gf (GKind x1 x2) = mkApp (mkCId "Kind") [gf x1, gf x2]
  gf (GOfpos x1 x2) = mkApp (mkCId "Ofpos") [gf x1, gf x2]
  gf Gbarber = mkApp (mkCId "barber") []
  gf Gcoat = mkApp (mkCId "coat") []
  gf Gday = mkApp (mkCId "day") []
  gf Gdollar = mkApp (mkCId "dollar") []
  gf Gdoor = mkApp (mkCId "door") []
  gf Gdoorman = mkApp (mkCId "doorman") []
  gf Gfact = mkApp (mkCId "fact") []
  gf Gfriend = mkApp (mkCId "friend") []
  gf Ggarage = mkApp (mkCId "garage") []
  gf Gguest = mkApp (mkCId "guest") []
  gf Ghour = mkApp (mkCId "hour") []
  gf Gjob = mkApp (mkCId "job") []
  gf Gkit = mkApp (mkCId "kit") []
  gf Glady = mkApp (mkCId "lady") []
  gf Glife = mkApp (mkCId "life") []
  gf Glocker = mkApp (mkCId "locker") []
  gf Gman = mkApp (mkCId "man") []
  gf Gmanager = mkApp (mkCId "manager") []
  gf Gmeeting = mkApp (mkCId "meeting") []
  gf Gmorning = mkApp (mkCId "morning") []
  gf Gparadise = mkApp (mkCId "paradise") []
  gf Gshoe = mkApp (mkCId "shoe") []
  gf Gshop = mkApp (mkCId "shop") []
  gf Gstory = mkApp (mkCId "story") []
  gf Gthing = mkApp (mkCId "thing") []
  gf Gtime = mkApp (mkCId "time") []
  gf Gtip = mkApp (mkCId "tip") []
  gf Gvip = mkApp (mkCId "vip") []
  gf Gway = mkApp (mkCId "way") []
  gf Gyear = mkApp (mkCId "year") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Kind" -> GKind (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Ofpos" -> GOfpos (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "barber" -> Gbarber 
      Just (i,[]) | i == mkCId "coat" -> Gcoat 
      Just (i,[]) | i == mkCId "day" -> Gday 
      Just (i,[]) | i == mkCId "dollar" -> Gdollar 
      Just (i,[]) | i == mkCId "door" -> Gdoor 
      Just (i,[]) | i == mkCId "doorman" -> Gdoorman 
      Just (i,[]) | i == mkCId "fact" -> Gfact 
      Just (i,[]) | i == mkCId "friend" -> Gfriend 
      Just (i,[]) | i == mkCId "garage" -> Ggarage 
      Just (i,[]) | i == mkCId "guest" -> Gguest 
      Just (i,[]) | i == mkCId "hour" -> Ghour 
      Just (i,[]) | i == mkCId "job" -> Gjob 
      Just (i,[]) | i == mkCId "kit" -> Gkit 
      Just (i,[]) | i == mkCId "lady" -> Glady 
      Just (i,[]) | i == mkCId "life" -> Glife 
      Just (i,[]) | i == mkCId "locker" -> Glocker 
      Just (i,[]) | i == mkCId "man" -> Gman 
      Just (i,[]) | i == mkCId "manager" -> Gmanager 
      Just (i,[]) | i == mkCId "meeting" -> Gmeeting 
      Just (i,[]) | i == mkCId "morning" -> Gmorning 
      Just (i,[]) | i == mkCId "paradise" -> Gparadise 
      Just (i,[]) | i == mkCId "shoe" -> Gshoe 
      Just (i,[]) | i == mkCId "shop" -> Gshop 
      Just (i,[]) | i == mkCId "story" -> Gstory 
      Just (i,[]) | i == mkCId "thing" -> Gthing 
      Just (i,[]) | i == mkCId "time" -> Gtime 
      Just (i,[]) | i == mkCId "tip" -> Gtip 
      Just (i,[]) | i == mkCId "vip" -> Gvip 
      Just (i,[]) | i == mkCId "way" -> Gway 
      Just (i,[]) | i == mkCId "year" -> Gyear 


      _ -> error ("no CN " ++ show t)

instance Gf GCl where
  gf (GSentence x1 x2) = mkApp (mkCId "Sentence") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Sentence" -> GSentence (fg x1) (fg x2)


      _ -> error ("no Cl " ++ show t)

instance Gf GComp where
  gf (GBe_bad x1) = mkApp (mkCId "Be_bad") [gf x1]
  gf (GBe_someone x1) = mkApp (mkCId "Be_someone") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Be_bad" -> GBe_bad (fg x1)
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
  gf Gfather = mkApp (mkCId "father") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "father" -> Gfather 


      _ -> error ("no N2 " ++ show t)

instance Gf GNP where
  gf (GEntity x1) = mkApp (mkCId "Entity") [gf x1]
  gf (GItem x1 x2) = mkApp (mkCId "Item") [gf x1, gf x2]
  gf Gschool_NP = mkApp (mkCId "school_NP") []
  gf Gwork_NP = mkApp (mkCId "work_NP") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Entity" -> GEntity (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Item" -> GItem (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "school_NP" -> Gschool_NP 
      Just (i,[]) | i == mkCId "work_NP" -> Gwork_NP 


      _ -> error ("no NP " ++ show t)

instance Gf GPN where
  gf Gchristmas = mkApp (mkCId "christmas") []
  gf Gdebra = mkApp (mkCId "debra") []
  gf Ged = mkApp (mkCId "ed") []
  gf Ggod = mkApp (mkCId "god") []
  gf Gjackie = mkApp (mkCId "jackie") []
  gf Gmerry_xmas = mkApp (mkCId "merry_xmas") []
  gf Gplaza = mkApp (mkCId "plaza") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "christmas" -> Gchristmas 
      Just (i,[]) | i == mkCId "debra" -> Gdebra 
      Just (i,[]) | i == mkCId "ed" -> Ged 
      Just (i,[]) | i == mkCId "god" -> Ggod 
      Just (i,[]) | i == mkCId "jackie" -> Gjackie 
      Just (i,[]) | i == mkCId "merry_xmas" -> Gmerry_xmas 
      Just (i,[]) | i == mkCId "plaza" -> Gplaza 


      _ -> error ("no PN " ++ show t)

instance Gf GPrep where
  gf Gabout_prep = mkApp (mkCId "about_prep") []
  gf Gat_prep = mkApp (mkCId "at_prep") []
  gf Gby_prep = mkApp (mkCId "by_prep") []
  gf Gfrom_prep = mkApp (mkCId "from_prep") []
  gf Gin_prep = mkApp (mkCId "in_prep") []
  gf Glike_prep = mkApp (mkCId "like_prep") []
  gf Gof_prep = mkApp (mkCId "of_prep") []
  gf Gon_prep = mkApp (mkCId "on_prep") []
  gf Gover_prep = mkApp (mkCId "over_prep") []
  gf Gpart_prep = mkApp (mkCId "part_prep") []
  gf Gto_prep = mkApp (mkCId "to_prep") []
  gf Gup_prep = mkApp (mkCId "up_prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "about_prep" -> Gabout_prep 
      Just (i,[]) | i == mkCId "at_prep" -> Gat_prep 
      Just (i,[]) | i == mkCId "by_prep" -> Gby_prep 
      Just (i,[]) | i == mkCId "from_prep" -> Gfrom_prep 
      Just (i,[]) | i == mkCId "in_prep" -> Gin_prep 
      Just (i,[]) | i == mkCId "like_prep" -> Glike_prep 
      Just (i,[]) | i == mkCId "of_prep" -> Gof_prep 
      Just (i,[]) | i == mkCId "on_prep" -> Gon_prep 
      Just (i,[]) | i == mkCId "over_prep" -> Gover_prep 
      Just (i,[]) | i == mkCId "part_prep" -> Gpart_prep 
      Just (i,[]) | i == mkCId "to_prep" -> Gto_prep 
      Just (i,[]) | i == mkCId "up_prep" -> Gup_prep 


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
  gf Gcome = mkApp (mkCId "come") []
  gf Gfit = mkApp (mkCId "fit") []
  gf Gsmile = mkApp (mkCId "smile") []
  gf Gwork_V = mkApp (mkCId "work_V") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "come" -> Gcome 
      Just (i,[]) | i == mkCId "fit" -> Gfit 
      Just (i,[]) | i == mkCId "smile" -> Gsmile 
      Just (i,[]) | i == mkCId "work_V" -> Gwork_V 


      _ -> error ("no V " ++ show t)

instance Gf GV2 where
  gf Gbecome = mkApp (mkCId "become") []
  gf Gcut = mkApp (mkCId "cut") []
  gf Gget = mkApp (mkCId "get") []
  gf Ggraduate = mkApp (mkCId "graduate") []
  gf Ghave = mkApp (mkCId "have") []
  gf Gknow = mkApp (mkCId "know") []
  gf Glive = mkApp (mkCId "live") []
  gf Gput_on = mkApp (mkCId "put_on") []
  gf Grun = mkApp (mkCId "run") []
  gf Gshine = mkApp (mkCId "shine") []
  gf Gtalk = mkApp (mkCId "talk") []
  gf Gtell = mkApp (mkCId "tell") []
  gf Gwalk = mkApp (mkCId "walk") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "become" -> Gbecome 
      Just (i,[]) | i == mkCId "cut" -> Gcut 
      Just (i,[]) | i == mkCId "get" -> Gget 
      Just (i,[]) | i == mkCId "graduate" -> Ggraduate 
      Just (i,[]) | i == mkCId "have" -> Ghave 
      Just (i,[]) | i == mkCId "know" -> Gknow 
      Just (i,[]) | i == mkCId "live" -> Glive 
      Just (i,[]) | i == mkCId "put_on" -> Gput_on 
      Just (i,[]) | i == mkCId "run" -> Grun 
      Just (i,[]) | i == mkCId "shine" -> Gshine 
      Just (i,[]) | i == mkCId "talk" -> Gtalk 
      Just (i,[]) | i == mkCId "tell" -> Gtell 
      Just (i,[]) | i == mkCId "walk" -> Gwalk 


      _ -> error ("no V2 " ++ show t)

instance Gf GV2A where
  gf Gmake = mkApp (mkCId "make") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "make" -> Gmake 


      _ -> error ("no V2A " ++ show t)

instance Gf GV2Q where
  gf Gask = mkApp (mkCId "ask") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "ask" -> Gask 


      _ -> error ("no V2Q " ++ show t)

instance Gf GV2V where
  gf Gtell_to = mkApp (mkCId "tell_to") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "tell_to" -> Gtell_to 


      _ -> error ("no V2V " ++ show t)

instance Gf GV3 where
  gf Ggive = mkApp (mkCId "give") []
  gf Gput = mkApp (mkCId "put") []
  gf Gtreat = mkApp (mkCId "treat") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "give" -> Ggive 
      Just (i,[]) | i == mkCId "put" -> Gput 
      Just (i,[]) | i == mkCId "treat" -> Gtreat 


      _ -> error ("no V3 " ++ show t)

instance Gf GVP where
  gf (GBe_vp x1) = mkApp (mkCId "Be_vp") [gf x1]
  gf (GCausative x1 x2 x3) = mkApp (mkCId "Causative") [gf x1, gf x2, gf x3]
  gf (GChanging x1 x2) = mkApp (mkCId "Changing") [gf x1, gf x2]
  gf (GHappening x1) = mkApp (mkCId "Happening") [gf x1]
  gf (GInforming x1 x2 x3) = mkApp (mkCId "Informing") [gf x1, gf x2, gf x3]
  gf (GIntens x1 x2) = mkApp (mkCId "Intens") [gf x1, gf x2]
  gf (GLocated x1 x2) = mkApp (mkCId "Located") [gf x1, gf x2]
  gf (GLook_bad x1 x2) = mkApp (mkCId "Look_bad") [gf x1, gf x2]
  gf (GPassV3 x1 x2) = mkApp (mkCId "PassV3") [gf x1, gf x2]
  gf (GPositing x1 x2) = mkApp (mkCId "Positing") [gf x1, gf x2]
  gf (GPred2A x1 x2 x3) = mkApp (mkCId "Pred2A") [gf x1, gf x2, gf x3]
  gf (GTriangulating x1 x2 x3) = mkApp (mkCId "Triangulating") [gf x1, gf x2, gf x3]

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
      Just (i,[x1,x2]) | i == mkCId "PassV3" -> GPassV3 (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Positing" -> GPositing (fg x1) (fg x2)
      Just (i,[x1,x2,x3]) | i == mkCId "Pred2A" -> GPred2A (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2,x3]) | i == mkCId "Triangulating" -> GTriangulating (fg x1) (fg x2) (fg x3)


      _ -> error ("no VP " ++ show t)

instance Gf GVS where
  gf Gsay = mkApp (mkCId "say") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "say" -> Gsay 


      _ -> error ("no VS " ++ show t)

instance Gf GVV where
  gf Gcan = mkApp (mkCId "can") []
  gf Gstart = mkApp (mkCId "start") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "can" -> Gcan 
      Just (i,[]) | i == mkCId "start" -> Gstart 


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



instance Show GV2S

instance Gf GV2S where
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




