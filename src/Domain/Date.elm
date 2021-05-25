module Domain.Date exposing (..)


monthName : Int -> String
monthName n =
    case n of
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
dayWithSuffix n =
    let
        lastDigitOf =
            modBy 10

        lastTwoDigitsOf =
            modBy 100

        suffix =
            case lastTwoDigitsOf n of
                11 ->
                    "th"

                12 ->
                    "th"

                13 ->
                    "th"

                _ ->
                    case lastDigitOf n of
                        1 ->
                            "st"

                        2 ->
                            "nd"

                        3 ->
                            "rd"

                        _ ->
                            "th"
    in
    ( String.fromInt n, suffix )
