module Yesod.Static.Commons where

import           Data.Text                       (Text)
import           GHC.Exts                        (Constraint)
import           Yesod.Core
import           Yesod.EmbeddedStatic            (EmbeddedStatic)
import qualified Yesod.Static.Bootstrap          as Bootstrap
import qualified Yesod.Static.Jquery             as Jquery
import qualified Yesod.Static.MaterialDesignLite as MaterialDesignLite
import qualified Yesod.Static.PickAColor         as PickAColor
import qualified Yesod.Static.TinyColor          as TinyColor

class HasEmbeddedStatic site where
  promoteEmbeddedStaticRoute :: site -> Route EmbeddedStatic -> Route site

class HasEmbeddedResources lib where
  embeddedStylesheets :: lib -> [Route EmbeddedStatic]
  embeddedStylesheets _ = []
  embeddedScripts :: lib -> [Route EmbeddedStatic]
  embeddedScripts _ = []
  remoteStylesheets :: lib -> [Text]
  remoteStylesheets _ = []

class Provide site lib where
  provide :: site -> lib -> WidgetT site IO ()
  default provide :: (HasEmbeddedResources lib, HasEmbeddedStatic site)
                  => site -> lib -> WidgetT site IO ()
  provide site lib = do
    mapM_ (addStylesheet . promoteEmbeddedStaticRoute site) (embeddedStylesheets lib)
    mapM_ addStylesheetRemote (remoteStylesheets lib)
    mapM_ (addScript . promoteEmbeddedStaticRoute site) (embeddedScripts lib)

data Bootstrap       = Bootstrap
data Jquery          = Jquery
data PickAColor      = PickAColor
data TinyColor       = TinyColor
data MaterialDesignLite  = MaterialDesignLite

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
instance HasEmbeddedResources MaterialDesignLite where
  embeddedStylesheets _ = [MaterialDesignLite.css_1_0_6]
  embeddedScripts     _ = [MaterialDesignLite.js_1_0_6]
  remoteStylesheets   _ = ["https://fonts.googleapis.com/icon?family=Material+Icons"]

type family ProvideAll site libs :: Constraint where
  ProvideAll site '[] = ()
  ProvideAll site (r ': rs) = (Provide site r, ProvideAll site rs)

