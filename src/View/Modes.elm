module View.Modes exposing (..)

import Domain.GameMode as GameMode
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (GameMode(..), Model, Msg(..), Page(..))
import View.Common exposing (finallyWithClass, textElem, withClass)


div =
    Html.div
        |> finallyWithClass "w-3/4"


h2 =
    Html.h2
        |> finallyWithClass "font-sans font-thin text-3xl text-center mb-10"
        |> textElem


h3 =
    Html.h3
        |> withClass "font-sans font-thin text-xl"
        |> withClass "cursor-pointer hover:underline"


ol =
    Html.ol
        |> finallyWithClass "something"


p =
    Html.p
        |> finallyWithClass "ml-4 my-2"
        |> textElem


li =
    Html.li
        |> finallyWithClass "mb-10"


view : Model -> Html Msg
view model =
    let
        option mode =
            let
                selectedGameModeClass =
                    "font-normal"

                attrs =
                    if mode == model.gameMode then
                        [ class selectedGameModeClass
                        , ChangeGameModeTo mode |> onClick
                        ]

                    else
                        [ ChangeGameModeTo mode |> onClick ]
            in
            h3 attrs [ text (GameMode.toString mode) ]
    in
    div
        [ h2 "Game Modes"
        , ol
            [ li
                [ option TrainWeekdays
                , p "This is the default mode. This mode takes everything together to finally enable you to train on calculating weekdays for a given date."
                , p "No code hints are enabled, by default. Year range can be customized on the settings page."
                ]
            , li
                [ option TrainSevens
                , p "This is the easiest mode. This mode enables you to train on dropping sevens (aka: applying mod 7)"
                , p "Code hints are enabled for the date and weekdays. You just have to sum the numbers on the date, drop the sevens and pick the matching number among the weekdays."
                ]
            , li
                [ option TrainMonths
                , p "This mode enables you to train on calculating the month codes only."
                , p "Code hints are enabled for the year and day, but they always add up to 0. Figure out the month code and pick the matching weekday."
                ]
            , li
                [ option TrainYears
                , p "This mode enables you to train on calculating the year and century only."
                , p "Code hints are enabled for the month and day, but they always add up to 0. Figure out the year and century code and pick the matching weekday."
                ]
            ]
        ]
