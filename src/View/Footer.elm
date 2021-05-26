module View.Footer exposing (..)

import Html exposing (Html, b, text)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)


h3 =
    Html.h3 [ class "font-sans font-thin text-xl text-center my-2" ]


footer =
    Html.footer [ class "w-3/6 my-4" ]


view : Model -> Html Msg
view _ =
    footer
        [ h3 [ b [] [ text "Tip: " ], text "There's a setting to disable the tooltips." ] ]
