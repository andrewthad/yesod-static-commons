module Yesod.Static.MaterialDesignLite where

import           Data.Text                     (Text)
import qualified Data.Text                     as Text
import           Yesod.Core                    (Route)
import           Yesod.EmbeddedStatic          (EmbeddedStatic)
import           Yesod.Static.Commons.Internal

css_1_0_6 :: Route EmbeddedStatic
css_1_0_6 = mdl_1_0_6_material_min_css

js_1_0_6 :: Route EmbeddedStatic
js_1_0_6 = mdl_1_0_6_material_min_js

css_1_0_6_remote :: Text -> Text -> Text
css_1_0_6_remote primary secondary = Text.intercalate "/"
  [ "https://storage.googleapis.com"
  , "code.getmdl.io"
  , "1.0.6"
  , Text.concat
    [ "material."
    , primary
    , "-"
    , secondary
    , ".min.css"
    ]
  ]

