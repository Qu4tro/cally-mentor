module View.Quiz.Date exposing (..)

import Domain.Date
import Domain.Day as Day
import Domain.Month as Month
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (Date, Model, Month, Msg(..))


h2 =
    Html.h2 [ class "font-sans font-thin text-3xl text-center mb-10" ]


ol =
    Html.ol [ class "flex flex-wrap flex-row justify-center text-white" ]


li =
    Html.li [ class "bg-gray-700 hover:bg-blue-700 todo-shadow" ]


p =
    Html.p [ class "pt-6 pb-4 px-14 text-lg xl:text-5xl font-serif text-center" ]


tint =
    div [ class "opacity-40 bg-gray-800 py-4" ] []


button attrs elems =
    Html.button
        ([ class "relative border-0 px-1 mx-2 text-center text-lg lg:text-4xl text-white rounded-sm todo-shadow cursor-pointer select-none clicked bg-gray-800 hover:bg-green-500" ] ++ attrs)
        elems


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
    in
    div []
        [ h2 [ text "What weekday does the given date fall on?" ]
        , div [ class "flex" ]
            [ viewDate
            , button [ onClick OneMoreDate ] [ text "🗘" ]
            ]
        ]
