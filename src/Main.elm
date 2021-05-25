module Main exposing (..)

import Browser

import Types
import View
import State
import Subscriptions

main : Program () Types.Model Types.Msg
main =
    Browser.element
        { view = View.view
        , init = \() -> Types.init
        , update = State.update
        , subscriptions = Subscriptions.subscriptions
        }




