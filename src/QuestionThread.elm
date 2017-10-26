module QuestionThread exposing (Question, questions)

import Questions
import Traits exposing (TraitDeterminant)


type alias Question =
    Questions.Question TraitDeterminant


questions : Question
questions =
    [ new "What is your Chinese Zodiac sign?" Traits.chineseZodiacSigns
    , new "What is your Zodiac sign?" Traits.zodiacSigns
    , new "What is your natural hair color?" Traits.hairColors
    , new "What is your Rh factor?" Traits.rhFactors
    , new "What is your blood type?" Traits.bloodTypes
    ]
        |> List.foldl (\question next -> Just (question next)) Nothing
        |> Maybe.withDefault (new "Uh oh, no questions left!" [] Nothing)


new : String -> List TraitDeterminant -> Maybe Question -> Question
new instruction options next =
    options
        |> List.map (\key -> ( key, next ))
        |> Questions.new instruction
