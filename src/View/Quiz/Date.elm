module View.Quiz.Date exposing (..)

import Domain.Day as Day
import Domain.Month as Month
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (Model, Msg(..), AnswerState(..))
import View.Common exposing (simpleWithClass, withClass)


h2 =
    Html.h2
        |> simpleWithClass "font-sans font-thin text-3xl text-center mb-10"


ol =
    Html.ol
        |> simpleWithClass "flex flex-wrap flex-row justify-center text-white"


li =
    Html.li
            |> withClass "border-b-8 border-gray-800"

        |> simpleWithClass "bg-gray-700 hover:bg-blue-700 todo-shadow"
        

p =
    Html.p
        |> withClass "font-serif text-center text-lg xl:text-5xl"
        |> simpleWithClass "pt-6 pb-4 px-14"


tint =
    div [ class "opacity-40 bg-gray-800 " ] []


button =
    Html.button
        |> withClass "text-white text-center text-lg lg:text-3xl"
        |> withClass "mx-2 rounded-sm todo-shadow"
        |> withClass "cursor-pointer select-none clicked"
        |> withClass "border-b-8 border-gray-800"


sup =
    Html.sup []


view : Model -> Html Msg
view model =
    let
        date =
            model.date

        ( dayString, suffix ) =
            Day.ordinal date.day

        viewDay =
            div []
                [ text dayString
                , sup [ text suffix ]
                ]

        viewDate =
            ol
                [ li [ p [ text (String.fromInt date.year) ], tint ]
                , li [ p [ text (Month.toString date.month) ], tint ]
                , li [ p [ viewDay ], tint ]
                ]

        buttonBgClass =
            if model.answerState /= Waiting then "bg-green-500" else "bg-gray-700 hover:bg-green-500"
    in
    div []
        [ h2 [ text "What weekday does the given date fall on?" ]
        , div [ class "flex" ]
            [ viewDate
            , button [ class buttonBgClass, onClick OneMoreDate ] [ text "🗘" ]
            ]
        ]
