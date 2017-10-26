module Traits.BirthOrder
    exposing
        ( BirthOrder
        , all
        , best
        , toString
        , worst
        )


type BirthOrder
    = Youngest
    | Middle
    | Oldest


all : List BirthOrder
all =
    [ Youngest, Middle, Oldest ]


toString : BirthOrder -> String
toString birthOrder =
    case birthOrder of
        Youngest ->
            "Youngest"

        Middle ->
            "Middle"

        Oldest ->
            "Oldest"


best : BirthOrder -> List String
best birthOrder =
    case birthOrder of
        Youngest ->
            []

        Middle ->
            []

        Oldest ->
            []


worst : BirthOrder -> List String
worst birthOrder =
    case birthOrder of
        Youngest ->
            []

        Middle ->
            []

        Oldest ->
            []
