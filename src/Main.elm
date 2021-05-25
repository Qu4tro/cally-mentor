module Main exposing (..)

import Browser
import State
import Subscriptions
import Types
import View


main : Program () Types.Model Types.Msg
main =
    Browser.element
        { view = View.view
        , init = \() -> Types.init
        , update = State.update
        , subscriptions = Subscriptions.subscriptions
        }
