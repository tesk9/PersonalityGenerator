module Text exposing (..)

import Accessibility as Html exposing (Html)
import Css exposing (..)
import Html.Attributes
import Theme exposing (..)


h1 : String -> Html a
h1 text_ =
    Html.h1
        [ styles
            [ color dark
            , fontFamily sansSerif
            , fontSize (px 36)
            , textAlign center
            , margin (px 8)
            ]
        ]
        [ Html.text text_
        ]


h2 : String -> Html a
h2 text_ =
    Html.h2
        [ styles
            [ color grayDark
            , fontFamily sansSerif
            , fontSize (px 20)
            , textAlign center
            , marginTop zero
            ]
        ]
        [ Html.text text_
        ]


h3 : String -> Html a
h3 text_ =
    Html.h3
        [ styles
            [ color darkest
            , fontFamily sansSerif
            , fontSize (px 18)
            , textAlign center
            , marginTop zero
            ]
        ]
        [ Html.text text_
        ]


styles : List Style -> Html.Attribute a
styles =
    asPairs >> Html.Attributes.style
