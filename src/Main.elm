module Main exposing (..)

import Accessibility exposing (..)
import Button
import Dict
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
    | Generating ( List String, List String ) Questions.Question
    | FullyBaked ( List String, List String )


model : Model
model =
    UnStarted


traits : Dict.Dict String ( List String, List String )
traits =
    Dict.fromList
        [ ( "A"
          , ( [ "earnest", "reserved", "sensible", "patient", "responsible", "cautious" ]
            , [ "fastidious", "over-earnest", "proud", "stubborn", "tense", "mischievous", "obsessive", "pessimistic" ]
            )
          )
        , ( "B"
          , ( [ "passionate", "active", "creative", "animal-loving", "flexible", "cheerful", "friendly", "optimistic" ]
            , [ "irresponsible", "forgetful", "selfish", "lazy", "impatient", "unreliable", "\"going own way\"" ]
            )
          )
        , ( "AB"
          , ( [ "cool", "controlled", "rational", "sociable", "intelligent", "adaptable" ]
            , [ "critical", "indecisive", "unforgiving", "two-faced", "aloof", "\"split personality\"" ]
            )
          )
        , ( "O"
          , ( [ "confident", "self-determined", "ambitious", "strong-willed", "intuitive", "agreeable", "competitive", "athletic" ]
            , [ "unpredictable", "spiteful", "self-centered", "cold", "aggressive", "arrogant", "envious", "ruthless" ]
            )
          )
        , ( "Rh negative", ( [ "smart", "high intuition", "fact-based" ], [ "easily frightened" ] ) )
        , ( "Rh positive", ( [], [] ) )
        ]


bloodType : Questions.Question
bloodType =
    [ "A", "B", "AB", "O" ]
        |> List.map (\key -> ( key, Just rhFactor ))
        |> Questions.new "What is your blood type?"


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
                            Generating ( [], [] ) bloodType

                    Generating traits question ->
                        viewOptions traits question

                    FullyBaked ( goodTraits, badTraits ) ->
                        div []
                            [ h3 [] [ text "Best traits" ]
                            , viewTraits goodTraits
                            , h3 [] [ text "Worst traits" ]
                            , viewTraits badTraits
                            ]
                ]
            ]
        ]


viewOptions : ( List String, List String ) -> Questions.Question -> Html Msg
viewOptions traits question =
    div []
        [ h3 [] [ text (Questions.directions question) ]
        , div [] (List.map (viewOption traits) (Questions.options question))
        ]


viewOption : ( List String, List String ) -> Questions.Option -> Html Msg
viewOption ( goodTraits, badTraits ) ( option, nextQuestion ) =
    changeStepButton option <|
        case nextQuestion of
            Just question ->
                let
                    ( newGoodTraits, newBadTraits ) =
                        Dict.get option traits
                            |> Maybe.withDefault ( [], [] )
                in
                Generating ( newGoodTraits ++ goodTraits, newBadTraits ++ badTraits ) question

            Nothing ->
                FullyBaked ( goodTraits, badTraits )


changeStepButton : String -> Model -> Html Msg
changeStepButton text_ changeTo =
    Button.view text_ (ChangeStep changeTo)


viewTraits : List String -> Html msg
viewTraits traits =
    ul [] (List.map (\trait -> li [] [ text trait ]) traits)
