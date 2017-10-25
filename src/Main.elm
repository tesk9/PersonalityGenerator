module Main exposing (..)

import Accessibility exposing (..)
import Button
import Css
import Html.Attributes
import Html.Keyed
import Layout
import Panel
import QuestionThread exposing (Question)
import Questions
import Text
import Traits exposing (TraitDeterminant)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = UnStarted
        , view = view
        , update = update
        }



{- *** MODEL *** -}


type Model
    = UnStarted
    | Generating (List TraitDeterminant) Question
    | FullyBaked (List TraitDeterminant)



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
                    changeStepButton "Start Generating"
                        (Generating [] QuestionThread.first)
                ]

            Generating traits question ->
                [ heading "Your personality is becoming clear... soon you will know who you are."
                , body (viewOptions traits question)
                ]

            FullyBaked answers ->
                let
                    ( goodTraits, badTraits ) =
                        Traits.getAll answers
                in
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


viewOptions : List TraitDeterminant -> Question -> Html Msg
viewOptions traits question =
    div []
        [ Text.h3 (Questions.directions question)
        , Html.Keyed.ul
            [ styles [ Css.textAlign Css.center, Css.listStyle Css.none, Css.padding Css.zero ] ]
            (List.map
                (\( option, nextQuestion ) ->
                    ( Traits.toString option, viewOption traits ( option, nextQuestion ) )
                )
                (Questions.options question)
            )
        ]


viewOption : List TraitDeterminant -> Questions.Option TraitDeterminant -> Html Msg
viewOption traits ( option, nextQuestion ) =
    changeStepButton (Traits.toString option) <|
        case nextQuestion of
            Just question ->
                Generating (option :: traits) question

            Nothing ->
                FullyBaked (option :: traits)


changeStepButton : String -> Model -> Html Msg
changeStepButton text_ changeTo =
    Button.view text_ (ChangeStep changeTo)


viewTraits : List String -> Html msg
viewTraits traits =
    traits
        |> List.map (\trait -> li [] [ text trait ])
        |> ul []


styles : List Css.Style -> Attribute a
styles =
    Css.asPairs >> Html.Attributes.style
