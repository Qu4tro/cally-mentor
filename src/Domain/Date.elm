module Domain.Date exposing (..)

import Types exposing (Date, Month(..))


isLeapYear : Int -> Bool
isLeapYear year =
    ((modBy year 4 == 0) && (modBy year 100 /= 0)) || (modBy year 400 == 0)


monthName : Month -> String
monthName month =
    case month of
        January ->
            "January"

        February ->
            "February"

        March ->
            "March"

        April ->
            "April"

        May ->
            "May"

        June ->
            "June"

        July ->
            "July"

        August ->
            "August"

        September ->
            "September"

        October ->
            "October"

        November ->
            "November"

        December ->
            "December"


dayWithSuffix : Int -> ( String, String )
dayWithSuffix day =
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
