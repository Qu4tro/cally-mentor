module Types exposing (..)

import Html exposing (Html)
import Http


type alias Model =
    { page : Page
    , date : Date
    , weekday : Weekday
    , guide : Html Msg
    , gameMode : GameMode
    , settings : Settings
    , answerState : AnswerState
    , hintVisibilityState : HintVisibilityState
    }


type alias Settings =
    { darkModeEnabled : Bool
    , sundayFirst : Bool
    , weekdayHintsEnabled : Bool
    , dateHintsEnabled : Bool
    , yearRange : ( Year, Year )
    }


type Msg
    = NoOp
    | OneMoreDate
    | NewDate Date
    | ChangeMinYearTo Year
    | ChangeMaxYearTo Year
    | ChangePageTo Page
    | PickOption Weekday
    | ChangeGameModeTo GameMode
    | ToggleDarkMode
    | ToggleSundayFirst
    | ToggleWeekdayHints
    | ToggleDateHints
    | ShowDateHint String
    | GotGuide (Result Http.Error String)


type alias Date =
    { day : Day
    , month : Month
    , year : Year
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


type alias HintVisibilityState =
    { dayVisible : Bool
    , monthVisible : Bool
    , yearVisible : Bool
    }
