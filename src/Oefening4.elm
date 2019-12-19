module Oefening4 exposing (..)

import Browser
import Html exposing (Html, div, input)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput)


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


initModel : Model
initModel =
    { naam = emptyMM, achternaam = emptyMM }



-- TODO maak een case expression op model.naam en model.achternaam en genereer
-- andere view code op basis van de staat van dit ding
-- zo zou bij de 'Invalid' staat een error message gesdisplayed moeten worden
-- bij Valid uiteraard niet


view : Model -> Html Msg
view model =
    div []
        [ input [ onInput NaamChanged, value (toStr model.naam) ] []
        , input [ onInput AchternaamChanged, value (toStr model.achternaam) ] []
        ]



-- TODO gebruik de valideer functie om de waardes uit het model te valideren en vervolgens een error in te
-- vullen als de functie 'false' returnt. Let er op dat je dus nog een aparte validatie functie moet schrijven
-- dit kan een top level functie of een anonieme zijn (\x -> x / 2 = True)


update : Msg -> Model -> Model
update msg model =
    case msg of
        NaamChanged _ ->
            -- TODO maak het zodat de als de naam begint met een B hij errort
            model

        AchternaamChanged _ ->
            -- TODO maak het zodat als de achternaam leeg is hij errort
            model



-- MinMaxVeld


type alias MinMaxData =
    { input : String
    , error : String
    }



-- MinMaxVeld kan een Valid of Invalid staat hebben


type MinMaxVeld
    = Valid String
    | Invalid MinMaxData



-- constructor functie voor een leeg minmaxveld


emptyMM : MinMaxVeld
emptyMM =
    Valid ""



-- Hulp functie om ons MinxMaxVeld om te zetten naar een string


toStr : MinMaxVeld -> String
toStr minmax =
    case minmax of
        Valid str ->
            str

        Invalid { input } ->
            input



-- De validate functie heeft een functie nodig om te bepalen of hij een valid of invalid veld teruggeeft


validate : (String -> Bool) -> String -> MinMaxVeld
validate valideerFunc input =
    if valideerFunc input then
        Valid input

    else
        Invalid { input = input, error = "Invalid waarde gegeven" }
