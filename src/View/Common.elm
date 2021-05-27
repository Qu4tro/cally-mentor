module View.Common exposing (..)

import Html exposing (Attribute, Html)
import Html.Attributes exposing (class)


withClass :
    String
    -> (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
withClass className f attrs elems =
    f (( class className ) :: attrs) elems


simpleWithClass :
    String
    -> (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Html msg)
    -> Html msg
simpleWithClass className f elems =
    withClass className f [] elems
