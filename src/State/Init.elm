module State.Init exposing (..)

import Domain.Calc
import Domain.Date
import Random
import Types exposing (Date, Model, Msg(..), Page(..))


initDate : Date
initDate =
    { day = 1, month = 1, year = 3000 }


init : ( Model, Cmd Msg )
init =
    ( { date = initDate, page = HomePage }, Random.generate NewDate Domain.Date.randomDateGenerator )
