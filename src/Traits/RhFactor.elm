module Traits.RhFactor
    exposing
        ( RhFactor
        , all
        , best
        , toString
        , worst
        )


type RhFactor
    = Positive
    | Negative


all : List RhFactor
all =
    [ Positive, Negative ]


toString : RhFactor -> String
toString rhFactor =
    case rhFactor of
        Negative ->
            "Negative"

        Positive ->
            "Positive"


best : RhFactor -> List String
best rhFactor =
    case rhFactor of
        Negative ->
            [ "smart", "high intuition", "fact-based" ]

        Positive ->
            []


worst : RhFactor -> List String
worst rhFactor =
    case rhFactor of
        Negative ->
            [ "easily frightened" ]

        Positive ->
            []
