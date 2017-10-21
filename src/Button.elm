module Button exposing (view)

import Accessibility as Html exposing (Html, button)
import Css exposing (..)
import Html.Attributes
import Html.Events exposing (onClick)
import Theme exposing (..)


{-|

    view "Submit" Update.Submit

-}
view : String -> a -> Html a
view text_ do =
    button
        [ onClick do
        , styles
            [ margin (px 8)
            , padding2 (px 8) (px 16)
            , borderRadius zero
            , border3 (px 1) solid light
            , backgroundColor dark
            , color hue1
            , fontFamily sansSerif
            , fontSize (px 16)
            ]
        ]
        [ Html.text text_ ]


styles : List Style -> Html.Attribute a
styles =
    asPairs >> Html.Attributes.style
