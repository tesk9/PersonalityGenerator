module Traits.ZodiacSign
    exposing
        ( ZodiacSign
        , all
        , best
        , toString
        , worst
        )


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


all : List ZodiacSign
all =
    [ Aries, Taurus, Gemini, Cancer, Leo, Virgo, Libra, Scorpio, Sagittarius, Capricorn, Aquarius, Pisces ]


toString : ZodiacSign -> String
toString sign =
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


best : ZodiacSign -> List String
best sign =
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


worst : ZodiacSign -> List String
worst sign =
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
