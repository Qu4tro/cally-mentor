module View.Header exposing (..)

import Html exposing (Html)
import Html.Events exposing (onClick)
import Types exposing (Model, Msg(..))
import View.Common exposing (plain, plainAsText, withAttr, withClass)


h1 =
    Html.h1
        |> withClass "font-sans font-thin text-5xl text-center my-14"
        |> withAttr (onClick NoOp)
        |> plainAsText


header =
    Html.header
        |> withClass "mb-10"
        |> plain


view : Model -> Html Msg
view _ =
    header
        [ h1 "Weekday.Guru" ]
