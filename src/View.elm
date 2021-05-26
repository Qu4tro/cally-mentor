module View exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg, Page(..))
import View.Footer
import View.Header
import View.Navbar
import View.Quiz.Date
import View.Quiz.Options


main_ =
    Html.main_ [ class "min-h-screen max-w-screen bg-gray-100 flex" ]


article =
    Html.article [ class "flex flex-col w-3/6 mx-auto my-2 items-center justify-start" ]


view : Model -> Html Msg
view model =
    let
        pageView =
            case model.page of
                HomePage ->
                    article
                        [ View.Header.view model
                        , View.Quiz.Date.view model
                        , View.Quiz.Options.view model
                        , View.Footer.view model
                        ]

                _ ->
                    article [ View.Header.view model ]
    in
    main_
        [ View.Navbar.view model
        , pageView
        ]
