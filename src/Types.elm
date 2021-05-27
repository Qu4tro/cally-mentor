module Types exposing (..)


type alias Model =
    { date : Date
    , weekday : Weekday
    , gameMode : GameMode
    , yearRange : ( Year, Year )
    , page : Page
    , answerState : AnswerState
    }


type Msg
    = NoOp
    | OneMoreDate
    | NewDate Date
    | ChangePageTo Page
    | ChangeGameModeTo GameMode
    | PickOption Weekday


type alias Date =
    { day : Int
    , month : Month
    , year : Int
    }


type Weekday
    = Sunday
    | Monday
    | Tuesday
    | Wednesday
    | Thursday
    | Friday
    | Saturday


type alias Day =
    Int


type alias Year =
    Int


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
    | GuidePage
    | GameModesPage
    | SettingsPage


type GameMode
    = TrainWeekdays
    | TrainYears
    | TrainMonths
    | TrainSevens


type AnswerState
    = Waiting
    | CorrectAnswer
    | WrongAnswer Weekday
