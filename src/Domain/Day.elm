module Domain.Day exposing (..)

import Types exposing (Day)


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
