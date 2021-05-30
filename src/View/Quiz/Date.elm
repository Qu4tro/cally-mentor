module View.Quiz.Date exposing (..)

import Domain.Day as Day
import Domain.Month as Month
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (AnswerState(..), Model, Msg(..))
import View.Common exposing (plain, withClass)


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
        |> withClass "flex flex-wrap flex-row justify-center text-white"
        |> plain


li =
    Html.li
        |> withClass "font-serif text-center text-lg xl:text-5xl"
        |> withClass "pt-6 pb-4 px-14"
        |> withClass "bg-gray-700 hover:bg-blue-500 todo-shadow"
        |> withClass "border-b-8 border-gray-800"
        |> plain


button =
    Html.button
        |> withClass "text-white text-center text-lg lg:text-3xl"
        |> withClass "mx-2 rounded-sm todo-shadow"
        |> withClass "cursor-pointer select-none clicked"
        |> withClass "border-b-8 border-gray-800 "
        |> withClass "bg-gray-700  hover:bg-green-500"


view : Model -> Html Msg
view model =
    let
        ( dayString, suffix ) =
            Day.ordinal model.date.day

        viewDate =
            ol
                [ li [ text (String.fromInt model.date.year) ]
                , li [ text (Month.toString model.date.month) ]
                , li [ span [ text dayString, sup [ text suffix ] ] ]
                ]

        buttonAttrs =
            if model.answerState /= Waiting then
                [ OneMoreDate |> onClick, class "border-green-500" ]

            else
                [ OneMoreDate |> onClick]
    in
    div []
        [ h2 [ text "What weekday does the given date fall on?" ]
        , div [ class "flex" ]
            [ viewDate
            , button buttonAttrs [ text "🗘" ]
            ]
        ]
