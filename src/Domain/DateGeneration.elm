module Domain.DateGeneration exposing (..)

import Domain.Calc as Calc
import Domain.Date exposing (mkDate)
import Domain.Month as Month
import Domain.Year as Year
import Random
import Types exposing (Date, Month(..), Year)


randomYear : ( Year, Year ) -> Random.Generator Int
randomYear ( yA, yB ) =
    Random.int yA yB


randomMonth : Random.Generator Month
randomMonth =
    Random.uniform January
        [ February
        , March
        , April
        , May
        , June
        , July
        , August
        , September
        , October
        , November
        , December
        ]


random : ( Year, Year ) -> Random.Generator Date
random yearRange =
    randomYear yearRange
        |> Random.andThen
            (\year ->
                randomMonth
                    |> Random.andThen
                        (\month ->
                            let
                                daysOfMonth =
                                    Month.daysOf month (Year.isLeap year)
                            in
                            Random.map
                                (mkDate year month)
                                (Random.int 1 daysOfMonth)
                        )
            )


unknownYearGenerator : ( Year, Year ) -> Random.Generator Date
unknownYearGenerator yearRange =
    let
        unknownYearGeneratorGivenMonth : Int -> Month -> Random.Generator Date
        unknownYearGeneratorGivenMonth year month =
            let
                daysOnTheSameWeekday firstWeekdayDay =
                    []

                dayGenerator =
                    let
                        parcialDate =
                            mkDate year month 1

                        monthCode =
                            Calc.monthCode parcialDate

                        validDay =
                            Calc.dropSevens (7 - monthCode)
                    in
                    Random.uniform validDay (daysOnTheSameWeekday validDay)
            in
            Random.map
                (mkDate year month)
                dayGenerator
    in
    randomYear yearRange
        |> Random.andThen
            (\year ->
                randomMonth
                    |> Random.andThen
                        (\month ->
                            unknownYearGeneratorGivenMonth year month
                        )
            )


unknownMonthGenerator : ( Year, Year ) -> Random.Generator Date
unknownMonthGenerator yearRange =
    let
        unknownMonthGeneratorGivenYear : Int -> Month -> Random.Generator Date
        unknownMonthGeneratorGivenYear year month =
            let
                daysOnTheSameWeekday firstWeekdayDay =
                    []

                dayGenerator =
                    let
                        parcialDate =
                            mkDate year month 1

                        yearCode =
                            Calc.yearCode parcialDate
                                + Calc.centuryCode parcialDate

                        validDay =
                            Calc.dropSevens (7 - yearCode)
                    in
                    Random.uniform validDay (daysOnTheSameWeekday validDay)
            in
            Random.map
                (mkDate year month)
                dayGenerator
    in
    randomMonth
        |> Random.andThen
            (\month ->
                randomYear yearRange
                    |> Random.andThen
                        (\year ->
                            unknownMonthGeneratorGivenYear year month
                        )
            )
