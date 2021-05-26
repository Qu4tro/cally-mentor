module Main exposing (..)

import Browser
import State.Init
import State.Update
import Subscriptions
import Types
import View


main : Program () Types.Model Types.Msg
main =
    Browser.element
        { view = View.view
        , init = \() -> State.Init.init
        , update = State.Update.update
        , subscriptions = Subscriptions.subscriptions
        }
