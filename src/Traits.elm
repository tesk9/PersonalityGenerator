module Traits
    exposing
        ( BloodType
        , RhFactor
        , TraitDeterminant
        , ZodiacSign
        , best
        , bloodTypes
        , getAll
        , rhFactors
        , toString
        , worst
        , zodiacSigns
        )

import List.Extra


type TraitDeterminant
    = BloodType BloodType
    | RhFactor RhFactor
    | ZodiacSign ZodiacSign


getAll : List TraitDeterminant -> ( List String, List String )
getAll traits =
    traits
        |> List.foldl
            (\trait ( goodAcc, badAcc ) ->
                ( best trait ++ goodAcc, worst trait ++ badAcc )
            )
            ( [], [] )
        |> Tuple.mapFirst List.Extra.unique
        |> Tuple.mapSecond List.Extra.unique


best : TraitDeterminant -> List String
best trait =
    case trait of
        BloodType bloodType ->
            bestBloodTypeTraits bloodType

        RhFactor rhFactor ->
            bestRhFactorTraits rhFactor

        ZodiacSign zodiacSign ->
            bestZodiacSignTraits zodiacSign


worst : TraitDeterminant -> List String
worst trait =
    case trait of
        BloodType bloodType ->
            worstBloodTypeTraits bloodType

        RhFactor rhFactor ->
            worstRhFactorTraits rhFactor

        ZodiacSign zodiacSign ->
            worstZodiacSignTraits zodiacSign


toString : TraitDeterminant -> String
toString trait =
    case trait of
        BloodType bloodType ->
            toStringBloodType bloodType

        RhFactor rhFactor ->
            toStringRhFactor rhFactor

        ZodiacSign zodiacSign ->
            toStringZodiacSign zodiacSign


type BloodType
    = A
    | B
    | AB
    | O


bloodTypes : List TraitDeterminant
bloodTypes =
    List.map BloodType [ A, B, AB, O ]


toStringBloodType : BloodType -> String
toStringBloodType bloodType =
    case bloodType of
        A ->
            "A"

        B ->
            "B"

        AB ->
            "AB"

        O ->
            "O"


bestBloodTypeTraits : BloodType -> List String
bestBloodTypeTraits bloodType =
    case bloodType of
        A ->
            [ "earnest", "reserved", "sensible", "patient", "responsible", "cautious" ]

        B ->
            [ "passionate", "active", "creative", "animal-loving", "flexible", "cheerful", "friendly", "optimistic" ]

        AB ->
            [ "cool", "controlled", "rational", "sociable", "intelligent", "adaptable" ]

        O ->
            [ "confident", "self-determined", "ambitious", "strong-willed", "intuitive", "agreeable", "competitive", "athletic" ]


worstBloodTypeTraits : BloodType -> List String
worstBloodTypeTraits bloodType =
    case bloodType of
        A ->
            [ "fastidious", "over-earnest", "proud", "stubborn", "tense", "mischievous", "obsessive", "pessimistic" ]

        B ->
            [ "irresponsible", "forgetful", "selfish", "lazy", "impatient", "unreliable", "\"going own way\"" ]

        AB ->
            [ "critical", "indecisive", "unforgiving", "two-faced", "aloof", "\"split personality\"" ]

        O ->
            [ "unpredictable", "spiteful", "self-centered", "cold", "aggressive", "arrogant", "envious", "ruthless" ]


type RhFactor
    = Positive
    | Negative


rhFactors : List TraitDeterminant
rhFactors =
    List.map RhFactor [ Positive, Negative ]


toStringRhFactor : RhFactor -> String
toStringRhFactor rhFactor =
    case rhFactor of
        Negative ->
            "Negative"

        Positive ->
            "Positive"


bestRhFactorTraits : RhFactor -> List String
bestRhFactorTraits rhFactor =
    case rhFactor of
        Negative ->
            [ "smart", "high intuition", "fact-based" ]

        Positive ->
            []


worstRhFactorTraits : RhFactor -> List String
worstRhFactorTraits rhFactor =
    case rhFactor of
        Negative ->
            [ "easily frightened" ]

        Positive ->
            []


type ZodiacSign
    = Aries
    | Taurus
    | Gemini
    | Cancer
    | Leo
    | Virgo
    | Libra
    | Scorpio
    | Sagittarius
    | Capricorn
    | Aquarius
    | Pisces


zodiacSigns : List TraitDeterminant
zodiacSigns =
    List.map ZodiacSign [ Aries, Taurus, Gemini, Cancer, Leo, Virgo, Libra, Scorpio, Sagittarius, Capricorn, Aquarius, Pisces ]


toStringZodiacSign : ZodiacSign -> String
toStringZodiacSign sign =
    case sign of
        Aries ->
            "Aries"

        Taurus ->
            "Taurus"

        Gemini ->
            "Gemini"

        Cancer ->
            "Cancer"

        Leo ->
            "Leo"

        Virgo ->
            "Virgo"

        Libra ->
            "Libra"

        Scorpio ->
            "Scorpio"

        Sagittarius ->
            "Sagittarius"

        Capricorn ->
            "Capricorn"

        Aquarius ->
            "Aquarius"

        Pisces ->
            "Pisces"


bestZodiacSignTraits : ZodiacSign -> List String
bestZodiacSignTraits sign =
    case sign of
        Aries ->
            [ "adventurous", "energetic", "pioneering", "courageous", "enthousiastic", "confident", "dynamic", "quick-witted" ]

        Taurus ->
            [ "patient", "reliable", "warm-hearted", "loving", "persistent", "determined", "placid", "security-loving" ]

        Gemini ->
            [ "adaptable", "versatile", "communicative", "witty", "intellectual", "eloquent", "youthful", "lively" ]

        Cancer ->
            [ "emotional", "loving", "intuitive", "imaginative", "shrewd", "cautious", "protectice", "sympathetic" ]

        Leo ->
            [ "generous", "warm-hearted", "creative", "enthousiastic", "broad-minded", "expansive", "faitful", "loving" ]

        Virgo ->
            [ "modest", "shy", "meticulous", "reliable", "practical", "diligent", "intelligent", "analytical" ]

        Libra ->
            [ "diplomatic", "urbane", "romantic", "charming", "easy-going", "sociable", "idealistic", "peacable" ]

        Scorpio ->
            [ "determined", "forceful", "emotional", "intuitive", "powerful", "passionate", "exciting", "magnetic" ]

        Sagittarius ->
            [ "optimistic", "freedom-loving", "jovial", "good-humored", "honest", "straightforward", "intellectual", "philosophical" ]

        Capricorn ->
            [ "practical", "prudent", "ambitious", "disciplined", "patient", "careful", "humorous", "reserved" ]

        Aquarius ->
            [ "friendly", "humanitarian", "honest", "loyal", "original", "inventive", "independent", "intellectual" ]

        Pisces ->
            [ "imaginative", "sensitive", "compassionate", "kind", "selfless", "unworldly", "intuitive", "sympathetic" ]


worstZodiacSignTraits : ZodiacSign -> List String
worstZodiacSignTraits sign =
    case sign of
        Aries ->
            [ "selfish", "quick-tempered", "impulsive", "impatient", "foolhardy", "daredevil" ]

        Taurus ->
            [ "jealous", "possessive", "resentful", "inflexible", "self-indulgent", "greedy" ]

        Gemini ->
            [ "nervous", "tense", "superficial", "inconsistent", "cunning", "inquisistive" ]

        Cancer ->
            [ "changeable", "moody", "overemotional", "touchy", "clingy", "unable to let go" ]

        Leo ->
            [ "pompous", "patronizing", "bossy", "interfering", "dogmatic", "intolerant" ]

        Virgo ->
            [ "fussy", "worrier", "overcritcal", "harsh", "perfectionist", "conservatice" ]

        Libra ->
            [ "indecisive", "changeable", "gullible", "easily influenced", "flirtatious", "self-indulgent" ]

        Scorpio ->
            [ "jealous", "resentful", "compulsive", "obsessive", "secretive", "obstinate" ]

        Sagittarius ->
            [ "blindly optimistic", "careless", "irresponsible", "superficial", "tactless", "restless" ]

        Capricorn ->
            [ "pessimistic", "fatalistic", "miserly", "grudging" ]

        Aquarius ->
            [ "intractable", "contrary", "perverse", "unpredictable", "unemotional", "detached" ]

        Pisces ->
            [ "escapist", "idealistic", "secretive", "vague", "weak-willed", "easily led" ]
