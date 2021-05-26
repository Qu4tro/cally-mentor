module View.Date exposing (..)

import Domain.Date
import Html exposing (Html, div, sup, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (Date, Model, Month, Msg(..))


h2 =
    Html.h2 [ class "font-sans font-thin text-3xl text-center mb-10" ]


tint =
    div [ class "opacity-40 bg-gray-800 py-4" ] []


square =
    div [ class "pt-6 pb-4 px-14 text-5xl font-serif text-center" ]


button =
    Html.button
        [ class "relative border-0 px-1 mx-2 text-center text-4xl rounded-sm todo-shadow cursor-pointer select-none clicked bg-gray-800 hover:bg-green-500"
        , onClick OneMoreDate
        ]


yearText : Int -> Html Msg
yearText =
    String.fromInt >> text


monthText : Month -> Html Msg
monthText =
    Domain.Date.monthName >> text


dayText : Int -> Html Msg
dayText n =
    let
        ( dayString, suffix ) =
            Domain.Date.dayWithSuffix n
    in
    div []
        [ text dayString
        , sup [] [ text suffix ]
        ]


viewDate : Date -> Html Msg
viewDate date =
    div [ class "flex flex-wrap flex-col lg:flex-row justify-center" ]
        [ div [ class "bg-gray-700 hover:bg-blue-700  todo-shadow" ]
            [ square [ yearText date.year ], tint ]
        , div [ class "bg-gray-700 hover:bg-blue-700  todo-shadow " ]
            [ square [ monthText date.month ], tint ]
        , div [ class "bg-gray-700 hover:bg-blue-700  todo-shadow" ]
            [ square [ dayText date.day ], tint ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ h2 [ text "What weekday does the given date fall on?" ]
        , div [ class "flex text-white" ]
            [ viewDate model.date
            , button [ text "🗘" ]
            ]
        ]
