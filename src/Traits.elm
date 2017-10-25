module Traits
    exposing
        ( BloodType
        , RhFactor
        , TraitDeterminant
        , ZodiacSign
        , bloodTypes
        , get
        , getAll
        , rhFactors
        , toString
        , zodiacSigns
        )


type TraitDeterminant
    = BloodType BloodType
    | RhFactor RhFactor
    | ZodiacSign ZodiacSign


getAll : List TraitDeterminant -> ( List String, List String )
getAll =
    List.foldl
        (\trait ( goodAcc, badAcc ) ->
            let
                ( good, bad ) =
                    get trait
            in
            ( good ++ goodAcc, bad ++ badAcc )
        )
        ( [], [] )


get : TraitDeterminant -> ( List String, List String )
get trait =
    case trait of
        BloodType bloodType ->
            getBloodTypeTraits bloodType

        RhFactor rhFactor ->
            getRhFactorTraits rhFactor

        ZodiacSign zodiacSign ->
            getZodiacSignTraits zodiacSign


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


getBloodTypeTraits : BloodType -> ( List String, List String )
getBloodTypeTraits bloodType =
    case bloodType of
        A ->
            ( [ "earnest", "reserved", "sensible", "patient", "responsible", "cautious" ]
            , [ "fastidious", "over-earnest", "proud", "stubborn", "tense", "mischievous", "obsessive", "pessimistic" ]
            )

        B ->
            ( [ "passionate", "active", "creative", "animal-loving", "flexible", "cheerful", "friendly", "optimistic" ]
            , [ "irresponsible", "forgetful", "selfish", "lazy", "impatient", "unreliable", "\"going own way\"" ]
            )

        AB ->
            ( [ "cool", "controlled", "rational", "sociable", "intelligent", "adaptable" ]
            , [ "critical", "indecisive", "unforgiving", "two-faced", "aloof", "\"split personality\"" ]
            )

        O ->
            ( [ "confident", "self-determined", "ambitious", "strong-willed", "intuitive", "agreeable", "competitive", "athletic" ]
            , [ "unpredictable", "spiteful", "self-centered", "cold", "aggressive", "arrogant", "envious", "ruthless" ]
            )


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


getRhFactorTraits : RhFactor -> ( List String, List String )
getRhFactorTraits rhFactor =
    case rhFactor of
        Negative ->
            ( [ "smart", "high intuition", "fact-based" ], [ "easily frightened" ] )

        Positive ->
            ( [], [] )


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


getZodiacSignTraits : ZodiacSign -> ( List String, List String )
getZodiacSignTraits sign =
    case sign of
        Aries ->
            ( [ "adventurous", "energetic", "pioneering", "courageous", "enthousiastic", "confident", "dynamic", "quick-witted" ]
            , [ "selfish", "quick-tempered", "impulsive", "impatient", "foolhardy", "daredevil" ]
            )

        Taurus ->
            ( [ "patient", "reliable", "warm-hearted", "loving", "persistent", "determined", "placid", "security-loving" ]
            , [ "jealous", "possessive", "resentful", "inflexible", "self-indulgent", "greedy" ]
            )

        Gemini ->
            ( [ "adaptable", "versatile", "communicative", "witty", "intellectual", "eloquent", "youthful", "lively" ]
            , [ "nervous", "tense", "superficial", "inconsistent", "cunning", "inquisistive" ]
            )

        Cancer ->
            ( [ "emotional", "loving", "intuitive", "imaginative", "shrewd", "cautious", "protectice", "sympathetic" ]
            , [ "changeable", "moody", "overemotional", "touchy", "clingy", "unable to let go" ]
            )

        Leo ->
            ( [ "generous", "warm-hearted", "creative", "enthousiastic", "broad-minded", "expansive", "faitful", "loving" ]
            , [ "pompous", "patronizing", "bossy", "interfering", "dogmatic", "intolerant" ]
            )

        Virgo ->
            ( [ "modest", "shy", "meticulous", "reliable", "practical", "diligent", "intelligent", "analytical" ]
            , [ "fussy", "worrier", "overcritcal", "harsh", "perfectionist", "conservatice" ]
            )

        Libra ->
            ( [ "diplomatic", "urbane", "romantic", "charming", "easy-going", "sociable", "idealistic", "peacable" ]
            , [ "indecisive", "changeable", "gullible", "easily influenced", "flirtatious", "self-indulgent" ]
            )

        Scorpio ->
            ( [ "determined", "forceful", "emotional", "intuitive", "powerful", "passionate", "exciting", "magnetic" ]
            , [ "jealous", "resentful", "compulsive", "obsessive", "secretive", "obstinate" ]
            )

        Sagittarius ->
            ( [ "optimistic", "freedom-loving", "jovial", "good-humored", "honest", "straightforward", "intellectual", "philosophical" ]
            , [ "blindly optimistic", "careless", "irresponsible", "superficial", "tactless", "restless" ]
            )

        Capricorn ->
            ( [ "practical", "prudent", "ambitious", "disciplined", "patient", "careful", "humorous", "reserved" ]
            , [ "pessimistic", "fatalistic", "miserly", "grudging" ]
            )

        Aquarius ->
            ( [ "friendly", "humanitarian", "honest", "loyal", "original", "inventive", "independent", "intellectual" ]
            , [ "intractable", "contrary", "perverse", "unpredictable", "unemotional", "detached" ]
            )

        Pisces ->
            ( [ "imaginative", "sensitive", "compassionate", "kind", "selfless", "unworldly", "intuitive", "sympathetic" ]
            , [ "escapist", "idealistic", "secretive", "vague", "weak-willed", "easily led" ]
            )
