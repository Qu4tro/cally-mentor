module State.Update exposing (..)

import Domain.DateGeneration as DateGeneration
import Domain.Weekday as Weekday
import Random
import Types exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OneMoreDate ->
            let
                randomDateF =
                    case model.gameMode of
                        TrainYears ->
                            DateGeneration.unknownYearGenerator

                        TrainMonths ->
                            DateGeneration.unknownMonthGenerator

                        _ ->
                            DateGeneration.random

                cmd =
                    Random.generate NewDate (randomDateF model.yearRange)
            in
            ( model, cmd )

        NewDate newDate ->
            ( { model
                | date = newDate
                , weekday = Weekday.fromDate newDate
                , answerState = Waiting
              }
            , Cmd.none
            )

        ChangePageTo newPage ->
            ( { model | page = newPage }, Cmd.none )

        PickOption weekday ->
            let
                isCorrect =
                    Weekday.fromDate model.date == weekday

                newAnswerState =
                    if isCorrect then
                        CorrectAnswer

                    else
                        WrongAnswer weekday
            in
            case model.answerState of
                Waiting ->
                    ( { model | answerState = newAnswerState }, Cmd.none )

                _ ->
                    ( model, Cmd.none )
