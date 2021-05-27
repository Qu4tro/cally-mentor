module View.Footer exposing (..)

import Html exposing (Html, b, text)
import Types exposing (Model, Msg)
import View.Common exposing (finallyWithClass)


b =
    Html.b []


span =
    Html.span
        |> finallyWithClass "font-sans font-thin text-xl text-center my-2"


footer =
    Html.footer
        |> finallyWithClass "w-3/6 my-4"


view : Model -> Html Msg
view _ =
    footer
        [ span
            [ b [ text "Tip: " ]
            , text "Settings are saved on your browser automatically."
            ]
        ]
