module Main exposing (..)

import Accessibility exposing (..)
import Button
import Css
import Html.Attributes
import Html.Keyed
import Layout
import List.Extra
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
    | Generating ( List String, List String ) Question
    | FullyBaked ( List String, List String )



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
                        (Generating ( [], [] ) QuestionThread.first)
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


viewOptions : ( List String, List String ) -> Question -> Html Msg
viewOptions traits question =
    div []
        [ Text.h3 (Questions.directions question)
        , Html.Keyed.ul
            [ styles [ Css.textAlign Css.center, Css.listStyle Css.none, Css.padding Css.zero ] ]
            (List.map
                (\( option, nextQuestion ) -> ( toString option, viewOption traits ( option, nextQuestion ) ))
                (Questions.options question)
            )
        ]


viewOption : ( List String, List String ) -> Questions.Option TraitDeterminant -> Html Msg
viewOption ( goodTraits, badTraits ) ( option, nextQuestion ) =
    let
        ( newGoodTraits, newBadTraits ) =
            --Traits.get option
            ( [], [] )

        newTraits =
            ( newGoodTraits ++ goodTraits, newBadTraits ++ badTraits )
    in
    changeStepButton (toString option) <|
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
