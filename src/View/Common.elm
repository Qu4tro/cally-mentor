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


asText : (List (Html msg) -> Html msg) -> String -> Html msg
asText elem string =
    elem [ text string ]


plain :
    (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Html msg)
    -> Html msg
plain elem =
    elem []


basic :
    (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> Html msg
basic elem attrs =
    elem attrs []
