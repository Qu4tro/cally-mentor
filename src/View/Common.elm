module View.Common exposing (..)

import Html.Attributes exposing (class)
import Html exposing (Attribute)


withClass : String -> (List (Attribute msg) -> d -> a) -> List (Attribute msg) -> d -> a
withClass className f attrs elems =
    f ([ class className ] ++ attrs) elems


simpleWithClass : String -> (List (Attribute msg) -> c -> a) -> c -> a
simpleWithClass className f elems =
    f [ class className ] elems


plain : (List a -> b) -> b
plain f =
    f []
