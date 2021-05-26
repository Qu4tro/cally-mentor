module State.Update exposing (..)

import Domain.Calc
import Domain.Date
import Random
import Types exposing (AnswerState(..), Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OneMoreDate ->
            ( model, Random.generate NewDate Domain.Date.randomDateGenerator )

        NewDate newDate ->
            ( { model | date = newDate }, Cmd.none )

        ChangePageTo newPage ->
            ( { model | page = newPage }, Cmd.none )

        PickOption weekday ->
            let
                isCorrect =
                    Domain.Calc.weekday model.date == weekday

                newAnswerState =
                    if isCorrect then
                        CorrectAnswer

                    else
                        WrongAnswer
            in
            ( { model | answerState = newAnswerState }, Cmd.none )

        ClearAnswerState ->
            ( { model | answerState = Waiting }, Cmd.none )
