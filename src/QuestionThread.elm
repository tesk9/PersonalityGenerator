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
    Traits.bloodTypes
        |> List.map (\key -> ( key, Just rhFactor ))
        |> Questions.new "What is your blood type?"


rhFactor : Question
rhFactor =
    Traits.rhFactors
        |> List.map (\key -> ( key, Just zodiacSign ))
        |> Questions.new "What is your Rh factor?"


zodiacSign : Question
zodiacSign =
    Traits.zodiacSigns
        |> List.map (\key -> ( key, Nothing ))
        |> Questions.new "What is your Zodiac sign?"
