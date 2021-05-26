module State.Update exposing (..)

import Domain.Date
import Random
import Types exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OneMoreDate ->
            ( model, Random.generate NewDate Domain.Date.randomDateGenerator )

        NewDate newDate ->
            ( { model | date = newDate }, Cmd.none )

        ChangePageTo newPage ->
            ( { model | page = newPage }, Cmd.none )
