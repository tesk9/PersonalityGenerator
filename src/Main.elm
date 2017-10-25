module Main exposing (..)

import Accessibility exposing (..)
import Button
import Css
import Dict
import Html.Attributes
import Html.Keyed
import Layout
import List.Extra
import Panel
import Questions
import Text


main : Program Never Model Msg
main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }



{- *** MODEL *** -}


type Model
    = UnStarted
    | Generating ( List String, List String ) Questions.Question
    | FullyBaked ( List String, List String )


init : Model
init =
    UnStarted


type TraitDeterminant
    = BloodType BloodType
    | RhFactor RhFactor
    | ZodiacSign ZodiacSign


type BloodType
    = A
    | B
    | AB
    | O


type RhFactor
    = Positive
    | Negative


type ZodiacSign
    = Aries
    | Taurus
    | Gemini
    | Cancer
    | Leo
    | Virgo
    | Libra
    | Scorpio
    | Sagittarius
    | Capricorn
    | Aquarius
    | Pisces


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
    Layout.page <|
        case model of
            UnStarted ->
                [ heading "Generate a personality, because you clearly need one."
                , body <|
                    changeStepButton "Start Generating" (Generating ( [], [] ) bloodType)
                ]

            Generating traits question ->
                [ heading "Your personality is becoming clear... soon you will know who you are."
                , body (viewOptions traits question)
                ]

            FullyBaked ( goodTraits, badTraits ) ->
                [ heading "We know who you are. Do you?"
                , body <|
                    Layout.paneled
                        [ Panel.view
                            [ h3 [] [ text "Best traits" ]
                            , viewTraits goodTraits
                            ]
                        , Panel.view
                            [ h3 [] [ text "Worst traits" ]
                            , viewTraits badTraits
                            ]
                        ]
                ]


heading : String -> Html msg
heading subheading =
    Layout.header
        [ Layout.centered
            [ div []
                [ Text.h1 "Personality Generator"
                , Text.h2 subheading
                ]
            ]
        ]


body : Html a -> Html a
body bodyContent =
    Layout.main_
        [ Layout.centered
            [ bodyContent
            ]
        ]


viewOptions : ( List String, List String ) -> Questions.Question -> Html Msg
viewOptions traits question =
    div []
        [ Text.h3 (Questions.directions question)
        , Html.Keyed.ul
            [ styles [ Css.textAlign Css.center, Css.listStyle Css.none, Css.padding Css.zero ] ]
            (List.map
                (\( option, nextQuestion ) -> ( option, viewOption traits ( option, nextQuestion ) ))
                (Questions.options question)
            )
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
    traits
        |> List.Extra.unique
        |> List.map (\trait -> li [] [ text trait ])
        |> ul []


styles : List Css.Style -> Attribute a
styles =
    Css.asPairs >> Html.Attributes.style
