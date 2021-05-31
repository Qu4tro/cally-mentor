module View.Quiz.Options exposing (..)

import Domain.Options as Options
import Domain.Weekday as Weekday
import Html exposing (Html, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (AnswerState(..), GameMode(..), Model, Msg(..), Weekday(..))
import View.Common exposing (plain, plainAsText, withClass)


span =
    Html.span
        |> withClass "font-thin font-serif m-10"
        |> withClass "flex flex-wrap justify-center"
        |> withClass "flex-row w-3/4 h-2/5"
        |> withClass "xl:flex-row xl:w-full"
        |> plain


button =
    Html.button
        |> withClass "text-white text-2xl p-4"
        |> withClass "rounded-sm shadow"
        |> withClass "cursor-pointer select-none clicked"
        |> withClass "w-2/5 m-4 h-20"
        |> withClass "xl:w-1/5 xl:mx-10"


aside =
    Html.aside
        |> withClass "text-base opacity-30"
        |> plainAsText


view : Model -> Html Msg
view m =
    let
        option weekday =
            let
                isPickedOption =
                    Options.selected m == Just weekday

                isCorrectOption =
                    m.weekday == weekday

                bgClass =
                    case ( m.answerState, isPickedOption, isCorrectOption ) of
                        ( Waiting, _, _ ) ->
                            class "bg-gray-700 hover:bg-yellow-500 "

                        ( _, _, True ) ->
                            class "bg-green-500 hover:bg-green-500 "

                        ( _, True, False ) ->
                            class "bg-red-500 hover:bg-red-500 "

                        _ ->
                            class "bg-gray-700 hover:bg-yellow-500 "

                weekdayName =
                    Weekday.toString weekday
            in
            button
                [ PickOption weekday |> onClick, bgClass ]
                (if m.settings.weekdayHintsEnabled || m.gameMode == TrainSevens then
                    [ text weekdayName, aside (Weekday.hint weekday) ]

                 else
                    [ text weekdayName ]
                )
    in
    if m.settings.sundayFirst then
        span
            [ option Sunday
            , option Monday
            , option Tuesday
            , option Wednesday
            , option Thursday
            , option Friday
            , option Saturday
            ]

    else
        span
            [ option Monday
            , option Tuesday
            , option Wednesday
            , option Thursday
            , option Friday
            , option Saturday
            , option Sunday
            ]
