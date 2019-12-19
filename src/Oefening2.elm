module Oefening2 exposing (..)

import Browser
import Html exposing (Html, button, div, input, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onClick, onInput)


type alias Model =
    { gewicht : String
    , lengte : String
    }


type Msg
    = GewichtChanged String
    | LengteChanged String


update msg model =
    case msg of
        GewichtChanged newValue ->
            { model | gewicht = newValue }

        -- zet de nieuwe waarde uit de Msg in het model zodat we er later mee kunnen rekenen
        LengteChanged newValue ->
            -- TODO doe dit ook met lengte
            model


view model =
    div []
        [ text "Gewicht: "
        , input [ onInput GewichtChanged, value model.gewicht ] []
        , text "Lengte: "
        , input [ onInput LengteChanged, value model.lengte ] []
        , text ("Uw BMI: " ++ "<BMI>") -- TODO gebruik de calculeerBMI functie om bmi te calculeren
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }


initModel =
    { lengte = ""
    , gewicht = ""
    }



-- Calculeer bmi op basis van lengte en gewicht, houd in de gaten dat alleen als beide waardes "goed"
-- zijn er een bmi gecalculeerd kan worden. Anders kunnen we gewoon "ongeldige invoer" teruggeven


calculeerBmi : String -> String -> String
calculeerBmi lengte gewicht =
    let
        -- toFloat is een functie die String -> Maybe Int gaat
        maybeGewicht =
            String.toFloat lengte

        -- TODO lengte omzetten naar een float
        maybeLengte =
            lengte

        -- g voor gewicht, l voor lengte
        bmiFormule g l =
            g / (l * l)

    in
    case maybeGewicht of
        Nothing ->
            "Ongeldige invoer"

        Just floatValue ->
            -- case .. of statements kunnen genest worden
            -- gewicht kan nu als Float benaderd worden, TODO nu lengte nog
            "Geldige invoer"



-- TODO, als beide als float benaderd kunnen worden berekent dan de BMI waarde en
-- convert het naar string (gebruik de String.toFloat functie)
