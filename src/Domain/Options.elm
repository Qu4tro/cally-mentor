module Domain.Options exposing (..)

import Types exposing (Model, AnswerState(..), Weekday)


selected : Model -> Maybe Weekday
selected m =
    case m.answerState of
        Waiting ->
            Nothing

        WrongAnswer answer ->
            Just answer

        CorrectAnswer ->
            Just m.weekday
