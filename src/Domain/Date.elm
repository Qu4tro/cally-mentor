module Domain.Date exposing (..)

import Types exposing (Date, Day, Month, Year)


mkDate : Year -> Month -> Day -> Date
mkDate year month day =
    { year = year
    , month = month
    , day = day
    }
