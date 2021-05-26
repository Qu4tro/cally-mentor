module Types exposing (..)


type alias Model =
    { date : Date
    , page : Page
    }


type Msg
    = NoOp
    | OneMoreDate
    | NewDate Date
    | ChangePageTo Page


type Page
    = HomePage
    | AboutPage
    | GuideAlgorithmPage
    | GuideUIPage
    | GameModesPage
    | SettingsPage


type alias Date =
    { day : Int
    , month : Int
    , year : Int
    }
