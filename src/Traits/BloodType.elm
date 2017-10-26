module Traits.BloodType
    exposing
        ( BloodType
        , all
        , best
        , toString
        , worst
        )


type BloodType
    = A
    | B
    | AB
    | O


all : List BloodType
all =
    [ A, B, AB, O ]


toString : BloodType -> String
toString bloodType =
    case bloodType of
        A ->
            "A"

        B ->
            "B"

        AB ->
            "AB"

        O ->
            "O"


best : BloodType -> List String
best bloodType =
    case bloodType of
        A ->
            [ "earnest", "reserved", "sensible", "patient", "responsible", "cautious" ]

        B ->
            [ "passionate", "active", "creative", "animal-loving", "flexible", "cheerful", "friendly", "optimistic" ]

        AB ->
            [ "cool", "controlled", "rational", "sociable", "intelligent", "adaptable" ]

        O ->
            [ "confident", "self-determined", "ambitious", "strong-willed", "intuitive", "agreeable", "competitive", "athletic" ]


worst : BloodType -> List String
worst bloodType =
    case bloodType of
        A ->
            [ "fastidious", "over-earnest", "proud", "stubborn", "tense", "mischievous", "obsessive", "pessimistic" ]

        B ->
            [ "irresponsible", "forgetful", "selfish", "lazy", "impatient", "unreliable", "\"going own way\"" ]

        AB ->
            [ "critical", "indecisive", "unforgiving", "two-faced", "aloof", "\"split personality\"" ]

        O ->
            [ "unpredictable", "spiteful", "self-centered", "cold", "aggressive", "arrogant", "envious", "ruthless" ]
