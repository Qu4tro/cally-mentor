module View.Quiz.Date exposing (..)

import Domain.Day as Day
import Domain.Month as Month
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (AnswerState(..), Model, Msg(..))
import View.Common exposing (finallyWithClass, withClass)


sup =
    Html.sup []


span =
    Html.span []


h2 =
    Html.h2
        |> finallyWithClass "font-sans font-thin text-3xl text-center mb-10"


ol =
    Html.ol
        |> finallyWithClass "flex flex-wrap flex-row justify-center text-white"


li =
    Html.li
        |> withClass "font-serif text-center text-lg xl:text-5xl"
        |> withClass "pt-6 pb-4 px-14"
        |> withClass "bg-gray-700 hover:bg-blue-700 todo-shadow"
        |> finallyWithClass "border-b-8 border-gray-800"


button =
    Html.button
        |> withClass "text-white text-center text-lg lg:text-3xl"
        |> withClass "mx-2 rounded-sm todo-shadow"
        |> withClass "cursor-pointer select-none clicked"
        |> withClass "border-b-8 border-gray-800"


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

        buttonBgClass =
            if model.answerState /= Waiting then
                "bg-green-500"

            else
                "bg-gray-700 hover:bg-green-500"
    in
    div []
        [ h2 [ text "What weekday does the given date fall on?" ]
        , div [ class "flex" ]
            [ viewDate
            , button [ class buttonBgClass, onClick OneMoreDate ] [ text "🗘" ]
            ]
        ]
