module Oefening1 exposing (..)

-- Opdracht1, vervang Hallo Wereld met Hallo <jouw naam> door het model aan te passen
-- Laat volgens dezelfde methode een leeftijd zien

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

main =
    Browser.sandbox { init = initModel, update = update, view = view }



-- De vorm van ons model


type alias Model =
    { naam : String }



-- Initiele waarde van ons model
initModel =
    { naam = "Wereld" }


-- De message dat ons interface produceert
type Msg
    = NoOp



-- We hebben nog geen interactie maar hier zou je update logica moeten komen
update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model



-- De view die Html Msg produceert
view : Model -> Html Msg
view model =
    div []
        [ text ("Hallo " ++ model.naam) -- String concetenation ++ (niet +)
        , text ("Leeftijd: <nog in te vullen>")
        ]
