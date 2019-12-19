module Oefening4 exposing (..)

import Browser
import Html exposing (Html, button, div, input, li, text, ul)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)


type Msg
    = NaamChanged String
    | AchternaamChanged String


type alias Model =
    { naam : MinMaxVeld
    , achternaam : MinMaxVeld
    }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }


initModel =
    { naam = emptyMM, achternaam = emptyMM }


view model =
    div []
        [ input [ onInput NaamChanged, value (toStr model.naam) ] []
        , input [ onInput AchternaamChanged, value (toStr model.achternaam) ] []
        ]


update msg model =
    case msg of
        NaamChanged str ->
            model

        AchternaamChanged str ->
            model



-- MinMaxVeld


type alias MinMaxData =
    { input : String, error : String }


type MinMaxVeld
    = Valid String
    | Invalid MinMaxData


emptyMM =
    Valid ""


toStr minmax =
    case minmax of
        Valid str ->
            str

        Invalid { input, error } ->
            input


validate : (String -> Bool) -> String -> MinMaxVeld
validate valideerFunc input =
    case valideerFunc input of
        True ->
            Valid input

        False ->
            Invalid { input = input, error = "Invalid waarde gegeven" }
