module View.Quiz.Options exposing (..)

import Domain.Options
import Domain.Weekday
import Html exposing (Html, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (AnswerState(..), Model, Msg(..), Weekday(..))


span =
    Html.span [ class "flex flex-wrap justify-center font-thin font-serif my-10" ]


button attrs elems =
    Html.button ([ class "p-5 m-4 text-white text-4xl rounded-sm todo-shadow cursor-pointer select-none clicked " ] ++ attrs) elems


view : Model -> Html Msg
view m =
    let
        option weekday =
            let
                weekdayName =
                    Domain.Weekday.toString weekday

                isPickedOption =
                    Domain.Options.selected m.answerState m.weekday == Just weekday

                isCorrectOption =
                    m.weekday == weekday

                bgClass =
                    case ( m.answerState, isPickedOption, isCorrectOption ) of
                        ( Waiting, _, _ ) ->
                            "bg-gray-700 hover:bg-yellow-500 "

                        ( _, _, True ) ->
                            "bg-green-500 hover:bg-green-500 "

                        ( _, True, False ) ->
                            "bg-red-500 hover:bg-red-500 "

                        ( _, _, _ ) ->
                            "bg-gray-700 hover:bg-yellow-500 "
            in
            button
                [ class bgClass, PickOption weekday |> onClick ]
                [ text weekdayName ]
    in
    span
        [ option Sunday
        , option Monday
        , option Tuesday
        , option Wednesday
        , option Thursday
        , option Friday
        , option Saturday
        ]
