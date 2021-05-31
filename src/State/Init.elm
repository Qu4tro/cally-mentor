module State.Init exposing (..)

import Domain.GameMode as GameMode
import Html exposing (div)
import Http
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


initGuideCmd : Cmd Msg
initGuideCmd =
    Http.get
        { url = "%PUBLIC_URL%/guide.md"
        , expect = Http.expectString GotGuide
        }


initRandomDate : Model -> Cmd Msg
initRandomDate model =
    Random.generate
        NewDate
        (GameMode.dateGenerator model.gameMode model.settings.yearRange)


init : ( Model, Cmd Msg )
init =
    let
        model =
            { page = HomePage
            , date = initDate
            , weekday = Sunday
            , guide = div [] []
            , gameMode = TrainWeekdays
            , answerState = Waiting
            , hintVisibilityState = initHintVisibilityState
            , settings = initSettings
            }

        commands =
            [ initRandomDate model
            , initGuideCmd
            ]
    in
    ( model
    , Cmd.batch commands
    )
