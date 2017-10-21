module Main exposing (..)

import Accessibility exposing (..)
import Html.Events exposing (onClick)


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
    | Generating ( String, String )
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
        [ h1 [] [ text "Personality Generator" ]
        , h2 [] [ text "Generate a personality, because you clearly need one." ]
        , main_ []
            [ case model of
                UnStarted ->
                    button [ onClick (ChangeStep <| Generating ( "Rh negative", "Rh positive" )) ]
                        [ text "Start Generating" ]

                Generating options ->
                    viewOptions options

                FullyBaked personality ->
                    text personality
            ]
        ]


viewOptions : ( String, String ) -> Html msg
viewOptions ( optionA, optionB ) =
    div [] [ viewOption optionA, viewOption optionB ]


viewOption : String -> Html msg
viewOption option =
    button [] [ text option ]
