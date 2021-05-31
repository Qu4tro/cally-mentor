module State.Update exposing (..)

import Domain.Weekday as Weekday
import Html exposing (text)
import Html.Attributes exposing (class)
import Markdown
import State.Init exposing (initHintVisibilityState, initRandomDate)
import Types exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        OneMoreDate ->
            ( model, initRandomDate model )

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
            ( { model | gameMode = newGameMode }, Cmd.none )

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

        GotGuide markdownResult ->
            let
                markdownRenderOptions =
                    { githubFlavored = Just { tables = True, breaks = True }
                    , defaultHighlighting = Nothing
                    , sanitize = True
                    , smartypants = False
                    }

                renderedGuide =
                    case markdownResult of
                        Ok markdown ->
                            markdown
                                |> Markdown.toHtmlWith
                                    markdownRenderOptions
                                    [ class "guide" ]

                        Err _ ->
                            text ""
            in
            ( { model | guide = renderedGuide }, Cmd.none )
