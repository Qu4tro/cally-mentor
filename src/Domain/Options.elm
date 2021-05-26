module Domain.Options exposing (..)

import Types exposing (AnswerState(..), Weekday)


selected : AnswerState -> Weekday -> Maybe Weekday
selected answerState weekday =
    case answerState of
        Waiting ->
            Nothing

        WrongAnswer answer ->
            Just answer

        CorrectAnswer ->
            Just weekday
