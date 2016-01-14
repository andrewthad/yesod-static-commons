module Yesod.Form.Fields.Bootstrap.Types where

import           Data.Text            (Text)
import           Database.Persist     (PersistField)
import           Database.Persist.Sql (PersistFieldSql)

newtype Color = Color { getColor :: Text }
  deriving (PersistField, PersistFieldSql)

