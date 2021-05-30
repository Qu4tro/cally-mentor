module State.Update exposing (..)

import Domain.GameMode as GameMode
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
                cmd =
                    Random.generate NewDate
                        (GameMode.dateGenerator model.gameMode model.yearRange)
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

        ChangeMinYearTo year ->
            let
                yearRange =
                    ( year, Tuple.second model.yearRange )
            in
            ( { model | yearRange = yearRange }, Cmd.none )

        ChangeMaxYearTo year ->
            let
                yearRange =
                    ( Tuple.first model.yearRange, year )
            in
            ( { model | yearRange = yearRange }, Cmd.none )

        ChangePageTo newPage ->
            ( { model | page = newPage }, Cmd.none )

        ChangeGameModeTo newGameMode ->
            let
                cmd =
                    Random.generate NewDate
                        (GameMode.dateGenerator newGameMode model.yearRange)
            in
            ( { model | gameMode = newGameMode }, cmd )

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

        ToggleDarkMode ->
            ( { model | darkModeEnabled = not model.darkModeEnabled }, Cmd.none )
