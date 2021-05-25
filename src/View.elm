module View exposing (..)

import Html exposing (Html, button, div, h1, option, select, sup, text)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)
import View.Answers
import View.Date


container =
    div [ class "min-h-screen max-w-screen bg-gray-100 flex justify-center" ]


page =
    div [ class "flex flex-col w-3/6 items-center" ]


header =
    h1 [ class "text-5xl font-sans font-thin my-20" ]


view : Model -> Html Msg
view model =
    container
        [ page
            [ header [ text "Train weekday calculation" ]
            , View.Date.view model
            , View.Answers.view model
            ]
        ]
