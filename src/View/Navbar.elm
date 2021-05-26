module View.Navbar exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types exposing (Model, Msg(..), Page(..))
import View.Common exposing (plain, withClass)


h4 =
    Html.h4
        |> withClass "font-sans font-thin text-xl cursor-pointer hover:underline"


nav =
    Html.nav
        |> withClass "fixed top-24 h-full ml-10"
        |> plain


span =
    Html.span
        |> withClass "h-4/6 flex flex-col justify-around"
        |> plain


view : Model -> Html Msg
view _ =
    nav
        [ span
            [ h4 [ ChangePageTo HomePage |> onClick ]
                [ text "Home" ]
            , h4 [ ChangePageTo AboutPage |> onClick ]
                [ text "About" ]
            , h4 [ ChangePageTo GuidePage |> onClick ]
                [ text "Guide" ]
            , h4 [ ChangePageTo GameModesPage |> onClick ]
                [ text "Modes" ]
            , h4 [ ChangePageTo SettingsPage |> onClick ]
                [ text "Settings" ]
            , h4 []
                [ text "Github" ]
            ]
        ]
