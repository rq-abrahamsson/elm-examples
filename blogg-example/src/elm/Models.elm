module Models exposing (..)

import Json.Encode
import Json.Decode
import Json.Decode.Pipeline


-- Custom imports

import Components.Users.Models exposing (User)
import Routing


type alias Model =
    { number : Int
    , profile : Profile
    , users : List User
    , posts : List Post
    , route : Routing.Route
    }


model : Routing.Route -> Model
model route =
    { number = 0
    , profile = { id = 1 }
    , users = []
    , posts = []
    , route = route
    }


type alias Profile =
    { id : Int
    }


decodeProfile : Json.Decode.Decoder Profile
decodeProfile =
    Json.Decode.Pipeline.decode Profile
        |> Json.Decode.Pipeline.required "id" (Json.Decode.int)


encodeProfile : Profile -> Json.Encode.Value
encodeProfile record =
    Json.Encode.object
        [ ( "id", Json.Encode.int <| record.id )
        ]


type alias Post =
    { id : Int
    , title : String
    , body : String
    , authorId : Int
    }


decodePosts : Json.Decode.Decoder (List Post)
decodePosts =
    Json.Decode.list decodePost


decodePost : Json.Decode.Decoder Post
decodePost =
    Json.Decode.Pipeline.decode Post
        |> Json.Decode.Pipeline.required "id" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "title" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "body" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "authorId" (Json.Decode.int)


encodePost : Post -> Json.Encode.Value
encodePost record =
    Json.Encode.object
        [ ( "id", Json.Encode.int <| record.id )
        , ( "title", Json.Encode.string <| record.title )
        , ( "body", Json.Encode.string <| record.body )
        , ( "authorId", Json.Encode.int <| record.authorId )
        ]
