module State.Init exposing (..)

import Domain.Calc
import Domain.Date
import Random
import Types exposing (..)


initDate : Date
initDate =
    { day = 1, month = January, year = 3000 }


init : ( Model, Cmd Msg )
init =
    ( { date = initDate
      , page = HomePage
      , answerState = Waiting
      }
    , Random.generate NewDate Domain.Date.randomDateGenerator
    )
