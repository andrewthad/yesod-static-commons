module Yesod.Static.PickAColor where

import           Yesod.Core                    (Route)
import           Yesod.EmbeddedStatic          (EmbeddedStatic)
import           Yesod.Static.Commons.Internal

css_1_2_3 :: Route EmbeddedStatic
css_1_2_3 = pick_a_color_pick_a_color_1_2_3_min_css

js_1_2_3 :: Route EmbeddedStatic
js_1_2_3 = pick_a_color_pick_a_color_1_2_3_min_js

