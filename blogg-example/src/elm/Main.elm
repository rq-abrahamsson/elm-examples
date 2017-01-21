module Main exposing (..)

import Navigation as Nav


-- component import example

import Models exposing (..)
import Messages exposing (Msg(..))
import View exposing (view)
import Update exposing (update)
import Commands exposing (..)
import Routing exposing (Route)


-- APP


main : Program Never Model Msg
main =
    Nav.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Nav.Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( model currentRoute
        , Cmd.batch [ getData, getPosts, getUsers ]
        )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
