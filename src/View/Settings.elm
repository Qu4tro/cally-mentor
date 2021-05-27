module View.Settings exposing (..)

import Domain.GameMode as GameMode
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (GameMode(..), Model, Msg(..), Page(..))
import View.Common exposing (finallyWithClass, textElem, withClass)


ol =
    Html.ol []


div =
    Html.div
        |> withClass "font-sans font-thin"
        |> finallyWithClass "w-3/4"


h2 =
    Html.h2
        |> finallyWithClass "text-3xl text-center mb-10"
        |> textElem


h3 =
    Html.h3
        |> finallyWithClass "text-xl cursor-pointer hover:underline"
        |> textElem


p =
    Html.p
        |> finallyWithClass "ml-4 my-2"
        |> textElem


li =
    Html.li
        |> finallyWithClass "mb-10"


view : Model -> Html Msg
view model =
    div
        [ h2 "Settings"
        , ol
            [ li
                [ h3 "Year range"
                , p "Applies to all game modes."
                ]
            , li
                [ h3 "Dark mode enabled"
                , p "Spare your eyes."

                -- TODO
                ]
            ]
        ]
