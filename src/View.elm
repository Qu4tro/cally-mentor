module View exposing (..)

import Html exposing (Html)
import Html.Attributes exposing (class)
import Types exposing (Model, Msg, Page(..))
import View.Common exposing (plain, withClass)
import View.Footer
import View.Header
import View.Modes
import View.Navbar
import View.Quiz.Date
import View.Quiz.Options
import View.Settings


div =
    Html.div
        |> withClass "nightwind"


main_ =
    Html.main_
        |> withClass "flex"
        |> withClass "min-h-screen max-w-screen bg-gray-100 text-black"
        |> plain


article =
    Html.article
        |> withClass "flex flex-col justify-start items-center"
        |> withClass "w-5/6 md:w-4/6 lg:w-3/6 mx-auto my-2"
        |> plain


view : Model -> Html Msg
view model =
    let
        eternalChoiceClass =
            if model.darkModeEnabled then
                class "dark"

            else
                class "light"

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
                    [ View.Header.view model
                    , View.Settings.view model
                    , View.Footer.view model
                    ]

                GameModesPage ->
                    [ View.Header.view model
                    , View.Modes.view model
                    ]

                GuidePage ->
                    [ View.Header.view model ]
    in
    div [ eternalChoiceClass ]
        [ main_
            [ View.Navbar.view model
            , article content
            ]
        ]
