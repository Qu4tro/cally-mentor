module Domain.GameMode exposing (..)

import Domain.DateGeneration as DateGeneration
import Random
import Types exposing (Date, GameMode(..), Year)


toString : GameMode -> String
toString gameMode =
    case gameMode of
        TrainWeekdays ->
            "Train weekdays"

        TrainSevens ->
            "Drop sevens"

        TrainMonths ->
            "Train months"

        TrainYears ->
            "Train years"


dateGenerator : GameMode -> ( Year, Year ) -> Random.Generator Date
dateGenerator gameMode =
    case gameMode of
        TrainYears ->
            DateGeneration.unknownYearGenerator

        TrainMonths ->
            DateGeneration.unknownMonthGenerator

        _ ->
            DateGeneration.random
