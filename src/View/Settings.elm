module View.Settings exposing (..)

import Domain.GameMode as GameMode
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onClick, onInput)
import Types exposing (GameMode(..), Model, Msg(..), Page(..))
import View.Common exposing (asText, basic, plain, plainAsText, withClass)


ol =
    Html.ol |> plain


span =
    Html.span
        |> withClass "text-xl"
        |> withClass "flex items-center"
        |> plain


div =
    Html.div
        |> withClass "font-sans font-thin"
        |> withClass "w-3/4"
        |> plain


h2 =
    Html.h2
        |> withClass "text-3xl text-center mb-10"
        |> plainAsText


h3 =
    Html.h4
        |> withClass "mx-2"
        |> plainAsText


u =
    Html.u
        |> withClass "mx-2"
        |> withClass "no-underline hover:underline cursor-pointer"
        |> asText


p =
    Html.p
        |> withClass "ml-4 my-2"
        |> plainAsText


li =
    Html.li
        |> withClass "mb-10"
        |> plain


input =
    Html.input
        |> withClass "bg-transparent w-16"
        |> withClass "text-lg text-center"
        |> withClass "outline-none border-b border-black"
        |> basic


view : Model -> Html Msg
view model =
    let
        enabledClass =
            class "font-normal"

        yearRange =
            let
                ( yMin, yMax ) =
                    model.yearRange

                yearInput yValue msg =
                    input
                        [ value (String.fromInt yValue)
                        , onInput (msg << Maybe.withDefault yValue << String.toInt)
                        , type_ "number"
                        ]
            in
            [ span
                [ h3 "Year range "
                , h3 "― "
                , yearInput yMin ChangeMinYearTo
                , h3 "– "
                , yearInput yMax ChangeMaxYearTo
                ]
            , p "Applies to all game modes."
            ]

        hints =
            [ span
                [ h3 "Hints enabled "
                , h3 "― "
                , (if model.hintsEnabled then
                    u [ enabledClass ]

                   else
                    u [ ToggleHints |> onClick ]
                  )
                    "Yes"
                , h3 " / "
                , (if model.hintsEnabled then
                    u [ ToggleHints |> onClick ]

                   else
                    u [ enabledClass ]
                  )
                    "No"
                ]
            , p "A set of cheats and cheatsheets at a hover distance."
            ]

        darkMode =
            [ span
                [ h3 "Dark mode enabled "
                , h3 "― "
                , (if model.darkModeEnabled then
                    u [ enabledClass ]

                   else
                    u [ ToggleDarkMode |> onClick ]
                  )
                    "Yes"
                , h3 " / "
                , (if model.darkModeEnabled then
                    u [ ToggleDarkMode |> onClick ]

                   else
                    u [ enabledClass ]
                  )
                    "No"
                ]
            , p "Spare your eyes."
            ]
    in
    div
        [ h2 "Settings"
        , ol
            [ li yearRange
            , li hints
            , li darkMode
            ]
        ]
