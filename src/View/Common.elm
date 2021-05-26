module View.Common exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (class)


withClass className f attrs elems =
    f ([ class className ] ++ attrs) elems


simpleWithClass className f elems =
    f [ class className ] elems


plain f =
    f []
