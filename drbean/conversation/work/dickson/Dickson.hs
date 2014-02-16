module Dickson where

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
   Gbad 
 | Gbetter 
 | Gfirst 
 | Ghard 
 | Glittle 
 | Gmad 
 | Gnext 
 | Gnone 
 | Gright 
 | Gsame 
 | Gseveral 
 | Gtwo 
  deriving Show

data GCN =
   GOfpos GN2 GNP 
 | Gapprentice 
 | Gchild 
 | Gdad 
 | Geighty 
 | Gend 
 | Gfamily 
 | Gfather 
 | Ggraduation 
 | Gguy 
 | Gjob 
 | Gkind 
 | Gknack 
 | Glife 
 | Gman 
 | Gnight 
 | Gposition 
 | Gpound 
 | Gschool 
 | Gship 
 | Gsuperintendent 
 | Gsupervisor 
 | Gthing 
 | Gtop 
 | Gtransformer 
 | Guncle 
 | Gway 
 | Gweek 
 | Gword 
  deriving Show

data GCl = GSentence GNP GVP 
  deriving Show

data GComp =
   GBe_bad GAP 
 | GBe_dee GNP 
  deriving Show

data GDet =
   Ga_Det 
 | GthePlural_Det 
 | Gthe_Det 
 | Gzero_Det 
  deriving Show

data GIP =
   Gwhat_WH 
 | Gwho_WH 
  deriving Show

data GN2 =
   Gfather_2 
 | Guncle_2 
  deriving Show

data GNP =
   GEntity GPN 
 | GItem GDet GCN 
 | Gmoney 
 | Gstuff 
 | Gtime 
 | Gwork 
  deriving Show

data GPN =
   Galf 
 | Gdee 
 | Gmonday 
  deriving Show

data GPrep = Gof_prep 
  deriving Show

data GQCl =
   GTagQ GNP GVP 
 | GWH_Cop GIP GNP 
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
 | GUt GQS 
 | GYes 
  deriving Show

data GV =
   Gknow 
 | Glaugh 
 | Glook_here 
 | Gslow_down 
 | Gwork_V 
  deriving Show

data GV2 =
   Gbecome 
 | Gget 
 | Gget_along 
 | Ggo 
 | Ghave 
 | Ghire 
 | Ginterview 
 | Glift 
 | Glike 
 | Gprove 
 | Gsee 
  deriving Show

data GV2S = Gtell 
  deriving Show

data GV2V = Gtake 
  deriving Show

data GVA = Glook 
  deriving Show

data GVP =
   GBe_vp GComp 
 | GCausative GV2V GNP GVP 
 | GChanging GV2 GNP 
 | GHappening GV 
 | GInforming GV2S GNP GS 
 | GIntens GVV GVP 
 | GLook_bad GVA GAP 
 | GPositing GVS GS 
  deriving Show

data GVS =
   Gknow_VS 
 | Gsay 
 | Gthink 
  deriving Show

data GVV =
   Gcan 
 | Gneed 
 | Gstart 
  deriving Show

data GA

data GA2

data GAdA

data GAdN

data GAdV

data GAdv

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

data GV3

data GVPSlash

data GVQ

data GVoc


instance Gf GAP where
  gf Gbad = mkApp (mkCId "bad") []
  gf Gbetter = mkApp (mkCId "better") []
  gf Gfirst = mkApp (mkCId "first") []
  gf Ghard = mkApp (mkCId "hard") []
  gf Glittle = mkApp (mkCId "little") []
  gf Gmad = mkApp (mkCId "mad") []
  gf Gnext = mkApp (mkCId "next") []
  gf Gnone = mkApp (mkCId "none") []
  gf Gright = mkApp (mkCId "right") []
  gf Gsame = mkApp (mkCId "same") []
  gf Gseveral = mkApp (mkCId "several") []
  gf Gtwo = mkApp (mkCId "two") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "bad" -> Gbad 
      Just (i,[]) | i == mkCId "better" -> Gbetter 
      Just (i,[]) | i == mkCId "first" -> Gfirst 
      Just (i,[]) | i == mkCId "hard" -> Ghard 
      Just (i,[]) | i == mkCId "little" -> Glittle 
      Just (i,[]) | i == mkCId "mad" -> Gmad 
      Just (i,[]) | i == mkCId "next" -> Gnext 
      Just (i,[]) | i == mkCId "none" -> Gnone 
      Just (i,[]) | i == mkCId "right" -> Gright 
      Just (i,[]) | i == mkCId "same" -> Gsame 
      Just (i,[]) | i == mkCId "several" -> Gseveral 
      Just (i,[]) | i == mkCId "two" -> Gtwo 


      _ -> error ("no AP " ++ show t)

instance Gf GCN where
  gf (GOfpos x1 x2) = mkApp (mkCId "Ofpos") [gf x1, gf x2]
  gf Gapprentice = mkApp (mkCId "apprentice") []
  gf Gchild = mkApp (mkCId "child") []
  gf Gdad = mkApp (mkCId "dad") []
  gf Geighty = mkApp (mkCId "eighty") []
  gf Gend = mkApp (mkCId "end") []
  gf Gfamily = mkApp (mkCId "family") []
  gf Gfather = mkApp (mkCId "father") []
  gf Ggraduation = mkApp (mkCId "graduation") []
  gf Gguy = mkApp (mkCId "guy") []
  gf Gjob = mkApp (mkCId "job") []
  gf Gkind = mkApp (mkCId "kind") []
  gf Gknack = mkApp (mkCId "knack") []
  gf Glife = mkApp (mkCId "life") []
  gf Gman = mkApp (mkCId "man") []
  gf Gnight = mkApp (mkCId "night") []
  gf Gposition = mkApp (mkCId "position") []
  gf Gpound = mkApp (mkCId "pound") []
  gf Gschool = mkApp (mkCId "school") []
  gf Gship = mkApp (mkCId "ship") []
  gf Gsuperintendent = mkApp (mkCId "superintendent") []
  gf Gsupervisor = mkApp (mkCId "supervisor") []
  gf Gthing = mkApp (mkCId "thing") []
  gf Gtop = mkApp (mkCId "top") []
  gf Gtransformer = mkApp (mkCId "transformer") []
  gf Guncle = mkApp (mkCId "uncle") []
  gf Gway = mkApp (mkCId "way") []
  gf Gweek = mkApp (mkCId "week") []
  gf Gword = mkApp (mkCId "word") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Ofpos" -> GOfpos (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "apprentice" -> Gapprentice 
      Just (i,[]) | i == mkCId "child" -> Gchild 
      Just (i,[]) | i == mkCId "dad" -> Gdad 
      Just (i,[]) | i == mkCId "eighty" -> Geighty 
      Just (i,[]) | i == mkCId "end" -> Gend 
      Just (i,[]) | i == mkCId "family" -> Gfamily 
      Just (i,[]) | i == mkCId "father" -> Gfather 
      Just (i,[]) | i == mkCId "graduation" -> Ggraduation 
      Just (i,[]) | i == mkCId "guy" -> Gguy 
      Just (i,[]) | i == mkCId "job" -> Gjob 
      Just (i,[]) | i == mkCId "kind" -> Gkind 
      Just (i,[]) | i == mkCId "knack" -> Gknack 
      Just (i,[]) | i == mkCId "life" -> Glife 
      Just (i,[]) | i == mkCId "man" -> Gman 
      Just (i,[]) | i == mkCId "night" -> Gnight 
      Just (i,[]) | i == mkCId "position" -> Gposition 
      Just (i,[]) | i == mkCId "pound" -> Gpound 
      Just (i,[]) | i == mkCId "school" -> Gschool 
      Just (i,[]) | i == mkCId "ship" -> Gship 
      Just (i,[]) | i == mkCId "superintendent" -> Gsuperintendent 
      Just (i,[]) | i == mkCId "supervisor" -> Gsupervisor 
      Just (i,[]) | i == mkCId "thing" -> Gthing 
      Just (i,[]) | i == mkCId "top" -> Gtop 
      Just (i,[]) | i == mkCId "transformer" -> Gtransformer 
      Just (i,[]) | i == mkCId "uncle" -> Guncle 
      Just (i,[]) | i == mkCId "way" -> Gway 
      Just (i,[]) | i == mkCId "week" -> Gweek 
      Just (i,[]) | i == mkCId "word" -> Gword 


      _ -> error ("no CN " ++ show t)

instance Gf GCl where
  gf (GSentence x1 x2) = mkApp (mkCId "Sentence") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Sentence" -> GSentence (fg x1) (fg x2)


      _ -> error ("no Cl " ++ show t)

instance Gf GComp where
  gf (GBe_bad x1) = mkApp (mkCId "Be_bad") [gf x1]
  gf (GBe_dee x1) = mkApp (mkCId "Be_dee") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Be_bad" -> GBe_bad (fg x1)
      Just (i,[x1]) | i == mkCId "Be_dee" -> GBe_dee (fg x1)


      _ -> error ("no Comp " ++ show t)

instance Gf GDet where
  gf Ga_Det = mkApp (mkCId "a_Det") []
  gf GthePlural_Det = mkApp (mkCId "thePlural_Det") []
  gf Gthe_Det = mkApp (mkCId "the_Det") []
  gf Gzero_Det = mkApp (mkCId "zero_Det") []

  fg t =
    case unApp t of
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
  gf Gfather_2 = mkApp (mkCId "father_2") []
  gf Guncle_2 = mkApp (mkCId "uncle_2") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "father_2" -> Gfather_2 
      Just (i,[]) | i == mkCId "uncle_2" -> Guncle_2 


      _ -> error ("no N2 " ++ show t)

instance Gf GNP where
  gf (GEntity x1) = mkApp (mkCId "Entity") [gf x1]
  gf (GItem x1 x2) = mkApp (mkCId "Item") [gf x1, gf x2]
  gf Gmoney = mkApp (mkCId "money") []
  gf Gstuff = mkApp (mkCId "stuff") []
  gf Gtime = mkApp (mkCId "time") []
  gf Gwork = mkApp (mkCId "work") []

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "Entity" -> GEntity (fg x1)
      Just (i,[x1,x2]) | i == mkCId "Item" -> GItem (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "money" -> Gmoney 
      Just (i,[]) | i == mkCId "stuff" -> Gstuff 
      Just (i,[]) | i == mkCId "time" -> Gtime 
      Just (i,[]) | i == mkCId "work" -> Gwork 


      _ -> error ("no NP " ++ show t)

instance Gf GPN where
  gf Galf = mkApp (mkCId "alf") []
  gf Gdee = mkApp (mkCId "dee") []
  gf Gmonday = mkApp (mkCId "monday") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "alf" -> Galf 
      Just (i,[]) | i == mkCId "dee" -> Gdee 
      Just (i,[]) | i == mkCId "monday" -> Gmonday 


      _ -> error ("no PN " ++ show t)

instance Gf GPrep where
  gf Gof_prep = mkApp (mkCId "of_prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "of_prep" -> Gof_prep 


      _ -> error ("no Prep " ++ show t)

instance Gf GQCl where
  gf (GTagQ x1 x2) = mkApp (mkCId "TagQ") [gf x1, gf x2]
  gf (GWH_Cop x1 x2) = mkApp (mkCId "WH_Cop") [gf x1, gf x2]
  gf (GWH_Pred x1 x2) = mkApp (mkCId "WH_Pred") [gf x1, gf x2]
  gf (GYN x1) = mkApp (mkCId "YN") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "TagQ" -> GTagQ (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "WH_Cop" -> GWH_Cop (fg x1) (fg x2)
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
  gf (GUt x1) = mkApp (mkCId "Ut") [gf x1]
  gf GYes = mkApp (mkCId "Yes") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "No" -> GNo 
      Just (i,[x1]) | i == mkCId "Ut" -> GUt (fg x1)
      Just (i,[]) | i == mkCId "Yes" -> GYes 


      _ -> error ("no Utt " ++ show t)

instance Gf GV where
  gf Gknow = mkApp (mkCId "know") []
  gf Glaugh = mkApp (mkCId "laugh") []
  gf Glook_here = mkApp (mkCId "look_here") []
  gf Gslow_down = mkApp (mkCId "slow_down") []
  gf Gwork_V = mkApp (mkCId "work_V") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "know" -> Gknow 
      Just (i,[]) | i == mkCId "laugh" -> Glaugh 
      Just (i,[]) | i == mkCId "look_here" -> Glook_here 
      Just (i,[]) | i == mkCId "slow_down" -> Gslow_down 
      Just (i,[]) | i == mkCId "work_V" -> Gwork_V 


      _ -> error ("no V " ++ show t)

instance Gf GV2 where
  gf Gbecome = mkApp (mkCId "become") []
  gf Gget = mkApp (mkCId "get") []
  gf Gget_along = mkApp (mkCId "get_along") []
  gf Ggo = mkApp (mkCId "go") []
  gf Ghave = mkApp (mkCId "have") []
  gf Ghire = mkApp (mkCId "hire") []
  gf Ginterview = mkApp (mkCId "interview") []
  gf Glift = mkApp (mkCId "lift") []
  gf Glike = mkApp (mkCId "like") []
  gf Gprove = mkApp (mkCId "prove") []
  gf Gsee = mkApp (mkCId "see") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "become" -> Gbecome 
      Just (i,[]) | i == mkCId "get" -> Gget 
      Just (i,[]) | i == mkCId "get_along" -> Gget_along 
      Just (i,[]) | i == mkCId "go" -> Ggo 
      Just (i,[]) | i == mkCId "have" -> Ghave 
      Just (i,[]) | i == mkCId "hire" -> Ghire 
      Just (i,[]) | i == mkCId "interview" -> Ginterview 
      Just (i,[]) | i == mkCId "lift" -> Glift 
      Just (i,[]) | i == mkCId "like" -> Glike 
      Just (i,[]) | i == mkCId "prove" -> Gprove 
      Just (i,[]) | i == mkCId "see" -> Gsee 


      _ -> error ("no V2 " ++ show t)

instance Gf GV2S where
  gf Gtell = mkApp (mkCId "tell") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "tell" -> Gtell 


      _ -> error ("no V2S " ++ show t)

instance Gf GV2V where
  gf Gtake = mkApp (mkCId "take") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "take" -> Gtake 


      _ -> error ("no V2V " ++ show t)

instance Gf GVA where
  gf Glook = mkApp (mkCId "look") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "look" -> Glook 


      _ -> error ("no VA " ++ show t)

instance Gf GVP where
  gf (GBe_vp x1) = mkApp (mkCId "Be_vp") [gf x1]
  gf (GCausative x1 x2 x3) = mkApp (mkCId "Causative") [gf x1, gf x2, gf x3]
  gf (GChanging x1 x2) = mkApp (mkCId "Changing") [gf x1, gf x2]
  gf (GHappening x1) = mkApp (mkCId "Happening") [gf x1]
  gf (GInforming x1 x2 x3) = mkApp (mkCId "Informing") [gf x1, gf x2, gf x3]
  gf (GIntens x1 x2) = mkApp (mkCId "Intens") [gf x1, gf x2]
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
      Just (i,[x1,x2]) | i == mkCId "Look_bad" -> GLook_bad (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "Positing" -> GPositing (fg x1) (fg x2)


      _ -> error ("no VP " ++ show t)

instance Gf GVS where
  gf Gknow_VS = mkApp (mkCId "know_VS") []
  gf Gsay = mkApp (mkCId "say") []
  gf Gthink = mkApp (mkCId "think") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "know_VS" -> Gknow_VS 
      Just (i,[]) | i == mkCId "say" -> Gsay 
      Just (i,[]) | i == mkCId "think" -> Gthink 


      _ -> error ("no VS " ++ show t)

instance Gf GVV where
  gf Gcan = mkApp (mkCId "can") []
  gf Gneed = mkApp (mkCId "need") []
  gf Gstart = mkApp (mkCId "start") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "can" -> Gcan 
      Just (i,[]) | i == mkCId "need" -> Gneed 
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



instance Show GAdv

instance Gf GAdv where
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



instance Show GV3

instance Gf GV3 where
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




