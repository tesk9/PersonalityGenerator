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
        , ( "Aries"
          , ( [ "adventurous", "energetic", "pioneering", "courageous", "enthousiastic", "confident", "dynamic", "quick-witted" ]
            , [ "selfish", "quick-tempered", "impulsive", "impatient", "foolhardy", "daredevil" ]
            )
          )
        , ( "Taurus"
          , ( [ "patient", "reliable", "warm-hearted", "loving", "persistent", "determined", "placid", "security-loving" ]
            , [ "jealous", "possessive", "resentful", "inflexible", "self-indulgent", "greedy" ]
            )
          )
        , ( "Gemini"
          , ( [ "adaptable", "versatile", "communicative", "witty", "intellectual", "eloquent", "youthful", "lively" ]
            , [ "nervous", "tense", "superficial", "inconsistent", "cunning", "inquisistive" ]
            )
          )
        , ( "Cancer"
          , ( [ "emotional", "loving", "intuitive", "imaginative", "shrewd", "cautious", "protectice", "sympathetic" ]
            , [ "changeable", "moody", "overemotional", "touchy", "clingy", "unable to let go" ]
            )
          )
        , ( "Leo"
          , ( [ "generous", "warm-hearted", "creative", "enthousiastic", "broad-minded", "expansive", "faitful", "loving" ]
            , [ "pompous", "patronizing", "bossy", "interfering", "dogmatic", "intolerant" ]
            )
          )
        , ( "Virgo"
          , ( [ "modest", "shy", "meticulous", "reliable", "practical", "diligent", "intelligent", "analytical" ]
            , [ "fussy", "worrier", "overcritcal", "harsh", "perfectionist", "conservatice" ]
            )
          )
        , ( "Libra"
          , ( [ "diplomatic", "urbane", "romantic", "charming", "easy-going", "sociable", "idealistic", "peacable" ]
            , [ "indecisive", "changeable", "gullible", "easily influenced", "flirtatious", "self-indulgent" ]
            )
          )
        , ( "Scorpio"
          , ( [ "determined", "forceful", "emotional", "intuitive", "powerful", "passionate", "exciting", "magnetic" ]
            , [ "jealous", "resentful", "compulsive", "obsessive", "secretive", "obstinate" ]
            )
          )
        , ( "Sagittarius"
          , ( [ "optimistic", "freedom-loving", "jovial", "good-humored", "honest", "straightforward", "intellectual", "philosophical" ]
            , [ "blindly optimistic", "careless", "irresponsible", "superficial", "tactless", "restless" ]
            )
          )
        , ( "Capricorn"
          , ( [ "practical", "prudent", "ambitious", "disciplined", "patient", "careful", "humorous", "reserved" ]
            , [ "pessimistic", "fatalistic", "miserly", "grudging" ]
            )
          )
        , ( "Aquarius"
          , ( [ "friendly", "humanitarian", "honest", "loyal", "original", "inventive", "independent", "intellectual" ]
            , [ "intractable", "contrary", "perverse", "unpredictable", "unemotional", "detached" ]
            )
          )
        , ( "Pisces"
          , ( [ "imaginative", "sensitive", "compassionate", "kind", "selfless", "unworldly", "intuitive", "sympathetic" ]
            , [ "escapist", "idealistic", "secretive", "vague", "weak-willed", "easily led" ]
            )
          )
        ]


bloodType : Questions.Question
bloodType =
    [ "A", "B", "AB", "O" ]
        |> List.map (\key -> ( key, Just rhFactor ))
        |> Questions.new "What is your blood type?"


rhFactor : Questions.Question
rhFactor =
    Questions.new "What is your Rh factor?"
        [ ( "Rh negative", Just zodiacSign )
        , ( "Rh positive", Just zodiacSign )
        ]


zodiacSign : Questions.Question
zodiacSign =
    [ "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces" ]
        |> List.map (\key -> ( key, Nothing ))
        |> Questions.new "What is your Zodiac sign?"



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
    let
        ( newGoodTraits, newBadTraits ) =
            Dict.get option traits
                |> Maybe.withDefault ( [], [] )

        newTraits =
            ( newGoodTraits ++ goodTraits, newBadTraits ++ badTraits )
    in
    changeStepButton option <|
        case nextQuestion of
            Just question ->
                Generating newTraits question

            Nothing ->
                FullyBaked newTraits


changeStepButton : String -> Model -> Html Msg
changeStepButton text_ changeTo =
    Button.view text_ (ChangeStep changeTo)


viewTraits : List String -> Html msg
viewTraits traits =
    ul [] (List.map (\trait -> li [] [ text trait ]) traits)
