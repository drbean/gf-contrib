module LogicalForm (module LogicalForm) where

import Data.DRS.DataType hiding (Rel)

data LF = NonProposition
	| ForAll (DRSRef -> LF)
	| Exists (DRSRef -> LF)
	| And LF LF
	| Or LF LF
	| Imp LF LF
	| Neg LF
	| Rel DRSRel [DRSRef]
	| Top
	| Bottom
--	deriving (Eq)

relname :: LF -> String
relname (Rel (DRSRel name) _) = name
-- relname lf = error ( (show lf) ++ " not a relation" )
relname lf = error ( "The formula is " ++ " not a relation" )

-- vim: set ts=2 sts=2 sw=2 noet:
