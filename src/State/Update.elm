module State.Update exposing (..)

import Domain.GameMode as GameMode
import Domain.Weekday as Weekday
import Random
import State.Init exposing (initHintVisibilityState)
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
                        (GameMode.dateGenerator model.gameMode model.settings.yearRange)
            in
            ( model, cmd )

        NewDate newDate ->
            ( { model
                | date = newDate
                , weekday = Weekday.fromDate newDate
                , answerState = Waiting
                , hintVisibilityState = initHintVisibilityState
              }
            , Cmd.none
            )

        ChangeMinYearTo year ->
            let
                yearRange =
                    ( year, Tuple.second model.settings.yearRange )

                oldSettings =
                    model.settings

                newSettings =
                    { oldSettings | yearRange = yearRange }
            in
            ( { model | settings = newSettings }, Cmd.none )

        ChangeMaxYearTo year ->
            let
                yearRange =
                    ( Tuple.first model.settings.yearRange, year )

                oldSettings =
                    model.settings

                newSettings =
                    { oldSettings | yearRange = yearRange }
            in
            ( { model | settings = newSettings }, Cmd.none )

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

        ChangeGameModeTo newGameMode ->
            let
                cmd =
                    Random.generate NewDate
                        (GameMode.dateGenerator newGameMode model.settings.yearRange)
            in
            ( { model | gameMode = newGameMode }, cmd )

        ToggleDarkMode ->
            let
                oldSettings =
                    model.settings

                newSettings =
                    { oldSettings | darkModeEnabled = not oldSettings.darkModeEnabled }
            in
            ( { model | settings = newSettings }, Cmd.none )

        ToggleSundayFirst ->
            let
                oldSettings =
                    model.settings

                newSettings =
                    { oldSettings | sundayFirst = not oldSettings.sundayFirst }
            in
            ( { model | settings = newSettings }, Cmd.none )

        ToggleWeekdayHints ->
            let
                oldSettings =
                    model.settings

                newSettings =
                    { oldSettings | weekdayHintsEnabled = not oldSettings.weekdayHintsEnabled }
            in
            ( { model | settings = newSettings }, Cmd.none )

        ToggleDateHints ->
            let
                oldSettings =
                    model.settings

                newSettings =
                    { oldSettings | dateHintsEnabled = not oldSettings.dateHintsEnabled }
            in
            ( { model | settings = newSettings }, Cmd.none )

        ShowDateHint datePart ->
            let
                oldHintVisibilityState =
                    model.hintVisibilityState

                newHintVisibilityState =
                    case datePart of
                        "day" ->
                            { oldHintVisibilityState | dayVisible = True }

                        "month" ->
                            { oldHintVisibilityState | monthVisible = True }

                        "year" ->
                            { oldHintVisibilityState | yearVisible = True }

                        _ ->
                            oldHintVisibilityState
            in
            ( { model | hintVisibilityState = newHintVisibilityState }, Cmd.none )
