module Domain.Page exposing (..)

import Types exposing (Page(..))


toString : Page -> String
toString page =
    case page of
        HomePage ->
            "Play"

        AboutPage ->
            "About"

        GuidePage ->
            "Guide"

        GameModesPage ->
            "Modes"

        SettingsPage ->
            "Settings"
