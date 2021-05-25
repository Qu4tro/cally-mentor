module View.Date exposing (..)

import Html exposing (Html, button, div, h1, option, select, sup, text)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)

import Domain.Date

tint =
    div [ class "opacity-20 bg-black py-4" ] []


square =
    div [ class "py-8 px-14 text-5xl font-serif text-white" ]


oneMore =
    button [ class "border-0 px-1 mx-2 text-white text-4xl rounded-sm todo-shadow cursor-pointer select-none clicked bg-gray-800 hover:bg-red-500" ]
        [ text "🗘" ]


yearText : Int -> Html Msg
yearText =
    String.fromInt >> text


monthText : Int -> Html Msg
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


view : Model -> Html Msg
view model =
    div [ class "flex" ]
        [ div [ class "flex text-center justify-center todo-shadow" ]
            [ div [ class "bg-gray-700 hover:bg-blue-700" ]
                [ square [ yearText 2021 ], tint ]
            , div [ class "bg-gray-700 hover:bg-indigo-700" ]
                [ square [ monthText 5 ], tint ]
            , div [ class "bg-gray-700 hover:bg-purple-700" ]
                [ square [ dayText 25 ], tint ]
            ]
        , oneMore
        ]
