module Domain.Year exposing (..)

import Types exposing (Year)


isLeap : Year -> Bool
isLeap year =
    ((modBy year 4 == 0) && (modBy year 100 /= 0)) || (modBy year 400 == 0)
