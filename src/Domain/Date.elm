module Domain.Date exposing (..)

import Random
import Types exposing (Date)


randomDateGenerator : Random.Generator Date
randomDateGenerator =
    Random.map3
        (\y m d ->
            { year = y
            , month = m
            , day = d
            }
        )
        (Random.int 1990 2030)
        (Random.int 1 12)
        (Random.int 1 31)


isLeapYear : Int -> Bool
isLeapYear year =
    ((modBy year 4 == 0) && (modBy year 100 /= 0)) || (modBy year 400 == 0)


monthName : Int -> String
monthName month =
    case month of
        1 ->
            "January"

        2 ->
            "February"

        3 ->
            "March"

        4 ->
            "April"

        5 ->
            "May"

        6 ->
            "June"

        7 ->
            "July"

        8 ->
            "August"

        9 ->
            "September"

        10 ->
            "October"

        11 ->
            "November"

        12 ->
            "December"

        _ ->
            "This is awkward!"


dayWithSuffix : Int -> ( String, String )
dayWithSuffix day =
    let
        lastDigitOf =
            modBy 10

        lastTwoDigitsOf =
            modBy 100

        suffix =
            case lastTwoDigitsOf day of
                11 ->
                    "th"

                12 ->
                    "th"

                13 ->
                    "th"

                _ ->
                    case lastDigitOf day of
                        1 ->
                            "st"

                        2 ->
                            "nd"

                        3 ->
                            "rd"

                        _ ->
                            "th"
    in
    ( String.fromInt day, suffix )
