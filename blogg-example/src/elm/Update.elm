module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (..)
import Commands exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        GetData ->
            ( model, getData )

        GetUsers ->
            ( model, getUsers )

        GetPosts ->
            ( model, getPosts )

        NewUsers (Ok users) ->
            ( { model | users = users }, Cmd.none )

        NewUsers (Err _) ->
            ( model, Cmd.none )

        NewData (Ok newData) ->
            ( { model | profile = newData }, Cmd.none )

        NewData (Err _) ->
            ( model, Cmd.none )

        NewPosts (Ok newData) ->
            ( { model | posts = newData }, Cmd.none )

        NewPosts (Err _) ->
            ( model, Cmd.none )

        Increment ->
            ( { model | number = model.number + 1 }, Cmd.none )
