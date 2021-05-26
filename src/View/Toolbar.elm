module View.Toolbar exposing (..)

import Html exposing (Html, fieldset, p, span, text, ul)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg)


h4 =
    Html.h4 [ class "font-sans font-thin text-xl mr-5 cursor-pointer hover:underline" ]


nav =
    Html.nav [ class "flex flex-col justify-evenly items-end w-1/12 mr-10" ]


view : Model -> Html Msg
view _ =
    nav
        [ fieldset [ class "p-0 m-0" ]
            [ h4 [ text "Difficulty: 7" ]
            , span [ class "flex" ]
                [ p [] [ text "+" ]
                , p [] [ text "-" ]
                ]
            ]
        , fieldset [ class "p-0 m-0 flex flex-col text-right" ]
            [ h4 [ text "Game mode:" ]
            , p [] [ text "Weekdays" ]
            , p [] [ text "Year codes" ]
            , p [] [ text "Month codes" ]
            , p [] [ text "Drop 7s" ]
            ]
        , h4 [ text "Show help" ]
        ]
