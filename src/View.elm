module View exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg, Page(..))
import View.Date
import View.Footer
import View.Header
import View.Navbar
import View.Options
import View.Toolbar


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
                        , View.Date.view model
                        , View.Options.view model
                        , View.Footer.view model
                        ]

                _ ->
                    article [ View.Header.view model ]
    in
    main_
        [ View.Navbar.view model
        , pageView
        ]
