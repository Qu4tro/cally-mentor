module View.Options exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)


div =
    Html.div [ class "flex flex-wrap justify-center font-thin font-serif my-10" ]


button =
    Html.button [ class "p-5 m-4 text-white text-4xl rounded-sm todo-shadow cursor-pointer select-none clicked bg-gray-700 hover:bg-yellow-500" ]


view : Model -> Html Msg
view _ =
    div
        [ button [ text "Sunday" ]
        , button [ text "Monday" ]
        , button [ text "Tuesday" ]
        , button [ text "Wednesday" ]
        , button [ text "Thursday" ]
        , button [ text "Friday" ]
        , button [ text "Saturday" ]
        ]
