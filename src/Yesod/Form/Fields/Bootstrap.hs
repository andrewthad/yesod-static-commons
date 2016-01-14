module Yesod.Form.Fields.Bootstrap where

import           Text.Julius                       (rawJS)
import           Yesod.Core
import           Yesod.Form.Fields.Bootstrap.Types
import           Yesod.Form.Functions
import           Yesod.Form.Types
import           Yesod.Static.Commons

pickAColorField ::
  ( RenderMessage site FormMessage
  , ProvideAll site '[Jquery,Bootstrap,TinyColor,PickAColor]
  ) => Field (HandlerT site IO) Color
pickAColorField = Field
  { fieldParse = parseHelper (Right . Color)
  , fieldView = \theId name attrs val _isReq -> do
      app <- getYesod
      provide app Bootstrap
      provide app Jquery
      provide app TinyColor
      provide app PickAColor
      [whamlet|
$newline never
<input class="form-control" type="text" value="{either id getColor val}" *{attrs} name="#{name}" id="#{theId}">
|]
      toWidget [julius|
$().ready(function(){
  $('##{rawJS theId}').pickAColor();
});
|]
  , fieldEnctype = UrlEncoded
  }

