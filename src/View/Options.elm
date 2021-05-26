module View.Options exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (AnswerState(..), Model, Msg(..))


ifA cond attr =
    if cond then
        attr

    else
        class ""


div =
    Html.div [ class "flex flex-wrap justify-center font-thin font-serif my-10" ]


button attrs elems =
    Html.button (attrs ++ [ class "p-5 m-4 text-white text-4xl rounded-sm todo-shadow cursor-pointer select-none clicked bg-gray-700 hover:bg-yellow-500" ]) elems


view : Model -> Html Msg
view model =
    let
        answered =
            model.answerState /= Waiting

        option weekdayNumber weekdayName =
            button
                [ PickOption weekdayNumber |> onClick
                , ifA (model.weekday == weekdayNumber && answered) (class "bg-green-500")
                ]
                [ text weekdayName ]
    in
    div
        [ option 0 "Sunday"
        , option 1 "Monday"
        , option 2 "Tueday"
        , option 3 "Wednesday"
        , option 4 "Thursday"
        , option 5 "Friday"
        , option 6 "Saturday"
        ]
