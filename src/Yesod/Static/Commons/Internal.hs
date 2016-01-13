module Yesod.Static.Commons.Internal where

import           Yesod.EmbeddedStatic            (mkEmbeddedStatic)
import           Yesod.EmbeddedStatic.Generators (embedDir)

mkEmbeddedStatic False "commons" [embedDir "resources"]


