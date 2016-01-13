module Yesod.Static.Bootstrap where

import           Yesod.Core                    (Route)
import           Yesod.EmbeddedStatic          (EmbeddedStatic)
import           Yesod.Static.Commons.Internal

css_3_6 :: Route EmbeddedStatic
css_3_6 = bootstrap_3_3_6_css_bootstrap_css

js_3_6 :: Route EmbeddedStatic
js_3_6 = bootstrap_3_3_6_js_bootstrap_js

theme_3_6 :: Route EmbeddedStatic
theme_3_6 = bootstrap_3_3_6_css_bootstrap_theme_css

