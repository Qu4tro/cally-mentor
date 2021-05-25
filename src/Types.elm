module Types exposing (..)

type alias Model =
    {}

init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )

type Msg
    = NoOp
