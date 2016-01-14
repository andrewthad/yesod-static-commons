module Yesod.Static.TinyColor where

import           Yesod.Core                    (Route)
import           Yesod.EmbeddedStatic          (EmbeddedStatic)
import           Yesod.Static.Commons.Internal

version_1_3_0 :: Route EmbeddedStatic
version_1_3_0 = tinycolor_tinycolor_1_3_0_min_js

version_0_9_15 :: Route EmbeddedStatic
version_0_9_15 = tinycolor_tinycolor_0_9_15_min_js

