module Layout exposing (..)

import Accessibility as Html exposing (Html, div)
import Css exposing (..)
import Html.Attributes


{-| -}
centered : List (Html a) -> Html a
centered =
    div
        [ styles
            [ displayFlex
            , justifyContent center
            , alignItems center
            ]
        ]


styles : List Style -> Html.Attribute a
styles =
    asPairs >> Html.Attributes.style
