module Layout exposing (..)

import Accessibility as Html exposing (Html, div)
import Css exposing (..)
import Html.Attributes
import Theme


page : List (Html a) -> Html a
page =
    div []


header : List (Html a) -> Html a
header =
    Html.header
        [ styles
            [ maxWidth (vw 100)
            , borderBottom3 (px 4) solid Theme.hue4
            ]
        ]


main_ : List (Html a) -> Html a
main_ =
    Html.main_
        [ styles
            [ maxWidth (px 700)
            , height (vh 70)
            , margin2 zero auto
            ]
        ]


centered : List (Html a) -> Html a
centered =
    div
        [ styles
            [ displayFlex
            , justifyContent center
            , alignItems center
            , minHeight (pct 100)
            ]
        ]


paneled : List (Html a) -> Html a
paneled =
    div
        [ styles
            [ displayFlex
            , justifyContent spaceAround
            , minWidth (pct 100)
            ]
        ]


styles : List Style -> Html.Attribute a
styles =
    asPairs >> Html.Attributes.style
