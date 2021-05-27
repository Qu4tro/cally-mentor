module View.Footer exposing (..)

import Html exposing (Html, b, text)
import Types exposing (Model, Msg)
import View.Common exposing (simpleWithClass)


h3 =
    Html.h3
        |> simpleWithClass "font-sans font-thin text-xl text-center my-2"


footer =
    Html.footer
        |> simpleWithClass "w-3/6 my-4"


view : Model -> Html Msg
view _ =
    footer
        [ h3 [ b [] [ text "Tip: " ], text "There's a setting to disable the tooltips." ] ]
