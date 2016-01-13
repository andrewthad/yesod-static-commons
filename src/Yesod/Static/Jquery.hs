module Yesod.Static.Jquery where

import           Yesod.Core                    (Route)
import           Yesod.EmbeddedStatic          (EmbeddedStatic)
import           Yesod.Static.Commons.Internal

version_1_12_0 :: Route EmbeddedStatic
version_1_12_0 = jquery_jquery_1_12_0_min_js

version_2_2_0 :: Route EmbeddedStatic
version_2_2_0 = jquery_jquery_2_2_0_min_js

