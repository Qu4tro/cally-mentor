module View.Options exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

import Types exposing (Model, Msg(..))


div =
    Html.div [ class "flex flex-wrap justify-center font-thin font-serif my-10" ]


button attrs elems =
    Html.button (attrs ++ [ class "p-5 m-4 text-white text-4xl rounded-sm todo-shadow cursor-pointer select-none clicked bg-gray-700 hover:bg-yellow-500" ]) elems


view : Model -> Html Msg
view _ =
    div
        [ button [PickOption 0 |> onClick] [ text "Sunday" ]
        , button [PickOption 1 |> onClick] [ text "Monday" ]
        , button [PickOption 2 |> onClick] [ text "Tuesday" ]
        , button [PickOption 3 |> onClick] [ text "Wednesday" ]
        , button [PickOption 4 |> onClick] [ text "Thursday" ]
        , button [PickOption 5 |> onClick] [ text "Friday" ]
        , button [PickOption 6 |> onClick] [ text "Saturday" ]
        ]
