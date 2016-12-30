module Commands exposing (..)

import Http


--Custom imports

import Messages exposing (Msg(..))
import Models exposing (decodeProfile, decodeUsers, decodePosts)


getData : Cmd Msg
getData =
    let
        url =
            "http://localhost:3000/profile"

        request =
            Http.get url decodeProfile
    in
        Http.send NewData request


getUsers : Cmd Msg
getUsers =
    let
        url =
            "http://localhost:3000/users"

        request =
            Http.get url decodeUsers
    in
        Http.send NewUsers request


getPosts : Cmd Msg
getPosts =
    let
        url =
            "http://localhost:3000/posts"

        request =
            Http.get url decodePosts
    in
        Http.send NewPosts request
