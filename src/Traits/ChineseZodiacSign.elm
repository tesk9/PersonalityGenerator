module Traits.ChineseZodiacSign
    exposing
        ( ChineseZodiacSign
        , best
        , chineseZodiacSigns
        , toString
        , worst
        )


type ChineseZodiacSign
    = Rat
    | Ox
    | Tiger
    | Rabbit
    | Dragon
    | Snake
    | Horse
    | Sheep
    | Monkey
    | Rooster
    | Dog
    | Pig


chineseZodiacSigns : List ChineseZodiacSign
chineseZodiacSigns =
    [ Rat, Ox, Tiger, Rabbit, Dragon, Snake, Horse, Sheep, Monkey, Rooster, Dog, Pig ]


toString : ChineseZodiacSign -> String
toString sign =
    case sign of
        Rat ->
            "Rat"

        Ox ->
            "Ox"

        Tiger ->
            "Tiger"

        Rabbit ->
            "Rabbit"

        Dragon ->
            "Dragon"

        Snake ->
            "Snake"

        Horse ->
            "Horse"

        Sheep ->
            "Sheep"

        Monkey ->
            "Monkey"

        Rooster ->
            "Rooster"

        Dog ->
            "Dog"

        Pig ->
            "Pig"


best : ChineseZodiacSign -> List String
best sign =
    case sign of
        Rat ->
            []

        Ox ->
            []

        Tiger ->
            []

        Rabbit ->
            []

        Dragon ->
            []

        Snake ->
            []

        Horse ->
            []

        Sheep ->
            []

        Monkey ->
            []

        Rooster ->
            []

        Dog ->
            []

        Pig ->
            []


worst : ChineseZodiacSign -> List String
worst sign =
    case sign of
        Rat ->
            []

        Ox ->
            []

        Tiger ->
            []

        Rabbit ->
            []

        Dragon ->
            []

        Snake ->
            []

        Horse ->
            []

        Sheep ->
            []

        Monkey ->
            []

        Rooster ->
            []

        Dog ->
            []

        Pig ->
            []
