module View.Common exposing (..)

import Html exposing (Attribute, Html, text)
import Html.Attributes exposing (class)


type alias Elem msg =
    List (Attribute msg) -> List (Html msg) -> Html msg


type alias TextElem msg =
    List (Attribute msg) -> String -> Html msg


type alias BasicElem msg =
    List (Attribute msg) -> Html msg


type alias PlainTextElem msg =
    String -> Html msg


type alias PlainElem msg =
    List (Html msg) -> Html msg


withAttr : Attribute msg -> Elem msg -> Elem msg
withAttr attr elem attrs elems =
    elem (attr :: attrs) elems


withClass : String -> Elem msg -> Elem msg
withClass className =
    withAttr (class className)


asText : Elem msg -> TextElem msg
asText elem attrs string =
    elem attrs [ text string ]


plainAsText : Elem msg -> PlainTextElem msg
plainAsText elem string =
    elem [] [ text string ]


plain : Elem msg -> PlainElem msg
plain elem =
    elem []


basic : Elem msg -> BasicElem msg
basic elem attrs =
    elem attrs []
