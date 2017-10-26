module Traits.HairColor
    exposing
        ( HairColor
        , all
        , best
        , toString
        , worst
        )


type HairColor
    = Black
    | Red
    | Brown
    | Blond


all : List HairColor
all =
    [ Black, Red, Brown, Blond ]


toString : HairColor -> String
toString hairColor =
    case hairColor of
        Black ->
            "Black"

        Red ->
            "Red"

        Brown ->
            "Brown"

        Blond ->
            "Blond"


best : HairColor -> List String
best hairColor =
    case hairColor of
        Black ->
            []

        Red ->
            []

        Brown ->
            []

        Blond ->
            []


worst : HairColor -> List String
worst hairColor =
    case hairColor of
        Black ->
            []

        Red ->
            []

        Brown ->
            []

        Blond ->
            []
