module State.Init exposing (..)

import Domain.DateGeneration
import Random
import Types exposing (..)


initDate : Date
initDate =
    { day = 1, month = January, year = 3000 }


init : ( Model, Cmd Msg )
init =
    let
        model =
            { date = initDate
            , weekday = Sunday
            , gameMode = TrainWeekdays
            , yearRange = ( 2000, 2025 )
            , hintsEnabled = True
            , darkModeEnabled = True
            , page = HomePage
            , answerState = Waiting
            }

        commands =
            [ Random.generate NewDate (Domain.DateGeneration.random model.yearRange)
            ]
    in
    ( model
    , Cmd.batch commands
    )
