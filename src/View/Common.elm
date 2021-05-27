module View.Common exposing (..)

import Html exposing (Attribute, Html, text)
import Html.Attributes exposing (class)


withClass :
    String
    -> (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
withClass className elem attrs elems =
    elem (class className :: attrs) elems


finallyWithClass :
    String
    -> (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Html msg)
    -> Html msg
finallyWithClass className elem elems =
    withClass className elem [] elems


textElem : (List (Html msg) -> Html msg) -> String -> Html msg
textElem elem string =
    elem [ text string ]
