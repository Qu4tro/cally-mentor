module View.Answers exposing (..)

import Html exposing (Html, button, div, h1, option, select, sup, text)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)


weekdays =
    div [ class "flex flex-wrap justify-center font-thin font-serif my-10" ]


weekday =
    div [ class "p-5 m-4 text-white text-4xl rounded-sm todo-shadow cursor-pointer select-none clicked bg-gray-800 hover:bg-yellow-500" ]


view : Model -> Html Msg
view model =
    weekdays
        [ weekday [ text "Sunday" ]
        , weekday [ text "Monday" ]
        , weekday [ text "Tuesday" ]
        , weekday [ text "Wednesday" ]
        , weekday [ text "Thursday" ]
        , weekday [ text "Friday" ]
        , weekday [ text "Saturday" ]
        ]
