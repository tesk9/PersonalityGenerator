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
                        Button.view "Start Generating"
                            (ChangeStep
                                (Generating <|
                                    Questions.new "What is your Rh factor?"
                                        [ ( "Rh negative", Nothing )
                                        , ( "Rh positive", Nothing )
                                        ]
                                )
                            )

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
    Button.view option
        (ChangeStep <|
            case nextQuestion of
                Just question ->
                    Generating question

                Nothing ->
                    FullyBaked "Here's your personality!"
        )
