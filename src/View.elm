module View exposing (..)

import Html exposing (Html, div, sup, text)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)


view : Model -> Html Msg
view model =
    div
        [ class "container" ]
        [ div [ class "date" ]
            [ div [ class "year" ]
                [ div [ class "square tint" ]
                    [ text "2020" ]
                , div [ class "square" ]
                    [ text "2021" ]
                , div [ class "square tint" ]
                    [ text "2022" ]
                ]
            , div
                [ class "month" ]
                [ div [ class "square tint" ]
                    [ text "April" ]
                , div
                    [ class "square" ]
                    [ text "May" ]
                , div
                    [ class "square tint" ]
                    [ text "June" ]
                ]
            , div
                [ class "day" ]
                [ div [ class "tint square" ]
                    [ text "24"
                    , sup []
                        [ text "th" ]
                    ]
                , div
                    [ class "square" ]
                    [ text "25"
                    , sup []
                        [ text "th" ]
                    ]
                , div
                    [ class "tint square" ]
                    [ text "26"
                    , sup []
                        [ text "th" ]
                    ]
                ]
            ]
        ]
