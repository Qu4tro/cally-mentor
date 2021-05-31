module Domain.Day exposing (..)

import Domain.Month as Month
import Domain.Year as Year
import Types exposing (Day, Month, Year)


daysOnTheSameWeekday : Year -> Month -> Day -> List Day
daysOnTheSameWeekday year month firstWeekdayDay =
    List.range (firstWeekdayDay + 1) (Month.daysOf month (Year.isLeap year))
        |> List.filter (\day -> modBy 7 day == modBy 7 firstWeekdayDay)


ordinal : Day -> ( String, String )
ordinal day =
    let
        lastDigit =
            day |> modBy 10

        butLastDigit =
            (day |> modBy 100) // 10

        suffix =
            case ( butLastDigit, lastDigit ) of
                ( 1, 1 ) ->
                    "th"

                ( 1, 2 ) ->
                    "th"

                ( 1, 3 ) ->
                    "th"

                ( _, 1 ) ->
                    "st"

                ( _, 2 ) ->
                    "nd"

                ( _, 3 ) ->
                    "rd"

                _ ->
                    "th"
    in
    ( String.fromInt day, suffix )
