module Models exposing (..)

import Json.Encode
import Json.Decode
import Json.Decode.Pipeline


type alias Model =
    { number : Int
    , profile : Profile
    , users : List User
    , posts : List Post
    }


model : Model
model =
    { number = 0
    , profile = { id = 1 }
    , users = []
    , posts = []
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


type alias User =
    { id : Int
    , email : String
    , username : String
    , firstname : String
    , lastname : String
    , password : String
    }


decodeUsers : Json.Decode.Decoder (List User)
decodeUsers =
    Json.Decode.list decodeUser


decodeUser : Json.Decode.Decoder User
decodeUser =
    Json.Decode.Pipeline.decode User
        |> Json.Decode.Pipeline.required "id" (Json.Decode.int)
        |> Json.Decode.Pipeline.required "email" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "username" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "firstname" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "lastname" (Json.Decode.string)
        |> Json.Decode.Pipeline.required "password" (Json.Decode.string)


encodeUser : User -> Json.Encode.Value
encodeUser record =
    Json.Encode.object
        [ ( "id", Json.Encode.int <| record.id )
        , ( "email", Json.Encode.string <| record.email )
        , ( "username", Json.Encode.string <| record.username )
        , ( "firstname", Json.Encode.string <| record.firstname )
        , ( "lastname", Json.Encode.string <| record.lastname )
        , ( "password", Json.Encode.string <| record.password )
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
