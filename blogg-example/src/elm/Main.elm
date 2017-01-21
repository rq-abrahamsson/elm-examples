module Main exposing (..)

import Html exposing (..)


-- component import example

import Models exposing (..)
import Messages exposing (Msg(..))
import View exposing (view)
import Update exposing (update)
import Commands exposing (..)


-- APP


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( model
    , Cmd.batch [ getData, getPosts, getUsers ]
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
