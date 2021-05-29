module View.Navbar exposing (..)

import Domain.Page as Page
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
view model =
    let
        option page =
            let
                selectedPageClass =
                    "font-normal"

                attrs =
                    if page == model.page then
                        [ class selectedPageClass
                        , ChangePageTo page |> onClick
                        ]

                    else
                        [ ChangePageTo page |> onClick ]
            in
            h4 attrs [ text (Page.toString page) ]
    in
    nav
        [ span
            [ option HomePage
            , option AboutPage
            , option GuidePage
            , option GameModesPage
            , option SettingsPage
            , h4 [] [ text "Github" ]
            ]
        ]
