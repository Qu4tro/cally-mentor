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
view m =
    let
        eternalChoiceClass =
            if m.settings.darkModeEnabled then
                class "dark"

            else
                class "light"

        content =
            case m.page of
                HomePage ->
                    [ View.Header.view m
                    , View.Quiz.Date.view m
                    , View.Quiz.Options.view m
                    , View.Footer.view m
                    ]

                AboutPage ->
                    [ View.Header.view m ]

                SettingsPage ->
                    [ View.Header.view m
                    , View.Settings.view m
                    , View.Footer.view m
                    ]

                GameModesPage ->
                    [ View.Header.view m
                    , View.Modes.view m
                    ]

                GuidePage ->
                    [ View.Header.view m
                    , m.guide
                    ]
    in
    div [ eternalChoiceClass ]
        [ main_
            [ View.Navbar.view m
            , article content
            ]
        ]
