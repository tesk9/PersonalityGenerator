module Traits.RhFactor
    exposing
        ( RhFactor
        , best
        , rhFactors
        , toString
        , worst
        )


type RhFactor
    = Positive
    | Negative


rhFactors : List RhFactor
rhFactors =
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
