module View.Quiz.Options exposing (..)

import Domain.Options as Options
import Domain.Weekday as Weekday
import Html exposing (Html, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (AnswerState(..), Model, Msg(..), Weekday(..))
import View.Common exposing (plain, withClass)


span =
    Html.span
        |> withClass "flex flex-wrap justify-center"
        |> withClass "font-thin font-serif m-10"
        |> plain


button =
    Html.button
        |> withClass "rounded-sm todo-shadow p-4 my-5 mx-10"
        |> withClass "text-white text-2xl"
        |> withClass "cursor-pointer select-none clicked"


view : Model -> Html Msg
view m =
    let
        option weekday =
            let
                weekdayName =
                    Weekday.toString weekday

                isPickedOption =
                    Options.selected m == Just weekday

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

                        _ ->
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
