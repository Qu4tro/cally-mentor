module Domain.Calc exposing (..)

import Domain.Year as Year
import Types exposing (Date, Month(..))


dayCode : Date -> Int
dayCode date =
    date.day


monthCode : Date -> Int
monthCode date =
    let
        leapDeficit =
            (date.month == January || date.month == February)
                && Year.isLeap date.year

        monthValue =
            case date.month of
                January ->
                    6

                February ->
                    2

                March ->
                    2

                April ->
                    5

                May ->
                    0

                June ->
                    3

                July ->
                    5

                August ->
                    1

                September ->
                    4

                October ->
                    6

                November ->
                    2

                December ->
                    4
    in
    if not leapDeficit then
        monthValue

    else
        monthValue - 1


yearCode : Date -> Int
yearCode date =
    let
        y =
            date.year |> modBy 100
    in
    y + y // 4


centuryCode : Date -> Int
centuryCode date =
    let
        c =
            date.year // 100
    in
    2 * (3 - modBy 5 c) + 1


dropSevens : Int -> Int
dropSevens =
    modBy 7
