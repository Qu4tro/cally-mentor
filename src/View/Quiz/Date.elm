module View.Quiz.Date exposing (..)

import Domain.Calc as Calc
import Domain.Day as Day
import Domain.Month as Month
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (AnswerState(..), Model, Msg(..))
import View.Common exposing (plain, plainAsText, withClass)


sup =
    Html.sup
        |> plain


span =
    Html.span
        |> plain


h2 =
    Html.h2
        |> withClass "font-sans font-thin text-3xl text-center mb-10"
        |> plain


ol =
    Html.ol
        |> withClass "flex flex-wrap flex-row justify-center"
        |> withClass "text-white w-full m-2"
        |> plain


li =
    Html.li
        |> withClass "font-serif text-black text-center text-5xl"
        |> withClass "px-4"


button =
    Html.button
        |> withClass "text-white text-center text-3xl"
        |> withClass "mx-2 rounded-sm shadow"
        |> withClass "cursor-pointer select-none clicked"
        |> withClass "border-b-8 border-gray-800"
        |> withClass "bg-gray-800  hover:bg-green-500"


aside =
    Html.aside
        |> withClass "text-base opacity-30"
        |> plainAsText


view : Model -> Html Msg
view m =
    let
        ( dayString, suffix ) =
            Day.ordinal m.date.day

        viewDate =
            let
                viewDatePart name visible content =
                    li
                        (if m.settings.dateHintsEnabled then
                            [ class "cursor-pointer", ShowDateHint name |> onClick ]

                         else
                            []
                        )
                        (if visible then
                            [ content
                            , aside
                                (case name of
                                    "day" ->
                                        Calc.dayCode m.date |> String.fromInt

                                    "month" ->
                                        Calc.monthCode m.date |> String.fromInt

                                    "year" ->
                                        (Calc.centuryCode m.date |> String.fromInt)
                                            ++ " + "
                                            ++ (Calc.yearCode m.date |> String.fromInt)

                                    _ ->
                                        ""
                                )
                            ]

                         else
                            [ content ]
                        )
            in
            ol
                [ viewDatePart "year"
                    m.hintVisibilityState.yearVisible
                    (text (String.fromInt m.date.year))
                , viewDatePart "month"
                    m.hintVisibilityState.monthVisible
                    (text (Month.toString m.date.month))
                , viewDatePart "day"
                    m.hintVisibilityState.dayVisible
                    (span [ text dayString, sup [ text suffix ] ])
                ]

        buttonAttrs =
            if m.answerState /= Waiting then
                [ OneMoreDate |> onClick, class "border-green-500" ]

            else
                [ OneMoreDate |> onClick ]
    in
    div []
        [ h2 [ text "What weekday does the given date fall on?" ]
        , div [ class "flex" ]
            [ viewDate
            , button buttonAttrs [ text "🗘" ]
            ]
        ]
