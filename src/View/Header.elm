module View.Header exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)


h1 =
    Html.h1 [ class "font-sans font-thin text-5xl text-center my-14" ]


header =
    Html.header [ class "mb-10" ]


view : Model -> Html Msg
view _ =
    header
        [ h1 [ text "Weekday.Guru" ]
        ]
