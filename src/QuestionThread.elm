module QuestionThread exposing (Question, first)

import Questions
import Traits exposing (TraitDeterminant)


type alias Question =
    Questions.Question TraitDeterminant


first : Question
first =
    bloodType


bloodType : Question
bloodType =
    new "What is your blood type?"
        Traits.bloodTypes
        (Just rhFactor)


rhFactor : Question
rhFactor =
    new "What is your Rh factor?"
        Traits.rhFactors
        (Just zodiacSign)


zodiacSign : Question
zodiacSign =
    new "What is your Zodiac sign?"
        Traits.zodiacSigns
        (Just chineseZodiacSign)


chineseZodiacSign : Question
chineseZodiacSign =
    new "What is your Chinese Zodiac sign?"
        Traits.chineseZodiacSigns
        Nothing


new : String -> List TraitDeterminant -> Maybe Question -> Question
new instruction options next =
    options
        |> List.map (\key -> ( key, next ))
        |> Questions.new instruction
