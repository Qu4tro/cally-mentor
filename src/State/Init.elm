module State.Init exposing (..)

import Domain.DateGeneration
import Random
import Types exposing (..)


initDate : Date
initDate =
    { day = 1, month = January, year = 3000 }


initSettings : Settings
initSettings =
    { darkModeEnabled = True
    , sundayFirst = False
    , weekdayHintsEnabled = True
    , yearRange = ( 2000, 2025 )
    , dateHintsEnabled = True
    }


initHintVisibilityState : HintVisibilityState
initHintVisibilityState =
    { dayVisible = False
    , monthVisible = False
    , yearVisible = False
    }


init : ( Model, Cmd Msg )
init =
    let
        model =
            { date = initDate
            , weekday = Sunday
            , gameMode = TrainWeekdays
            , page = HomePage
            , answerState = Waiting
            , hintVisibilityState = initHintVisibilityState
            , settings = initSettings
            }

        commands =
            [ Random.generate NewDate (Domain.DateGeneration.random model.settings.yearRange)
            ]
    in
    ( model
    , Cmd.batch commands
    )
