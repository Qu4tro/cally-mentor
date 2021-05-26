module Domain.Weekday exposing (..)

import Domain.Calc as Calc exposing (dropSevens)
import Types exposing (Date, Weekday(..))


fromDate : Date -> Weekday
fromDate date =
    Calc.dayCode date
        + Calc.monthCode date
        + Calc.yearCode date
        + Calc.centuryCode date
        |> dropSevens
        |> fromInt


fromInt : Int -> Weekday
fromInt n =
    case n of
        0 ->
            Sunday

        1 ->
            Monday

        2 ->
            Tuesday

        3 ->
            Wednesday

        4 ->
            Thursday

        5 ->
            Friday

        6 ->
            Saturday

        _ ->
            fromInt (dropSevens n)


toString : Weekday -> String
toString weekday =
    case weekday of
        Sunday ->
            "Sunday"

        Monday ->
            "Monday"

        Tuesday ->
            "Tuesday"

        Wednesday ->
            "Wednesday"

        Thursday ->
            "Thursday"

        Friday ->
            "Friday"

        Saturday ->
            "Saturday"
