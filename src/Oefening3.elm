module Oefening3 exposing (..)

import Browser
import Html exposing (Html, button, div, li, text, ul)
import Html.Events exposing (onClick)


type alias Model =
    List String


type Msg
    = NoOp


initModel =
    [ "mike"
    , "Bram"
    , "Bas"
    , "Joren"
    ]



-- TODO, defineer of een top level functie of een inner functie die een element van model
-- om kan zetten naar Html Msg (String -> Html Msg) en gebruik de List.map functie
-- om de lijst van string om te zetten naar een lijst van Html Msg


modelNaarView : Model -> List (Html Msg)
modelNaarView model =
    [ li [] []
    ]


update msg model =
    case msg of
        NoOp ->
            model



-- TODO de inner lijst van ul vervangen door een functie (modelNaarView) welke het model pakt en
-- de lijst van namen print


view model =
    div []
        [ ul []
            [ li [] [ text "Waarde1" ]
            , li [] [ text "Waarde2" ]
            , li [] [ text "Waarde3" ]
            , li [] [ text "Waarde4" ]
            ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }
