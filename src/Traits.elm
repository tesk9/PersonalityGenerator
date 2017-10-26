module Traits
    exposing
        ( TraitDeterminant
        , best
        , bloodTypes
        , getAll
        , rhFactors
        , toString
        , worst
        , zodiacSigns
        )

import List.Extra
import Traits.BloodType as BloodType exposing (BloodType)
import Traits.ChineseZodiacSign as ChineseZodiacSign exposing (ChineseZodiacSign)
import Traits.RhFactor as RhFactor exposing (RhFactor)
import Traits.ZodiacSign as ZodiacSign exposing (ZodiacSign)


type TraitDeterminant
    = BloodType BloodType
    | RhFactor RhFactor
    | ZodiacSign ZodiacSign
    | ChineseZodiacSign ChineseZodiacSign


bloodTypes : List TraitDeterminant
bloodTypes =
    List.map BloodType BloodType.bloodTypes


rhFactors : List TraitDeterminant
rhFactors =
    List.map RhFactor RhFactor.rhFactors


zodiacSigns : List TraitDeterminant
zodiacSigns =
    List.map ZodiacSign ZodiacSign.zodiacSigns


chineseZodiacSigns : List TraitDeterminant
chineseZodiacSigns =
    List.map ChineseZodiacSign ChineseZodiacSign.chineseZodiacSigns


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
            BloodType.best bloodType

        RhFactor rhFactor ->
            RhFactor.best rhFactor

        ZodiacSign zodiacSign ->
            ZodiacSign.best zodiacSign

        ChineseZodiacSign zodiacSign ->
            ChineseZodiacSign.best zodiacSign


worst : TraitDeterminant -> List String
worst trait =
    case trait of
        BloodType bloodType ->
            BloodType.worst bloodType

        RhFactor rhFactor ->
            RhFactor.worst rhFactor

        ZodiacSign zodiacSign ->
            ZodiacSign.worst zodiacSign

        ChineseZodiacSign zodiacSign ->
            ChineseZodiacSign.worst zodiacSign


toString : TraitDeterminant -> String
toString trait =
    case trait of
        BloodType bloodType ->
            BloodType.toString bloodType

        RhFactor rhFactor ->
            RhFactor.toString rhFactor

        ZodiacSign zodiacSign ->
            ZodiacSign.toString zodiacSign

        ChineseZodiacSign zodiacSign ->
            ChineseZodiacSign.toString zodiacSign
