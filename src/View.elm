module View exposing (..)

import Html exposing (Html)
import Types exposing (Model, Msg, Page(..))
import View.Common exposing (simpleWithClass, withClass)
import View.Footer
import View.Header
import View.Modes
import View.Navbar
import View.Quiz.Date
import View.Quiz.Options
import View.Settings


main_ =
    Html.main_
        |> withClass "flex"
        |> simpleWithClass "min-h-screen max-w-screen bg-gray-100"


article =
    Html.article
        |> withClass "flex flex-col justify-start items-center"
        |> simpleWithClass "w-3/6 mx-auto my-2"


view : Model -> Html Msg
view model =
    let
        content =
            case model.page of
                HomePage ->
                    [ View.Header.view model
                    , View.Quiz.Date.view model
                    , View.Quiz.Options.view model
                    , View.Footer.view model
                    ]

                AboutPage ->
                    [ View.Header.view model ]

                SettingsPage ->
                    [ View.Header.view model ]

                GameModesPage ->
                    [ View.Header.view model ]

                GuidePage ->
                    [ View.Header.view model ]
    in
    main_
        [ View.Navbar.view model
        , article content
        ]
