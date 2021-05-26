module Types exposing (..)


type alias Model =
    { date : Date
    , page : Page
    , answerState : AnswerState
    }


type Msg
    = NoOp
    | OneMoreDate
    | NewDate Date
    | ChangePageTo Page
    | PickOption Int
    | ClearAnswerState


type alias Date =
    { day : Int
    , month : Month
    , year : Int
    }


type Month
    = January
    | February
    | March
    | April
    | May
    | June
    | July
    | August
    | September
    | October
    | November
    | December


type Page
    = HomePage
    | AboutPage
    | GuideAlgorithmPage
    | GuideUIPage
    | GameModesPage
    | SettingsPage


type AnswerState
    = Waiting
    | CorrectAnswer
    | WrongAnswer
