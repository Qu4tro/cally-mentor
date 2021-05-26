module View.Footer exposing (..)

import Html exposing (Html, b, text)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)
import View.Common exposing (plain, withClass)


h3 =
    Html.h3
        |> withClass "font-sans font-thin text-xl text-center my-2"
        |> plain


footer =
    Html.footer
        |> withClass "w-3/6 my-4"
        |> plain


view : Model -> Html Msg
view _ =
    footer
        [ h3 [ b [] [ text "Tip: " ], text "There's a setting to disable the tooltips." ] ]
