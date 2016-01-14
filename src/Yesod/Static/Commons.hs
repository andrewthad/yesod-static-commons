module Yesod.Static.Commons where

import           GHC.Exts                (Constraint)
import           Yesod.Core
import           Yesod.EmbeddedStatic    (EmbeddedStatic)
import qualified Yesod.Static.Bootstrap  as Bootstrap
import qualified Yesod.Static.Jquery     as Jquery
import qualified Yesod.Static.PickAColor as PickAColor
import qualified Yesod.Static.TinyColor  as TinyColor

class HasEmbeddedStatic site where
  promoteEmbeddedStaticRoute :: site -> Route EmbeddedStatic -> Route site

class HasEmbeddedResources lib where
  embeddedStylesheets :: lib -> [Route EmbeddedStatic]
  embeddedScripts :: lib -> [Route EmbeddedStatic]

class Provide site lib where
  provide :: site -> lib -> WidgetT site IO ()
  default provide :: (HasEmbeddedResources lib, HasEmbeddedStatic site)
                  => site -> lib -> WidgetT site IO ()
  provide site lib = do
    mapM_ (addStylesheet . promoteEmbeddedStaticRoute site) (embeddedStylesheets lib)
    mapM_ (addScript . promoteEmbeddedStaticRoute site) (embeddedScripts lib)

data Bootstrap  = Bootstrap
data Jquery     = Jquery
data PickAColor = PickAColor
data TinyColor  = TinyColor

instance HasEmbeddedResources Bootstrap where
  embeddedStylesheets _ = [Bootstrap.css_3_6, Bootstrap.theme_3_6]
  embeddedScripts     _ = [Bootstrap.js_3_6]
instance HasEmbeddedResources Jquery where
  embeddedStylesheets _ = []
  embeddedScripts     _ = [Jquery.version_2_2_0]
instance HasEmbeddedResources PickAColor where
  embeddedStylesheets _ = [PickAColor.css_1_2_3]
  embeddedScripts     _ = [PickAColor.js_1_2_3]
instance HasEmbeddedResources TinyColor where
  embeddedStylesheets _ = []
  embeddedScripts     _ = [TinyColor.version_0_9_15]

type family ProvideAll site libs :: Constraint where
  ProvideAll site '[] = ()
  ProvideAll site (r ': rs) = (Provide site r, ProvideAll site rs)

