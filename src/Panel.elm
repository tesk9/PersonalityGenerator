module Panel exposing (view)

import Accessibility as Html exposing (Html, div)
import Css exposing (..)
import Html.Attributes
import Theme exposing (..)


{-|

    view [ h3 [] [ text "Heading text" ], p [] [ text "Some great content!" ] ]

-}
view : List (Html a) -> Html a
view =
    div
        [ styles
            [ margin (px 16)
            , padding (px 16)
            , minWidth (px 200)
            , borderRadius (px 4)
            , border3 (px 1) solid light
            , fontFamily sansSerif
            ]
        ]


styles : List Style -> Html.Attribute a
styles =
    asPairs >> Html.Attributes.style
