module Components.Users.Models exposing (..)

import Json.Encode
import Json.Decode
import Json.Decode.Pipeline


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
