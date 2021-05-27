module View.Header exposing (..)

import Html exposing (Html, text)
import Types exposing (Model, Msg)
import View.Common exposing (finallyWithClass)


h1 =
    Html.h1
        |> finallyWithClass "font-sans font-thin text-5xl text-center my-14"


header =
    Html.header
        |> finallyWithClass "mb-10"


view : Model -> Html Msg
view _ =
    header
        [ h1 [ text "Weekday.Guru" ]
        ]
