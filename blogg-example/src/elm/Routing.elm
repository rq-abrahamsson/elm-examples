module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = UsersRoute
    | PostsRoute
    | FunRoute
    | NotFoundRoute


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map FunRoute top
        , map UsersRoute (s "users")
        , map PostsRoute (s "posts")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
