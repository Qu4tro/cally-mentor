module State.Init exposing (..)

import Domain.Calc
import Domain.DateGeneration
import Random
import Types exposing (..)


initDate : Date
initDate =
    { day = 1, month = January, year = 3000 }


init : ( Model, Cmd Msg )
init =
    ( { date = initDate
      , weekday = 0
      , page = HomePage
      , answerState = Waiting
      }
    , Random.generate NewDate Domain.DateGeneration.random
    )
