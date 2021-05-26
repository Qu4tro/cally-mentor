module Domain.DateGeneration exposing (..)

import Random
import Types exposing (Date, Month(..))


random : Random.Generator Date
random =
    Random.map3
        (\y m d ->
            { year = y
            , month = m
            , day = d
            }
        )
        (Random.int 1990 2030)
        (Random.uniform January
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
        )
        (Random.int 1 31)
