module Domain.Month exposing (..)

import Types exposing (Month(..))


daysOf : Month -> Bool -> Int
daysOf month leap =
    case month of
        January ->
            31

        February ->
            if leap then
                29

            else
                28

        March ->
            31

        April ->
            30

        May ->
            31

        June ->
            30

        July ->
            31

        August ->
            31

        September ->
            30

        October ->
            31

        November ->
            30

        December ->
            31


toString : Month -> String
toString month =
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
