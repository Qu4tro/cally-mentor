module Domain.Calc exposing (..)

import Array
import Domain.Date
import Types exposing (Date)


dayCode : Date -> Int
dayCode date =
    date.day


monthCode : Date -> Int
monthCode date =
    let
        leapDeficit =
            (date.month == 1 || date.month == 2) && Domain.Date.isLeapYear date.year

        monthValue =
            case date.month of
                1 ->
                    5

                2 ->
                    1

                3 ->
                    1

                4 ->
                    1

                5 ->
                    1

                6 ->
                    1

                7 ->
                    1

                8 ->
                    1

                9 ->
                    1

                10 ->
                    1

                11 ->
                    1

                12 ->
                    1

                _ ->
                    Debug.todo "I broke"
    in
    if not leapDeficit then
        monthValue

    else
        monthValue - 1


yearCode : Date -> Int
yearCode date =
    let
        y =
            modBy 100 date.year
    in
    y + y // 4


centuryCode : Date -> Int
centuryCode date =
    let
        cycleArray =
            [ 0, 3, 5, 1 ] |> Array.fromList

        c =
            date.year // 100

        index =
            modBy 4 c
    in
    Array.get index cycleArray |> Maybe.withDefault (Debug.todo "I broke")


dropSevens : Int -> Int
dropSevens =
    modBy 7
