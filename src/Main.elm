module Main exposing (..)

import Accessibility exposing (..)
import Button
import Layout
import Questions


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }



{- *** MODEL *** -}


type Model
    = UnStarted
    | Generating Questions.Question
    | FullyBaked String


model : Model
model =
    UnStarted


bloodType : Questions.Question
bloodType =
    Questions.new "What is your blood type?"
        [ ( "0", Just rhFactor )
        , ( "A", Just rhFactor )
        , ( "B", Just rhFactor )
        , ( "AB", Just rhFactor )
        ]


rhFactor : Questions.Question
rhFactor =
    Questions.new "What is your Rh factor?"
        [ ( "Rh negative", Nothing )
        , ( "Rh positive", Nothing )
        ]



{- *** UPDATE *** -}


type Msg
    = NoOp
    | ChangeStep Model


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        ChangeStep newModel ->
            newModel



{- *** VIEW *** -}


view : Model -> Html Msg
view model =
    div []
        [ Layout.centered
            [ header []
                [ h1 [] [ text "Personality Generator" ]
                , h2 [] [ text "Generate a personality, because you clearly need one." ]
                ]
            ]
        , main_ []
            [ Layout.centered
                [ case model of
                    UnStarted ->
                        changeStepButton "Start Generating" <|
                            Generating bloodType

                    Generating question ->
                        viewOptions question

                    FullyBaked personality ->
                        text personality
                ]
            ]
        ]


viewOptions : Questions.Question -> Html Msg
viewOptions question =
    div []
        [ h3 [] [ text (Questions.directions question) ]
        , div [] (List.map viewOption (Questions.options question))
        ]


viewOption : Questions.Option -> Html Msg
viewOption ( option, nextQuestion ) =
    changeStepButton option <|
        case nextQuestion of
            Just question ->
                Generating question

            Nothing ->
                FullyBaked "Here's your personality!"


changeStepButton : String -> Model -> Html Msg
changeStepButton text_ changeTo =
    Button.view text_ (ChangeStep changeTo)
