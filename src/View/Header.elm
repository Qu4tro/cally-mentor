module View.Header exposing (..)

import Html exposing (Html, text)
import Types exposing (Model, Msg)
import View.Common exposing (plain, withClass)


h1 =
    Html.h1
        |> withClass "font-sans font-thin text-5xl text-center my-14"
        |> plain


header =
    Html.header
        |> withClass "mb-10"
        |> plain


view : Model -> Html Msg
view _ =
    header
        [ h1 [ text "Weekday.Guru" ] ]
